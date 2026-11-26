# Customer / Commerce Database (`db/`)

The data layer the support agent reads (via an API, built later) to answer and **act** on tickets.
SQLite for now; the schema is written to port cleanly to Postgres/MySQL later.

> **Written for:** whoever builds the API + agent on top of this DB.

## Files
| File | What it is |
|---|---|
| `schema.sql` | DDL — 34 tables, indexes, 7 views, triggers. STRICT, type-enforced. |
| `seed.sql` | Deterministic **fixtures**: 6 customers, 15 products, 11 eval orders (`ORD-100001..100011`) mapped 1:1 to the KB eval cases. |
| `seed_db.py` | **Bulk generator** (stdlib only): loads schema + `seed.sql`, then layers thousands of synthetic orders on top. |
| `build.sh` | One command to build `ecommerce.db` (full by default, `--minimal` for fixtures only). |
| `ecommerce.db` | **Generated** output (safe to delete; rebuild with `build.sh`). |

## Build & inspect
```bash
bash db/build.sh                     # FULL: schema + fixtures + ~6,000 bulk orders (~81k rows, ~9 MB)
bash db/build.sh --orders 10000      # scale up (5-10k supported); also --customers, --seed
bash db/build.sh --minimal           # fixtures only (~11 orders) — fast, for quick checks
sqlite3 db/ecommerce.db              # open a shell
DB=/tmp/test.db bash db/build.sh     # build elsewhere
```
The default dataset is ~1,800 customers, ~6,000 orders, ~10k order lines, ~29k carrier scans, ~750
past tickets with agent-action logs, plus returns/refunds/claims/disputes/credits. Dates are
generated **relative to today**, so "days late" / delivery windows stay meaningful — rebuild to
refresh. The eval fixtures `ORD-100001..100011` are always included (bulk orders use `ORD-2xxxxx`
and higher ids, so they never collide).

## Conventions (important)
- **Money = INTEGER cents**, columns suffixed `_cents` ($1.00 → `100`). No floats → no rounding
  drift in refund math or the $100 threshold.
- **Dates = TEXT, ISO-8601 UTC** (`YYYY-MM-DD` or `YYYY-MM-DD HH:MM:SS`). Compute with
  `julianday()`. Seed data uses `date('now','-N days')` so scenarios stay current.
- **Booleans = INTEGER 0/1**; **enums = TEXT with CHECK**.
- **STRICT tables** (type-enforced) with surrogate INTEGER PKs + business keys
  (`order_number`, `rma_number`, `sku`, `email`).
- **Foreign keys are enforced but OFF by default per connection** — the API **must** run
  `PRAGMA foreign_keys = ON;` on every connection. FK columns are explicitly indexed (SQLite does
  not auto-index them).

## Table catalog (by domain)
**Identity** — `customers` (unique email, `loyalty_tier`, `account_status` incl. `fraud_hold`),
`addresses`, `support_staff` (human approvers + `approval_limit_cents`)
**Catalog** — `categories` (`return_policy_class` → product-specific KB rules), `brands`, `products`
(policy flags: `is_returnable`, `is_final_sale`, `is_perishable`, `hygiene_restricted`,
`requires_data_wipe`, `is_bulky`, `restocking_fee_pct`, `warranty_months`, `warranty_type`
full/limited, `restock_eta`, `brand_id`), `product_variants`, `warehouses`, `inventory`
(per-warehouse stock + `restock_eta` for backorders)
**Orders** — `orders` (+ generated `order_value_cents` = subtotal − discount, `cancelled_at`),
`order_items` (price snapshots), `order_status_history`, `order_promotions`
**Fulfillment** — `carriers` (+ tracking-URL template), `shipments` (`delivered_at` =
carrier-confirmed delivery, `carrier_id`, `signed_by`, `delivery_photo`, `tracking_url`),
`shipment_items` (split shipments), `shipment_events` (carrier scan history → WISMO timeline)
**Payments** — `payment_methods` (tokenized: brand + last4 only, **never full PAN**), `payments`
(event log incl. `failure_reason` for declines), `payment_disputes` (chargebacks — block refunds)
**Returns/Refunds/Claims** — `returns`, `return_items`, `refunds` (one row per refund → powers the
one-refund-per-order check; `requires_approval`, `approved_by_type`, `policy_id`), `claims`
(damaged/wrong/missing/defective)
**Credit & promos** — `store_credits` (ledger; balance = SUM; **unique index = max one delay credit
per order**), `gift_cards`, `promotions`
**Warranty** — `warranties`, `warranty_claims`
**Privacy** — `privacy_requests` (CCPA; `acknowledge_by` +10 biz days, `respond_by` +45 days)
**Support & agent** — `support_tickets` (`policy_id_cited`, `escalated`, `contact_count`,
`sentiment` incl. `abusive`, `assigned_staff_id`), `ticket_messages`, `agent_actions` (per-step
audit log; blocked prompt-injections land here as `status='blocked'`), `approvals` (human sign-off
queue for actions over $100)

