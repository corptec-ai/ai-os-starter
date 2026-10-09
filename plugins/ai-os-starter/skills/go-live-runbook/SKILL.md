---
name: go-live-runbook
description: Writes a go-live runbook for a custom AI workflow: purpose, owner, schedule, inputs, approval steps, weekly checks, how to switch it off, and a 30-day success measure. Use for "write the runbook", "document this workflow", "go live", or Session 8 of the workshop.
---

# Go-live runbook

Write the one page that turns the custom workflow into a business system rather than a workshop demo: what it does, who owns it, when it runs, how to check it, how to stop it, and how you'll know in 30 days whether it was worth it. **One page, under 70 lines.**

## Input
- The skill name in `$ARGUMENTS` (for example `hot-water-quote-reply`). If none is given, use the newest custom skill in `.claude/skills/` and confirm: "Write the runbook for **<name>**? (Return = yes)".
- If there's no blueprint or skill for that name, say so and suggest `/workflow-blueprint` or `/skill-builder`. Then stop.

## What it reads
- `workflows/<name>/blueprint.md`: Trigger, Inputs, Approval points, Out of scope, Success criteria.
- `.claude/skills/<name>/SKILL.md`: the command, inputs and never list. Read only.
- `workflows/<name>/test-log.md`: the **latest** run's score.
- `workflows/<name>/build-log.md`: version and changes.
- `business-dna/business-rules.md` → "Escalation contacts by role", for who to tell. Roles only.
- Anything missing becomes `[CHECK: …]`. Never stop with an error.

## Steps
1. **Pre-fill** everything you can from the files above.
2. **Ask at most six questions, one at a time,** each with a default the owner can accept with Return. Skip any the files already answer.
   1. Who owns this workflow? (a role, e.g. "Office Coordinator")
   2. Who covers when they're away? (a role)
   3. When does it run? (default: on demand; or daily, weekly)
   4. Hours a week spent on this task today?
   5. Expected hours a week after? (default: from the blueprint's success criteria, if stated)
   6. When's the 30-day check? (default: 30 days from today)
   If someone gives a person's name, phone or email, use their role instead.
3. **Set the status:**
   - No test log: **PILOT**, with this line at the very top: "Not yet tested: run `/test-pack <name>` before relying on it."
   - Latest score under 7/8: **PILOT**, and say why (e.g. "6/8 on 12 Nov; the trap case failed").
   - Latest score 7/8 or 8/8: **LIVE**.
   Use the latest run in the log, not the best one.
4. **Draft the runbook** with exactly these ten headings, in this order (template: `templates/output.md`):
   - **What it does**: two lines.
   - **Owner and backup**: roles only.
   - **How to run it**: the exact command (`/<name> <input>`) or button, and where the inputs come from.
   - **Approval steps**: every approval point from the blueprint, in order, with who approves.
   - **Weekly check**: three checks, e.g. read two outputs in full; any `[CHECK]` items left unresolved; anything sent without approval (should be none).
   - **When it goes wrong**: rewind (press Esc twice, or `/rewind`); who to tell, by role; and **how to switch it off**: rename the skill folder `.claude/skills/<name>` to `<name>-off`, or remove the connector it uses.
   - **What it must never do**: from the skill's never list and the blueprint's Out of scope.
   - **Measure**: baseline hours today, **expected** hours after, the 30-day check date, and one quality measure from the success criteria.
   - **Test status**: the latest score and date from `test-log.md`, and PILOT or LIVE.
   - **Change log**: from the build log, plus today's line "Runbook written".
   End with the short Check before you use block (bold labels, not a heading).
5. **Stop and ask.** Show the draft and ask: "Happy for me to save this? (Return = yes, or tell me what to change)". Apply edits, show the changed lines, and ask again.
6. **Write `workflows/<name>/RUNBOOK.md`**, then tell the owner the status (PILOT or LIVE) and the 30-day check date.

## Approval points
- **Stop and ask** before the file is written. The owner confirms the draft.
- If `RUNBOOK.md` already exists, **stop and ask** before changing it: show the differences and add a Change log line. Never overwrite silently.

## Output
`workflows/<name>/RUNBOOK.md`, one page, **under 70 lines**, with the ten headings above and nothing else as a heading.

## Never
- Put personal phone numbers or email addresses in the runbook. Use roles.
- State savings as fact. Label hours "expected" until the 30-day check is done.
- Mark it LIVE if the latest test result is under 7/8, or if there's no test log.
- Add steps, approval points or promises that aren't in the blueprint or the skill.
- Change the skill, the blueprint, the logs or the Business DNA. Write only `workflows/<name>/RUNBOOK.md`.
- Send, post, publish, delete, pay, book or contact anyone. Ask for or store passwords, API keys or card numbers.

## Edge cases
- **The workflow runs on a schedule:** add to "How to run it" that a schedule needs a paid Claude plan with scheduled tasks `[CHECK: confirm which plan with your Corptec contact]`, and that desktop schedules only run while the laptop is awake and the Claude app is open.
- **It uses a connected tool:** name the tool in "How to run it", and make removing that connector one of the switch-off options.
- **No build log:** write "v1, not recorded" in the Change log with `[CHECK: version]`.
- **The owner can't give hours:** use `[CHECK: hours a week today]`; the measure still needs a date.

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers or approvals. Use the suggested defaults (owner "Business owner", backup "Operations Manager" or the first role in "Escalation contacts by role", on demand, hours `[CHECK]`, 30 days from today), mark each `[CHECK: default used in automated run]`, apply the status rules exactly, and write the file.

Worked example: see `examples/sample-1.md`.
