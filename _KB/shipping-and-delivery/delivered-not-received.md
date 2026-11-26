---
policy_id: SHIP-007
title: "Delivered but not received (DNR)"
category: shipping-and-delivery
tags: [delivered not received, marked delivered, stolen, porch, DNR, not arrived]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "repeat DNR claims on account", "carrier photo contradicts claim"]
related: [SHIP-006, SHIP-004, ACCT-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Delivered But Not Received (DNR)

**Summary.** Tracking shows **delivered** but the customer says it didn't arrive. Run the basic
checks and a **24–48 hour wait** (most are found), then resolve with a **reship or refund**. Watch
for fraud signals on high-value or repeat claims. Value **over $100** needs human approval.

## Steps
1. Verify the delivery address matches the order.
2. Ask the customer to check: doors/porch, mailroom, parcel lockers, household members, neighbors,
   and any carrier note/photo.
3. Ask them to **wait 24–48 hours** — packages are sometimes marked delivered early.
4. IF still not found → offer **reship** (if in stock) or **refund**.
5. For suspected theft → the customer may file a police report; we can support a carrier claim.
6. IF `order_value ≤ $100` → agent approves; ELSE escalate.

## Rule details
- Use carrier **delivery photo/signature** where available to confirm location before deciding.
- Treat the customer respectfully; lean on evidence, never accusation.
- IF a carrier photo/signature **contradicts** the claim, or the account shows repeat DNR claims →
  escalate (fraud guard, [ACCT-005](../account-and-privacy/what-data-we-share-with-support.md) for
  data handling).

## Examples
1. $40 order marked delivered, not found after checks + 24h → reship or refund.
2. **$150** order DNR → escalate (over $100).
3. Carrier photo shows the package at the customer's door → share respectfully; escalate if disputed.

## What the agent must not do
- Do not reship before the basic checks + wait.
- Do not accuse the customer; do not approve over $100.

## Escalation
Value over $100, repeat DNR claims, or carrier evidence contradicting the claim → escalate.

## Customer-facing wording
> "It's marked delivered, so let's find it first — could you check with neighbors and household and
> give it 24 hours? If it's still missing, I'll sort a reship or refund right away."

## Related
- [Lost or stolen packages](lost-or-stolen-packages.md) (SHIP-006)
- [Tracking your order](tracking-your-order.md) (SHIP-004)
