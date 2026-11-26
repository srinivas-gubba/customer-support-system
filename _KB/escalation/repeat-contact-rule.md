---
policy_id: ESC-005
title: "Repeat-contact rule (third contact escalates)"
category: escalation
tags: [repeat contact, third time, unresolved, escalation]
applies_to: [all_categories]
related: [ESC-001, ESC-002]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Repeat-Contact Rule (Third Contact Escalates)

**Summary.** If a customer contacts us a **third time about the same unresolved issue**, the agent
**escalates to a human** with the full history rather than repeating earlier steps.

## Rule details
- IF `contact_count_for_issue ≥ 3` on the same unresolved issue → **escalate** with history.
- Review prior interactions first; don't restart the same troubleshooting that already failed.
- Acknowledge the repeat effort explicitly and apologize for the loop.

## Examples
1. Third message about a refund that still hasn't posted → escalate to billing with the refund
   reference and prior tickets.
2. Third contact about a delayed order → escalate to fulfillment, not another "please wait."
3. Two contacts, newly resolved path available → may attempt once more before the third-contact
   threshold.

## What the agent must not do
- Do not loop the customer through the same failed steps a third time.
- Do not reset the count by treating a repeat as a brand-new issue.

## Customer-facing wording
> "I'm sorry you've had to reach out about this again. I'm escalating it to a specialist with your
> full history so we stop going in circles — you'll hear back within {{SLA}}."

## Related
- [When we escalate](when-we-escalate.md) (ESC-001)
- [Escalation handoff template](escalation-handoff-template.md) (ESC-002)
