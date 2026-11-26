---
policy_id: RET-008
title: "Holiday return extension"
category: returns
tags: [holiday, extension, return window, christmas, january 31]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
related: [RET-001, REF-001, REF-006]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Holiday Return Extension

**Summary.** Items purchased in the holiday period (**October 1 – December 31**) may be returned
until **January 31** of the following year, even if that exceeds the standard 30-day window. All
other return conditions (original condition, non-returnable exclusions) still apply.

## Rule details
- IF `order_date` is between **Oct 1 and Dec 31** → return window extends to **Jan 31** next year.
- The later of the standard 30-day window or Jan 31 applies.
- Condition and exclusion rules are unchanged ([RET-002](non-returnable-items.md), [RET-003](return-condition-requirements.md)).
- Confirm exact dates each season in [policy configuration]; defaults follow major-retailer practice.

## Examples
1. Ordered **Dec 20**, delivered **Dec 23**, returned **Jan 15** → **eligible** (holiday extension),
   even though it's 23 days — well within both windows.
2. Ordered **Nov 1**, delivered **Nov 3**, returned **Jan 20** → **eligible** via holiday extension
   (standard 30 days would have ended Dec 3).
3. Ordered **Dec 28**, returned **Feb 10** → past **Jan 31** → outside window → [REF-006](../refunds/refunds-outside-window-decline.md).

## What the agent must not do
- Do not apply the holiday extension to purchases made outside Oct 1 – Dec 31.
- Do not waive condition or exclusion rules just because the extension applies.

## Escalation
Edge cases just past Jan 31, or value over $100 → escalate.

## Customer-facing wording
> "Good news — because you ordered during the holidays, you have until January 31 to return it, so
> you're still within the window. Want me to start that return?"

## Related
- [Return policy overview](return-policy-overview.md) (RET-001)
- [Refunds outside window — decline](../refunds/refunds-outside-window-decline.md) (REF-006)
