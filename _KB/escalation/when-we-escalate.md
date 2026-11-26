---
policy_id: ESC-001
title: "When we escalate"
category: escalation
tags: [escalation, triggers, human, handoff, routing]
applies_to: [all_categories]
related: [ESC-002, ESC-003, ESC-004, ESC-005, GUARD-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# When We Escalate

**Summary.** The agent escalates to a human whenever a request is outside its authority or carries
risk. Core triggers: **any refund or damaged/wrong order over $100**, **legal threats**, **abuse**,
**third contact** on the same issue, **safety**, **fraud**, **privacy requests**, **chargeback in
progress**, **tool failure that blocks verification**, or **still unclear after two clarifying
questions**.

## Always escalate
- Any **refund > $100** or damaged/wrong/lost **order value > $100** ([REF-002](../refunds/refund-approval-limits.md)).
- **Legal threats** / lawyer mentioned / regulatory complaint ([ESC-004](legal-threats-and-safety-reports.md)).
- **Abusive language** ([ESC-003](abusive-language-policy.md)).
- **Safety / injury / hazard / allergic reaction** ([ESC-004](legal-threats-and-safety-reports.md)).
- **Fraud / account takeover / unauthorized charge** ([ACCT-004](../account-and-privacy/account-security-and-password-reset.md)).
- **Privacy requests** (access/delete/correct/opt-out) ([ACCT-003](../account-and-privacy/privacy-rights-access-delete-correct.md)).
- **Chargeback already filed** ([PAY-004](../payments-and-billing/chargebacks-and-disputes.md)).
- **Third contact** on the same unresolved issue ([ESC-005](repeat-contact-rule.md)).
- **Tool failure** blocking verification, or **any action outside the written rules** ([GUARD-001](../agent-guardrails.md)).
- **Still unclear after two clarifying questions.**
- Wholesale/B2B → sales; media/PR → PR.

## What to do
Use the handoff template ([ESC-002](escalation-handoff-template.md)); collect order ID, email,
summary, what's been tried, desired outcome, and evidence.

## Examples
1. $140 cracked lamp → escalate (over $100) with photos.
2. "I'll sue you" → escalate (legal).
3. Order lookup tool down → escalate (can't verify; don't guess).

## What the agent must not do
- Do not improvise an exception rather than escalate.
- Do not argue with a customer who insists after a clear decision — escalate.

## Customer-facing wording
> "I want this fully resolved, so I'm bringing in a specialist and passing along everything so far —
> you won't need to repeat yourself. You'll hear back within {{SLA}}."

## Related
- [Escalation handoff template](escalation-handoff-template.md) (ESC-002)
- [Repeat-contact rule](repeat-contact-rule.md) (ESC-005)
