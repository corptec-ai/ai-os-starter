---
name: workflow-blueprint
description: Designs an AI workflow blueprint from a scope sentence (steps, inputs, outputs, business rules, approval points and success criteria), then simulates it against sample data without building anything. Use for "design my workflow", "blueprint this", "map the steps", or Session 4 of the workshop.
---

# Workflow blueprint

Turn the owner's scope sentence into a blueprint precise enough that `/skill-builder` can make a working skill from it the next morning. Then walk it against sample data and find the gaps **before** anything is built. **This designs only. It builds nothing and sends nothing.**

It's designed to run in **Plan mode**. If you're not in Plan mode, say once: "This works best in Plan mode. Press Shift+Tab until you see 'plan mode', then ask again." If they carry on anyway, present the draft in the chat and ask for approval before writing.

## Input
- The scope sentence in `$ARGUMENTS`, or a workflow name.
- Otherwise, **The pick** from the newest `workflows/opportunity-map*.md`.
- If neither exists, ask: "What's the workflow? Finish this sentence: When ___ arrives, produce ___, and I approve it before ___."

## What it reads
- All five Business DNA files. Cite the file and heading for every rule you use, e.g. `business-rules.md → Always check with a human`. Never paste DNA text into the blueprint.
- Sample inputs in `sandbox/<name>/` for the simulated run. If there are none, suggest `/sample-data-maker <name>` first. If they'd rather not, use the closest matching items in `sandbox/` (up to five) and say which.
- If a DNA file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders.

## Steps
1. **Check the scope.** Run the scope test: one trigger, one main output, six steps or fewer, a human approves before anything leaves the business, input available by Day 2. If it does too much, say so and cut it back to its first approval point before drafting.
2. **Name it.** Propose a short kebab-case name, e.g. `hot-water-quote-reply`. It becomes the folder and, later, the skill name.
3. **Interview: six questions at most, one at a time,** each with a suggested answer from the DNA they can accept with Return:
   1. What exactly arrives, and where? (email, form, file, calendar)
   2. What does a good output look like? (ask for an example if they have one)
   3. Which DNA rules matter most here?
   4. What does a human check, and who? (a role, not a name)
   5. What must never happen?
   6. How will you know it worked? (time, accuracy, response speed)
4. **Draft the blueprint** with exactly these nine headings, in this order:
   - **Trigger**
   - **Inputs**
   - **Steps:** numbered, **six or fewer**, each with *Does / Reads / Produces*
   - **Business rules applied:** each rule cites the DNA file and heading
   - **Approval points:** every step that leaves the business, changes money or commits to a date, referenced by step number
   - **Output:** the format, plus a filled example
   - **Success criteria:** 3–5 checkable items (a number, a yes/no, or a time)
   - **Out of scope**
   - **Failure handling:** missing information, unclear input, out-of-scope input
5. **Present it as the plan.** The owner edits it (Ctrl+G or the plan pane) and approves it. Show their edits back in one line ("You changed: …"). Then write `blueprint.md` as v1.0.
6. **Simulated run.** For each sample, walk every step in words: what it reads, what it produces, and where it stalls. Flag the messy sample and anything that would hit an approval point or a "Never" rule. **Build nothing and write no outputs except the log.**
7. **Fix the gaps.** List each gap with a proposed fix. The owner accepts or rejects each one, one at a time. Apply the accepted fixes to the blueprint, bump the version line, and record each fix in the log. Then show a 3-line summary and both file paths.

## Approval points
- **Stop and ask before writing the blueprint:** plan approval (in Plan mode, the approve button; otherwise "Happy with this plan? I'll save it.").
- **Stop and ask before each gap fix:** "Apply this fix? (yes / no / edit)". Default is yes.
- Inside the blueprint: an approval point must sit **right before** any step whose output leaves the business (send, email, post, reply to a customer), changes money, or commits to a date.

## Output
Write only inside `workflows/<name>/`. Never overwrite: if the folder already has a blueprint, ask whether to save the new one as `<name>-2`. Template: `templates/output.md`.

`workflows/<name>/blueprint.md`:
```
# Blueprint — <name>
Version: v1.1 · <date> · simulated against <n> samples
Scope sentence: When ___ arrives, produce ___, and I approve it before ___.

## Trigger
## Inputs
## Steps
1. **<step name>**
   - Does: …
   - Reads: …
   - Produces: …
## Business rules applied
- <rule in plain words> (`business-rules.md → Never say`)
## Approval points
- Before step <n> (<what leaves the business>): <role> approves.
## Output
## Success criteria
## Out of scope
## Failure handling
## Check before you use
- **[CHECK] items:** …
- **Assumptions:** …
- **Needs a human decision:** …
- Nothing has been sent.
```

`workflows/<name>/simulation-log.md`: one section per sample with its type (typical, edge case or messy), the step-by-step trace (read → produced, or STALLED and why), and the fix applied (or "none"). End with the gap list (accepted or rejected) and the version change.

## Never
- More than six steps. If it needs more, split it and record part 2 under Out of scope.
- A step that sends, posts, pays or books without an approval point right before it.
- Write a SKILL.md, or anything in `.claude/`. That's `/skill-builder`'s job.
- Simulate against real customer data on Day 1. Sandbox samples only.
- Write anything outside `workflows/<name>/`.
- Invent rules, prices, people or deadlines. Gaps become `[CHECK: …]`.
- Give legal, tax, financial or HR-law advice in a rule. Flag it: "Have your adviser check this."

## Edge cases
- **The scope sentence fails the scope test:** say which item fails, propose a cut-down version, and draft only once it passes.
- **The input arrives through a tool they haven't connected yet:** design for a file in `inbox/` now and add "connect <tool> in Session 6" to Inputs.
- **The owner can't describe a good output:** draft two short options and let them pick.
- **A step needs judgement the AI shouldn't make** (safety, refunds, credit, hiring): make it "prepare the information and stop for <role>".
- **Blueprint exists marked "not yet simulated":** go straight to the simulated run step; don't create a `-2` copy.
- **No samples at all:** run the simulation on one sample you describe in words, mark the log `[CHECK: simulated without sandbox samples]`, and suggest `/sample-data-maker`.

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers. Use the scope sentence given and the suggested default for every interview question, treat the plan as approved, accept every proposed gap fix, mark each default `[CHECK: default used in test run]`, and write both files.

Worked example: see `examples/sample-1.md`.
