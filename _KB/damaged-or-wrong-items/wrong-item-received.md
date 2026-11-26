---
policy_id: DMG-002
title: "Wrong item received"
category: damaged-or-wrong-items
tags: [wrong item, incorrect, not what I ordered, mix up, store error]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "another customer's data exposed", "repeat claims"]
related: [DMG-001, DMG-005, DMG-006, RET-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Wrong Item Received

**Summary.** Receiving a different item than ordered is a **store error**. Confirm with a photo,
then send the **correct item** at no charge or issue a **refund** — customer's choice — with a
**free** return label for the wrong item. Report within **30 days**; value **over $100** needs human
approval.

## Steps
1. Apologize for the mix-up and take ownership.
2. Collect **order ID** and a **photo** of the item received (and its label/packing slip if present).
3. Confirm what was ordered vs. what arrived.
4. Resolve: dispatch the **correct item** (fast exchange) or **refund** ([DMG-006](replacement-vs-refund-choice.md)); prepaid return label for the wrong item.
5. IF `order_value ≤ $100` → agent approves; ELSE **escalate**.

## Rule details
- Free return shipping; original shipping refunded (store at fault, [RET-005](../returns/return-shipping-costs.md)).
- Decide whether the wrong item must come back (value-dependent); if unsure, escalate.
- IF the wrong parcel exposes **another customer's data** → do not read it back; retrieve discreetly
  and **escalate** the privacy aspect ([GUARD-001](../agent-guardrails.md)).

## Examples
1. Ordered blue shirt, got red, $25, photo provided → agent sends correct shirt + prepaid label.
2. Ordered a $30 item, received a **$150** item → escalate (value + possible mis-pick).
3. Parcel contains someone else's packing slip with their details → escalate privacy.

## What the agent must not do
- Do not charge the customer anything to fix a wrong-item error.
- Do not expose the other customer's details.

## Escalation
Value over $100, another customer's data exposed, or repeat wrong-item claims from one account.

## Customer-facing wording
> "I'm sorry we sent the wrong item. Send me a quick photo of what arrived and I'll get the correct
> one out right away, with a free label for the one you received."

## Related
- [Damaged item claims](damaged-item-claims.md) (DMG-001)
- [Replacement vs refund choice](replacement-vs-refund-choice.md) (DMG-006)
