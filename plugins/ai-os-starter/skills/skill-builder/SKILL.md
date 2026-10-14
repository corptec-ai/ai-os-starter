---
name: skill-builder
description: Builds a custom Claude Code skill (SKILL.md) from an approved workflow blueprint, with business rules, approval points, a drafts-only output and a "check before you use" box. Use for "build my skill", "turn this blueprint into a workflow", "make it runnable", or Session 5 of the workshop.
---

# Skill builder

Turn an approved workflow blueprint into a working skill the owner can run as `/<name>` on sample data within minutes, and improve themselves. The skill follows the same rules as every workflow in the library: **drafts only, no made-up facts, and a Check before you use box at the end.**

## Input
- A workflow name in `$ARGUMENTS` (for example `hot-water-quote-reply`). If none is given, use the newest `workflows/<name>/blueprint.md` and confirm: "Build the skill for **<name>**? (Return = yes)".
- `workflows/<name>/blueprint.md`, the approved blueprint.
- `workflows/<name>/simulation-log.md`, so the fixes found on Day 1 carry over. If it's missing, say so in one line and carry on.
- If there's no blueprint at all, say: "There's no blueprint yet. Run `/workflow-blueprint` first." Then stop.

## What it reads
- The blueprint and simulation log above. List and read files with the file tools, never a shell command.
- `business-dna/`, only to check that the files and headings the blueprint cites exist. **The new skill points to DNA by file and heading; it never copies DNA text.** That way, updating the DNA updates every skill.
- If a cited DNA file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on. The rule stays in the skill as a reference.

