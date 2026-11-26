---
policy_id: PAY-006
title: "Price adjustments (price-drop refunds)"
category: payments-and-billing
tags: [price adjustment, price drop, refund difference, invoice, receipt]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
related: [PROMO-003, REF-005, PAY-005]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: payments-team
---

# Price Adjustments (Price-Drop Refunds)

**Summary.** If an item's price drops within the price-adjustment window, {{STORE_NAME}} refunds the
**difference** once, subject to exclusions. This article also covers **invoices/receipts** on
request. Price matching against other retailers is in [PROMO-003](../store-credit-and-promotions/price-adjustments-and-price-match.md).

## Rule details
- Price-drop refund: difference refunded if the same item drops within the window (default **7–14
  days** of purchase); excludes clearance/flash sales.
- One adjustment per item; refunded to the original payment method ([REF-005](../refunds/partial-refunds-and-deductions.md)).
- **Invoices/receipts:** the confirmation email has an itemized receipt; a formal invoice can be
  provided on request (collect order ID + business details, **not** payment details).

## Examples
1. $50 item bought 3 days ago, now $40, not clearance → refund the **$10** difference.
2. Item on a flash sale → **excluded** from price adjustment.
3. Customer needs a VAT-style invoice → provide itemized invoice; escalate special tax handling.

## What the agent must not do
- Do not adjust clearance/flash-sale prices.
- Do not collect payment details for an invoice.

## Escalation
Adjustments on orders over $100, or special invoice/tax needs → escalate.

## Customer-facing wording
> "Since the price dropped within our adjustment window and it's not a clearance item, I can refund
> you the $10 difference to your original payment method."

## Related
- [Price adjustments & price match](../store-credit-and-promotions/price-adjustments-and-price-match.md) (PROMO-003)
- [Sales tax](sales-tax.md) (PAY-005)
