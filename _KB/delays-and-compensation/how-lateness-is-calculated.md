---
policy_id: DELAY-002
title: "How lateness is calculated"
category: delays-and-compensation
tags: [days late, calculation, promised date, delivery date, calendar days]
applies_to: [all_categories]
related: [DELAY-001, GLOSS-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# How Lateness Is Calculated

**Summary.** **Days late = actual delivery date − promised delivery date**, counted in **calendar
days**. If the order is still undelivered, use **today − promised delivery date**. The promised date
is the delivery estimate shown **at checkout** for the chosen shipping method. Never negative; 0 if
on time or early.

## The formula
- `days_late = actual_delivery_date − promised_delivery_date` (calendar days).
- IF still undelivered → `days_late = today − promised_delivery_date`.
- IF result ≤ 0 → **not late** (0 days late).
- Feed `days_late` into the tiers in [DELAY-001](delay-compensation-tiers.md).

## Rule details
- **Promised delivery date** = the estimate displayed at checkout (see [GLOSS-001](../glossary.md)),
  not a marketing "arrives in X days" banner.
- Use **calendar days**, not business days, for lateness.
- Carrier-caused delays still count as "late" for goodwill tiers, but see
  [DELAY-004](carrier-delays-weather-and-peak-season.md) for framing.

## Examples
1. Promised **Nov 10**, delivered **Nov 10** → 0 days late → $0.
2. Promised **Nov 10**, delivered **Nov 13** → 3 days late → $5 tier.
3. Promised **Nov 10**, today is **Nov 19**, still not delivered → 9 days late → $15 tier (and check
   lost-package flow, [SHIP-006](../shipping-and-delivery/lost-or-stolen-packages.md)).

## What the agent must not do
- Do not measure lateness from the order date or ship date.
- Do not use business days for the lateness count.

## Escalation
Promised date unavailable from the system, or tool failure blocks the lookup → escalate (don't
guess, [GUARD-001](../agent-guardrails.md)).

## Customer-facing wording
> "Your estimated delivery at checkout was Nov 10 and it arrived Nov 13, so that's 3 days late — let
> me make that right."

## Related
- [Delay compensation tiers](delay-compensation-tiers.md) (DELAY-001)
- [Glossary](../glossary.md) (GLOSS-001)
