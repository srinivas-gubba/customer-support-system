-- =============================================================================
-- {{STORE_NAME}} — Customer / Commerce Database (SQLite)
-- Schema v1.0  ·  2026-11-17
-- -----------------------------------------------------------------------------
-- Purpose: the data layer the support agent reads (via an API) to answer and act
--          on tickets. Designed to line up 1:1 with the _KB policies:
--            - carrier-confirmed delivery date  -> shipments.delivered_at
--            - 30-day refund window              -> v_refund_eligibility
--            - one refund per order              -> refunds (+ v_refund_eligibility)
--            - $100 agent approval threshold     -> order_value_cents / view flag
--            - delay goodwill tiers ($0/$5/$15)  -> v_delivery_status
--            - product-specific return rules     -> categories.return_policy_class + product flags
--
-- Conventions (see db/README.md):
--   * Money   : INTEGER cents, columns suffixed `_cents`  ($1.00 = 100). No floats.
--   * Dates   : TEXT, ISO-8601 UTC ('YYYY-MM-DD' or 'YYYY-MM-DD HH:MM:SS').
--   * Booleans: INTEGER 0/1 with CHECK (col IN (0,1)).
--   * Enums   : TEXT with CHECK (col IN (...)).
--   * Tables  : STRICT (type-enforced). Surrogate INTEGER PKs + business keys.
--   * FKs     : enforced — the API MUST run `PRAGMA foreign_keys = ON;` per connection.
-- =============================================================================

PRAGMA foreign_keys = ON;

-- =========================== IDENTITY & ADDRESSES ============================

