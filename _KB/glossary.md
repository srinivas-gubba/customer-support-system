---
policy_id: GLOSS-001
title: "Glossary: precise definitions for agent reasoning"
category: meta
tags: [glossary, definitions, terms, delivery date, days late, order value, refund amount]
applies_to: [all_categories]
related: [GUARD-001, REF-001, DELAY-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Glossary: Precise Definitions for Agent Reasoning

**Summary.** Every term below has exactly one meaning across the KB. The agent uses these
definitions for all date math and threshold checks. If a term is not defined here, do not invent a
definition — escalate.

## Core terms
- **Delivery date** — the **carrier-confirmed delivery date** (the date tracking shows status =
  `delivered`), not the order date and not the ship date. All return/refund/damage windows start
  here.
- **Order date** — the date the customer placed a properly completed order (payment accepted).
- **Ship date** — the date the carrier first scans the package.
- **Promised delivery date** — the delivery estimate shown to the customer **at checkout** for the
  chosen shipping method. Used only to compute lateness.
- **Days late** — `actual_delivery_date − promised_delivery_date`, in **calendar days**. If the
  order is still undelivered, use `today − promised_delivery_date`. Never negative; 0 if on time or
  early.
- **Days since delivery** — `today − delivery_date`, in **calendar days**. Drives the 30-day window.
- **Order value** — total the customer paid for the order **after discounts**, **excluding**
  original shipping and tax, in USD. Used for the $100 approval threshold.
- **Refund amount** — item price(s) paid **after discounts**, **excluding original shipping** unless
  the store is at fault (damaged/defective/wrong/store error), in which case original shipping is
  included.
- **Business day** — Monday–Friday excluding US federal holidays. "Calendar days" count every day.

## Fault & condition terms
- **Store at fault** — item arrived damaged, defective on arrival, wrong item, missing item/part, or
  a {{STORE_NAME}} processing/shipping error. Store pays return shipping and refunds original
  shipping.
- **Change of mind** — customer no longer wants an otherwise-correct, as-described item. Customer
  pays return shipping; original shipping is not refunded.
- **Original condition** — new/unused, in original packaging, with all tags, accessories, and parts.
- **Non-returnable** — on the published exclusion list (see [RET-002](returns/non-returnable-items.md)).

## Status terms
- **Delivered but not received (DNR)** — tracking shows `delivered` but the customer reports
  non-receipt. Handled under [SHIP-007](shipping-and-delivery/delivered-not-received.md).
- **Lost** — in transit with no delivery and no meaningful movement past the expected window.
- **Delay notice** — a formal FTC Mail Order Rule notice sent when the store cannot ship on time;
  triggers the customer's right to cancel for a full refund (see [DELAY-003](delays-and-compensation/delay-notices-and-your-right-to-cancel.md)).

## Rule precedence (when rules collide)
**Legal requirement > safety > damaged-item policy > standard return policy > goodwill credits.**
Example: the FTC-required cancellation refund overrides the "goodwill credit" delay tiers.

## Related
- [Agent guardrails](agent-guardrails.md) (GUARD-001)
- [Refund eligibility & window](refunds/refund-eligibility-and-window.md) (REF-001)