## Views — policy logic the API can SELECT directly
| View | Encodes | Key columns |
|---|---|---|
| `v_order_summary` | WISMO / order lookup | status, tracking, `tracking_url`, `delivered_at`, `signed_by`, `delivery_photo`, `refund_count`, `delay_credit_count`, `open_disputes` |
| `v_order_delivery` | delivery facts | `days_since_delivery`, `days_late` |
| `v_refund_eligibility` | **REF-001/002/003 + PAY-004** | `within_window`, `has_prior_refund`, `has_open_dispute`, `agent_can_approve`, `refund_verdict` |
| `v_delivery_status` | **DELAY-001** | `suggested_goodwill_credit_cents` ($0/$5/$15), `goodwill_credit_already_given` |
| `v_store_credit_balance` | store credit | `balance_cents` per customer |
| `v_order_item_return_rules` | per-line return rules | `return_policy_class`, flags, `restocking_fee_pct`, `warranty_type` |
| `v_pending_approvals` | **>$100 human queue** | `ticket_number`, `reason`, `amount_cents` |

`refund_verdict` values: `eligible_agent_can_approve`, `eligible_needs_human_approval`,
`outside_window`, `blocked_prior_refund`, `blocked_open_dispute`, `not_yet_delivered`.

> **v1.2 — fully consolidated from the "ShopNest" design (`shopnest.db` now removed).** This single
> `ecommerce.db` is a superset of that database. Pulled in: `support_staff`, `shipment_events`,
> `payment_disputes`, `privacy_requests`, `agent_actions`, `approvals`, `brands`, `carriers`,
> `warehouses`, `inventory`; the approval/decline columns on `refunds`; delivery-evidence columns on
> `shipments`; `failure_reason` on `payments`; and a DB-level unique index enforcing one delay credit
> per order. (ShopNest's `damage_claims` corresponds to this schema's `claims`.) Everything unique to
> this schema — the verdict views, `product_variants`, `gift_cards`, `warranties`/`warranty_claims`,
> `order_status_history`, STRICT typing — is retained.

## Relationships (text ER)
```
customers 1─* addresses, orders, payment_methods, returns, refunds, claims, store_credits, warranties, support_tickets
categories 1─* products 1─* product_variants
orders 1─* order_items, shipments, payments, order_status_history, order_promotions
shipments 1─* shipment_items ─1 order_items          (split shipments)
orders 1─* returns 1─* return_items ─1 order_items
orders 1─* refunds        (0..1 typical; one-refund-per-order enforced in logic)
orders 1─* claims ─0..1 order_items
warranties 1─* warranty_claims
support_tickets 1─* ticket_messages
```

## Example agent/API queries (map to KB policy IDs)

**Identity verification — order # + email on file (ACCT-001):**
```sql
SELECT order_number, status, first_name, last_name, tracking_number, delivered_at
FROM v_order_summary
WHERE order_number = :order_number AND email = :email;   -- email is COLLATE NOCASE
-- 0 rows => verification fails; do not disclose details.
```

**WISMO — where is my order (SHIP-004):**
```sql
SELECT status, shipment_status, carrier, tracking_number, estimated_delivery_date, delivered_at
FROM v_order_summary WHERE order_number = :order_number;
```

**Refund decision (REF-001/002/003) — one row says it all:**
```sql
SELECT refund_verdict, within_window, has_prior_refund, agent_can_approve, order_value_cents
FROM v_refund_eligibility WHERE order_number = :order_number;
```

**Delay goodwill (DELAY-001):**
```sql
SELECT days_late, suggested_goodwill_credit_cents, goodwill_credit_already_given
FROM v_delivery_status WHERE order_number = :order_number;
```

**Store-credit balance (PROMO-001):**
```sql
SELECT balance_cents FROM v_store_credit_balance WHERE customer_id = :cid;
```

**Product return rule (product-specific rules):**
```sql
SELECT p.title, c.return_policy_class, p.is_returnable, p.is_final_sale,
       p.hygiene_restricted, p.requires_data_wipe, p.restocking_fee_pct, p.warranty_months
FROM order_items oi JOIN products p ON p.product_id = oi.product_id
JOIN categories c ON c.category_id = p.category_id
WHERE oi.order_id = (SELECT order_id FROM orders WHERE order_number = :order_number);
```

## Notes for the upcoming API layer
- Expose the **views** for read paths (they carry the policy verdicts) and keep write paths
  (refunds, returns, credits, tickets) behind explicit, audited endpoints.
- Always `PRAGMA foreign_keys = ON;` per connection; use **parameterized** queries only.
- Enforce the **$100 threshold** and **one-refund-per-order** using `v_refund_eligibility`, not
  ad-hoc code, so the API and the KB never disagree.
- The agent never selects `payment_methods.last4` to a customer as proof, and the DB stores no full
  card data — consistent with `_KB/agent-guardrails.md`.

## Portability
To move to Postgres later: `INTEGER PK` → `BIGSERIAL`/identity; `datetime('now')` → `now()`;
`julianday()` diffs → `AGE()`/date subtraction; keep cents as `BIGINT`; `STRICT` drops (Postgres is
already strict); CHECK/enum constraints carry over (or become `ENUM` types).

## Placeholders
`{{STORE_NAME}}` appears in SQL comments only — cosmetic. All data is fictional sample data.

_Schema v1.0 · 2026-11-17_