CREATE TABLE customers (
    customer_id      INTEGER PRIMARY KEY,
    email            TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    first_name       TEXT    NOT NULL,
    last_name        TEXT    NOT NULL,
    phone            TEXT,
    -- Never store plaintext passwords; this is a hash placeholder (nullable for demo).
    password_hash    TEXT,
    marketing_opt_in INTEGER NOT NULL DEFAULT 0 CHECK (marketing_opt_in IN (0,1)),
    loyalty_tier     TEXT    NOT NULL DEFAULT 'standard'
                             CHECK (loyalty_tier IN ('standard','silver','gold','platinum')),
    status           TEXT    NOT NULL DEFAULT 'active'
                             CHECK (status IN ('active','suspended','closed','locked','fraud_hold')),
    created_at       TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at       TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE addresses (
    address_id          INTEGER PRIMARY KEY,
    customer_id         INTEGER NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    label               TEXT,                       -- 'home', 'work', ...
    recipient_name      TEXT    NOT NULL,
    line1               TEXT    NOT NULL,
    line2               TEXT,
    city                TEXT    NOT NULL,
    state               TEXT    NOT NULL,           -- US state code
    postal_code         TEXT    NOT NULL,
    country             TEXT    NOT NULL DEFAULT 'US',
    phone               TEXT,
    is_default_shipping INTEGER NOT NULL DEFAULT 0 CHECK (is_default_shipping IN (0,1)),
    is_default_billing  INTEGER NOT NULL DEFAULT 0 CHECK (is_default_billing  IN (0,1)),
    created_at          TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- Human support team: approvers & escalation owners (for the >$100 workflow).
CREATE TABLE support_staff (
    staff_id             INTEGER PRIMARY KEY,
    name                 TEXT    NOT NULL,
    email                TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    role                 TEXT    NOT NULL CHECK (role IN ('agent','senior_agent','supervisor','privacy_officer')),
    approval_limit_cents INTEGER NOT NULL DEFAULT 0 CHECK (approval_limit_cents >= 0),
    is_active            INTEGER NOT NULL DEFAULT 1 CHECK (is_active IN (0,1)),
    created_at           TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- =============================== CATALOG =====================================

-- One row per DummyJSON category family. `return_policy_class` maps to the
-- _KB/product-specific-rules/* articles so the API can apply the right rule.
CREATE TABLE categories (
    category_id             INTEGER PRIMARY KEY,
    slug                    TEXT    NOT NULL UNIQUE,   -- 'laptops', 'fragrances', ...
    name                    TEXT    NOT NULL,
    parent_id               INTEGER REFERENCES categories(category_id) ON DELETE SET NULL,
    return_policy_class      TEXT   NOT NULL DEFAULT 'standard'
        CHECK (return_policy_class IN
            ('standard','electronics','hygiene','perishable','apparel',
             'furniture','jewelry','vehicle_parts','kitchen')),
    default_returnable      INTEGER NOT NULL DEFAULT 1 CHECK (default_returnable IN (0,1)),
    default_warranty_months INTEGER NOT NULL DEFAULT 0 CHECK (default_warranty_months >= 0),
    restocking_fee_pct      INTEGER NOT NULL DEFAULT 0 CHECK (restocking_fee_pct BETWEEN 0 AND 100),
    created_at              TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE brands (
    brand_id INTEGER PRIMARY KEY,
    name     TEXT    NOT NULL UNIQUE
) STRICT;

CREATE TABLE products (
    product_id         INTEGER PRIMARY KEY,
    sku                TEXT    NOT NULL UNIQUE,
    title              TEXT    NOT NULL,
    description        TEXT,
    category_id        INTEGER NOT NULL REFERENCES categories(category_id),
    brand              TEXT,
    brand_id           INTEGER REFERENCES brands(brand_id),
    price_cents        INTEGER NOT NULL CHECK (price_cents >= 0),
    currency           TEXT    NOT NULL DEFAULT 'USD',
    stock_quantity     INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    weight_grams       INTEGER CHECK (weight_grams IS NULL OR weight_grams >= 0),
    -- Policy flags consumed by the support agent / API:
    is_returnable      INTEGER NOT NULL DEFAULT 1 CHECK (is_returnable IN (0,1)),
    is_final_sale      INTEGER NOT NULL DEFAULT 0 CHECK (is_final_sale IN (0,1)),
    is_hazmat          INTEGER NOT NULL DEFAULT 0 CHECK (is_hazmat IN (0,1)),
    is_perishable      INTEGER NOT NULL DEFAULT 0 CHECK (is_perishable IN (0,1)),
    hygiene_restricted INTEGER NOT NULL DEFAULT 0 CHECK (hygiene_restricted IN (0,1)), -- opened => non-returnable
    requires_data_wipe INTEGER NOT NULL DEFAULT 0 CHECK (requires_data_wipe IN (0,1)), -- electronics
    restocking_fee_pct INTEGER NOT NULL DEFAULT 0 CHECK (restocking_fee_pct BETWEEN 0 AND 100),
    warranty_months    INTEGER NOT NULL DEFAULT 0 CHECK (warranty_months >= 0),
    warranty_type      TEXT    CHECK (warranty_type IS NULL OR warranty_type IN ('full','limited')), -- Magnuson-Moss label
    is_bulky           INTEGER NOT NULL DEFAULT 0 CHECK (is_bulky IN (0,1)),      -- freight / white-glove
    lifecycle_status   TEXT    NOT NULL DEFAULT 'active'
                              CHECK (lifecycle_status IN ('active','discontinued','recalled')),
    restock_eta        TEXT,                                                      -- date, for backorders
    created_at         TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at         TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE product_variants (
    variant_id     INTEGER PRIMARY KEY,
    product_id     INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    sku            TEXT    NOT NULL UNIQUE,
    variant_name   TEXT    NOT NULL,                -- 'Large / Blue'
    price_cents    INTEGER NOT NULL CHECK (price_cents >= 0),
    stock_quantity INTEGER NOT NULL DEFAULT 0 CHECK (stock_quantity >= 0),
    created_at     TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- Warehouses & per-warehouse stock (fulfillment detail; `restock_eta` for backorders).
CREATE TABLE warehouses (
    warehouse_id INTEGER PRIMARY KEY,
    code         TEXT    NOT NULL UNIQUE,
    name         TEXT    NOT NULL,
    city         TEXT    NOT NULL,
    state        TEXT    NOT NULL
) STRICT;

CREATE TABLE inventory (
    product_id   INTEGER NOT NULL REFERENCES products(product_id) ON DELETE CASCADE,
    warehouse_id INTEGER NOT NULL REFERENCES warehouses(warehouse_id),
    qty_on_hand  INTEGER NOT NULL DEFAULT 0 CHECK (qty_on_hand >= 0),
    qty_reserved INTEGER NOT NULL DEFAULT 0 CHECK (qty_reserved >= 0),
    restock_eta  TEXT,                               -- date, for backorders
    PRIMARY KEY (product_id, warehouse_id)
) STRICT;

-- Carriers (normalized) + a tracking-URL template the agent can hand the customer.
CREATE TABLE carriers (
    carrier_id   INTEGER PRIMARY KEY,
    name         TEXT    NOT NULL UNIQUE,
    tracking_url TEXT    NOT NULL                    -- template with {tracking} placeholder
) STRICT;

-- ============================ PAYMENT METHODS ================================
-- Tokenized only. NEVER store full card numbers / CVV (see _KB security rules).
CREATE TABLE payment_methods (
    payment_method_id INTEGER PRIMARY KEY,
    customer_id       INTEGER NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    type              TEXT    NOT NULL
                              CHECK (type IN ('card','paypal','apple_pay','google_pay','gift_card','store_credit')),
    brand             TEXT    CHECK (brand IS NULL OR brand IN ('visa','mastercard','amex','discover')),
    last4             TEXT    CHECK (last4 IS NULL OR length(last4) = 4),
    exp_month         INTEGER CHECK (exp_month IS NULL OR exp_month BETWEEN 1 AND 12),
    exp_year          INTEGER CHECK (exp_year  IS NULL OR exp_year BETWEEN 2000 AND 2100),
    is_default        INTEGER NOT NULL DEFAULT 0 CHECK (is_default IN (0,1)),
    created_at        TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ============================= PROMOTIONS ====================================
CREATE TABLE promotions (
    promotion_id       INTEGER PRIMARY KEY,
    code               TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    description        TEXT,
    discount_type      TEXT    NOT NULL CHECK (discount_type IN ('percent','fixed')),
    discount_value     INTEGER NOT NULL CHECK (discount_value >= 0), -- percent 0-100, or cents if 'fixed'
    min_order_cents    INTEGER NOT NULL DEFAULT 0 CHECK (min_order_cents >= 0),
    starts_at          TEXT,
    ends_at            TEXT,
    usage_limit        INTEGER CHECK (usage_limit IS NULL OR usage_limit >= 0),
    per_customer_limit INTEGER NOT NULL DEFAULT 1 CHECK (per_customer_limit >= 0),
    is_active          INTEGER NOT NULL DEFAULT 1 CHECK (is_active IN (0,1)),
    created_at         TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ============================== GIFT CARDS ===================================
CREATE TABLE gift_cards (
    gift_card_id         INTEGER PRIMARY KEY,
    code                 TEXT    NOT NULL UNIQUE COLLATE NOCASE,
    initial_balance_cents INTEGER NOT NULL CHECK (initial_balance_cents >= 0),
    balance_cents        INTEGER NOT NULL CHECK (balance_cents >= 0),
    status               TEXT    NOT NULL DEFAULT 'active'
                                 CHECK (status IN ('active','redeemed','expired','disabled')),
    purchaser_customer_id INTEGER REFERENCES customers(customer_id) ON DELETE SET NULL,
    issued_at            TEXT    NOT NULL DEFAULT (datetime('now')),
    expires_at           TEXT,
    created_at           TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- =============================== ORDERS ======================================
CREATE TABLE orders (
    order_id            INTEGER PRIMARY KEY,
    order_number        TEXT    NOT NULL UNIQUE,      -- human-facing 'ORD-100001'
    customer_id         INTEGER NOT NULL REFERENCES customers(customer_id),
    status              TEXT    NOT NULL DEFAULT 'pending'
        CHECK (status IN ('pending','processing','shipped','out_for_delivery',
                          'delivered','cancelled','returned','exception')),
    placed_at           TEXT    NOT NULL DEFAULT (datetime('now')),
    promised_delivery_date TEXT,                      -- checkout estimate; drives lateness
    shipping_method     TEXT    NOT NULL DEFAULT 'standard'
                                CHECK (shipping_method IN ('standard','expedited','overnight')),
    shipping_address_id INTEGER REFERENCES addresses(address_id),
    billing_address_id  INTEGER REFERENCES addresses(address_id),
    channel             TEXT    NOT NULL DEFAULT 'web' CHECK (channel IN ('web','mobile','phone')),
    currency            TEXT    NOT NULL DEFAULT 'USD',
    subtotal_cents      INTEGER NOT NULL DEFAULT 0 CHECK (subtotal_cents >= 0),
    discount_cents      INTEGER NOT NULL DEFAULT 0 CHECK (discount_cents >= 0),
    shipping_cents      INTEGER NOT NULL DEFAULT 0 CHECK (shipping_cents >= 0),
    tax_cents           INTEGER NOT NULL DEFAULT 0 CHECK (tax_cents >= 0),
    grand_total_cents   INTEGER NOT NULL DEFAULT 0 CHECK (grand_total_cents >= 0),
    -- Canonical "order value" for the $100 approval threshold (GLOSS-001):
    --   amount paid after discounts, EXCLUDING shipping & tax.
    order_value_cents   INTEGER GENERATED ALWAYS AS (subtotal_cents - discount_cents) VIRTUAL,
    is_gift             INTEGER NOT NULL DEFAULT 0 CHECK (is_gift IN (0,1)),
    notes               TEXT,
    cancelled_at        TEXT,
    cancel_reason       TEXT,
    created_at          TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at          TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE order_items (
    order_item_id    INTEGER PRIMARY KEY,
    order_id         INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    product_id       INTEGER NOT NULL REFERENCES products(product_id),
    variant_id       INTEGER REFERENCES product_variants(variant_id),
    sku              TEXT    NOT NULL,                -- snapshot at purchase
    title            TEXT    NOT NULL,                -- snapshot at purchase
    unit_price_cents INTEGER NOT NULL CHECK (unit_price_cents >= 0),
    quantity         INTEGER NOT NULL CHECK (quantity > 0),
    discount_cents   INTEGER NOT NULL DEFAULT 0 CHECK (discount_cents >= 0),
    tax_cents        INTEGER NOT NULL DEFAULT 0 CHECK (tax_cents >= 0),
    line_total_cents INTEGER NOT NULL CHECK (line_total_cents >= 0), -- unit*qty - discount
    is_gift          INTEGER NOT NULL DEFAULT 0 CHECK (is_gift IN (0,1)),
    created_at       TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE order_status_history (
    history_id INTEGER PRIMARY KEY,
    order_id   INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    status     TEXT    NOT NULL,
    note       TEXT,
    changed_at TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE order_promotions (
    order_id            INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    promotion_id        INTEGER NOT NULL REFERENCES promotions(promotion_id),
    amount_applied_cents INTEGER NOT NULL CHECK (amount_applied_cents >= 0),
    PRIMARY KEY (order_id, promotion_id)
) STRICT;

-- ============================== FULFILLMENT ==================================
CREATE TABLE shipments (
    shipment_id            INTEGER PRIMARY KEY,
    order_id               INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    carrier                TEXT    CHECK (carrier IS NULL OR carrier IN ('UPS','USPS','FedEx','DHL')),
    carrier_id             INTEGER REFERENCES carriers(carrier_id),
    tracking_number        TEXT,
    status                 TEXT    NOT NULL DEFAULT 'label_created'
        CHECK (status IN ('label_created','in_transit','out_for_delivery',
                          'delivered','exception','returned_to_sender','lost')),
    shipped_at             TEXT,
    estimated_delivery_date TEXT,
    delivered_at           TEXT,                      -- carrier-confirmed delivery (NULL until delivered)
    signed_by              TEXT,                       -- signature on delivery, if any
    delivery_photo         INTEGER NOT NULL DEFAULT 0 CHECK (delivery_photo IN (0,1)), -- DNR evidence
    tracking_url           TEXT,                       -- carrier tracking link to share with the customer
    shipping_cost_cents    INTEGER NOT NULL DEFAULT 0 CHECK (shipping_cost_cents >= 0),
    created_at             TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at             TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- Links shipment -> order lines, so split shipments are representable.
CREATE TABLE shipment_items (
    shipment_item_id INTEGER PRIMARY KEY,
    shipment_id      INTEGER NOT NULL REFERENCES shipments(shipment_id) ON DELETE CASCADE,
    order_item_id    INTEGER NOT NULL REFERENCES order_items(order_item_id),
    quantity         INTEGER NOT NULL CHECK (quantity > 0)
) STRICT;

-- Carrier scan history: the "where is my order?" timeline (SHIP-004).
CREATE TABLE shipment_events (
    event_id    INTEGER PRIMARY KEY,
    shipment_id INTEGER NOT NULL REFERENCES shipments(shipment_id) ON DELETE CASCADE,
    event_time  TEXT    NOT NULL,
    status      TEXT    NOT NULL,
    location    TEXT,
    description TEXT    NOT NULL
) STRICT;

-- ========================= PAYMENTS (event log) =============================
CREATE TABLE payments (
    payment_id        INTEGER PRIMARY KEY,
    order_id          INTEGER NOT NULL REFERENCES orders(order_id) ON DELETE CASCADE,
    payment_method_id INTEGER REFERENCES payment_methods(payment_method_id),
    txn_type          TEXT    NOT NULL CHECK (txn_type IN ('authorization','capture','refund','void')),
    status            TEXT    NOT NULL CHECK (status IN ('pending','settled','failed','voided')),
    amount_cents      INTEGER NOT NULL CHECK (amount_cents >= 0),
    currency          TEXT    NOT NULL DEFAULT 'USD',
    processor_ref     TEXT,                           -- e.g. 'ch_123', 're_123'
    failure_reason    TEXT,                           -- declines: 'insufficient_funds','avs_mismatch',...
    created_at        TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ========================== RETURNS & REFUNDS ===============================
CREATE TABLE returns (
    return_id            INTEGER PRIMARY KEY,
    rma_number           TEXT    NOT NULL UNIQUE,     -- 'RMA-5001'
    order_id             INTEGER NOT NULL REFERENCES orders(order_id),
    customer_id          INTEGER NOT NULL REFERENCES customers(customer_id),
    reason               TEXT    NOT NULL
        CHECK (reason IN ('change_of_mind','wrong_size','defective','damaged',
                          'wrong_item','missing_item','not_as_described','other')),
    fault                TEXT    NOT NULL CHECK (fault IN ('customer','store')),
    status               TEXT    NOT NULL DEFAULT 'requested'
        CHECK (status IN ('requested','label_sent','in_transit','received',
                          'inspected','completed','rejected','cancelled')),
    resolution           TEXT    CHECK (resolution IS NULL OR
                                   resolution IN ('refund','exchange','store_credit','replacement')),
    return_shipping_payer TEXT   NOT NULL DEFAULT 'customer'
                                 CHECK (return_shipping_payer IN ('customer','store')),
    restocking_fee_cents INTEGER NOT NULL DEFAULT 0 CHECK (restocking_fee_cents >= 0),
    requested_at         TEXT    NOT NULL DEFAULT (datetime('now')),
    received_at          TEXT,
    inspected_at         TEXT,
    completed_at         TEXT,
    created_at           TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at           TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE return_items (
    return_item_id INTEGER PRIMARY KEY,
    return_id      INTEGER NOT NULL REFERENCES returns(return_id) ON DELETE CASCADE,
    order_item_id  INTEGER NOT NULL REFERENCES order_items(order_item_id),
    quantity       INTEGER NOT NULL CHECK (quantity > 0),
    condition      TEXT    CHECK (condition IS NULL OR condition IN ('new','opened','used','damaged')),
    reason         TEXT
) STRICT;

-- One row per refund issued. Enables the "one refund per order" check (REF-003)
-- and refund status lookups (REF-007).
CREATE TABLE refunds (
    refund_id        INTEGER PRIMARY KEY,
    order_id         INTEGER NOT NULL REFERENCES orders(order_id),
    return_id        INTEGER REFERENCES returns(return_id),
    customer_id      INTEGER NOT NULL REFERENCES customers(customer_id),
    amount_cents     INTEGER NOT NULL CHECK (amount_cents >= 0),
    method           TEXT    NOT NULL CHECK (method IN ('original_payment','store_credit','gift_card')),
    status           TEXT    NOT NULL DEFAULT 'pending'
                             CHECK (status IN ('pending','issued','posted','failed')),
    includes_shipping INTEGER NOT NULL DEFAULT 0 CHECK (includes_shipping IN (0,1)),
    requires_approval INTEGER NOT NULL DEFAULT 0 CHECK (requires_approval IN (0,1)), -- amount > $100 (REF-002)
    approved_by_type TEXT    CHECK (approved_by_type IS NULL OR approved_by_type IN ('ai_agent','staff','system')),
    approved_by_staff_id INTEGER REFERENCES support_staff(staff_id),
    policy_id        TEXT,                            -- KB policy cited, e.g. 'REF-001'
    reason           TEXT,
    processor_ref    TEXT,
    issued_at        TEXT,
    created_at       TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ===================== CLAIMS (damaged/wrong/missing) =======================
CREATE TABLE claims (
    claim_id        INTEGER PRIMARY KEY,
    claim_number    TEXT    NOT NULL UNIQUE,          -- 'CLM-7001'
    order_id        INTEGER NOT NULL REFERENCES orders(order_id),
    order_item_id   INTEGER REFERENCES order_items(order_item_id),
    customer_id     INTEGER NOT NULL REFERENCES customers(customer_id),
    type            TEXT    NOT NULL
        CHECK (type IN ('damaged','defective','wrong_item','missing_item','missing_part')),
    status          TEXT    NOT NULL DEFAULT 'open'
        CHECK (status IN ('open','awaiting_photos','approved','rejected','resolved','escalated')),
    resolution      TEXT    CHECK (resolution IS NULL OR
                               resolution IN ('replacement','refund','store_credit')),
    photos_provided INTEGER NOT NULL DEFAULT 0 CHECK (photos_provided IN (0,1)),
    photos_url      TEXT,
    reported_at     TEXT    NOT NULL DEFAULT (datetime('now')),
    resolved_at     TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ===================== CHARGEBACKS / DISPUTES ===============================
-- When a dispute is open, the store must NOT also issue a refund (PAY-004).
CREATE TABLE payment_disputes (
    dispute_id   INTEGER PRIMARY KEY,
    order_id     INTEGER NOT NULL REFERENCES orders(order_id),
    payment_id   INTEGER NOT NULL REFERENCES payments(payment_id),
    reason       TEXT    NOT NULL
                         CHECK (reason IN ('fraudulent','not_received','not_as_described','duplicate','other')),
    amount_cents INTEGER NOT NULL CHECK (amount_cents >= 0),
    status       TEXT    NOT NULL CHECK (status IN ('open','under_review','won','lost','withdrawn')),
    opened_at    TEXT    NOT NULL DEFAULT (datetime('now')),
    respond_by   TEXT,
    created_at   TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ===================== PRIVACY (CCPA/CPRA) ==================================
-- Routed to the privacy workflow, never fulfilled in chat (ACCT-003).
CREATE TABLE privacy_requests (
    request_id     INTEGER PRIMARY KEY,
    customer_id    INTEGER NOT NULL REFERENCES customers(customer_id),
    request_type   TEXT    NOT NULL
                           CHECK (request_type IN ('access','delete','correct','opt_out_sale','limit_sensitive')),
    status         TEXT    NOT NULL DEFAULT 'received'
                           CHECK (status IN ('received','verifying','in_progress','completed','denied')),
    received_at    TEXT    NOT NULL DEFAULT (datetime('now')),
    acknowledge_by TEXT    NOT NULL,                  -- received + 10 business days
    respond_by     TEXT    NOT NULL,                  -- received + 45 calendar days
    completed_at   TEXT,
    created_at     TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- ===================== STORE CREDIT (ledger) ================================
-- Positive amount = credit granted; negative = redeemed. Balance = SUM(amount_cents).
CREATE TABLE store_credits (
    store_credit_id INTEGER PRIMARY KEY,
    customer_id     INTEGER NOT NULL REFERENCES customers(customer_id) ON DELETE CASCADE,
    amount_cents    INTEGER NOT NULL,                 -- may be negative (redemption)
    reason          TEXT    NOT NULL
        CHECK (reason IN ('goodwill_delay','gift_return','return_refund','manual','redemption')),
    source_order_id INTEGER REFERENCES orders(order_id),
    policy_id       TEXT,                             -- e.g. 'DELAY-001'
    expires_at      TEXT,
    created_at      TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- DB-level enforcement of "max one delay goodwill credit per order" (DELAY-005).
CREATE UNIQUE INDEX ux_one_delay_credit_per_order
    ON store_credits(source_order_id) WHERE reason = 'goodwill_delay';

-- ============================== WARRANTY ====================================
CREATE TABLE warranties (
    warranty_id   INTEGER PRIMARY KEY,
    order_item_id INTEGER REFERENCES order_items(order_item_id),
    product_id    INTEGER NOT NULL REFERENCES products(product_id),
    customer_id   INTEGER NOT NULL REFERENCES customers(customer_id),
    type          TEXT    NOT NULL CHECK (type IN ('manufacturer','protection_plan')),
    starts_at     TEXT    NOT NULL,
    ends_at       TEXT    NOT NULL,
    status        TEXT    NOT NULL DEFAULT 'active'
                          CHECK (status IN ('active','expired','claimed','void')),
    created_at    TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE warranty_claims (
    warranty_claim_id INTEGER PRIMARY KEY,
    warranty_id       INTEGER NOT NULL REFERENCES warranties(warranty_id) ON DELETE CASCADE,
    description       TEXT,
    status            TEXT    NOT NULL DEFAULT 'submitted'
        CHECK (status IN ('submitted','assessing','approved','rejected','repaired','replaced','refunded')),
    resolution        TEXT,
    created_at        TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at        TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- =========================== SUPPORT / AGENT ================================
CREATE TABLE support_tickets (
    ticket_id        INTEGER PRIMARY KEY,
    ticket_number    TEXT    NOT NULL UNIQUE,         -- 'TKT-9001'
    customer_id      INTEGER REFERENCES customers(customer_id),
    order_id         INTEGER REFERENCES orders(order_id),
    channel          TEXT    NOT NULL DEFAULT 'chat'
                             CHECK (channel IN ('chat','email','phone','social')),
    category         TEXT    CHECK (category IS NULL OR category IN
                             ('refunds','returns','shipping','delays','damaged','payments',
                              'account','warranty','promotions','order_management','other')),
    subject          TEXT,
    status           TEXT    NOT NULL DEFAULT 'open'
                             CHECK (status IN ('open','pending','pending_approval','escalated','resolved','closed')),
    priority         TEXT    NOT NULL DEFAULT 'normal'
                             CHECK (priority IN ('low','normal','high','urgent')),
    escalated        INTEGER NOT NULL DEFAULT 0 CHECK (escalated IN (0,1)),
    escalation_reason TEXT,
    assigned_to      TEXT    NOT NULL DEFAULT 'bot' CHECK (assigned_to IN ('bot','human')),
    assigned_staff_id INTEGER REFERENCES support_staff(staff_id),
    sentiment        TEXT    CHECK (sentiment IS NULL OR sentiment IN ('positive','neutral','negative','abusive')), -- abuse → ESC-003
    policy_id_cited  TEXT,                            -- e.g. 'REF-001' (ties to _KB for QA)
    contact_count    INTEGER NOT NULL DEFAULT 1 CHECK (contact_count >= 1), -- repeat-contact (ESC-005)
    created_at       TEXT    NOT NULL DEFAULT (datetime('now')),
    updated_at       TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

CREATE TABLE ticket_messages (
    message_id INTEGER PRIMARY KEY,
    ticket_id  INTEGER NOT NULL REFERENCES support_tickets(ticket_id) ON DELETE CASCADE,
    sender     TEXT    NOT NULL CHECK (sender IN ('customer','agent','bot')),
    body       TEXT    NOT NULL,
    created_at TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- Audit log of every tool call / decision the AI agent makes.
-- Observability + a home for blocked prompt-injection attempts (status='blocked').
CREATE TABLE agent_actions (
    action_id         INTEGER PRIMARY KEY,
    ticket_id         INTEGER NOT NULL REFERENCES support_tickets(ticket_id) ON DELETE CASCADE,
    step_number       INTEGER NOT NULL,
    action_type       TEXT    NOT NULL
        CHECK (action_type IN ('retrieve','tool_call','decision','guardrail','reply','escalate')),
    tool_name         TEXT,
    input_json        TEXT,
    output_json       TEXT,
    policy_id         TEXT,
    risk_level        TEXT    NOT NULL DEFAULT 'low' CHECK (risk_level IN ('low','medium','high')),
    requires_approval INTEGER NOT NULL DEFAULT 0 CHECK (requires_approval IN (0,1)),
    status            TEXT    NOT NULL DEFAULT 'completed'
                              CHECK (status IN ('completed','failed','blocked','pending_approval')),
    input_tokens      INTEGER,
    output_tokens     INTEGER,
    latency_ms        INTEGER,
    created_at        TEXT    NOT NULL DEFAULT (datetime('now'))
) STRICT;

-- Human approval queue for actions beyond agent authority (refund > $100, REF-002).
CREATE TABLE approvals (
    approval_id   INTEGER PRIMARY KEY,
    action_id     INTEGER REFERENCES agent_actions(action_id),
    ticket_id     INTEGER NOT NULL REFERENCES support_tickets(ticket_id),
    reason        TEXT    NOT NULL,                   -- e.g. 'refund > $100 (REF-002)'
    amount_cents  INTEGER CHECK (amount_cents IS NULL OR amount_cents >= 0),
    status        TEXT    NOT NULL DEFAULT 'pending'
                          CHECK (status IN ('pending','approved','rejected','expired')),
    decided_by    INTEGER REFERENCES support_staff(staff_id),
    requested_at  TEXT    NOT NULL DEFAULT (datetime('now')),
    decided_at    TEXT,
    notes         TEXT
) STRICT;

-- =============================== INDEXES =====================================
-- SQLite does NOT auto-index FK columns; index lookups the API will hit most.
CREATE INDEX idx_addresses_customer       ON addresses(customer_id);
CREATE INDEX idx_products_category        ON products(category_id);
CREATE INDEX idx_variants_product         ON product_variants(product_id);
CREATE INDEX idx_payment_methods_customer ON payment_methods(customer_id);
CREATE INDEX idx_orders_customer          ON orders(customer_id);
CREATE INDEX idx_orders_status            ON orders(status);
CREATE INDEX idx_orders_customer_placed   ON orders(customer_id, placed_at);
CREATE INDEX idx_order_items_order        ON order_items(order_id);
CREATE INDEX idx_order_items_product      ON order_items(product_id);
CREATE INDEX idx_status_history_order     ON order_status_history(order_id);
CREATE INDEX idx_shipments_order          ON shipments(order_id);
CREATE INDEX idx_shipments_tracking       ON shipments(tracking_number);
CREATE INDEX idx_shipment_items_shipment  ON shipment_items(shipment_id);
CREATE INDEX idx_payments_order           ON payments(order_id);
CREATE INDEX idx_returns_order            ON returns(order_id);
CREATE INDEX idx_returns_customer         ON returns(customer_id);
CREATE INDEX idx_return_items_return      ON return_items(return_id);
CREATE INDEX idx_refunds_order            ON refunds(order_id);
CREATE INDEX idx_refunds_customer         ON refunds(customer_id);
CREATE INDEX idx_claims_order             ON claims(order_id);
CREATE INDEX idx_claims_customer          ON claims(customer_id);
CREATE INDEX idx_store_credits_customer   ON store_credits(customer_id);
CREATE INDEX idx_warranties_customer      ON warranties(customer_id);
CREATE INDEX idx_tickets_customer         ON support_tickets(customer_id);
CREATE INDEX idx_tickets_order            ON support_tickets(order_id);
CREATE INDEX idx_shipment_events_ship     ON shipment_events(shipment_id, event_time);
CREATE INDEX idx_disputes_order           ON payment_disputes(order_id);
CREATE INDEX idx_privacy_customer         ON privacy_requests(customer_id);
CREATE INDEX idx_agent_actions_ticket     ON agent_actions(ticket_id, step_number);
CREATE INDEX idx_approvals_status         ON approvals(status);
CREATE INDEX idx_approvals_ticket         ON approvals(ticket_id);
CREATE INDEX idx_products_brand           ON products(brand_id);
CREATE INDEX idx_inventory_warehouse      ON inventory(warehouse_id);

-- =============================== TRIGGERS ====================================
-- Keep updated_at honest on the most-mutated tables.
CREATE TRIGGER trg_customers_updated AFTER UPDATE ON customers
BEGIN UPDATE customers SET updated_at = datetime('now') WHERE customer_id = NEW.customer_id; END;

CREATE TRIGGER trg_orders_updated AFTER UPDATE ON orders
BEGIN UPDATE orders SET updated_at = datetime('now') WHERE order_id = NEW.order_id; END;

CREATE TRIGGER trg_shipments_updated AFTER UPDATE ON shipments
BEGIN UPDATE shipments SET updated_at = datetime('now') WHERE shipment_id = NEW.shipment_id; END;

CREATE TRIGGER trg_returns_updated AFTER UPDATE ON returns
BEGIN UPDATE returns SET updated_at = datetime('now') WHERE return_id = NEW.return_id; END;

CREATE TRIGGER trg_tickets_updated AFTER UPDATE ON support_tickets
BEGIN UPDATE support_tickets SET updated_at = datetime('now') WHERE ticket_id = NEW.ticket_id; END;

-- Log every order status change automatically.
CREATE TRIGGER trg_orders_status_log AFTER UPDATE OF status ON orders
WHEN NEW.status <> OLD.status
BEGIN
    INSERT INTO order_status_history(order_id, status, note)
    VALUES (NEW.order_id, NEW.status, 'auto: status change');
END;

-- =============================== VIEWS =======================================
-- These encode the agent's most common read patterns. The API can SELECT from
-- them directly instead of re-deriving policy logic in code.

-- Latest delivery fact per order (max delivered_at across shipments).
CREATE VIEW v_order_delivery AS
SELECT
    o.order_id,
    o.order_number,
    o.customer_id,
    o.status                         AS order_status,
    o.placed_at,
    o.promised_delivery_date,
    MAX(s.delivered_at)              AS delivered_at,
    CASE WHEN MAX(s.delivered_at) IS NOT NULL
         THEN CAST(julianday('now') - julianday(MAX(s.delivered_at)) AS INTEGER)
    END                              AS days_since_delivery,
    CASE
        WHEN MAX(s.delivered_at) IS NOT NULL AND o.promised_delivery_date IS NOT NULL
            THEN MAX(0, CAST(julianday(MAX(s.delivered_at)) - julianday(o.promised_delivery_date) AS INTEGER))
        WHEN MAX(s.delivered_at) IS NULL AND o.promised_delivery_date IS NOT NULL
            THEN MAX(0, CAST(julianday('now') - julianday(o.promised_delivery_date) AS INTEGER))
    END                              AS days_late
FROM orders o
LEFT JOIN shipments s ON s.order_id = o.order_id
GROUP BY o.order_id;

-- Delay goodwill tier (DELAY-001): $0 / $5 / $15, one per order.
CREATE VIEW v_delivery_status AS
SELECT
    d.*,
    CASE
        WHEN d.days_late IS NULL OR d.days_late <= 2 THEN 0
        WHEN d.days_late BETWEEN 3 AND 5            THEN 500
        WHEN d.days_late > 5                        THEN 1500
    END AS suggested_goodwill_credit_cents,
    EXISTS (SELECT 1 FROM store_credits sc
            WHERE sc.source_order_id = d.order_id AND sc.reason = 'goodwill_delay'
              AND sc.amount_cents > 0) AS goodwill_credit_already_given
FROM v_order_delivery d;

-- Refund eligibility (REF-001/002/003): window + prior-refund + $100 threshold.
CREATE VIEW v_refund_eligibility AS
SELECT
    o.order_id,
    o.order_number,
    o.customer_id,
    o.order_value_cents,
    d.delivered_at,
    d.days_since_delivery,
    (d.days_since_delivery IS NOT NULL AND d.days_since_delivery <= 30) AS within_window,
    EXISTS (SELECT 1 FROM refunds r WHERE r.order_id = o.order_id)      AS has_prior_refund,
    EXISTS (SELECT 1 FROM payment_disputes pd WHERE pd.order_id = o.order_id
            AND pd.status IN ('open','under_review'))                  AS has_open_dispute,
    (o.order_value_cents <= 10000)                                     AS agent_can_approve, -- $100.00
    CASE
        -- Precedence: open dispute (PAY-004) > prior refund (REF-003) > window/value (REF-001/002)
        WHEN EXISTS (SELECT 1 FROM payment_disputes pd WHERE pd.order_id = o.order_id
                     AND pd.status IN ('open','under_review'))          THEN 'blocked_open_dispute'
        WHEN EXISTS (SELECT 1 FROM refunds r WHERE r.order_id = o.order_id) THEN 'blocked_prior_refund'
        WHEN d.delivered_at IS NULL                                        THEN 'not_yet_delivered'
        WHEN d.days_since_delivery > 30                                    THEN 'outside_window'
        WHEN o.order_value_cents > 10000                                   THEN 'eligible_needs_human_approval'
        ELSE 'eligible_agent_can_approve'
    END AS refund_verdict
FROM orders o
LEFT JOIN v_order_delivery d ON d.order_id = o.order_id;

-- Current store-credit balance per customer.
CREATE VIEW v_store_credit_balance AS
SELECT customer_id, COALESCE(SUM(amount_cents),0) AS balance_cents
FROM store_credits
GROUP BY customer_id;

-- Flat order summary for quick lookups / WISMO.
CREATE VIEW v_order_summary AS
SELECT
    o.order_id, o.order_number, o.status, o.placed_at, o.promised_delivery_date,
    o.shipping_method, o.grand_total_cents, o.order_value_cents,
    c.customer_id, c.email, c.first_name, c.last_name,
    s.carrier, s.tracking_number, s.tracking_url, s.status AS shipment_status,
    s.estimated_delivery_date, s.delivered_at, s.signed_by, s.delivery_photo,
    (SELECT COUNT(*) FROM refunds r WHERE r.order_id = o.order_id)                 AS refund_count,
    (SELECT COUNT(*) FROM store_credits sc WHERE sc.source_order_id = o.order_id
       AND sc.reason = 'goodwill_delay' AND sc.amount_cents > 0)                   AS delay_credit_count,
    (SELECT COUNT(*) FROM payment_disputes pd WHERE pd.order_id = o.order_id
       AND pd.status IN ('open','under_review'))                                   AS open_disputes
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
LEFT JOIN shipments s ON s.shipment_id = (
    SELECT shipment_id FROM shipments s2 WHERE s2.order_id = o.order_id
    ORDER BY s2.created_at DESC LIMIT 1
);

-- Per-line return rules (category policy class + product flags), for return decisions.
CREATE VIEW v_order_item_return_rules AS
SELECT
    oi.order_id, o.order_number, oi.order_item_id, oi.title, oi.line_total_cents,
    cat.slug AS category, cat.return_policy_class,
    p.is_returnable, p.is_final_sale, p.is_perishable, p.hygiene_restricted,
    p.requires_data_wipe, p.is_bulky, p.restocking_fee_pct, p.warranty_months, p.warranty_type
FROM order_items oi
JOIN orders o       ON o.order_id = oi.order_id
JOIN products p     ON p.product_id = oi.product_id
JOIN categories cat ON cat.category_id = p.category_id;

-- Open approval queue for human reviewers (the >$100 workflow).
CREATE VIEW v_pending_approvals AS
SELECT a.approval_id, a.ticket_id, t.ticket_number, a.reason, a.amount_cents, a.requested_at
FROM approvals a
JOIN support_tickets t ON t.ticket_id = a.ticket_id
WHERE a.status = 'pending'
ORDER BY a.requested_at;
