---
policy_id: PAY-005
title: "Sales tax"
category: payments-and-billing
tags: [sales tax, tax, why charged tax, tax refund, invoice]
applies_to: [all_categories]
related: [PAY-001, PAY-006, REF-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: payments-team
---

# Sales Tax

**Summary.** Sales tax is calculated at checkout based on the **US shipping destination** and shown
before payment. When an item is refunded, the **tax on that item is refunded too**. Original
shipping is not refunded unless the store is at fault.

## Rule details
- Tax rate depends on the destination state/locality (US); it's system-calculated and shown at
  checkout.
- Refunds include the **tax** proportional to the refunded item(s) ([REF-005](../refunds/partial-refunds-and-deductions.md)).
- Tax-exempt or business purchases → provide an invoice and escalate exemption handling
  ([PAY-006](price-adjustments.md) covers invoices/receipts cross-link).

## Examples
1. "Why was I taxed?" → Tax is set by your delivery location and shown at checkout.
2. Item refunded → the tax charged on it is refunded with it.
3. Nonprofit wants tax exemption → provide invoice; **escalate** exemption to finance.

## What the agent must not do
- Do not recompute tax by hand; explain the basis (destination).
- Do not promise a tax exemption without finance approval.

## Escalation
Tax-exemption requests, tax-ID handling, or disputed tax amounts → escalate to finance.

## Customer-facing wording
> "Sales tax is based on your delivery address and shown at checkout before payment. If you return
> the item, the tax on it comes back with your refund."

## Related
- [Accepted payment methods](accepted-payment-methods.md) (PAY-001)
- [Price adjustments](price-adjustments.md) (PAY-006)
