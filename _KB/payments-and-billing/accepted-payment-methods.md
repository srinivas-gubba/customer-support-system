---
policy_id: PAY-001
title: "Accepted payment methods and security"
category: payments-and-billing
tags: [payment methods, credit card, paypal, apple pay, secure, PCI]
applies_to: [all_categories]
related: [PAY-002, PAY-005, ACCT-002, GUARD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Accepted Payment Methods and Security

**Summary.** {{STORE_NAME}} accepts **major credit/debit cards, PayPal, and Apple Pay / Google Pay**,
plus gift cards/store credit. Payments are processed by a **PCI-compliant** provider over an
encrypted connection. The assistant **never** asks for full card numbers, CVV, or PINs.

## Accepted methods
- Major credit/debit cards (Visa, Mastercard, Amex, Discover)
- PayPal
- Apple Pay / Google Pay
- Gift cards / store credit ([PROMO-004](../store-credit-and-promotions/gift-cards.md))

## Security (what to tell customers)
- Processed by a PCI-compliant provider over HTTPS; {{STORE_NAME}} does **not** store full card
  numbers.
- The assistant will never request your full card number, CVV, PIN, password, or one-time code
  ([GUARD-001](../agent-guardrails.md)).

## Examples
1. "Do you take PayPal?" → Yes, plus cards and Apple/Google Pay.
2. "Is it safe?" → Yes — PCI-compliant, encrypted, no full card storage.
3. Card + gift card split → gift card applies first, remainder to the card.

## What the agent must not do
- Do not request or accept full card data on any channel.
- Do not confirm or deny a specific card is "on file" by number.

## Escalation
Suspected phishing (someone claiming to be us asked for card/password) → escalate to security
([ACCT-004](../account-and-privacy/account-security-and-password-reset.md)).

## Customer-facing wording
> "We take major cards, PayPal, and Apple/Google Pay. Everything's processed securely through a
> PCI-compliant provider, and we never store your full card number."

## Related
- [Payment declined](payment-declined.md) (PAY-002)
- [Sales tax](sales-tax.md) (PAY-005)
