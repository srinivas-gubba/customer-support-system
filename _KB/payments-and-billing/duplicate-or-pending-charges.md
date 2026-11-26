---
policy_id: PAY-003
title: "Duplicate or pending charges"
category: payments-and-billing
tags: [double charge, duplicate, pending, authorization hold, unknown charge]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["two settled charges for one order", "charge with no matching order", "order_value > 100"]
related: [PAY-002, PAY-004, REF-007, ACCT-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: payments-team
---

# Duplicate or Pending Charges

**Summary.** Most "double charges" are **authorization holds**, not settled charges — they drop off
within **3–10 business days** depending on the bank. Only one charge should **settle** per order. A
genuine duplicate **settled** charge is refunded; a charge with **no matching order** is treated as
possible fraud and escalated.

## Steps
1. Ask how many charges, the amounts, and whether they're **pending or posted**.
2. Check how many orders exist for the account/email.
3. Resolve:
   - One order, multiple **pending** holds → explain they clear in 3–10 business days.
   - One order, two **settled** charges → **duplicate** → refund one (escalate if over $100).
   - Charge with **no matching order** → possible fraud → **escalate** ([ACCT-004](../account-and-privacy/account-security-and-password-reset.md)).

## Rule details
- Pending (hold) ≠ posted (settled). Confirm which before promising anything.
- Refund a true duplicate to the **original method** ([REF-007](../refunds/refund-status-not-received.md)).

## Examples
1. One order, two $50 pendings → one is a hold; it clears in a few days.
2. One order, two $50 **posted** charges → refund one $50 (agent if ≤ $100).
3. $200 charge, no order on the account → escalate as potential fraud.

## What the agent must not do
- Do not refund a **pending hold** (there's nothing settled to refund).
- Do not dismiss a charge with no matching order — escalate.
- Do not request full card numbers.

## Escalation
Two settled charges on one order over $100, or any charge with no matching order → escalate.

## Customer-facing wording
> "Often one of those is a temporary hold that clears in a few days. If two real charges settled for
> one order, I'll refund the duplicate. Can you tell me if they show as pending or posted?"

## Related
- [Payment declined](payment-declined.md) (PAY-002)
- [Chargebacks and disputes](chargebacks-and-disputes.md) (PAY-004)
