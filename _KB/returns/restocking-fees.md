---
policy_id: RET-009
title: "Restocking fees: opened electronics only"
category: returns
tags: [restocking fee, 15 percent, opened electronics, deduction]
applies_to: [laptops, smartphones, tablets, mobile-accessories]
agent_can_approve: true
approval_limit_usd: 100
related: [RET-003, REF-005, PROD-003]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Restocking Fees: Opened Electronics Only

**Summary.** {{STORE_NAME}} charges **no restocking fee** on most items. The only exception is
**opened electronics** (laptops, smartphones, tablets), which carry a **15% restocking fee** on
change-of-mind returns. **Unopened** items and **store-at-fault** returns never incur a fee.

## Rule details
- Default restocking fee: **0%**.
- IF item is **opened electronics** AND return reason is **change of mind** → **15%** restocking fee,
  deducted from the refund ([REF-005](../refunds/partial-refunds-and-deductions.md)).
- IF item is **unopened** → **no fee**.
- IF **store at fault** (damaged/defective/wrong) → **no fee**, ever.
- Disclose the fee **before** the customer returns the item.

## Examples
1. Opened $200 laptop, change of mind → 15% = **$30** fee → refund $170 (escalate: over $100).
2. Unopened $200 laptop, change of mind → **no fee** → refund $200 (escalate: over $100).
3. Opened laptop that was **defective** → **no fee** → full remedy via [DMG-004](../damaged-or-wrong-items/defective-on-arrival.md).

## What the agent must not do
- Do not apply a restocking fee to non-electronics or to unopened items.
- Do not apply a fee when the store is at fault.
- Do not apply the fee without disclosing it first.

## Escalation
Disputed fee or electronics order value over $100 → escalate.

## Customer-facing wording
> "Since the laptop's been opened and this is a change-of-mind return, a 15% restocking fee applies
> — that's $30 on a $200 item, so your refund would be $170. If it's actually faulty, there's no
> fee and I'll handle it differently."

## Related
- [Return condition requirements](return-condition-requirements.md) (RET-003)
- [Partial refunds & deductions](../refunds/partial-refunds-and-deductions.md) (REF-005)
- [Electronics data wipe & returns](../product-specific-rules/electronics-data-wipe-and-returns.md) (PROD-003)
