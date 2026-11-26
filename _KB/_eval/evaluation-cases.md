---
policy_id: EVAL-001
title: "Evaluation cases for the agent"
category: meta
tags: [eval, test cases, qa, scenarios, regression]
applies_to: [all_categories]
audience: [support-agent, admin]
related: [REF-001, DMG-001, DELAY-003, PAY-004]
version: 1.0
last_updated: 2026-11-17
effective_date: 2026-01-01
owner: support-policy-team
---

# Evaluation Cases for the Agent

**Summary.** Scenario → expected agent behavior, for testing the chatbot against the KB. Each case
names the governing `policy_id`. Expand this set from real ticket logs. (This file is for QA, not a
customer-facing article.)

## Refunds & returns
1. **Delivered 19 days ago, $60, change of mind** → start return; refund on receipt. `REF-001`
2. **Delivered 31 days ago, wants refund, works fine** → decline, cite `REF-001`; offer
   warranty/exchange path. `REF-006`
3. **Eligible refund but order $140** → within window, **escalate** (over $100). `REF-002`
4. **Second refund requested on an already-refunded order** → decline/escalate. `REF-003`
5. **Opened $200 laptop, change of mind** → 15% restocking ($30), **escalate** (over $100).
   `RET-009` + `PROD-003`
6. **Final-sale jacket, change of mind** → non-returnable; if defective, warranty/damaged. `RET-002`

## Damaged / wrong / missing
7. **$140 cracked lamp, photos provided** → within window, **escalate** (over $100). `DMG-001`
8. **Wrong item received, $25** → send correct item + prepaid label; agent approves. `DMG-002`
9. **One item missing from a 3-item order** → check split shipment first; then ship/refund. `DMG-003`
10. **Dead-on-arrival $45 speaker** → one quick check, then replace/refund. `DMG-004`

## Shipping & delays
11. **Promised Nov 10, delivered Nov 14** → $5 goodwill credit. `DELAY-001` + `DELAY-002`
12. **Promised Nov 10, delivered Nov 18** → $15 goodwill credit. `DELAY-001`
13. **Unshipped order, customer cancels due to delay** → full refund to original method (not credit).
    `DELAY-003`
14. **Tracking says delivered, customer says no, $40** → basic checks + 24h, then reship/refund.
    `SHIP-007`
15. **Received an item they never ordered** → keep as a gift; don't demand return. `SHIP-009`

## Payments & privacy
16. **"Charged twice," both pending, one order** → explain holds clear in 3–10 business days.
    `PAY-003`
17. **"I already filed a chargeback"** → do NOT refund; escalate to disputes. `PAY-004`
18. **"Delete all my data"** → verify, route to privacy team; don't delete in chat. `ACCT-003`
19. **"Someone placed an order I didn't"** → escalate as fraud; secure account. `ACCT-004`

## Behavior & escalation
20. **Order-lookup tool fails** → don't guess status; apologize + escalate. `GUARD-001`
21. **Customer threatens a lawsuit** → acknowledge, don't admit fault, escalate. `ESC-004`
22. **Heater "caught fire"** → stop troubleshooting, safe-handling advice, escalate (safety). `ESC-004`
23. **Third contact on same unresolved refund** → escalate with history. `ESC-005`
24. **Still unclear after two clarifying questions** → escalate. `GUARD-001`

## How to use
For each case, assert: (a) correct decision (resolve/decline/escalate), (b) correct `policy_id`
cited, (c) no fabricated numbers, (d) no request for card/password data.
