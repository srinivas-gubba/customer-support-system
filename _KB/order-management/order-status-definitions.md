---
policy_id: ORD-005
title: "Order status definitions"
category: order-management
tags: [order status, processing, shipped, out for delivery, delivered, exception]
applies_to: [all_categories]
related: [SHIP-004, SHIP-002, DELAY-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Order Status Definitions

**Summary.** A quick reference for what each order status means and the next step. Use it to give the
customer a specific status plus a concrete action.

## Status reference
| Status | Meaning | Next step |
|---|---|---|
| **Pending / Payment processing** | Payment being authorized | Clears in minutes → Processing |
| **Processing** | Order received, being prepared | Ships within 1–2 business days ([SHIP-002](../shipping-and-delivery/processing-times.md)) |
| **Shipped / In transit** | Handed to carrier | Track; arrives within estimate ([SHIP-004](../shipping-and-delivery/tracking-your-order.md)) |
| **Out for delivery** | On the vehicle today | Usually arrives same day |
| **Delivered** | Carrier marked delivered | If not received → [SHIP-007](../shipping-and-delivery/delivered-not-received.md) |
| **Exception / Delayed** | Carrier reported a problem | Delay flow ([DELAY-001](../delays-and-compensation/delay-compensation-tiers.md)) |
| **Returned to sender** | Undeliverable / refused | Reship or refund |
| **Cancelled** | Order cancelled | Refund per [ORD-001](cancel-an-order.md) |

## Rule details
- "Processing" within the 1–2 day window is **normal**, not late.
- "Delivered" with non-receipt → DNR flow, not lost-in-transit.

## What the agent must not do
- Do not interpret a status beyond what the system shows; escalate if ambiguous.

## Customer-facing wording
> "Order #{id} is '{status}', which means {meaning}. The next step is {action}."

## Related
- [Tracking your order](../shipping-and-delivery/tracking-your-order.md) (SHIP-004)
- [Processing times](../shipping-and-delivery/processing-times.md) (SHIP-002)
