---
name: dna-check
description: Checks a draft against the Business DNA (brand voice, ideal customers, products, pricing, business rules) and lists what's off-brand, inaccurate or against the rules, with fixes. Use for "is this on brand", "check this draft", "dna check", or after any workflow produces output.
---

# DNA check

Score a piece of AI output against the owner's Business DNA and say exactly what to change: in the draft, in the DNA, or in the workflow that made it. This is how the owner learns that fixing the DNA once fixes every workflow. **It points to fixes; it doesn't rewrite the draft.** It changes no file unless the person asks with `--apply`.

## Input
- `$ARGUMENTS`: a file path, or pasted text. Optional flags: `--apply` and `--save`.
- **No path or text given:** use the newest file in `outputs/` (any workflow folder, not `outputs/dna-check/`). Say which file you picked in one line.
- If nothing is in `outputs/` and nothing was pasted, ask: "Which draft? Give me a file or paste the text."
- A file with several drafts (e.g. a set of email replies): check them together and number the fixes by item.

## What it reads
- All five Business DNA files:
  - `business-dna/brand-voice.md`: "How we sound" (we say / we don't say), "Words we use", "Words we avoid", "Spelling and format rules".
  - `business-dna/products-services.md` and `business-dna/pricing-positioning.md`: every offer, inclusion, timeframe, price, term and discount rule.
  - `business-dna/business-rules.md`: "Never say", "Never do", "Always check with a human", "Response-time promises".
  - `business-dna/ideal-customers.md`: "Best customers", "Who we are not for", "Red flags in an enquiry".
- **Only the DNA counts as true.** A price, policy or promise that sounds right but isn't in the DNA is not accurate.
- If a file is missing or a heading still has `[[FILL]]`, score what you can, mark that line "can't check: DNA missing <heading>", and suggest a [DNA] fix. Mention `/business-dna-interview` once.

## Steps
1. Read the draft and all five DNA files.
2. **Score each line 1–5, with one line of evidence.** Quote the draft where you can.
   - **Voice:** matches the traits, uses "we say" phrasing, avoids "we don't say" and "Words we avoid".
   - **Accuracy:** every product, price, timeframe and policy matches the DNA. Anything not in the DNA is flagged.
   - **Rules:** breaks no "Never say" or "Never do" item, and routes "Always check with a human" items to a person.
   - **Customer fit:** written for an ideal-customer segment, and doesn't over-promise to a red-flag type.
   - **Spelling and format:** follows "Spelling and format rules".
3. **Scoring guide:**
   - 5 spot on · 4 small slips · 3 noticeable problems · 2 a serious problem · 1 unusable on this line.
   - **Accuracy:** any price, rate, discount or policy not in the DNA scores **2 or below**.
   - **Rules:** any "Never say" phrase or "Never do" action in the draft scores **1**.
   - **Voice:** any "we don't say" or "Words we avoid" phrase scores **3 or below**.
   - `[CHECK: …]` placeholders are fine. They're gaps, not errors.
4. **Give the verdict:**
   - **Don't use:** Rules is 2 or below, or any line is 1.
   - **Needs edits:** any line is 3 or below, or Accuracy or Rules couldn't be checked.
   - **Ready:** every line checked is 4 or 5.
5. **List up to 5 fixes, most serious first.** Quote the offending phrase each time and tag it:
   - **[OUTPUT]:** edit this draft. Say what to change it to, using DNA wording.
   - **[DNA]:** the DNA is missing or unclear. Give the exact line to add and the file and heading it goes under. If the fact isn't known, leave a slot for the owner: `<your rate for X>`.
   - **[SKILL]:** the workflow that made this needs a rule. Name the workflow and the rule in one line.
6. **With `--apply` only:** take the [DNA] fixes, then for each one show the exact line, the file and the heading, and ask: "Add this to <file> under <heading>? (yes / no)". On the word `yes`, in any capitals, append it under that heading. Anything else, including `Accept`, means no and writes nothing. If the line has a slot like `<your rate>`, ask the owner for the value first; never fill it yourself.
7. Show the result on screen. With `--save`, also write it to `outputs/dna-check/YYYY-MM-DD-<short-slug>.md`. Never overwrite: add `-2`, `-3` and so on.

## Approval points
- **Without `--apply`, change no file.** Not the draft, not the DNA. `--save` writes only the report in `outputs/dna-check/`.
- **With `--apply`, ask before every [DNA] line.** Only [DNA] fixes are applied. [OUTPUT] and [SKILL] fixes are always left for the owner.
- Appending only: never delete, reword or reorder existing DNA lines, and leave `[[FILL]]` markers for `/business-dna-interview`. The safety file also asks before any change to `business-dna/`.

## Output
On screen (and in the `--save` file). Template: `templates/output.md`.

```
DNA check — <file or "pasted text"> — <date>
| Line | Score | Evidence |
| Voice | n/5 | … |
| Accuracy | n/5 | … |
| Rules | n/5 | … |
| Customer fit | n/5 or n/a | … |
| Spelling and format | n/5 | … |
Verdict: Ready | Needs edits | Don't use — <one-line reason>
Fixes
1. [OUTPUT] "<quoted phrase>" → <change>
2. [DNA] Add to <file> → <heading>: "<line>"
3. [SKILL] <workflow>: <rule to add>
## Check before you use
- **[CHECK] items:** `[CHECK: …]` placeholders still in the draft
- **Assumptions:** e.g. which file was checked; lines that couldn't be checked
- **Needs a human decision:** each fix to accept or reject; DNA lines applied (if `--apply`)
- Nothing has been sent.
```

## Never
- Rewrite the whole draft. Point to fixes. (The owner can ask for a rewrite separately.)
- Accept a price or policy as "correct" because it sounds plausible. Only the DNA counts.
- Change any file without `--apply`, or apply an [OUTPUT] or [SKILL] fix.
- Add a fact to the DNA the owner hasn't given. Slots stay slots.
- Give legal, tax or financial advice about the draft. Flag it: "Have your adviser check this."
- Send, post or contact anyone. Copy personal details into the report beyond the quoted phrase.

## Edge cases
- **DNA is thin or has `[[FILL]]`:** score what you can, mark the rest "can't check: DNA missing <heading>", and suggest a [DNA] fix.
- **The draft isn't customer-facing** (an internal note, an action list): Customer fit is "n/a: internal", and say so.
- **More than 5 problems:** list the 5 most serious, then "Plus <n> smaller ones; fix these first and run it again."
- **The draft is a HUMAN FIRST holding reply:** check it, but don't mark it down for not answering the question.
- **The input isn't a draft** (a DNA file, a price list): say so in one line and stop.

## Automated test runs
If the request includes "This is an automated test run", never apply anything: answer **no** to every `--apply` question and change no DNA file. Still produce the scores, the verdict and the fixes as normal.

Worked example: see `examples/sample-1.md`.
