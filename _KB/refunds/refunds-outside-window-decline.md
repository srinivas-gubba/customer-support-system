---
policy_id: REF-006
title: "Refunds outside the 30-day window: polite decline"
category: refunds
tags: [refund, outside window, decline, late, past 30 days, exception]
applies_to: [all_categories]
agent_can_approve: false
escalate_if: ["customer requests exception", "possible defect under warranty", "legal threat"]
related: [REF-001, WAR-001, RET-008, ESC-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Refunds Outside the 30-Day Window: Polite Decline

**Summary.** If `days_since_delivery > 30`, the agent **politely declines** the refund, cites policy
**REF-001**, and offers the real alternatives: a **warranty** claim if it may be defective, an
**exchange** where allowed, or **escalation** if the customer wants an exception. Never approve a
late refund in chat.

## Rule details
- IF `days_since_delivery > 30` → **decline the refund**; do not approve.
- Always pair the decline with a next step:
  - Possible manufacturing defect → route to [WAR-001](../warranty/warranty-overview.md).
  - Within a holiday-extended window → re-check [RET-008](../returns/holiday-return-extension.md).
  - Customer insists on an exception → **escalate** (agent cannot grant exceptions).
- Be empathetic and specific; cite the delivery date and the day count.

## Exceptions
- Holiday extension may make an apparently-late request actually eligible — check first.
- A legally distinct remedy (warranty defect, FTC cancellation for an unshipped order) is **not**
  governed by this 30-day window.

## Examples
1. Delivered **Sep 1**, requested **Nov 17** (77 days), works fine, change of mind → **decline**,
   cite REF-001, mention no restock/exchange available past window.
2. Delivered **Oct 1**, requested **Nov 10** (40 days), item stopped working → **decline the
   refund** but **open a warranty claim** (WAR-002).
3. Customer past window demands a refund and mentions a lawyer → **escalate** immediately (ESC-004).

## What the agent must not do
- Do not grant a late refund or a goodwill exception on its own.
- Do not simply say "no" — always offer the warranty/exchange/escalation path.

## Customer-facing wording
> "I've checked order #{id}: it was delivered on {date}, {n} days ago, which is past our 30-day
> refund window (policy REF-001), so I'm not able to refund it. If it's faulty, I can start a
> warranty claim — or I can pass an exception request to our team."

## Escalation
Any exception request, suspected defect beyond simple cases, or legal/abusive language → escalate.

## Related
- [Refund eligibility & window](refund-eligibility-and-window.md) (REF-001)
- [Warranty overview](../warranty/warranty-overview.md) (WAR-001)
- [Holiday return extension](../returns/holiday-return-extension.md) (RET-008)
