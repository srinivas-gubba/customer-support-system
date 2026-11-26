---
policy_id: PROMO-004
title: "Gift cards"
category: store-credit-and-promotions
tags: [gift card, balance, redeem, not working, no promo, no cash]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["lost/stolen gift card", "suspected gift-card fraud", "disputed balance"]
related: [PROMO-001, PROMO-002, PAY-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Gift Cards

**Summary.** A gift card is a **prepaid balance** redeemed at checkout like a payment method.
Gift cards are **not redeemable for cash** and **can't be purchased with a promo code**. A promo
discount can usually still apply to an order paid partly by gift card. Refunds on gift-card purchases
go back to the gift card / store credit.

## Rule details
- Redeem at checkout; remainder charged to another method ([PAY-001](../payments-and-billing/accepted-payment-methods.md)).
- **Not** redeemable for cash.
- **Promo codes cannot buy gift cards** ([PROMO-002](promo-code-rules.md)).
- Returns of gift-card-funded purchases → refund to **gift card / store credit** ([PROMO-001](store-credit-terms.md)).
- Gift-card expiry follows applicable law (many regions restrict expiry/fees).

## Examples
1. $25 gift card on a $40 order → gift card covers $25, card covers $15.
2. "Cash out my gift card" → not possible; usable in full on any order.
3. "My gift card won't apply" → verify the code/balance; handle any PIN securely.

## What the agent must not do
- Do not give cash for a gift card.
- Do not let a promo code purchase a gift card.
- Do not expose a physical card's PIN over an insecure channel.

## Escalation
Lost/stolen cards, suspected fraud, or a disputed zero balance → escalate.

## Customer-facing wording
> "Enter the gift-card code at checkout and it applies to your total; anything left goes on another
> method. Gift cards can't be cashed out, but you can spend the full balance."

## Related
- [Store credit terms](store-credit-terms.md) (PROMO-001)
- [Accepted payment methods](../payments-and-billing/accepted-payment-methods.md) (PAY-001)
