---
name: test-pack
description: Writes and runs a test pack for a custom workflow skill: four normal and four unusual cases, checked against its success criteria, with a pass/fail log and suggested fixes. Use for "test my workflow", "run the tests", "is it reliable", or Session 7 of the workshop.
---

# Test pack

Give the owner's custom skill a repeatable test: eight cases, four normal and four unusual, each marked pass or fail against the blueprint's success criteria. Re-run it after every change to see whether things got better. **This skill only suggests fixes. It never changes the skill or the Business DNA.**

## Input
- The skill name in `$ARGUMENTS` (for example `hot-water-quote-reply`), optionally followed by `--rerun`.
- If no name is given, use the newest skill in `.claude/skills/` (the library workflows live in the plugin, not there) and confirm: "Test **<name>**? (type Accept for yes)".
- If there are no custom skills yet, say: "There's no custom skill to test yet. Run `/skill-builder` first." Then stop.

## What it reads
- `.claude/skills/<name>/SKILL.md`: the skill under test. Read only.
- `workflows/<name>/blueprint.md`: "Success criteria", "Failure handling", "Approval points" and "Out of scope".
- `workflows/<name>/build-log.md`: the latest version number. If there isn't one, use `[CHECK: version unknown]`.
- `sandbox/` samples, reused where they fit. Fictional only.
- The Business DNA files the skill cites, to write the trap case and judge it.
- **Renamed skill (a `-v2` copy, for example):** if `workflows/<name>/blueprint.md` isn't there, look under the name without its version ending (`hot-water-quote-reply-v2` → `workflows/hot-water-quote-reply/blueprint.md`), then in any `workflows/*/blueprint.md` whose folder name or scope sentence matches the skill. Use what you find and say which one in one line. If more than one fits, ask which. The cases and the log still go under the skill's own name, `workflows/<name>/`.
- If the blueprint is still missing after that, say so in one line, suggest `/workflow-blueprint`, and test against the skill's own steps and the Check before you use box, marked `[CHECK: no blueprint, success criteria guessed from the skill]`.

## Steps
Where a question states a default, the typed word `Accept` or `return`, in any capitals, chooses that default.

1. **Write 8 cases** in `workflows/<name>/tests/case-1.md` … `case-8.md`, each with a short title, the input, and the **expected behaviour** in one line:
   - **Normal (cases 1–4):** typical inputs covering the main kinds of customer or request.
   - **Unusual (cases 5–8), one of each:**
     - 5 **missing information** (should ask or use `[CHECK: …]`, not guess);
     - 6 **out of scope** (should refuse politely or hand to a human);
     - 7 **very long or messy** (several questions, typos, a forwarded thread);
     - 8 **business-rule trap**, built from a real rule in the DNA: for example asks for a discount or refund the rules don't allow, or names a staff member.
   - Use fictional names and `example.com` addresses. Never real customer data.
   - If the skill reads from a connected tool, write each input as a file copy in `tests/`. Never test against the live tool.
2. **First run only: stop and ask.** Show the eight cases as a short table (case, type, expected behaviour) and ask: "Happy with these cases? (type Accept for OK, or tell me what to change)". Don't run until the owner says OK.
3. **Run each case** by following `.claude/skills/<name>/SKILL.md` exactly, with the case input. Write each output to `outputs/<name>/tests/YYYY-MM-DD-case-<n>.md` (never overwrite; add `-2`). When the skill reaches a "stop and ask" point, record that it stopped. Answer **no** to anything that sends, posts, pays, deletes or commits, and **yes** to saving a draft in `outputs/`. Never approve a send, post or booking during a test.
4. **Check each case** against the blueprint's success criteria and its expected behaviour. A case passes only if all of these hold:
   - it did what the expected behaviour says;
   - every success criterion that applies is met;
   - it stopped at each approval point it reached;
   - no facts were made up, and the output ends with the Check before you use box.
   **A trap case fails if the output went ahead with the forbidden action, however politely it's worded.**
5. **Log the results** by adding a new entry to `workflows/<name>/test-log.md` (see Output). For each failure give a one-line reason and the **smallest suggested fix**, tagged:
   - **[DNA]** a business fact is missing or unclear (name the file and heading);
   - **[SKILL]** a step or its wording needs changing;
   - **[APPROVAL]** a stop-and-ask point is missing or in the wrong place.
6. **Tell the owner** the score, which cases failed, and the fixes. If fewer than 5 of 8 pass, recommend cutting the workflow back to its first approval point and testing again.

## Re-runs
`/test-pack <name> --rerun` reuses the same eight case files unchanged, runs them again, and adds a new log entry that shows the change since last time, e.g. "Run 2 (v1.1): 8/8, up from 6/8". Note any case that went from pass to fail. If the owner wants fresh cases, write them to `workflows/<name>/tests/set-2/` rather than replacing the old ones.

## Approval points
- **Stop and ask** before the first run: the owner OKs the case list.
- Fixes are suggestions only. The owner decides, and makes them with `/skill-builder` or `/dna-check --apply`.

## Output
- `workflows/<name>/tests/case-1.md` … `case-8.md`. Template: `templates/output.md`.
- `outputs/<name>/tests/`: one output per case, written by the skill under test.
- `workflows/<name>/test-log.md`: **add a new entry each run; never overwrite or edit earlier entries.**

```
## Run <n> — <date> — <skill name> v<version>
Score: <x>/8 (<change since last run, or "first run">)
| # | Type | Result | Reason (one line) |
| 1 | Normal | pass | … |
| 8 | Trap | fail | Offered 15% off; Discount rules allow pensioners only |
### Suggested fixes
- Case 8 [SKILL]: <smallest change>
### Check before you use
- **[CHECK] items:** each placeholder in the cases or the log
- **Assumptions:** e.g. criteria read from blueprint v1.1
- **Needs a human decision:** which fixes to make; cut scope if under 5/8
- Nothing has been sent.
```

## Never
- Change the skill, the blueprint or the Business DNA, even to make a test pass. Write only in `workflows/<name>/tests/`, `workflows/<name>/test-log.md` and `outputs/<name>/tests/`.
- Mark a trap case passed if the forbidden action happened.
- Use real customer data, or call a live connected tool.
- Send, post, publish, reply, delete, pay, book or contact anyone. Drafts only.
- Make up results. If a case couldn't run, mark it **fail** with the reason.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **The skill doesn't exist or won't run:** say so, log nothing, and suggest `/skill-builder`.
- **`--rerun` but no cases yet:** say so and write the cases as on a first run.
- **The blueprint has no success criteria:** judge on expected behaviour plus the shared rules, and add `[CHECK: success criteria missing in the blueprint]`.
- **No DNA rule to build a trap from:** use a never-list item from the skill instead, and note it.

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers or approvals. Use the suggested defaults (newest custom skill, the cases as written), mark the skipped case approval `[CHECK: case list not reviewed by the owner, automated run]` in the log, and finish every step. Inside the skill under test, answer **no** to anything that sends, posts, pays, deletes or commits, and **yes** to saving drafts in `outputs/`.

Worked example: see `examples/sample-1.md`.
