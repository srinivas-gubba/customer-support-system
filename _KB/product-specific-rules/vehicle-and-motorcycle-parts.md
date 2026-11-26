---
policy_id: PROD-007
title: "Vehicle and motorcycle parts"
category: product-specific-rules
tags: [vehicle, motorcycle, auto parts, installed, hazmat, sports accessories]
applies_to: [vehicle, motorcycle, sports-accessories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "safety-critical part", "hazmat return"]
related: [RET-002, RET-003, DMG-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Vehicle and Motorcycle Parts

**Summary.** Vehicle/motorcycle and sports parts are returnable within 30 days **only if
uninstalled and in original packaging**. **Installed/used parts and hazmat** (fluids, loose
batteries) are **non-returnable**. Defective parts are covered via the defect/warranty flow.

## Rule details
- Uninstalled, unused, original packaging → returnable ([RET-003](../returns/return-condition-requirements.md)).
- **Installed/used** parts → **non-returnable** (can't be resold safely).
- **Hazmat** (fluids, loose batteries) → non-returnable; shipping-restricted ([RET-002](../returns/non-returnable-items.md)).
- Defective on arrival → [DMG-004](../damaged-or-wrong-items/defective-on-arrival.md); later defect → warranty.
- **Safety-critical** parts (brakes, etc.) → extra caution; escalate uncertainty.

## Examples
1. Uninstalled, boxed accessory, change of mind → returnable.
2. Installed exhaust part → non-returnable.
3. Brake component suspected defective → escalate (safety) + defect flow.

## What the agent must not do
- Do not accept installed/used parts or hazmat returns.
- Do not advise on installation/safety beyond documented info — escalate.

## Escalation
Value over $100, safety-critical parts, or hazmat returns → escalate.

## Customer-facing wording
> "Uninstalled parts in their original packaging can be returned within 30 days. Once a part's been
> installed, or for fluids/batteries, we can't take it back — but if it's faulty, I'll help with a
> defect or warranty claim."

## Related
- [Non-returnable items](../returns/non-returnable-items.md) (RET-002)
- [Defective on arrival](../damaged-or-wrong-items/defective-on-arrival.md) (DMG-004)
