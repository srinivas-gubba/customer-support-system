---
policy_id: ORD-001
title: "Cancel an order"
category: order-management
tags: [cancel, cancellation, before shipping, refund]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "already shipped and customer wants exception", "delay-related cancel of unshipped order"]
related: [ORD-003, DELAY-003, REF-004, REF-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Cancel an Order

**Summary.** An order can be cancelled **free before it enters fulfillment / ships**. A successful
cancellation is **refunded in full to the original payment method**. Once shipped, it can't be
cancelled — the customer refuses delivery or returns it ([ORD-003](cancellation-after-shipment.md)).

## Steps
1. Treat as **time-sensitive**; verify ownership (order ID + email).
2. Check fulfillment status.
3. IF **not shipped** → cancel and issue a **full refund to original method** ([REF-004](../payments-and-billing/duplicate-or-pending-charges.md) for timing via REF-004).
4. IF **shipped** → explain the return path ([ORD-003](cancellation-after-shipment.md)).
5. IF `order_value > $100` → escalate for approval of the cancellation refund.

## Rule details
- Cancellation window: before fulfillment/ship (often a short window after ordering).
- **Delay-related cancel of an unshipped order** → full refund is **required** (FTC), not store
  credit → [DELAY-003](../delays-and-compensation/delay-notices-and-your-right-to-cancel.md).

## Examples
1. Order placed 10 minutes ago, not shipped, $60 → cancel + full refund.
2. Order shipped yesterday → can't cancel; set up refuse-delivery or return.
3. Unshipped order, customer cancels due to a delay → **full refund to card**, 7 working days.

## What the agent must not do
- Do not cancel without verifying ownership.
- Do not offer store credit instead of a refund for a cancelled, unshipped order.
- Do not approve a cancellation refund over $100.

## Escalation
Already shipped + exception requested, value over $100, or delay-cancel edge cases → escalate.

## Customer-facing wording
> "Order #{id} hasn't shipped, so I can cancel it now and refund the full ${amount} to your original
> payment method — it'll post per your card's timing. Shall I go ahead?"

## Related
- [Cancellation after shipment](cancellation-after-shipment.md) (ORD-003)
- [Delay notices & right to cancel](../delays-and-compensation/delay-notices-and-your-right-to-cancel.md) (DELAY-003)
