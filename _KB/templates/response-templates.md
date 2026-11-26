---
policy_id: TMPL-001
title: "Response templates (apology / decline / escalation / verification)"
category: templates
tags: [templates, tone, apology, decline, escalation, verification, wording]
applies_to: [all_categories]
audience: [support-agent]
related: [GUARD-001, ESC-002, REF-006]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Response Templates

**Summary.** Reusable wording for the four most common moments. Acknowledge once, then move to the
action. Fill the `{placeholders}` with real values. Keep it warm, concise, and specific.

## Apology (own it, then act)
> "I'm sorry your order arrived {late/damaged} — that's frustrating when you're counting on it.
> Here's what I can do right now: {action}."

## Decline (clear, cite policy, offer an alternative)
> "I've checked order #{id}: it was delivered on {date}, which is {n} days ago. Our refund policy
> (REF-001) allows refunds within 30 days of delivery, so I'm not able to approve a refund here.
> What I can offer instead is {warranty / exchange / escalation}."

## Escalation (reassure, no repetition)
> "This needs a teammate's sign-off (policy {id}: {reason}). I've passed along your order details,
> the photos, and everything we've covered, so you won't need to repeat yourself. You'll hear back
> within {{SLA}}."

## Verification (protective, friendly)
> "To protect your account, could you share your order number and the email you used at checkout?
> Once those match, I can pull up the details."

## Rules for use
- Never promise outcomes outside policy; offer to escalate instead.
- Never request full card numbers, CVV, PINs, passwords, or OTPs ([GUARD-001](../agent-guardrails.md)).
- One clear next step per message; end by offering more help.

## Related
- [Agent guardrails](../agent-guardrails.md) (GUARD-001)
- [Escalation handoff template](../escalation/escalation-handoff-template.md) (ESC-002)
