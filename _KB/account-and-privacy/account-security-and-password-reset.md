---
policy_id: ACCT-004
title: "Account security and password reset"
category: account-and-privacy
tags: [password reset, locked out, hacked, unauthorized, phishing, 2FA]
applies_to: [all_categories]
agent_can_approve: false
escalate_if: ["account takeover", "unauthorized orders/charges", "confirmed phishing"]
related: [ACCT-001, PAY-004, GUARD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: trust-and-safety
---

# Account Security and Password Reset

**Summary.** Password resets happen only via the **emailed reset link** to the address on file — the
assistant never sets, reads, or asks for a password. **Account takeover, unauthorized orders/charges,
and confirmed phishing are high-priority and always escalate** to security.

## Steps
1. Password reset → direct the customer to **Forgot password**; a reset link is emailed (link
   expires). Check spam if it doesn't arrive.
2. Locked out after failed attempts → wait and retry, or escalate for a support unlock after
   identity verification ([ACCT-001](verify-your-identity.md)).
3. **Account takeover** → guide an immediate password reset + enable 2FA, and **escalate to
   security**.
4. **Unauthorized orders/charges** → gather details (not full card numbers) and **escalate**; do not
   just refund-and-close ([PAY-004](../payments-and-billing/chargebacks-and-disputes.md)).
5. **Phishing** → confirm we never ask for passwords/cards/OTP; collect the suspicious message and
   escalate.

## Rule details
- Never request, set, or read a password; never ask for OTP/CVV ([GUARD-001](../agent-guardrails.md)).
- Security issues take priority over normal queue handling.

## Examples
1. "Forgot password" → trigger the reset link; done.
2. "There's an order I didn't place" → escalate as potential fraud; advise securing the account.
3. "Got an email asking for my password — is it you?" → No; report it, don't respond.

## What the agent must not do
- Do not handle passwords or OTPs.
- Do not resolve a takeover/fraud report without escalating.

## Escalation
Always escalate: account takeover, unauthorized orders/charges, confirmed phishing.

## Customer-facing wording
> "Let's secure your account now — I'll trigger a password-reset email and recommend turning on
> two-factor. I'm also escalating this to our security team to investigate."

## Related
- [Verify your identity](verify-your-identity.md) (ACCT-001)
- [Chargebacks and disputes](../payments-and-billing/chargebacks-and-disputes.md) (PAY-004)
