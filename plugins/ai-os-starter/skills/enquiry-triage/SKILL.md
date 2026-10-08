---
name: enquiry-triage
description: Triages new enquiries or leads against the ideal-customer profile, scores fit, flags red flags, and suggests the next step and owner for each. Use for "sort these enquiries", "which leads are worth it", "triage my inbox leads", or a list of web-form or email enquiries.
---

# Enquiry triage

Sort new enquiries by how well they fit the business's ideal customers, spot red flags, and suggest a next step and owner for each, so the owner spends time on the right leads first. **This is a sorting list only. Nobody is contacted.**

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-enquiries.md`, a CSV or a text file), or pasted enquiries.
- **Connected sources (after Session 6):** if the person names a web-form inbox or email folder, read just those. Read only.
- If there's no input, ask: "Which enquiries? Give me a file, or paste them in."
- If the input isn't enquiries (a price list, meeting notes), say so in one line and stop.

## What it reads
- `business-dna/ideal-customers.md`: "Best customers" (the segments), "Their problems in their words", "Who we are not for", "Red flags in an enquiry".
- `business-dna/products-services.md`: each offer's name, and "What we never do".
- `business-dna/business-rules.md`: "Always check with a human", "Escalation contacts by role" (roles only).
- Never paste DNA text into the output. Quote only the enquiry's own words.
- If a file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]`. Without segments, grade everything `?` and say why.

## Steps
1. Read every enquiry. For each, pull out:
   - **who** (name or business; first name is enough);
   - **what they want**;
   - **location**;
   - **size or budget signals**;
   - **urgency**.
2. **Merge duplicates.** Same person or business asking the same thing: keep one row and note "duplicate (×2)".
3. **Grade fit:**
   - **A**: matches a "Best customers" segment and wants an offer we have.
   - **B**: possible fit; partly matches, or the offer is a stretch.
   - **C**: not for us; matches "Who we are not for", wants something in "What we never do", or is outside our area.
   - **?**: not enough to grade. Write the one question to ask, and name the likely offer: next step "Ask question; then <offer>".
   Name the matching segment and give one line of evidence from the enquiry.
4. **Check red flags.** Compare each enquiry with "Red flags in an enquiry" and "Who we are not for", and **quote the enquiry's exact phrase** for any match.
   - A "Who we are not for" match is grade C; put the quoted phrase in the main table's short "Notes" column.
   - A "Red flags in an enquiry" match **overrides the fit grade**: grade "Red flag", **not** in the main table, next step "Owner decides", owner the "Always check with a human" role. Name the red flag it matches.
   - Lesser concerns (tight timing, unclear scope) go in "Notes".
5. **Ignore protected characteristics.** Age, gender, ethnicity, religion, disability, pregnancy, sexuality, marital status and similar are never a fit signal. Don't mention them in evidence. If a grade would otherwise depend on one, grade on everything else and note "Protected characteristic ignored" in the Check box.
6. **Suggest a next step** that uses a real offer from `products-services.md`, by its exact name:
   - call, send info about <offer>, book a site visit for <offer>, politely decline, or refer elsewhere.
   - If no offer fits, the step is "decline" or "refer elsewhere". Never invent an offer.
   - Suggest an owner **by role** (from "Escalation contacts by role"), never a personal phone number.
7. **Sort** the main table A, then B, then C, then ?. Red-flagged enquiries appear **only** in the "Red-flagged enquiries" section after the table, with the quoted phrase and the matched red flag.
8. Write the output file. Show the person the summary line and the file path.

## Approval points
None. This skill only writes a sorting file. If the person asks you to reply to anyone, **stop and say**: "I only sort. Use `/email-reply-drafter` to draft a reply for you to check."

## Output
Write `outputs/enquiry-triage/YYYY-MM-DD-triage.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# Enquiry triage — <date>
Summary: <n> A · <n> B · <n> C · <n> ? · <n> red flag

| # | Enquiry | Grade | Segment | Notes | Next step (offer) | Owner (role) |
|---|---|---|---|---|---|---|

## Why the A's
- #<n> <who>: <one line>

## Red-flagged enquiries
| # | Enquiry | Grade | Quoted phrase | Matches red flag | Next step | Owner (role) |
| <n> | <who>: <what> | Red flag | "<phrase>" | <red flag> | Owner decides | <"Always check with a human" role> |

## Need more information (?)
- #<n> <who>: ask "<question>"

## Check before you use
- **[CHECK] items:** each placeholder, with the enquiry number
- **Assumptions:** e.g. service area, borderline grades
- **Needs a human decision:** red-flagged leads, grades to confirm, "Protected characteristic ignored" notes
- Nothing has been sent.
```

## Never
- Contact, reply to, book or decline anyone. Sorting only.
- Draft a decline message. Suggest "decline" only; the owner can use `/email-reply-drafter`.
- Use a protected characteristic as a fit signal.
- Suggest an offer, price or timeframe that isn't in the DNA.
- Copy phone numbers, emails or addresses into the output. Name and suburb are enough.
- Make up facts about a lead (budget, size, history). Gaps become `[CHECK: …]`.
- Give legal or financial advice about a lead. Flag it: "Have your adviser check this."
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Not enough to grade:** grade `?` with the single question to ask.
- **Duplicate:** merge and note "duplicate".
- **Two offers in one enquiry:** grade on the better-fitting one and mention the other in the next step.
- **Red flag on an otherwise A lead:** the red flag wins. Grade it "Red flag", leave it out of the main table, list it only in the red-flag section with the quoted phrase, next step "Owner decides", owner the "Always check with a human" role. You may note "otherwise an A" there.
- **Existing customer** (they say so): grade normally and note "existing customer" in evidence.
- **Spam or a sales pitch to us:** grade C, next step "no action", and say why.

Worked example: see `examples/sample-1.md`.
