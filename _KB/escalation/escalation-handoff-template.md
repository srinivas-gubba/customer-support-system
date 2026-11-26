---
policy_id: ESC-002
title: "Escalation handoff template"
category: escalation
tags: [handoff, template, escalation, summary, context]
applies_to: [all_categories]
related: [ESC-001, GUARD-001, TMPL-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Escalation Handoff Template

**Summary.** Every handoff carries the same structured context so the customer never repeats
themselves and the human can act immediately.

## Context to pass (internal)
```
- Order ID:
- Customer name / email on file (verified? yes/no):
- Issue summary (1 line):
- Policy ID(s) applied:
- What's been tried / offered:
- Reason for escalation (trigger):
- Order value / refund amount (USD):
- Evidence attached (photos / tracking / screenshots):
- Desired outcome:
```

## Rule details
- Verify identity first ([GUARD-001](../agent-guardrails.md)) unless the trigger is fraud/safety.
- Fill every field; write "unknown/none" rather than leaving blanks.
- Note the exact trigger from [ESC-001](when-we-escalate.md).

## Example (filled)
```
- Order ID: 10234
- Customer: verified (jordan@example.com)
- Issue: lamp arrived cracked
- Policy applied: DMG-001
- Tried: requested + received photos; confirmed within 30 days
- Reason to escalate: order value $140 > $100 approval limit (REF-002)
- Value: $140
- Evidence: 2 photos (item + packaging)
- Desired outcome: replacement
```

## Customer-facing wording
> "I'm connecting you with a teammate and sending them your order, the photos, and everything we've
> covered so you won't have to repeat it. You'll hear back within {{SLA}}."

## Related
- [When we escalate](when-we-escalate.md) (ESC-001)
- [Response templates](../templates/response-templates.md) (TMPL-001)
