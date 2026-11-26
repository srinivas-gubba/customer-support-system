---
policy_id: DELAY-005
title: "One goodwill credit per order"
category: delays-and-compensation
tags: [one credit, per order, goodwill limit, store credit]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["second credit requested", "customer disputes the single-credit limit"]
related: [DELAY-001, PROMO-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# One Goodwill Credit Per Order

**Summary.** Each order receives **at most one** delay goodwill credit. If a credit was already
applied for a delay on an order, the agent does **not** add a second one for the same order — it
escalates any further goodwill request.

## Rule details
- IF `delay_credit_already_applied(order) == true` → do not apply another; escalate if the customer
  pushes.
- The single-credit limit is independent of the tier amount — the one credit is the tier value at
  the time it's applied.
- This limit is separate from legal refunds: a required **cancellation refund** (DELAY-003) is **not**
  a goodwill credit and is not blocked by this rule.

## Examples
1. $5 credit applied Monday for a delay; package later also slow → **no second credit**; empathize,
   escalate if they insist.
2. Credit applied, then the order turns out **lost** → switch to lost-package reship/refund (that's
   a different remedy, not a second credit).
3. Customer with two **separate orders** both late → one credit **per order** is fine (two orders =
   up to two credits).

## What the agent must not do
- Do not stack goodwill credits on a single order.
- Do not use this rule to deny a legally required refund.

## Escalation
Second-credit requests on the same order, or disputes about the limit → escalate.

## Customer-facing wording
> "I've already applied a delay credit to this order, so I can't add another — but let me make sure
> the delivery itself gets sorted. If it's actually lost, that's a different fix and I'll reship or
> refund."

## Related
- [Delay compensation tiers](delay-compensation-tiers.md) (DELAY-001)
- [Store credit terms](../store-credit-and-promotions/store-credit-terms.md) (PROMO-001)
