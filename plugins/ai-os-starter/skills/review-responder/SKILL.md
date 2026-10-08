---
name: review-responder
description: Drafts replies to online reviews (Google, Facebook, other review sites) in the brand voice, thanking people for positive reviews and responding calmly and constructively to negative ones, never arguing or admitting liability. Use for "reply to this review", "respond to reviews", or pasted review text.
---

# Review responder

Draft public replies to online reviews. Warm when the review is good, calm when it's bad. Never argue, never admit liability, never reveal private details. **Drafts only. Nothing is posted.**

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-reviews.md`), or pasted review text. One review or many.
- Star ratings if known. If a review has no rating, judge the type from the wording and note that you did.
- If there's no input, ask: "Which reviews? Give me a file, or paste them in."
- If the input isn't a review (an email, a complaint sent privately), say so in one line and suggest `/email-reply-drafter` instead.

## What it reads
- `business-dna/brand-voice.md`: "How we sound", "Words we use", "Words we avoid", "Spelling and format rules".
- `business-dna/business-rules.md`: "Never say", "Always check with a human (with who)", "Escalation contacts by role" (the role and public contact for replies), "Legal and compliance notes".
- `business-dna/products-services.md`: each offer's name and "What we never do", to spot a review about a service you don't offer and to answer direct questions.
- If any of these files is missing or still has `[[FILL]]`, say which one in one line, suggest running `/business-dna-interview`, and carry on with plain, friendly Australian English and `[CHECK: …]` placeholders.

## Steps
1. Read every review. For each, note the platform (if given), the stars and the reviewer's display name as written.
2. **Classify by stars:**
   - 4–5★ = **Positive**
   - 3★ = **Mixed**
   - 1–2★ = **Negative**
3. **Check for flags** in every review, whatever the stars:
   - a safety issue (injury, gas, fire, water damage, food illness, anything dangerous);
   - a legal threat (lawyer, suing, Fair Trading, ACCC, tribunal, "see you in court");
   - a staff member named negatively;
   - a suspected fake (no detail, wrong business, a service you don't offer per `products-services.md`);
   - a language other than English.
4. **Any safety issue, legal threat or staff member named negatively = HUMAN FIRST.**
   **HUMAN FIRST, no draft:** do not draft a public reply. Write only:
   - **HUMAN FIRST — no draft.** Summary: … · Reason: … · Who decides: <role from "Always check with a human" in `business-rules.md`, or `[CHECK: who handles this]`>;
   - a short neutral holding line the owner *could* use (e.g. "Thanks for letting us know. We take this seriously and would like to talk with you directly. Please contact our <role> on <public contact>."). The role and public contact come from "Escalation contacts by role" in `business-rules.md`, or `[CHECK: public contact]`.
5. **Positive:** a short, specific thank-you that mentions what they praised, in their words where you can. **60 words or fewer.**
6. **Mixed or negative (not HUMAN FIRST):** **80 words or fewer.**
   - acknowledge what they experienced;
   - thank them for the feedback;
   - no excuses, no "but", no correcting their version;
   - no details of the job, the customer, dates or prices that the reviewer didn't say first;
   - invite them to continue offline by **role** and the business's **public** contact from "Escalation contacts by role" (`business-rules.md`), or `[CHECK: public contact]`.
7. Count the words of each draft. If it's over the limit, cut it before writing.
8. Check every draft against "Never say" in `business-rules.md` and "Words we avoid" in `brand-voice.md`.
9. Write the output file, then show the person a 3-line summary (counts by type, how many HUMAN FIRST) and the file path.

## Rules
- **Staff names:** never name staff in a reply, even to praise them, unless `brand-voice.md` "Spelling and format rules" or `business-rules.md` "Never say" explicitly allows naming staff. If the reviewer praises a named staff member, thank them for the kind words "about our team".
- **Customer details:** only repeat what the reviewer wrote. Never add their address, job details, invoice, or that you "checked our records".
- **Fault and money:** never admit fault or liability, never offer a refund, discount, voucher or compensation in public, and never discuss refunds at all. "We'd like to understand what happened" is fine. "Sorry for our mistake" is not.
- Use the reviewer's display name only as it appears on the review. If it looks like a full name, use the first name only.

## Output
Write `outputs/review-responder/YYYY-MM-DD-replies.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# Review replies — <date>
Source: <file or "pasted"> · <n> reviews

| # | Reviewer | Stars | Type | Flags |
|---|---|---|---|---|

## Review 1 — <Reviewer>, <stars>★, <Type>
> <short quote of the review>
**Flags:** none | <flag>
**Draft reply (not posted) — <n> words:**
<reply>

## Review 2 — <Reviewer>, <stars>★, HUMAN FIRST
**HUMAN FIRST — no draft.** Summary: … · Reason: <safety / legal / staff named> · Who decides: <role from business-rules, or [CHECK: who handles this]>
**Suggested holding line (not posted):** <line>

## Check before you use
- **[CHECK] items:** each placeholder, or "none"
- **Assumptions:** e.g. type judged from wording where no stars
- **Needs a human decision:** HUMAN FIRST reviews and who decides. Post each reply yourself on the platform.
- Nothing has been posted.
```

## Never
- Post, publish or reply on any platform. Drafts only.
- Admit fault or liability, offer compensation, or mention a refund publicly.
- Reveal anything about the customer or job that the reviewer didn't say first.
- Name staff in replies unless brand rules allow it.
- Argue, correct the reviewer, or hint they're lying.
- Make up facts, policies, contact details or promises. Use `[CHECK: …]`.
- Give legal advice on a review that threatens action. Flag it: "Have your adviser check this."
- Copy personal details into the output beyond what the reply needs.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Suspected fake review:** draft a neutral reply ("We can't find a record matching this. Please contact our [role] so we can look into it.") and add the note "Consider reporting it via the platform."
- **Another language:** reply in the same language only if you're confident, flag it, and include an English version underneath for the owner to check.
- **Positive stars, negative words (or the reverse):** go by the words, and say so in the flags.
- **A review that's just stars, no text:** a one-line thank-you, under 20 words.
- **The same reviewer posting twice:** draft once and note the duplicate.
- **A review asking a direct question (prices, hours):** answer only from DNA; otherwise `[CHECK: …]`.

Worked example: see `examples/sample-1.md`.
