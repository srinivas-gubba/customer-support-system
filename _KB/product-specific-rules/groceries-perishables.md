---
policy_id: PROD-002
title: "Groceries and perishables"
category: product-specific-rules
tags: [groceries, perishable, food, spoiled, non-returnable]
applies_to: [groceries]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["food safety / illness report", "order_value > 100"]
related: [RET-002, DMG-001, ESC-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Groceries and Perishables

**Summary.** Groceries and perishables are **non-returnable**. But if they arrive **spoiled,
damaged, or expired**, the customer gets a **refund or replacement** with a photo — reported quickly
(within **48–72 hours** of delivery). Any **illness/food-safety** report escalates immediately.

## Rule details
- Change of mind → **non-returnable** ([RET-002](../returns/non-returnable-items.md)).
- Spoiled/damaged/expired on arrival → refund or replacement with a **photo**, reported within
  **48–72 hours** ([DMG-001](../damaged-or-wrong-items/damaged-item-claims.md)).
- **Illness / food safety** → stop, show care, **escalate** ([ESC-004](../escalation/legal-threats-and-safety-reports.md)).

## Examples
1. Melted/spoiled items on arrival, photo provided → refund or replace.
2. "I changed my mind about the snacks" → non-returnable.
3. "I got sick from this" → escalate as a food-safety issue immediately.

## What the agent must not do
- Do not accept change-of-mind grocery returns.
- Do not troubleshoot an illness report — escalate.

## Escalation
Any illness/food-safety claim, or value over $100 → escalate.

## Customer-facing wording
> "Groceries can't be returned for a change of mind, but if anything arrived spoiled or damaged, send
> me a quick photo and I'll refund or replace it."

## Related
- [Non-returnable items](../returns/non-returnable-items.md) (RET-002)
- [Legal threats & safety reports](../escalation/legal-threats-and-safety-reports.md) (ESC-004)
