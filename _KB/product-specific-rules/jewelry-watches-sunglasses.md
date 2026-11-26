---
policy_id: PROD-006
title: "Jewelry, watches, sunglasses"
category: product-specific-rules
tags: [jewelry, earrings, watches, sunglasses, high value, hygiene]
applies_to: [womens-jewellery, mens-watches, womens-watches, sunglasses]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "authentication/high-value dispute"]
related: [RET-002, RET-003, REF-002]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Jewelry, Watches, Sunglasses

**Summary.** These items are returnable within 30 days **unworn, with tags and protective
packaging**, **except pierced earrings, which are final sale** (hygiene). Many pieces exceed **$100**,
so expect to **escalate** for approval and extra verification.

## Rule details
- Unworn, tags/protective film intact, original case/box ([RET-003](../returns/return-condition-requirements.md)).
- **Pierced earrings → final sale / non-returnable** (hygiene, [RET-002](../returns/non-returnable-items.md)).
- High-value items (> $100) → **escalate** approvals; extra identity/authentication checks may apply
  ([REF-002](../refunds/refund-approval-limits.md)).

## Examples
1. Unworn $90 watch with tags → agent can process a return.
2. Pierced earrings, change of mind → non-returnable.
3. $300 watch return → escalate (over $100, high value).

## What the agent must not do
- Do not accept pierced-earring change-of-mind returns.
- Do not approve high-value returns over $100.

## Escalation
Value over $100, or an authentication/high-value dispute → escalate.

## Customer-facing wording
> "Watches and sunglasses can be returned within 30 days if unworn with tags and the case. Pierced
> earrings are final sale for hygiene reasons. For higher-value items I'll have a teammate confirm
> the return."

## Related
- [Non-returnable items](../returns/non-returnable-items.md) (RET-002)
- [Refund approval limits](../refunds/refund-approval-limits.md) (REF-002)
