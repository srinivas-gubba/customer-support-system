---
policy_id: ORD-002
title: "Modify an order"
category: order-management
tags: [modify, edit order, change size, change quantity, add item]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["already shipped", "store-caused error after shipment"]
related: [ORD-001, ORD-003, SHIP-005, RET-006]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Modify an Order

**Summary.** Size, color, quantity, and address changes are possible **only before fulfillment**.
**Items cannot be added** to an existing order — cancel and reorder (if still cancellable) or place a
new order. After shipment, use returns or exchanges.

## Rule details
- IF **not in fulfillment** → apply the change after verifying ownership.
- **Adding an item** is not possible → place a new order.
- Address changes have their own article → [SHIP-005](../shipping-and-delivery/address-changes.md).
- After shipment → [ORD-003](cancellation-after-shipment.md) / exchange ([RET-006](../returns/exchanges.md)).

## Examples
1. Wrong size, not shipped → swap the size now.
2. Customer wants to add a second item → can't add; place a new order (or cancel + reorder if
   nothing shipped).
3. Already shipped, wrong size → set up an exchange on arrival.

## What the agent must not do
- Do not add items to an existing order.
- Do not modify after fulfillment; do not change details without verifying ownership.

## Escalation
Already shipped with a store-caused error → escalate for a no-cost fix.

## Customer-facing wording
> "Since order #{id} hasn't shipped, I can change the size to Large now. I can't add items to an
> existing order, but I can set up a new one if you'd like."

## Related
- [Cancel an order](cancel-an-order.md) (ORD-001)
- [Address changes](../shipping-and-delivery/address-changes.md) (SHIP-005)
