---
policy_id: DMG-006
title: "Replacement vs refund choice"
category: damaged-or-wrong-items
tags: [replacement, refund, choice, store at fault, stock]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "replacement out of stock and customer wants it"]
related: [DMG-001, DMG-002, DMG-004, REF-002]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Replacement vs Refund Choice

**Summary.** For store-at-fault items (damaged/defective/wrong), the **customer chooses** a
**replacement** or a **full refund**. Replacements depend on **stock**. Either way it's free — no
return-shipping or restocking charge. **Over $100** requires human approval.

## Rule details
- Offer **both** options and let the customer pick.
- IF replacement **in stock** → reserve/ship it; prepaid label for the faulty/wrong item.
- IF replacement **out of stock** → offer full refund now, or a back-in-stock hold if they prefer to
  wait.
- IF `order_value ≤ $100` → agent approves; ELSE escalate ([REF-002](../refunds/refund-approval-limits.md)).
- Refund amount includes original shipping (store at fault).

## Examples
1. Damaged $50 item, replacement in stock → ship replacement + prepaid label; done.
2. Wrong $70 item, customer prefers money back → full refund + prepaid label.
3. Defective **$130** item, replacement in stock → escalate (over $100) with the customer's choice
   noted.

## What the agent must not do
- Do not force a replacement when the customer wants a refund (or vice versa).
- Do not promise a replacement that isn't in stock — offer refund or a hold.
- Do not approve over $100.

## Escalation
Value over $100, or the wanted replacement is out of stock and the customer won't accept a refund →
escalate.

## Customer-facing wording
> "Since this is on us, you can choose: I can send a replacement (it's in stock) or refund you in
> full. Which would you prefer?"

## Related
- [Damaged item claims](damaged-item-claims.md) (DMG-001)
- [Refund approval limits](../refunds/refund-approval-limits.md) (REF-002)
