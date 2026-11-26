---
policy_id: DELAY-003
title: "Delay notices and your right to cancel (FTC)"
category: delays-and-compensation
tags: [delay notice, FTC, mail order rule, cancel, full refund, unshipped]
applies_to: [all_categories]
agent_can_approve: true
approval_limit_usd: 100
escalate_if: ["tool can't confirm shipping status", "order_value > 100", "indefinite delay"]
related: [DELAY-001, ORD-001, REF-004, LEGAL-001]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Delay Notices and Your Right to Cancel (FTC)

**Summary.** Under the **FTC Mail Order Rule**, if {{STORE_NAME}} can't ship by the promised time, it
must offer the customer the choice to **cancel for a full, prompt refund**. If a customer **cancels
an unshipped order** because of a delay, the agent arranges a **full refund to the original payment
method** — **not store credit** — within **7 working days** (card/cash/check). Escalate if a tool
can't confirm the order hasn't shipped.

## Rule details
- IF order **not shipped** AND customer cancels due to delay → **full refund to original payment
  method**; a gift card/credit does **not** count as a refund.
- A delay notice must give a revised date (or say it's unknown), offer **cancel-for-refund**, and a
  no-cost way to cancel.
- IF the revised date is **≤ 30 days** later, customer silence can count as consent to wait; for
  **longer/indefinite** delays, the order is cancelled unless the customer agrees to wait.
- Refund due within **7 working days** for card/cash/check/money-order payments
  ([REF-004](../refunds/refund-timing-by-payment-method.md)).
- Legal basis: [LEGAL-001](../legal/compliance-notes.md).

## Steps
1. Confirm the order's shipping status. IF the tool can't confirm → **escalate** (don't guess).
2. IF unshipped and the customer wants to cancel → process a **full refund to original method**.
3. IF shipped/in transit → this is a delivered-late case → goodwill tiers ([DELAY-001](delay-compensation-tiers.md)).
4. IF `order_value > $100` → escalate for approval.

## Examples
1. Order not shipped, 6 days past promised date, customer cancels → **full refund to card** within 7
   working days. No store credit.
2. Order in transit, 4 days late → **$5 goodwill credit** (DELAY-001), not a cancellation refund.
3. Indefinite stock delay, customer won't wait → cancel + full refund; escalate if over $100.

## What the agent must not do
- Do not offer store credit in place of a required cancellation refund.
- Do not assume shipping status when a tool fails — escalate.

## Escalation
Tool can't confirm shipping status, value over $100, or an indefinite delay dispute → escalate.

## Customer-facing wording
> "Since your order hasn't shipped yet and it's running late, you're entitled to cancel for a full
> refund to your original payment method — would you like me to do that, or wait for the new date?"

## Related
- [Delay compensation tiers](delay-compensation-tiers.md) (DELAY-001)
- [Cancel an order](../order-management/cancel-an-order.md) (ORD-001)
