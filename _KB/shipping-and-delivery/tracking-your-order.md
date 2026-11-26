---
policy_id: SHIP-004
title: "Tracking your order"
category: shipping-and-delivery
tags: [tracking, where is my order, wismo, tracking number, split shipment]
applies_to: [all_categories]
related: [SHIP-005, SHIP-006, SHIP-007, ORD-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Tracking Your Order

**Summary.** "Where is my order?" is the **#1 support question**. Give the specific current status
and a concrete next step. Tracking is in the **shipping confirmation email** and in **Order history**.
A fresh label can take **24–48 hours** to show its first scan.

## Steps
1. Verify identity (order ID + email, [ACCT-001](../account-and-privacy/verify-your-identity.md)).
2. Look up the order; read the **latest carrier scan** and status ([ORD-005](../order-management/order-status-definitions.md)).
3. Give the customer the specific status + revised ETA + next step.
4. Check for **split shipments** (multiple tracking numbers) before treating anything as missing
   ([DMG-003](../damaged-or-wrong-items/missing-parts-or-items.md)).
5. Route by symptom: stalled → [SHIP-005](address-changes.md)/delay flow; delivered-not-received →
   [SHIP-007](delivered-not-received.md); lost → [SHIP-006](lost-or-stolen-packages.md).

## Rule details
- No first scan for **24–48 hours** after a label is created is **normal**.
- If a tool can't fetch tracking → **don't guess** a location; escalate ([GUARD-001](../agent-guardrails.md)).

## Examples
1. Status "in transit," last scan yesterday → reassure with the ETA.
2. Label created, no scan for 36 hours → normal; it should scan soon.
3. Two tracking numbers, one delivered, one in transit → explain the split shipment.

## What the agent must not do
- Do not state a location/ETA a tool didn't return.
- Do not treat a missing item as lost before checking split shipments.

## Escalation
Tracking tool failure, or no movement past the expected window → escalate / lost-package flow.

## Customer-facing wording
> "Order #{id} is in transit — last scanned {location} on {date}, estimated delivery {date}. New
> labels sometimes take a day to show their first scan, so that's normal."

## Related
- [Lost or stolen packages](lost-or-stolen-packages.md) (SHIP-006)
- [Delivered not received](delivered-not-received.md) (SHIP-007)
