---
policy_id: ACCT-001
title: "Verify your identity"
category: account-and-privacy
tags: [identity, verification, order id, email, security]
applies_to: [all_categories]
related: [ACCT-004, ACCT-005, GUARD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: trust-and-safety
---

# Verify Your Identity

**Summary.** Before disclosing or changing any order or account detail, verify the customer with
their **order ID + the email used at checkout**. The assistant **never** uses passwords, full card
numbers, or one-time codes to verify.

## Rule details
- Standard verification = **order ID + email on file** match.
- IF verification **fails** → do not disclose order/account details; offer a secure path (email the
  address on file, or escalate).
- Never verify via password, full card number, CVV, or OTP ([GUARD-001](../agent-guardrails.md)).
- Higher-risk actions (address change, account changes, data requests) still require verification
  first.

## Examples
1. Customer gives order ID + matching email → verified; proceed.
2. Email doesn't match the order → do not reveal details; suggest they contact from the email on
   file, or escalate.
3. Customer offers their card number "to prove it's them" → decline; use order ID + email instead.

## What the agent must not do
- Do not reveal order contents, address, or account data to an unverified requester.
- Do not accept card numbers/passwords as identity proof.

## Escalation
Verification can't be completed but the request is legitimate-seeming, or a suspected impersonation →
escalate to trust & safety.

## Customer-facing wording
> "To protect your account, can you share your order number and the email used at checkout? Once
> those match, I can pull up the details."

## Related
- [Account security & password reset](account-security-and-password-reset.md) (ACCT-004)
- [What data we share with support](what-data-we-share-with-support.md) (ACCT-005)
