---
name: job-ad-writer
description: Writes a job ad and screening questions in the company's voice from a rough role description, using inclusive wording and leaving pay and award details for the owner to confirm. Use for "write a job ad", "we're hiring a…", "recruit for this role", or rough role notes.
---

# Job ad writer

Turn rough role notes into a job ad and 5 screening questions, in the business's voice, with fair and inclusive wording. Pay and award details come only from the owner. **Drafts only. Nothing is posted.**

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-role-notes.md`), or pasted role notes: title, hours, location, duties, must-haves, nice-to-haves, and pay if the owner gives it.
- If there's no input, ask: "Which role? Give me a file, or tell me the job title and a few lines about it."
- If the notes describe more than one role, write **every role** in one output file, one section per role. Each role gets its own complete ad, 5 screening questions, and language-check notes.

## What it reads
- `business-dna/brand-voice.md`: "Who we are", "How we sound", "Words we use", "Words we avoid", "Spelling and format rules".
- `business-dna/products-services.md`: each offer's name and what's included, for **About us** and **The role**.
- `business-dna/business-rules.md`: "Never say", "Always check with a human (with who)", "Legal and compliance notes".
- If any of these is missing or still has `[[FILL]]`, say which file in one line, suggest running `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders.

## Steps
Where a question states a default, the typed word `Accept` or `return`, in any capitals, chooses that default.

1. Read the notes. Split them into roles. For each role, list what's there and what's missing.
2. **Ask at most 3 questions, one at a time, each with a default the owner can accept by typing the word Accept.** Only ask what the notes don't already answer:
   - "What's the pay or pay range? (Type Accept for the default: leave it blank for your payroll adviser to fill in.)"
   - "Is it full-time, part-time, casual or fixed-term? (Type Accept for the default: [what the notes suggest])"
   - "When would you like them to start? (Type Accept for the default: as soon as possible)"
   With more than one role, ask each question once and cover every role in it. Never ask more than these three. Anything else missing becomes `[CHECK: …]`.
3. **For each role**, write the ad under these 7 headings, in this order:
   1. **About us** — from `brand-voice.md` "Who we are" and `products-services.md`. 2–3 lines.
   2. **The role** — title, employment type, hours, location, start window. 2–3 lines.
   3. **What you'll do** — 5–7 bullets from the duties in the notes.
   4. **What you'll bring** — must-haves only, including any licences named in the notes.
   5. **Nice to have** — from the notes. If none, write "Nothing extra. If you've got the must-haves, we'd like to hear from you."
   6. **What we offer** — only what the owner stated. Pay goes here if given; otherwise `[CHECK: pay rate and award, confirm with your HR or payroll adviser]`.
   7. **How to apply** — the method from the notes, or `[CHECK: how to apply, e.g. email to jobs@… or apply via the job board]`.
4. **For each role**, write **5 screening questions**, each tied to a must-have (say which one). Ask about skills, experience, licences and availability for the stated hours. Never about personal circumstances.
5. **Run the inclusive-language check on every role.** Look for wording tied to age, gender, family status, religion, ethnicity, disability or other protected attributes, plus coded words ("young", "digital native", "recent graduate", "school leaver", "mature", "he/she", "fit and healthy", "native English speaker", "no kids"). Rewrite each one to describe the actual skill or behaviour, or remove it. In that role's language-check notes, list **each age-coded (or other coded) phrase removed or changed, quoting it exactly** from the notes.
6. **Check every role for unpaid trials.** If a role's notes mention an unpaid trial, "trial shift" or "work for free to start", don't put it in the ad. Add the literal flag `[CHECK: unpaid trials may breach workplace law; confirm with an adviser]` to **that role's** language-check and flags notes, and repeat it in the Check box.
7. Check the draft against "Never say" in `business-rules.md` and "Words we avoid" in `brand-voice.md`.
8. Write the output file, then show the person a short summary (each role, its number of language changes, number of `[CHECK]` items) and the file path.

## Rules
- **Pay, award, super and entitlements:** state them only if the owner gave them, word for word. Never look up, estimate or suggest a rate or award classification.
- **Protected attributes:** a requirement tied to one stays out unless the owner says it's a genuine legal requirement. If they do, keep it and flag it: `[CHECK: confirm this requirement with an adviser]`.
- **Licences and checks** (electrical licence, gas fitting, RSA, Working with Children Check, driver's licence): list them as must-haves only if they're in the owner's notes.
- Keep the voice from `brand-voice.md`. Plain, warm, specific. No "rockstar", "ninja" or "work hard, play hard".

## Output
Write one file, `outputs/job-ad-writer/YYYY-MM-DD-<role>.md` (e.g. `2026-10-08-apprentice-plumber.md`; for several roles, `2026-10-08-apprentice-plumber-and-office-admin.md`). Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# Job ads — <date> (drafts, not posted)

## Role 1: <Role title>      (repeat this whole section for each role)
### About us
### The role
### What you'll do
### What you'll bring
### Nice to have
### What we offer
### How to apply
### Screening questions — <Role title>
| # | Question | Tests must-have |
### Language check and flags — <Role title>
| Original wording (quoted) | Changed to | Why |
Flags: `[CHECK: unpaid trials may breach workplace law; confirm with an adviser]` if a trial was mentioned, or "None."

## Check before you use
- **[CHECK] items:** by role: pay and award, unpaid trial, anything missing
- **Assumptions:** e.g. employment type taken from the notes
- **Needs a human decision:** e.g. unpaid trial, any requirement tied to a protected attribute
- Nothing has been sent.
```

## Never
- Post the ad or send it to a job board, recruiter or anyone else. Drafts only.
- State pay, award classification, super or entitlements unless the owner gave them. Use `[CHECK: pay rate and award, confirm with your HR or payroll adviser]`.
- Use or allow requirements tied to age, gender, family status, religion, ethnicity or disability unless the owner says it's a genuine legal requirement, and then flag it for an adviser.
- Ask screening questions about age, health, family, religion, background, or plans to have children.
- Make up benefits, perks, team size, awards or culture claims not in the DNA or the notes.
- Give HR-law advice. Flag it: "Have your adviser check this."
- Ask more than 3 questions.
- Copy personal details beyond what the ad needs (no staff names, phone numbers or home addresses).
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Licensed roles:** list the licences from the owner's notes only. If a role obviously needs one but the notes don't say, add `[CHECK: does this role need a licence or check?]`; don't add it yourself.
- **Unpaid or "trial shift" mention:** leave it out of the ad and flag `[CHECK: unpaid trials may breach workplace law; confirm with an adviser]`.
- **Pay given as "award rates" with no detail:** write "Paid in line with the relevant award" and add `[CHECK: pay rate and award, confirm with your HR or payroll adviser]`.
- **Very thin notes (just a title):** use your 3 questions, then draft with `[CHECK: …]` for duties and must-haves rather than inventing them.
- **No inclusive-language issues found for a role:** still include that role's section and write "No changes needed."
- **More than one role:** never write only the first. Every role gets the full set, and every role gets both checks.

Worked example: see `examples/sample-1.md`.
