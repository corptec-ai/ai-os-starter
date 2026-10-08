---
name: sample-data-maker
description: Creates realistic, fictional sample inputs (emails, enquiries, notes, forms, spreadsheets) for testing an AI workflow safely, including one deliberately messy example. Use for "make sample data", "I need test examples", "sandbox data", or Session 4 of the workshop.
---

# Sample data maker

Make five realistic but **fictional** inputs for the owner's workflow, so they can design and test it without touching real customer data on Day 1. **Everything it makes is invented. It never copies a real person's details.**

## Input
- A workflow name in `$ARGUMENTS` (e.g. `quote-request-reply`): read the **Trigger** and **Inputs** sections of `workflows/<name>/blueprint.md`.
- No argument: use the newest blueprint in `workflows/`, and say which one in one line.
- No blueprint yet: a plain description of the input works ("customer emails asking to move a booking"). Ask for a short kebab-case name for the folder, with a suggested default.
- Optional: one real example in `inbox/`, used for **shape only** (length, layout, the kind of details people include).

## What it reads
- `business-dna/ideal-customers.md` → "Best customers", "Their problems in their words", "Red flags in an enquiry": so the samples sound like this business's customers.
- `business-dna/products-services.md` → "Our offers": so requests match what the business sells.
- If a file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with plausible, generic samples for that industry, marked `[CHECK: DNA not filled; samples are generic]` in the README.

## Steps
1. **Confirm the format in one line**, with a default they can accept with Return, e.g. "Five customer emails asking for hot water quotes, one markdown file each. OK?" If the input is tabular (an export, a list, a spreadsheet), the default is CSV.
2. **Plan the five samples:**
   - **Samples 1–3, typical:** each from a different customer segment or request type in the DNA.
   - **Sample 4, edge case:** realistic but missing one key detail the workflow needs (no address, no date, no headcount, no amount).
   - **Sample 5, messy:** long or rambling, with mixed requests, wrong or contradicting details, or a request the business doesn't do.
3. **Write each sample** so it reads like the real thing: the subject line, greeting, the way customers actually write, typos where natural. Use only:
   - invented first and last names, invented businesses and invented street names (real suburbs are fine);
   - email addresses ending in `@example.com`;
   - phone numbers in the form `0400 000 xxx` (e.g. `0400 000 317`);
   - dates near the workshop, written the way the business writes them.
   No real business names other than the owner's own. No bank, card, ABN, Medicare or account numbers, ever.
4. **If you used an `inbox/` example,** check every sample: none of its names, emails, phone numbers, addresses or business names may appear. Take the structure, never the people.
5. **Write the README** with one line per sample: its type (typical, edge case or messy) and what it tests. Exactly one sample is marked messy and exactly one is marked edge case.
6. **Show the person** the five one-line descriptions and the folder path, and suggest the next step: "Now run the simulated run in `/workflow-blueprint`."

## Approval points
- **Stop and ask before writing:** the one-line format confirmation in step 1. Default is yes.
- Nothing else needs approval: samples are fictional and stay in `sandbox/`.

## Output
Write only inside `sandbox/<workflow-name>/`. Never overwrite: if samples already exist there, number the new ones on (`sample-6` …) and add them to the README. Template: `templates/output.md`.

- `sample-1.md` … `sample-5.md`, one input each; or `sample-1.csv` … `sample-5.csv` when the input is tabular.
- **Spreadsheets:** realistic column headers, 10–20 rows per file. The messy file includes at least one bad row (a wrong date format, a blank required cell, or a duplicate).
- `README.md`:

```
# Sample data — <workflow-name>
Fictional test inputs for <workflow>. All names, emails and phone numbers are invented.

| File | Type | What it tests |
|---|---|---|
| sample-1.md | typical | <segment or request type> |
| sample-2.md | typical | … |
| sample-3.md | typical | … |
| sample-4.md | edge case | <what's missing> |
| sample-5.md | messy | <what's messy> |

## Check before you use
- **[CHECK] items:** e.g. real ones arrive as PDF
- **Assumptions:** e.g. format confirmed as one email per file
- **Needs a human decision:** e.g. whether to test with one real file on Day 2
- Nothing has been sent.
```

## Never
- Copy real personal details from an `inbox/` example. Take the structure, never the people.
- Use real business names other than the owner's own, or real people's names you recognise.
- Use an email outside `example.com`, or a phone number outside the `0400 000` range.
- Include bank, card, tax file, ABN or Medicare numbers, passwords or health details.
- Write outside `sandbox/<workflow-name>/`, or change the blueprint.
- Send, post or contact anyone.

## Edge cases
- **An attachment type it can't make** (a PDF scan, a photo, a voice message): make a text version of what it would say, and add `[CHECK: real ones arrive as <type>; test with one real file on Day 2]` to the README.
- **The input is a spreadsheet:** make CSV as above. Keep amounts and dates realistic for the business.
- **The input is a calendar or a form:** write it as a markdown file laid out like the real screen or export.
- **The blueprint's Inputs section is vague:** ask one question ("What does one of these look like when it arrives?") with a suggested answer, then carry on.
- **The `inbox/` example contains sensitive details** (health, bank, tax file numbers): don't use it at all. Say so in one line and work from the description instead.

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers. Accept the default format, use the default folder name, mark each default `[CHECK: default used in test run]` in the README, and write all six files.

Worked example: see `examples/sample-1.md`.
