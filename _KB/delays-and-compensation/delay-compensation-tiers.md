---
policy_id: DELAY-001
title: "Delay compensation tiers: $0 / $5 / $15 store credit"
category: delays-and-compensation
tags: [delay, late, compensation, store credit, tiers, goodwill]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["customer cancels unshipped order", "requests cash refund for delay", "more than one credit requested"]
related: [DELAY-002, DELAY-003, DELAY-005, REF-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Delay Compensation Tiers: $0 / $5 / $15 Store Credit

**Summary.** For a **late delivery**, the agent may offer a **goodwill store credit** based on how
late it is: **0–2 days late → $0**, **3–5 days late → $5**, **more than 5 days → $15**. **Maximum one
credit per order.** These credits are goodwill **on top of** legal rights — they do **not** replace a
required refund for an unshipped, cancelled order.

## Tier table
| Days late | Goodwill credit |
|---|---|
| 0–2 | $0 (no credit) |
| 3–5 | $5 store credit |
| more than 5 | $15 store credit |

- "Days late" is defined precisely in [DELAY-002](how-lateness-is-calculated.md).
- **One credit per order** ([DELAY-005](one-credit-per-order-rule.md)).
- Store credit mechanics: [PROMO-001](../store-credit-and-promotions/store-credit-terms.md).

## Important legal boundary
- These tiers apply to **delivered-late** (or still-coming) orders as goodwill.
- IF the order has **not shipped** and the customer **cancels because of the delay** → they are
  entitled to a **full refund to the original payment method**, not store credit (FTC Mail Order
  Rule). See [DELAY-003](delay-notices-and-your-right-to-cancel.md). **A gift card/credit is not a
  refund.**

## Examples
1. Promised Nov 10, delivered Nov 12 (2 days) → **$0**.
2. Promised Nov 10, delivered Nov 14 (4 days) → **$5** store credit.
3. Promised Nov 10, delivered Nov 18 (8 days) → **$15** store credit.
4. Promised Nov 10, **not shipped**, customer cancels → **full refund** (not credit) — DELAY-003.

## What the agent must not do
- Do not offer more than one credit per order, or exceed the tier amount.
- Do not offer store credit **instead of** a legally required cancellation refund.

## Escalation
Customer cancels an unshipped order, demands cash for a delay, or wants more than the tier allows →
escalate.

## Customer-facing wording
> "Your order arrived 4 days later than promised — I'm sorry about that. I've added a $5 store credit
> to your account as an apology."

## Related
- [How lateness is calculated](how-lateness-is-calculated.md) (DELAY-002)
- [Delay notices & your right to cancel](delay-notices-and-your-right-to-cancel.md) (DELAY-003)
