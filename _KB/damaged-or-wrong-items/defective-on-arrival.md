---
policy_id: DMG-004
title: "Defective on arrival"
category: damaged-or-wrong-items
tags: [defective, doesn't work, faulty, malfunction, DOA]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["order_value > 100", "safety fault", "failure after use (warranty)"]
related: [DMG-001, DMG-006, WAR-001, WAR-002]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Defective on Arrival

**Summary.** An item that is intact but **doesn't work on arrival** is **store at fault**. After one
quick, relevant check, offer a **free replacement or full refund** within the **30-day** window.
Value **over $100** needs human approval. A failure **after use** is a **warranty** matter, not this
article.

## Decision: arrival-defect vs. later failure
| Timing | Path |
|---|---|
| Faulty on arrival / within 30-day window | **This article** — free replace/refund |
| Failed later, within warranty period | [WAR-002](../warranty/manufacturer-warranty-claims.md) |
| Failure from misuse/accident | Not covered; possible paid repair ([WAR-001](../warranty/warranty-overview.md)) |

## Steps
1. Gather what it does/doesn't do and when it started.
2. Try **one** simple, likely fix (e.g., charge/reset) — don't send the customer on a long chase.
3. Request a short video/photo of the fault if helpful ([DMG-005](evidence-requirements-photos.md)).
4. IF confirmed faulty on arrival → **free replacement or full refund**; prepaid label; original
   shipping refunded.
5. IF `order_value ≤ $100` → agent approves; ELSE escalate.

## Examples
1. $45 speaker won't power on out of the box, one charge attempt fails → replace or refund.
2. **$160** tablet dead on arrival → escalate (over $100) with the fault description.
3. Headphones that worked for a month then failed → **warranty** path (WAR-002), not this.

## What the agent must not do
- Do not run lengthy troubleshooting that feels like the customer's fault.
- Do not approve over $100; **stop** on a safety fault (overheating/smoking) — advise unplug/stop
  use and **escalate**.

## Escalation
Value over $100, any safety fault, or a later (warranty) failure → escalate / route to warranty.

## Customer-facing wording
> "Sorry it won't turn on. Let's try one quick thing — [step]. If that doesn't do it, I'll send a
> free replacement or refund you in full, whichever you prefer."

## Related
- [Replacement vs refund choice](replacement-vs-refund-choice.md) (DMG-006)
- [Manufacturer warranty claims](../warranty/manufacturer-warranty-claims.md) (WAR-002)
