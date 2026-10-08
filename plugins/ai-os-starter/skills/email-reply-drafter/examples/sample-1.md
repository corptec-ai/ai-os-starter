# Example: three emails for Northside Plumbing & Gas (fictional)

## Assumed DNA for this example
(In the business's own files; not pasted into the output.)
- `brand-voice.md`: friendly and practical; sign off "Cheers, The Northside team".
- `business-rules.md` → Response-time promises: "We reply to customer emails within one business day."
- `business-rules.md` → Always check with a human: refunds, complaints and damage claims, with the Operations Manager.
- `business-rules.md` → Escalation contacts by role: complaints, Operations Manager; bookings, Office Manager.

## Input (pasted)

**Email 1**
From: Priya Sample <priya@example.com>
Subject: Moving my booking
Hi, I've got a hot water service check booked for Thursday morning. Can we move it to Friday? Thanks, Priya

**Email 2**
From: Dan Example <dan@example.com>
Subject: Absolutely furious
Your plumber left a leak under my sink and now the cupboard floor is ruined. I want a full refund and you'll be paying for the cabinet. If I don't hear back today I'm going to Fair Trading.

**Email 3**
From: accounts@northside-payments.example.com
Subject: URGENT: update your bank details
Your supplier account will be suspended. Click here to confirm your banking details within 24 hours.

## Output (written to `outputs/email-reply-drafter/2026-10-08-replies.md`)

# Email replies — 2026-10-08

Summary: 1 drafted · 1 HUMAN FIRST · 1 don't reply

## 1. Priya Sample — Moving my booking
- **Gist:** Wants to move Thursday's hot water check to Friday.
- **Category:** booking change
- **Flag:** none
- **Why:** Routine reschedule. Friday availability isn't in the DNA, so it's a CHECK.

**Draft reply (not sent)**

Subject: Re: Moving my booking

Hi Priya,

No worries at all. We can look at moving your hot water check to Friday. [CHECK: is there a Friday slot, and what time?] We'll confirm the new time with you within one business day.

Cheers,
The Northside team

## 2. Dan Example — Absolutely furious
- **Gist:** Says a leak was left after a job; wants a refund and the cabinet paid for.
- **Category:** complaint
- **Flag:** HUMAN FIRST
- **Why:** Refund request, damage claim, legal threat (Fair Trading), angry customer.

**HUMAN FIRST — no draft.** Summary: Customer reports a leak under the sink after our visit, with damage to the cupboard floor. He wants a full refund and the cabinet paid for, and mentions Fair Trading if he doesn't hear back today. · Reason: refund request, damage claim, legal threat, angry customer · Who decides: Operations Manager

**Holding reply only (not sent)**

Subject: Re: Absolutely furious

Hi Dan, thanks for letting us know, and I'm sorry you're dealing with this. Our Operations Manager will be in touch within one business day.

_(Note for the owner: the holding reply admits no fault, promises no refund, and uses your response-time promise, not the customer's "today". No full draft written.)_

## 3. accounts@northside-payments.example.com — URGENT: update your bank details
- **Category:** other
- **Flag:** DON'T REPLY
- **Why:** Looks like phishing: urgent pressure, asks for bank details, link to an unknown site.

No draft.

## Check before you use
- **[CHECK] items:**
  - Email 1: [CHECK: is there a Friday slot, and what time?]
  - Email 2: [CHECK: does the one-business-day promise apply to complaints, or do you have a faster one?]
- **Assumptions:** "within one business day" taken from Response-time promises in business-rules.md, for Emails 1 and 2.
- **Needs a human decision:**
  - Email 2: HUMAN FIRST, for the Operations Manager. Dan asked to hear back today; decide whether to call sooner than the promise. Have your adviser check any reply about liability.
  - Email 3: don't reply. Don't click the link. Report it to whoever looks after your IT.
- Nothing has been sent.