## Steps
1. **Check the blueprint is ready.** It needs all nine headings: Trigger, Inputs, Steps, Business rules applied, Approval points, Output, Success criteria, Out of scope, Failure handling. It needs six steps or fewer, and at least one approval point. If anything is missing, list what in plain words and ask: "Run `/workflow-blueprint` again to fix this? (Return = yes)". **Don't guess or fill gaps yourself.** Stop here.
2. **Check the name.** If `.claude/skills/<name>/` already exists, ask: "There's already a skill called <name>. Make a new version (`<name>-v2`), or update this one and show you the changes? (Return = new version)". Never overwrite silently.
3. **Write `.claude/skills/<name>/SKILL.md`** using `templates/output.md`. Keep it under 150 lines and in plain English the owner could edit.
   **Business rules go in one place only:** the "Business rules (from your DNA)" section, one line each in the form ``- `<file>.md` → <Heading>: <what it's used for, in your own words, 8 words max>``. Steps and the Never list point to that section; they never restate a rule, price, threshold or deadline.
   **Before showing it, check for copying:** search `business-dna/` (with the search tool, not a shell command) for every line of your draft that mentions a price, number, limit, policy, "never" or "always". If any run of six or more words also appears in a DNA file, replace it with the reference. Repeat until nothing matches.
   - **Frontmatter:** `name` is the blueprint name. `description` says what it does, then "Use for …" with two or three trigger phrases in the owner's own words from the blueprint's Trigger.
   - **Purpose:** two lines, ending "Drafts only. Nothing is sent."
   - **Input:** from the blueprint's Inputs, plus what to ask if nothing is given.
   - **Steps:** numbered, **one per blueprint step**, in the same order, each saying what it does, reads and produces.
   - **Rules:** each rule as "`<file>.md` → <Heading exactly as it appears in that file>", optionally with the item in brackets, e.g. "`products-services.md` → Our offers (BAS support)". Never cite a bullet or item as if it were a heading. Never paste the DNA wording.
   - **Approval points:** each blueprint approval point becomes its own explicit **"Stop and ask: …"** line in the Approval points section, one to one, saying at which step it happens. Don't merge, split or drop any, and don't write "Stop and ask" anywhere else.
   - **Output:** `outputs/<name>/YYYY-MM-DD-<short-slug>.md`, never overwrite (add `-2`), ending with the Check before you use box.
   - **Never:** the shared list (send, post, delete, pay or contact anyone; make up facts; give legal, tax, financial, medical or HR-law advice; copy personal details it doesn't need; ask for passwords or card numbers) plus the blueprint's Out of scope and "must never" items, in the skill's own words. For the DNA's own rules, point to them, e.g. "Anything in `business-rules.md` → Never say". Never copy a DNA sentence into this list. The same goes for **numbers from the DNA** anywhere in the built skill (prices, thresholds such as order sizes or dollar limits, deadlines, response times): write "the threshold in `business-rules.md` → Always check with a human", not the figure itself, so changing the DNA updates the skill. Examples and templates may sound like the business; the instructions must not restate it.
   - **When something's wrong:** from the blueprint's Failure handling (missing information, unclear input, out-of-scope input).
   - **Self-check before saving:** count the blueprint's approval points and the skill's "Stop and ask" lines; they must match. Every cited heading exists word for word in its DNA file. No sentence is copied from the DNA, including in the Never list. Fix anything that fails.
4. **Write `templates/output.md`** from the blueprint's filled example, and **`examples/sample-1.md`** with one worked input and output from the simulation log (or from the first sandbox sample if the log has none).
5. **Show it for approval.** Saving into `.claude/` opens the diff view. Explain each section in one plain line, for example "Steps: the five things it does, in the order you designed." Then **wait for the owner to accept** in the diff view. If they reject or ask for a change, make it and show it again.
6. **First run.** Ask: "Try `/<name>` now on one sandbox sample? (Return = yes, using `<sandbox file>`)". The default sample is `sandbox/<name>/sample-1.md` when it exists; otherwise the first matching sample in `sandbox/`. Suggest Manual mode so every file it writes is shown first. If `/<name>` doesn't show yet, follow the new SKILL.md directly for this run. Afterwards, check the output against each of the blueprint's Success criteria and show **pass** or **miss** for each, plus whether the Check before you use box is there.
7. **Improve.** For each miss, propose the **smallest** change, shown as a diff:
   - **A business fact** (a price, a rule, a promise): show the change to the DNA file and heading. Don't edit `business-dna/` yourself; the owner makes it, by hand or with `/dna-check --apply`.
   - **A workflow step** (order, wording, what to ask): edit the skill.
   Apply skill changes only after the owner says yes, then re-run the same sample. If a run went badly, suggest rewinding (press Esc twice, or `/rewind`) to before it.
8. **Write the build log** (see Output), then show a three-line summary: skill name, version, and pass or miss count from the latest run.

## Approval points
- **Stop and ask before the skill is saved.** The owner accepts it in the diff view. The safety rule that asks before any change in `.claude/` enforces this.
- **Stop and ask before each improvement.** Show it as a diff first. One change at a time.
- **Stop and ask before the first run.** Default is yes, on one sandbox sample only.

## Output
- `.claude/skills/<name>/SKILL.md`, `.claude/skills/<name>/templates/output.md`, `.claude/skills/<name>/examples/sample-1.md`.
- `workflows/<name>/build-log.md`. Add to it; never overwrite it. Each entry:

```
## v<version> — <date>
- Built from: blueprint <version line>
- Sections: <one line each, as explained in step 5>
### Run <n> — <sandbox file>
| Success criterion | Pass / miss | Note |
### Changes
- <what changed> · <where: skill or DNA file and heading> · <why>
### Check before you use
- **[CHECK] items:** each placeholder left in the skill or the run
- **Assumptions:** e.g. which sandbox sample was used, defaults accepted
- **Needs a human decision:** judgement steps handed to a person, DNA changes waiting for the owner
- Nothing has been sent.
```

## Never
- Copy DNA content into the skill, including its Never list. Reference the file and heading only.
- Add tools or permissions, or ask to edit `.claude/settings.json`. If the workflow needs a connected tool, write "uses <tool> once connected in Session 6" and fall back to reading files from `inbox/`.
- Remove or weaken an approval point from the blueprint, even to make a run pass.
- Write anywhere except `.claude/skills/<name>/` and `workflows/<name>/`. (The first run's draft in `outputs/<name>/` is written by the new skill, not by the skill builder.)
- Send, post, publish, delete, pay, book or contact anyone, in the skill or in a run. Drafts only.
- Make up facts, prices, policies or names. Gaps become `[CHECK: …]`.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **A step needs a judgement the AI shouldn't make** (credit decisions, hiring, clinical or health calls): write that step as "Prepare the information and **stop for a human**: <role>". Say so when you show the diff.
- **The owner wants it to send automatically:** explain that every workshop workflow is drafts only, so a person always presses send. Corptec can help set up approved sending after the workshop. Keep drafts.
- **More than six steps, or no approval point, in the blueprint:** don't build. Offer `/workflow-blueprint`.
- **A DNA heading the blueprint cites doesn't exist:** keep the reference, add `[CHECK: heading "<heading>" not found in <file>]`, and list it in the build log.
- **Saving is refused:** don't look for a way around it. Say what happened and leave the draft text in the chat.

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers or approvals. Use the suggested default at each question (newest blueprint, new `-v2` name on a clash, first run on `sandbox/<name>/sample-1.md`, or the first matching sandbox sample), mark each default `[CHECK: default used in automated run]` in the build log, and finish every step. Still never edit `.claude/settings.json`, never add permissions, and never remove an approval point.

Worked example: see `examples/sample-1.md`.
