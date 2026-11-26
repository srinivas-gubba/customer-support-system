---
policy_id: PAY-004
title: "Chargebacks and disputes (FCBA)"
category: payments-and-billing
tags: [chargeback, dispute, bank, unauthorized, FCBA, reversal]
applies_to: [all_categories]
agent_can_approve: false
escalate_if: ["chargeback already filed", "unauthorized charge", "quality dispute escalating"]
related: [PAY-003, REF-001, ACCT-004, LEGAL-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: payments-team
---

# Chargebacks and Disputes (FCBA)

**Summary.** A **chargeback** is a reversal the customer initiates **through their bank** —
different from a refund we issue directly, and usually **slower**. If an issue is resolvable under
policy, offer the **direct remedy first**. If a chargeback is **already filed**, do **not** also
refund — **escalate** to the disputes team. Unauthorized/unknown charges → **escalate** as fraud.

## Rule details
- Refund (merchant-issued) is faster than a chargeback (bank process). Offer to fix it directly.
- IF a chargeback is **already filed** → do **not** issue a refund (double-refund risk) → escalate to
  billing/disputes.
- IF the charge is **unauthorized/unknown** → escalate as fraud ([ACCT-004](../account-and-privacy/account-security-and-password-reset.md)).
- FCBA facts (agent reference, don't quote): dispute must reach the issuer within **60 days** of the
  first statement; issuer acknowledges within **30 days**, resolves within **2 billing cycles / 90
  days**. Quality disputes are **not** "billing errors." See [LEGAL-001](../legal/compliance-notes.md).

## Examples
1. "Didn't arrive, I'll dispute it" → offer a reship/refund now (faster than a chargeback).
2. "I already filed a chargeback" → don't refund; escalate to disputes so it isn't double-handled.
3. "I never made this charge" → escalate as potential fraud.

## What the agent must not do
- **Never** refund an order with an active chargeback.
- Do not quote statutes to the customer; use plain language.
- Do not dismiss an unauthorized-charge report.

## Escalation
Always escalate: chargeback already filed, unauthorized charge, or an escalating quality dispute.

## Customer-facing wording
> "I can likely sort this faster than a bank dispute — tell me what went wrong and let me try. If
> you've already filed a chargeback, I'll pass it to our disputes team so it's handled correctly."

## Related
- [Duplicate or pending charges](duplicate-or-pending-charges.md) (PAY-003)
- [Account security & password reset](../account-and-privacy/account-security-and-password-reset.md) (ACCT-004)
