---
policy_id: PROD-003
title: "Electronics: data wipe and returns"
category: product-specific-rules
tags: [electronics, laptop, smartphone, tablet, factory reset, data wipe, restocking]
applies_to: [laptops, smartphones, tablets, mobile-accessories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "device locked to an account"]
related: [RET-003, RET-009, WAR-001, DMG-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Electronics: Data Wipe and Returns

**Summary.** Electronics follow the standard **30-day** window, but the customer must **factory
reset the device and sign out of all accounts** before returning it. **Opened** electronics carry a
**15% restocking fee** on change-of-mind returns (not if unopened or defective). Many electronics
orders exceed **$100**, so expect to **escalate** for approval.

## Rule details
- Return condition: **factory reset + signed out of all accounts** ([RET-003](../returns/return-condition-requirements.md)).
- **15% restocking fee** on **opened** change-of-mind electronics ([RET-009](../returns/restocking-fees.md));
  none if unopened or store at fault.
- Dead on arrival → arrival-defect flow ([DMG-004](../damaged-or-wrong-items/defective-on-arrival.md)); later defect → warranty ([WAR-001](../warranty/warranty-overview.md)).
- Order value often > $100 → **escalate** approvals.

## Examples
1. Opened $200 laptop, change of mind, reset done → 15% fee ($30) → escalate (over $100).
2. Unopened phone, change of mind → no fee → escalate (over $100).
3. Device still locked to the customer's account → ask them to sign out/reset before return.

## What the agent must not do
- Do not accept an electronics return still logged into an account.
- Do not approve over $100; do not charge a restocking fee on a defective item.

## Escalation
Order value over $100, or a device locked to an account the customer can't unlock → escalate.

## Customer-facing wording
> "Before returning the laptop, please factory-reset it and sign out of your accounts so your data
> is safe. Since it's been opened, a 15% restocking fee applies to a change-of-mind return."

## Related
- [Restocking fees](../returns/restocking-fees.md) (RET-009)
- [Defective on arrival](../damaged-or-wrong-items/defective-on-arrival.md) (DMG-004)
