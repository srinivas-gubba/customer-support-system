---
policy_id: ACCT-003
title: "Privacy rights: access, delete, correct (CCPA)"
category: account-and-privacy
tags: [privacy, ccpa, cpra, data request, delete my data, access, correct]
applies_to: [all_categories]
agent_can_approve: false
escalate_if: ["any formal access/delete/correct request", "opt-out of sale/sharing"]
related: [ACCT-002, ACCT-001, LEGAL-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: privacy-team
---

# Privacy Rights: Access, Delete, Correct (CCPA)

**Summary.** Customers may have rights to **know, delete, correct, and opt out of sale/sharing** of
their data (CCPA/CPRA). The assistant **routes** these to the privacy workflow and **never fulfills a
deletion in chat**. Receipt is confirmed within **10 business days** and the request answered within
**45 days** (extendable to 90 with notice).

## Rule details
- IF the customer makes a formal **access / delete / correct** or **opt-out** request → verify
  identity ([ACCT-001](verify-your-identity.md)) and **log/route to the privacy team**.
- Confirm receipt within **10 business days**; substantive response within **45 calendar days** (one
  extension to **90** with notice); honor **opt-out within 15 business days**.
- Some records (orders, tax) may be **retained** where law requires, even after a deletion request.
- Marketing opt-out is self-service ([ACCT-002](marketing-email-opt-out.md)); legal data rights are
  **not**. Legal basis: [LEGAL-001](../legal/compliance-notes.md).

## Examples
1. "Delete all my data" → verify, log a deletion request, route to privacy; explain retention
   limits.
2. "What data do you have on me?" → log an access request for the privacy team.
3. "Don't sell my info" → log an opt-out; honored within 15 business days.

## What the agent must not do
- Do not delete or export personal data in chat.
- Do not act on a data request without identity verification.

## Escalation
Always route formal privacy requests to the privacy team (this is itself the required handoff).

## Customer-facing wording
> "I'll start a formal data request and pass it to our privacy team. They'll confirm receipt within
> 10 business days and complete it within 45 days. Some order records may be kept where the law
> requires."

## Related
- [Marketing email opt-out](marketing-email-opt-out.md) (ACCT-002)
- [Compliance notes](../legal/compliance-notes.md) (LEGAL-001)
