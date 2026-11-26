---
policy_id: SHIP-006
title: "Lost or stolen packages"
category: shipping-and-delivery
tags: [lost package, stolen, in transit, never arrived, reship, carrier trace]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "repeat lost claims on account", "delivered-not-received dispute"]
related: [SHIP-007, SHIP-004, DMG-001, REF-002]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Lost or Stolen Packages

**Summary.** When a package stops moving in transit and doesn't arrive, start a **carrier trace**,
confirm the address, and after a short wait resolve with a **reship or refund**. If tracking shows
**delivered** but the customer didn't get it, use the delivered-not-received flow instead
([SHIP-007](delivered-not-received.md)). Value **over $100** needs human approval.

## Steps
1. Confirm the shipping address on the order is correct.
2. Read tracking: confirm it left our possession and shows no delivery.
3. Ask the customer to wait a short period if it only just stalled, and to check with
   household/neighbors (overlaps with DNR).
4. IF confirmed not delivered and past the expected window → offer **reship** (if in stock) or
   **full refund** (customer's choice).
5. File a carrier claim internally (does not delay the customer's resolution).
6. IF `order_value ≤ $100` → agent approves; ELSE escalate.

## Rule details
- Do not make the customer wait on the carrier's investigation before helping.
- Reship requires stock; if out of stock → refund or back-in-stock hold.

## Examples
1. $50 order, no scans for a week past ETA → reship free or refund; file carrier claim.
2. **$140** order lost → escalate (over $100).
3. Tracking says delivered, customer says no → use [SHIP-007](delivered-not-received.md), not this.

## What the agent must not do
- Do not approve over $100.
- Do not reship repeatedly to an account showing a pattern of "lost" claims → escalate (fraud guard).

## Escalation
Value over $100, repeat lost claims, or a DNR dispute → escalate.

## Customer-facing wording
> "I'm sorry — tracking shows it hasn't been delivered and it's past the window. I can reship it free
> or refund you in full. Which would you prefer?"

## Related
- [Delivered not received](delivered-not-received.md) (SHIP-007)
- [Tracking your order](tracking-your-order.md) (SHIP-004)
