---
policy_id: RET-005
title: "Return shipping costs: fault-based split"
category: returns
tags: [return shipping, who pays, prepaid label, fault, change of mind]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
related: [RET-001, RET-004, DMG-001, REF-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Return Shipping Costs: Fault-Based Split

**Summary.** Who pays return shipping depends on **fault**. If the **store is at fault**
(damaged/defective/wrong/missing), return shipping is **free** (prepaid label) and original shipping
is refunded. For a **change of mind**, the **customer pays** return shipping — it is deducted from
the refund — and original shipping is not refunded.

## Rule table
| Reason | Return shipping | Original shipping refunded? |
|---|---|---|
| Store at fault (damaged / defective / wrong / missing) | **Free (prepaid label)** | **Yes** |
| Change of mind / wrong size ordered / no longer wanted | **Customer pays** (deducted from refund) | No |

Stated as a rule: IF `store_at_fault == true` → prepaid label + refund original shipping; ELSE
customer pays return shipping, deducted per [REF-005](../refunds/partial-refunds-and-deductions.md).

## Examples
1. Lamp arrived cracked → store at fault → prepaid label, original shipping refunded.
2. Dress didn't suit the customer → change of mind → $6 return shipping deducted from the refund.
3. Customer ordered the wrong size themselves → change of mind → customer pays return shipping (an
   exchange may avoid a second shipping charge, [RET-006](exchanges.md)).

## What the agent must not do
- Do not charge the customer return shipping when the store is at fault.
- Do not hide the deduction — state the return-shipping cost **before** the customer ships.

## Escalation
Disputed fault (customer says "it was faulty," evidence unclear) → lean toward the damaged-item flow
and gather photos; escalate if unresolved or over $100.

## Customer-facing wording
> "Because this arrived damaged, the return is on us — here's a prepaid label, and I'll refund your
> original shipping too." / "For a change of mind, return shipping is $6, which I'll deduct from your
> refund — want me to proceed?"

## Related
- [How to start a return](how-to-start-a-return.md) (RET-004)
- [Damaged item claims](../damaged-or-wrong-items/damaged-item-claims.md) (DMG-001)
