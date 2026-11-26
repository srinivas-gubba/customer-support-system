---
policy_id: SHIP-005
title: "Address changes"
category: shipping-and-delivery
tags: [address change, wrong address, update address, before shipping]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order already shipped to wrong address", "store-caused address error"]
related: [ORD-002, SHIP-007, SHIP-006]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Address Changes

**Summary.** A shipping address can be changed **only before the order ships**. Once shipped, the
address can't be edited; options are to wait for a possible return-to-sender and reship, or (for a
delivery-in-progress) contact the carrier. A **store-caused** address error is fixed at no cost to
the customer.

## Rule details
- IF order **not shipped** → update the address after verifying the customer owns the order.
- IF order **shipped** → address can't be changed; explain return-to-sender/reship or carrier
  redirect options.
- IF the wrong address was **our error** → reship at no cost; escalate for the fix.

## Examples
1. Order still processing → update to the correct address immediately.
2. Order shipped to an old address the customer entered → wait for return-to-sender, then reship
   (reship cost per fault).
3. We mis-keyed the address → reship free; escalate.

## What the agent must not do
- Do not change an address without verifying order ownership (fraud/diversion risk).
- Do not promise a mid-transit address change the carrier may not honor.

## Escalation
Already shipped to a wrong address, or a store-caused error, or value over $100 → escalate.

## Customer-facing wording
> "Since order #{id} hasn't shipped yet, I can update the address now — what's the correct one? I'll
> confirm once it's changed."

## Related
- [Modify an order](../order-management/modify-an-order.md) (ORD-002)
- [Delivered not received](delivered-not-received.md) (SHIP-007)
