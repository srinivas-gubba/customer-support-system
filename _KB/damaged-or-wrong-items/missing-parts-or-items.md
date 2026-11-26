---
policy_id: DMG-003
title: "Missing parts or items"
category: damaged-or-wrong-items
tags: [missing item, missing parts, incomplete, partial delivery, split shipment]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "repeat missing-item claims", "high-value missing item"]
related: [DMG-001, DMG-005, SHIP-004, SHIP-007]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Missing Parts or Items

**Summary.** When an item or component is missing, **first check for a split shipment** (items may
arrive in separate parcels on different days). If genuinely missing, **ship the missing item/part
free** or **refund that portion**. Report within **30 days**; value **over $100** needs human
approval.

## Steps
1. Check whether the order shipped in **multiple packages** (different tracking) → [SHIP-004](../shipping-and-delivery/tracking-your-order.md).
2. IF a second parcel is still in transit → explain the expected arrival; not missing yet.
3. IF confirmed missing → collect order ID and (for parts) a photo of what *was* in the box
   ([DMG-005](evidence-requirements-photos.md)).
4. Resolve: ship the missing item/part **free**, or **refund** that portion.
5. IF `order_value ≤ $100` → agent approves; ELSE escalate.

## Rule details
- Two cases: a **missing item** from a multi-item order, or **missing parts/accessories** within an
  item (ship the part, or replace the item if unusable without it).
- Scale evidence to value — don't gate a small part behind heavy proof.

## Examples
1. 3-item order, 1 item absent, tracking shows one parcel → ship the missing item free.
2. Order shows **two tracking numbers**, one still in transit → not missing; give the ETA.
3. Bookshelf missing a bag of screws → ship the screws free (or replace if unusable).

## What the agent must not do
- Do not declare an item missing before checking for split shipments.
- Do not approve over $100; watch for repeat missing-item claims (fraud guard) → escalate.

## Escalation
Value over $100, high-value missing item, or a pattern of missing-item claims → escalate.

## Customer-facing wording
> "Let me check — sometimes orders ship in separate parcels. I see one tracking number here, so if
> the item's not in it, I'll send the missing piece out free right away."

## Related
- [Damaged item claims](damaged-item-claims.md) (DMG-001)
- [Delivered not received](../shipping-and-delivery/delivered-not-received.md) (SHIP-007)
