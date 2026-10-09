---
name: email-reply-drafter
description: Drafts replies to customer emails in the business's brand voice using only facts from the Business DNA, and flags anything needing a human decision (refunds, complaints, legal, pricing exceptions). Use for "reply to this email", "draft responses", "help with my inbox", or a file of customer emails.
---

# Email reply drafter

Draft replies to customer emails in the business's own voice, using only facts from the Business DNA. Anything that needs a person (a refund, a complaint, a legal or safety issue, an angry customer) is routed to a human first. **Drafts only. Nothing is ever sent.**

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-emails.md`), or pasted emails. One or many.
- **Connected email (after Session 6):** if the person names emails in a connected tool ("the last 5 unread from the bookings inbox"), read just those. Read only.
- If there's no input, ask: "Which emails? Give me a file, paste them in, or name the ones in your connected inbox."
- If the input isn't customer email (a price list, an article), say so in one line and stop.

## What it reads
- All five Business DNA files, especially:
  - `business-dna/brand-voice.md`: "How we sound", "Words we use", "Words we avoid", "Spelling and format rules".
  - `business-dna/business-rules.md`: "Never say", "Never do", "Always check with a human", "Response-time promises", "Escalation contacts by role".
  - `business-dna/products-services.md` and `business-dna/pricing-positioning.md`: only to answer what the customer actually asked.
- Never paste DNA text into the output. Use it to write; don't copy it.
- If a file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders. If the brand voice isn't set, use plain, friendly Australian English and add `[CHECK: brand voice not set yet]`.

## Steps
1. Read every email. For each, note who it's from, the gist, and what they're actually asking.
2. **Classify it:** enquiry, booking change, complaint, payment, or other.
3. **Route before drafting.** Mark the email **HUMAN FIRST** if it:
   - touches anything under "Always check with a human" in `business-rules.md`;
   - asks for a refund, credit or compensation;
   - mentions a lawyer, tribunal, Fair Trading, the ACCC, or any legal threat;
   - raises a safety or health issue: gas, electrical, water damage, food illness or an allergic reaction, an injury on the premises, anything dangerous;
   - complains about data or privacy (personal details shared, lost or misused);
   - is angry, abusive or upset.
   For HUMAN FIRST, write: **HUMAN FIRST — no draft.** Summary: <2 lines> · Reason: <why> · Who decides: <role from "Escalation contacts by role">. Then a short **holding reply only** ("Thanks for letting us know. <Role> will be in touch within <response-time promise from business-rules>."). Never promise the customer's own deadline. **Do not draft a full answer.**
4. **Phishing or spam** (fake invoices, "verify your account" links, payment-detail changes, prize offers): mark **DON'T REPLY**, say why in one line, and draft nothing. Never click or repeat the link.
5. **Everything else, draft the reply:**
   - in the brand voice;
   - answer what was actually asked, nothing more;
   - use facts from the DNA or the email only; every gap becomes `[CHECK: …]`;
   - suggest a next step that fits the "Response-time promises";
   - reply to the sender only. No CCs, no other recipients.
6. Give each draft a subject line (usually "Re: <their subject>") and a one-line reason ("Routine booking change; times from products-services.md").
7. **Check every draft** against "Never say" and "Words we avoid". Fix anything that slipped in.
8. Write the output file, then show the person: how many drafts, how many HUMAN FIRST, how many DON'T REPLY, and the file path.

## Approval points
**Saving drafts to a connected mailbox (optional).** Only when **all** of these are true:
- the person explicitly asks you to save drafts into their mailbox;
- the connected tool has a "create draft" action;
- the person approves **each** draft.

**Stop and ask before each one:** "Save this reply to <sender> as a draft in your mailbox? (yes / no / skip all)". Default is no.
- Never save a HUMAN FIRST or DON'T REPLY email as a draft (the holding reply stays in the file only, unless the person asks for it separately and approves it).
- **Never send.** If a tool offers send, don't use it. If a tool refuses something, don't look for a way around it.

## Output
Write `outputs/email-reply-drafter/YYYY-MM-DD-replies.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# Email replies — <date>
Summary: <n> drafted · <n> HUMAN FIRST · <n> don't reply

## 1. <Sender name> — <subject>
- **Gist:** <one line>
- **Category:** enquiry | booking change | complaint | payment | other
- **Flag:** none | HUMAN FIRST | DON'T REPLY
- **Why:** <one-line reason>

**Draft reply (not sent)**
Subject: Re: …
<reply>

(HUMAN FIRST: **HUMAN FIRST — no draft.** Summary: … · Reason: … · Who decides: <role>, then the holding reply only.)
(DON'T REPLY: reason only, no draft.)

## Check before you use
- **[CHECK] items:** one per line, with the email number
- **Assumptions:** e.g. response-time promise used
- **Needs a human decision:** HUMAN FIRST emails and who decides; DON'T REPLY emails
- Nothing has been sent.
```

## Never
- Send, reply, forward, schedule, delete, or contact anyone. Drafts only.
- Promise a refund, discount, credit, date, time or price that isn't in the DNA or the email.
- Admit liability or fault in a complaint. Acknowledge and route to a human.
- Reply to anyone but the sender, or add CCs.
- Make up policies, names, figures or legal claims. Gaps become `[CHECK: …]`.
- Give legal, tax or financial advice. Flag it: "Have your adviser check this."
- Copy personal details into a draft beyond what the reply needs (no account numbers, no other customers' details).
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Mixed requests** in one email (a booking question plus a refund): answer the routine part, flag the rest as HUMAN FIRST, and say so in the "Why" line. If the routine part can't sensibly be answered alone, treat the whole email as HUMAN FIRST.
- **Not in English:** draft in the same language if you're confident, and add `[CHECK: reply written in <language>; have a fluent speaker check it]`. If not confident, mark HUMAN FIRST.
- **A pricing exception** ("can you match this quote?"): HUMAN FIRST unless the "Discount rules" in `pricing-positioning.md` clearly cover it.
- **Thread with several replies:** answer the latest message only.
- **No emails need a reply:** say so, and still write the file with the Check box.

Worked example: see `examples/sample-1.md`.
