---
policy_id: ORD-003
title: "Cancellation after shipment"
category: order-management
tags: [after shipment, refuse delivery, too late to cancel, return instead]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
related: [ORD-001, RET-001, RET-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Cancellation After Shipment

**Summary.** Once an order has shipped it **can't be cancelled**. The customer can **refuse delivery**
(it returns to us and is refunded on receipt) or accept it and start a **return** within the 30-day
window. Change-of-mind return shipping is the customer's cost unless the store is at fault.

## Rule details
- IF already shipped → offer: (a) **refuse delivery** at the door, or (b) accept and **return**
  ([RET-001](../returns/return-policy-overview.md)).
- Refused/returned change-of-mind orders: customer bears return shipping ([RET-005](../returns/return-shipping-costs.md));
  refund on receipt + inspection.
- Store-at-fault shipments (wrong/damaged) → free return.

## Examples
1. Shipped this morning, customer changed mind → refuse delivery or return on arrival (customer pays
   return shipping).
2. Shipped, then found defective on arrival → free return (store at fault).

## What the agent must not do
- Do not promise to "stop" a shipped package mid-transit.
- Do not charge return shipping when the store is at fault.

## Escalation
Value over $100, or a time-critical interception request → escalate.

## Customer-facing wording
> "It's already shipped, so I can't cancel it — but you can refuse it at the door, or accept it and
> return it within 30 days. Which works better for you?"

## Related
- [Cancel an order](cancel-an-order.md) (ORD-001)
- [Return policy overview](../returns/return-policy-overview.md) (RET-001)
