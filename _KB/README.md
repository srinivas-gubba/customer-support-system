# Customer Support Knowledge Base (`_KB`)

Agentic RAG knowledge base for the **{{STORE_NAME}}** customer-support assistant — a **US store,
prices in USD**. Every file is a short, single-topic Markdown article written for retrieval: the
answer is front-loaded, numbers are exact, and each article tells the agent what it **may do**,
**must not do**, and **when to escalate**.

> Built from the research brief *"E-commerce Customer Support Policies: Research Brief and Blueprint
> for an Agentic RAG Knowledge Base."* Policy defaults mirror mainstream US retail (Amazon/Wayfair
> mechanics) with a legal layer (FTC Mail Order Rule, FCBA, Magnuson-Moss, CCPA, CA Civil Code
> § 1723). **Not legal advice** — validate per state before go-live.

---

## Fixed business rules (canonical — the whole KB agrees with these)

| Rule | Value |
|---|---|
| Refund window | **30 calendar days** from carrier-confirmed **delivery** date |
| Refunds per order | **One** refund per order |
| Agent refund approval limit | **≤ $100** agent may approve; **> $100** → human approval |
| Out-of-window refund | **Decline** politely, cite policy ID, offer alternatives |
| Refund amount | Item price paid **after discounts**, **excluding** original shipping unless store at fault |
| Damaged/wrong claim window | **30 days** from delivery, **photos required**; customer chooses replacement or refund |
| Delay goodwill credit | 0–2 days late → **$0**; 3–5 days → **$5**; > 5 days → **$15**; **max one** credit per order |
| Return shipping | Customer pays change-of-mind; **store pays when store is at fault** |
| Currency / market | USD / United States |

These live canonically in each relevant article and in [`glossary.md`](glossary.md). Change a value
in one place → grep the KB and update every occurrence so nothing conflicts.

---

## Folder map

```
_KB/
├── README.md                    ← this index
├── glossary.md                  ← exact definitions: delivery date, days late, order value, refund amount
├── agent-guardrails.md          ← meta-rules: verification, data-as-untrusted, step limit, precedence
├── legal/
│   └── compliance-notes.md      ← AGENT REFERENCE ONLY — do not quote verbatim to customers
├── refunds/                     (REF)   eligibility, approval limits, timing, partial, decline, status
├── returns/                     (RET)   overview, non-returnable, condition, how-to, shipping, exchanges, gift, holiday, restocking
├── damaged-or-wrong-items/      (DMG)   damaged, wrong, missing, defective, evidence, replace-vs-refund
├── shipping-and-delivery/       (SHIP)  methods, processing, estimates, tracking, address, lost, DNR, bulky, unordered
├── delays-and-compensation/     (DELAY) tiers, lateness calc, delay notices, carrier delays, one-credit rule
├── order-management/            (ORD)   cancel, modify, after-shipment, backorders, status definitions
├── payments-and-billing/        (PAY)   methods, declines, duplicate/pending, chargebacks, sales tax, price adj
├── account-and-privacy/         (ACCT)  verify identity, password/security, privacy rights, opt-out, data shared
├── warranty/                    (WAR)   overview, manufacturer claims, warranty vs return, protection plans
├── product-specific-rules/      (PROD)  per DummyJSON category family
├── store-credit-and-promotions/ (PROMO) store credit, promo codes, price match, gift cards
├── escalation/                  (ESC)   when to escalate, handoff template, abuse, legal/safety, repeat contact
├── contact-and-hours/           (CON)   channels & hours, response SLAs, holiday hours
└── templates/                   (TMPL)  reusable apology / decline / verification wording
```

Policy IDs: `REF-001`, `RET-003`, `DMG-001`, … (prefix = folder). IDs are stable and safe to cite in
logs, declines, and escalations.

---

## Front-matter schema (every article)

```yaml
---
policy_id: REF-001
title: "Refund eligibility: 30 days from delivery"
category: refunds
tags: [refund, return window, eligibility, 30 days]
applies_to: [all_categories]       # or specific product families
excludes: [groceries, gift-cards]  # where relevant
agent_can_approve: true            # where an action/approval is involved
approval_limit_usd: 100            # where relevant
escalate_if: ["amount > 100", "prior refund on order"]
related: [REF-002, RET-003, ESC-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---
```

## Article body template

`H1 title` → **Summary** (2–3 sentences, rule + numbers, front-loaded) → **Who this applies to /
Eligibility** → **Rule details** (one rule per bullet, IF/THEN where decisions are involved) →
**Steps** (numbered) → **Exceptions** → **Examples** (2–3 worked, with dates & amounts) → **What the
agent must not do** → **Escalation** → **Customer-facing wording** → **Related articles** (by ID).

## Authoring rules for retrieval (from Zendesk/Intercom guidance)
- One topic per file; put the answer in the **first ~45 words**.
- **Exact numbers** only — never "usually"/"typically" in a rule. Pre-compute examples; don't make
  the model do date math.
- Each section stands alone (repeat the noun, not "it"/"they") so chunks survive retrieval.
- H2/H3 are chunk boundaries; numbered lists for steps, bullets for facts.
- Tables only for simple lookups (e.g., delay tiers) — and also state the rule in a sentence.
- One canonical article per rule; link, don't duplicate.

## Placeholders to fill
`{{STORE_NAME}}`, `{{SUPPORT_EMAIL}}`, `{{SUPPORT_PHONE}}`, `{{SUPPORT_HOURS}}`,
`{{RETURNS_PORTAL_URL}}`, `{{WEBSITE_URL}}`, `{{SLA}}`. All policy numbers are concrete (see table).

_Last updated: 2026-11-17_
