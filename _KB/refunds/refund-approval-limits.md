---
policy_id: REF-002
title: "Refund approval limits: $100 agent threshold"
category: refunds
tags: [refund, approval, limit, 100, escalation, authorization]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "refund_amount > 100"]
related: [REF-001, DMG-006, ESC-001, GUARD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Refund Approval Limits: $100 Agent Threshold

**Summary.** The agent may approve refunds and store-paid replacements when the **order value is
$100 or less**. When the order value is **over $100**, the agent gathers details and **escalates for
human approval** — it must never auto-approve above the threshold.

## Rule details
- IF `order_value ≤ $100` AND eligible per [REF-001](refund-eligibility-and-window.md) → **agent
  approves**.
- IF `order_value > $100` → **escalate** for human approval, even if otherwise eligible.
- The threshold uses **order value** (amount paid after discounts, excluding shipping/tax) per
  [GLOSS-001](../glossary.md).
- The same $100 threshold applies to damaged/wrong-item replacements and refunds → see
  [DMG-006](../damaged-or-wrong-items/replacement-vs-refund-choice.md).

## Exceptions
- None. The threshold is a hard limit; there is no "just over" discretion for the agent. Borderline
  or VIP cases still escalate.

## Examples
1. Order **$95**, eligible, change of mind → **agent approves** refund.
2. Order **$100.00**, eligible → **agent approves** (100 is within "≤ $100").
3. Order **$101**, eligible, cracked item → **escalate** for human approval with photos attached.

## What the agent must not do
- Do not split a refund into sub-$100 pieces to stay under the limit.
- Do not approve above $100 because the customer is upset or insistent — escalate instead.

## Escalation
Any refund or store-paid remedy on an order over $100 → escalate with order ID, reason, eligibility
check, and any evidence, using the handoff template ([ESC-002](../escalation/escalation-handoff-template.md)).

## Customer-facing wording
> "This one needs a quick sign-off from a teammate because of the order total. I've passed along all
> the details so you won't repeat yourself — you'll hear back within {{SLA}}."

## Related
- [Refund eligibility & window](refund-eligibility-and-window.md) (REF-001)
- [Replacement vs refund choice](../damaged-or-wrong-items/replacement-vs-refund-choice.md) (DMG-006)
- [Escalation handoff template](../escalation/escalation-handoff-template.md) (ESC-002)
