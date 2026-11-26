---
policy_id: PROD-004
title: "Furniture and bulky items"
category: product-specific-rules
tags: [furniture, bulky, unassembled, return shipping, home decoration]
applies_to: [furniture, home-decoration]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "white-glove damage", "bulky return logistics"]
related: [SHIP-008, RET-003, RET-005, DMG-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Furniture and Bulky Items

**Summary.** Furniture must be returned **unassembled** within 30 days. **Change-of-mind** return
shipping on bulky items is the **customer's cost** (it can be significant); **store-at-fault** returns
are free. White-glove deliveries have a **3-day** damage-report window.

## Rule details
- Must be **unassembled** to count as original condition ([RET-003](../returns/return-condition-requirements.md)).
- Change-of-mind bulky return shipping → **customer pays** (deducted/arranged, [RET-005](../returns/return-shipping-costs.md)).
- Store at fault (damaged/wrong) → **free** return/replacement ([DMG-001](../damaged-or-wrong-items/damaged-item-claims.md)).
- White-glove/full-service damage → report within **3 days** ([SHIP-008](../shipping-and-delivery/large-item-furniture-delivery.md)).
- Many furniture orders exceed $100 → escalate approvals.

## Examples
1. Assembled bookshelf, change of mind → must disassemble; bulky return shipping is the customer's.
2. Sofa arrives torn (white-glove) → report within 3 days; free remedy.
3. $300 table, change of mind → escalate (over $100).

## What the agent must not do
- Do not accept assembled furniture as "original condition."
- Do not charge bulky return shipping when the store is at fault; do not approve over $100.

## Escalation
Value over $100, white-glove damage, or complex bulky-return logistics → escalate.

## Customer-facing wording
> "Furniture needs to be unassembled to return. For a change of mind, return shipping on large items
> is the customer's cost — I'll give you the amount before you commit. If it arrived damaged, it's
> free."

## Related
- [Large item & furniture delivery](../shipping-and-delivery/large-item-furniture-delivery.md) (SHIP-008)
- [Return shipping costs](../returns/return-shipping-costs.md) (RET-005)
