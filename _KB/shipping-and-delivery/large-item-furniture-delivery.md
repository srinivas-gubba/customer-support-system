---
policy_id: SHIP-008
title: "Large item and furniture delivery"
category: shipping-and-delivery
tags: [furniture, bulky, large item, white glove, full service, room of choice]
applies_to: [furniture, home-decoration]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "white-glove damage report"]
related: [SHIP-001, DMG-001, PROD-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Large Item and Furniture Delivery

**Summary.** Bulky items ship with tiered delivery (curbside, room-of-choice, or white-glove). For
**white-glove / full-service** deliveries, any **damage must be reported within 3 days** (shorter
than the standard 30). Furniture must be returned **unassembled**.

## Rule details
- Delivery tiers: curbside, room-of-choice, white-glove (assembly/placement). Availability/cost show
  at checkout.
- Damage reporting: standard items **30 days**; **white-glove/full-service → 3 days** (inspect at
  delivery, [DMG-001](../damaged-or-wrong-items/damaged-item-claims.md)).
- Returns: furniture must be **unassembled**; change-of-mind return shipping on bulky items is the
  customer's cost ([PROD-004](../product-specific-rules/furniture-and-bulky-items.md)).

## Examples
1. White-glove sofa with a tear noticed at delivery → report **within 3 days** with photos.
2. Assembled bookshelf, change of mind → must be **disassembled** to return; bulky return shipping
   applies.
3. Curbside dresser damaged in transit → standard 30-day damage window.

## What the agent must not do
- Do not apply the 30-day damage window to a white-glove delivery (it's 3 days).
- Do not accept an assembled furniture return as "original condition."

## Escalation
White-glove damage reports, or value over $100 → escalate.

## Customer-facing wording
> "For white-glove deliveries, please check the item at delivery and report any damage within 3 days
> with photos — then we'll repair, replace, or refund."

## Related
- [Furniture and bulky items](../product-specific-rules/furniture-and-bulky-items.md) (PROD-004)
- [Damaged item claims](../damaged-or-wrong-items/damaged-item-claims.md) (DMG-001)
