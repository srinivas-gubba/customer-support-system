---
policy_id: PAY-002
title: "Payment declined"
category: payments-and-billing
tags: [declined, payment failed, card error, AVS, retry]
applies_to: [all_categories]
related: [PAY-001, PAY-003, GUARD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: payments-team
---

# Payment Declined

**Summary.** A declined payment usually means **no charge settled**. Common causes are a billing-
address (AVS) mismatch, insufficient funds, a bank fraud block, or an expired card. Advise a fix or
another method — and **don't repeatedly retry the same card**, which can trigger fraud blocks and
extra holds. The assistant never handles full card data.

## Common causes & fixes
| Cause | Fix |
|---|---|
| Billing-address (AVS) mismatch | Match the billing address to the card exactly |
| Insufficient funds / limit | Use another method or contact the bank |
| Bank fraud block (online/large purchase) | Approve with the bank, then retry once |
| Expired card | Use a valid card |
| Typo in number/expiry/CVV | Re-enter carefully |

## Rule details
- A decline typically means **no settled charge**; any "pending" amount is an auth hold that clears
  within **3–5 business days** ([PAY-003](duplicate-or-pending-charges.md)).
- Advise against hammering the same declined card.
- Never ask for the full card number/CVV to "fix" it ([GUARD-001](../agent-guardrails.md)).

## Examples
1. Declined, customer worried about a charge → reassure; the pending hold clears in a few days.
2. Repeated declines → likely AVS or bank block → match billing address or try PayPal.

## What the agent must not do
- Do not request full card details.
- Do not tell the customer to retry the same card many times.

## Escalation
Persistent, unexplained declines or a genuinely stuck order → escalate to payments.

## Customer-facing wording
> "A decline usually means you weren't charged — any pending amount clears in a few days. Try
> matching your billing address exactly, or use another method like PayPal."

## Related
- [Accepted payment methods](accepted-payment-methods.md) (PAY-001)
- [Duplicate or pending charges](duplicate-or-pending-charges.md) (PAY-003)
