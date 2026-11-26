---
policy_id: ORD-004
title: "Backorders and preorders"
category: order-management
tags: [backorder, preorder, out of stock, delay notice, release date]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["indefinite backorder + customer wants refund", "order_value > 100"]
related: [DELAY-003, ORD-001, PROD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Backorders and Preorders

**Summary.** Backorders and preorders ship when stock/the release arrives. They fall under the **FTC
delay-notice** duties: if the ship date slips, the customer must be offered the choice to **cancel
for a full refund**. The customer can cancel an unshipped preorder/backorder at any time before it
ships.

## Rule details
- Communicate the expected ship/release date up front.
- IF the date slips → send a delay notice offering **cancel-for-refund** ([DELAY-003](../delays-and-compensation/delay-notices-and-your-right-to-cancel.md)).
- IF the customer cancels before shipment → **full refund to original payment method** ([ORD-001](cancel-an-order.md)).
- A charge may be an **authorization hold** until shipment, depending on payment setup ([PAY-003](../payments-and-billing/duplicate-or-pending-charges.md)).

## Examples
1. Preorder with a Dec 1 release → ships on/after release; customer can cancel any time before.
2. Backorder date slips from Nov to January → delay notice; customer may cancel for a full refund.
3. Customer wants out of an indefinite backorder → cancel + full refund; escalate if over $100.

## What the agent must not do
- Do not hold a customer to a backorder without offering cancel-for-refund when the date slips.
- Do not offer store credit instead of a refund on a cancelled, unshipped backorder.

## Escalation
Indefinite backorder + refund request, or value over $100 → escalate.

## Customer-facing wording
> "That item is on backorder with an estimated ship date of {date}. You can wait, or cancel any time
> before it ships for a full refund — just let me know."

## Related
- [Delay notices & right to cancel](../delays-and-compensation/delay-notices-and-your-right-to-cancel.md) (DELAY-003)
- [Cancel an order](cancel-an-order.md) (ORD-001)
