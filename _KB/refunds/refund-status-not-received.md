---
policy_id: REF-007
title: "Refund status: issued but not received"
category: refunds
tags: [refund status, not received, where is my refund, missing refund, pending]
applies_to: [all_categories]
escalate_if: ["refund issued but not posted past window", "no refund record found but customer returned item", "original card closed"]
related: [REF-004, PAY-003, ESC-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Refund Status: Issued But Not Received

**Summary.** When a customer says a refund hasn't arrived, check whether it has been **issued** and
compare against the posting windows: **credit card 3–5 business days**, **debit card up to 10
business days**, **store credit 2–3 hours**. If it's issued and within the window, reassure with a
reference; if it's past the window or not issued, **escalate**.

## Steps
1. Look up the refund record: **issued date**, amount, method, reference.
2. IF issued AND within the posting window (REF-004) → reassure; provide the date + reference; advise
   checking with the bank if it's at the edge of the window.
3. IF issued AND past the posting window → **escalate to billing** with the reference.
4. IF **no refund record** but the customer returned the item → verify the return was received;
   **escalate** if received but unrefunded.
5. IF the **original card is closed** → the bank usually reroutes; if not, **escalate** to billing.

## Examples
1. Credit-card refund issued **2 business days ago** → within 3–5 day window → reassure, share
   reference.
2. Refund issued **12 business days ago** to a debit card, still missing → past window → **escalate**.
3. Customer returned item 2 weeks ago, no refund issued → verify receipt; if received → **escalate**.

## What the agent must not do
- Do not re-issue a refund to "fix" a delay (risks a duplicate / violates one-refund-per-order).
- Do not guess a refund was issued — confirm from the record; if the tool fails, escalate (GUARD-001).

## Escalation
Issued-but-unposted past the window, no record despite a received return, or closed-card failure →
escalate to billing with the refund reference and order ID.

## Customer-facing wording
> "Good news — your refund of ${amount} was issued on {date} to your {method} (ref {ref}). Card
> refunds usually post within 3–5 business days; if it's not there by {date}, tell me and I'll
> escalate it."

## Related
- [Refund timing by payment method](refund-timing-by-payment-method.md) (REF-004)
- [Duplicate or pending charges](../payments-and-billing/duplicate-or-pending-charges.md) (PAY-003)
