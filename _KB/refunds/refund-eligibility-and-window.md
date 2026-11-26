---
policy_id: REF-001
title: "Refund eligibility: 30 days from delivery"
category: refunds
tags: [refund, return window, eligibility, 30 days, delivery date]
applies_to: [all_categories]
excludes: [groceries, gift-cards, personalized, digital-downloads]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["amount > 100", "prior refund on order", "customer disputes delivery date", "days_since_delivery > 30"]
related: [REF-002, REF-003, RET-002, DMG-001, ESC-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Refund Eligibility: 30 Days From Delivery

**Summary.** A refund is eligible when the request is made within **30 calendar days of the
carrier-confirmed delivery date** AND no prior refund exists on the order AND the item is not on the
non-returnable list. Refunds of **$100 or less** can be approved by the agent; **over $100** require
human approval.

## Eligibility (all must be true)
- IF `days_since_delivery ≤ 30` → within window.
- AND `prior_refund_on_order == false` → see [REF-003](one-refund-per-order-rule.md).
- AND item is **not** on the non-returnable list → see [RET-002](../returns/non-returnable-items.md).
- AND `order_value ≤ $100` for agent approval; ELSE escalate → see [REF-002](refund-approval-limits.md).

## Rule details
- The window is measured in **calendar days** from the **delivery date** (tracking = `delivered`),
  not the order or ship date. See [GLOSS-001](../glossary.md).
- IF `days_since_delivery > 30` → **decline** and cite this policy; offer alternatives → see
  [REF-006](refunds-outside-window-decline.md).
- Store-at-fault cases (damaged/defective/wrong) follow the damaged-item flow, which also uses a
  30-day window but refunds original shipping → see [DMG-001](../damaged-or-wrong-items/damaged-item-claims.md).

## Exceptions
- Holiday purchases may have an extended window → see [RET-008](../returns/holiday-return-extension.md).
- An **unshipped** order the customer cancels due to a delay is refunded in full regardless of this
  window (FTC) → see [DELAY-003](../delays-and-compensation/delay-notices-and-your-right-to-cancel.md).

## Examples
1. Delivered **Nov 1**, refund requested **Nov 20** (19 days), order $60, no prior refund → **agent
   approves** full refund.
2. Delivered **Oct 10**, requested **Nov 17** (38 days) → **decline**, cite REF-001, offer warranty
   or exchange info.
3. Delivered **Nov 5**, requested **Nov 12** (7 days), order **$140** → within window but **> $100**
   → **escalate** for human approval.

## What the agent must not do
- Do not measure the window from the order date.
- Do not approve a refund over $100 or a second refund on the same order.
- Do not accept the customer's claimed delivery date over tracking — if disputed, escalate.

## Escalation
Escalate if `order_value > $100`, a prior refund exists, the customer disputes the delivery date, or
the request is past 30 days and they want an exception.

## Customer-facing wording
> "I've checked order #{id}: delivered on {date}, which is {n} days ago. Our policy allows refunds
> within 30 days of delivery, so you're covered — I can process that now."

## Related
- [Refund approval limits](refund-approval-limits.md) (REF-002)
- [One refund per order](one-refund-per-order-rule.md) (REF-003)
- [Refunds outside window — decline](refunds-outside-window-decline.md) (REF-006)
