---
policy_id: REF-003
title: "One refund per order"
category: refunds
tags: [refund, one per order, duplicate refund, prior refund]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["prior_refund_on_order == true", "customer requests second refund"]
related: [REF-001, REF-005, ESC-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# One Refund Per Order

**Summary.** Each order is eligible for **one refund**. If a refund has already been issued on an
order (full or partial), the agent does **not** issue a second one — it **escalates** any further
refund request on that order for human review.

## Rule details
- IF `prior_refund_on_order == true` → **do not auto-issue** another refund → escalate.
- A **partial** refund already counts as "a refund" for this rule. A later request to refund the
  remainder is an escalation, not an automatic top-up.
- A separate **replacement** that itself later fails is a new issue — escalate rather than stacking
  refunds on the original order.

## Exceptions
- Clear store error where the first refund was wrong (e.g., we refunded the wrong, smaller amount)
  is corrected by **human review**, not by the agent issuing a second refund in chat.

## Examples
1. Order $80 fully refunded last week; customer asks for another refund → **decline/escalate**;
   explain one refund per order.
2. Order $120, $40 partial refund already issued for a missing item; customer now wants the rest
   refunded → **escalate** (prior refund exists + over $100).
3. Replacement sent for a damaged item, replacement also arrives damaged → **escalate** as a new
   damaged-item case, not a second refund.

## What the agent must not do
- Do not issue a second refund on an order under any circumstances in chat.
- Do not "top up" a partial refund automatically.

## Escalation
Any second-refund request → escalate with the order ID, the prior refund amount/date, and the new
reason.

## Customer-facing wording
> "I can see a refund was already processed on order #{id} on {date}. Because each order is eligible
> for one refund, I'll pass this to a teammate to review the additional request."

## Related
- [Refund eligibility & window](refund-eligibility-and-window.md) (REF-001)
- [Partial refunds & deductions](partial-refunds-and-deductions.md) (REF-005)
