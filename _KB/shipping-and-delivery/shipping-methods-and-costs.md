---
policy_id: SHIP-001
title: "Shipping methods and costs"
category: shipping-and-delivery
tags: [shipping, methods, cost, standard, expedited, overnight, free shipping]
applies_to: [all_categories]
related: [SHIP-002, SHIP-003, DELAY-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Shipping Methods and Costs

**Summary.** {{STORE_NAME}} offers **standard**, **expedited**, and **overnight** shipping. Exact
rates and any free-shipping threshold are shown at checkout before payment. Total delivery time =
**processing time + transit time**.

## Methods
| Method | Transit (business days) | Cost |
|---|---|---|
| Standard | 3–7 | Free over {{FREE_SHIPPING_THRESHOLD}}, else flat rate |
| Expedited | 2–3 | Flat expedited rate at checkout |
| Overnight | 1 | Flat overnight rate at checkout |

- Add processing time ([SHIP-002](processing-times.md)) to transit for the full estimate.
- Rates, free-ship threshold, and availability are shown at checkout and may vary by destination.

## Rule details
- IF an **expedited/overnight** order badly missed its guaranteed window due to the carrier →
  consider refunding the **upgrade fee** as goodwill (escalate if beyond authority); also see
  [DELAY-004](../delays-and-compensation/carrier-delays-weather-and-peak-season.md).

## Examples
1. $45 order, standard, below free-ship threshold → flat standard rate applies.
2. Overnight order placed Monday → processing + 1 business day transit.

## What the agent must not do
- Do not quote a transit time as the total; always include processing.
- Do not invent exact rates — they're shown at checkout and configured per store.

## Escalation
Express-fee refund beyond authority, or systemic rate errors → escalate.

## Customer-facing wording
> "We offer standard (3–7 business days), expedited (2–3), and overnight (1). Standard is free over
> {{FREE_SHIPPING_THRESHOLD}}; otherwise the rate shows at checkout."

## Related
- [Processing times](processing-times.md) (SHIP-002)
- [Delivery estimates](delivery-estimates.md) (SHIP-003)
