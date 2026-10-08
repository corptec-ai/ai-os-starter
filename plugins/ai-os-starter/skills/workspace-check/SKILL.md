---
name: workspace-check
description: Checks the AI workspace is set up correctly (folder, Business DNA files, safety rules, workflow library, connected tools, materials) and shows a green/amber/red checklist with one fix per problem. Use for "check my setup", "is everything working", "workspace check", or before starting any workshop session.
---

# Workspace check

Give the person a one-glance health check of this workspace. **Read files only.** Don't run shell commands, don't change any file, and don't call any connected tool. Report status only; never print the contents of files.

## Checks

Work through these in order. Mark each line 🟢, 🟠 or 🔴, and give one short fix for anything not green.

1. **In the workspace folder.** Green if `CLAUDE.md` and the `business-dna/` folder both exist here. If not, show only this line, red: "Open the `my-ai-workspace` folder in the Code tab." Then stop.
2. **CLAUDE.md loads the Business DNA.** Count the `@business-dna/` lines in `CLAUDE.md`: 5 is green, 1–4 amber, 0 red ("Restore CLAUDE.md from the kit").
3. **Business DNA filled.** Check the five files in `business-dna/`.
   - Green: all five exist with no `[[FILL]]` left.
   - Amber: some `[[FILL]]` left. Name the files. "Normal before Session 2; you'll fill these on Day 1."
   - Red: a file is missing. "Restore it from the kit." (Test kit v0 has no `/business-dna-interview` yet. To try a filled one, copy `sandbox/example-business-dna/` into `business-dna/`.)
4. **Safety rules.** Read `.claude/settings.json`.
   - Green: it has a `deny` list and an `ask` list that covers `business-dna`.
   - Red: the file is missing. "Restore it from the kit, or ask a helper."
5. **Workflow library.** List the skills available in this session (the slash commands). This is test kit v0, so expect `/workspace-check` and `/meeting-to-actions`. Green if both are there; otherwise red, "Ask a helper."
6. **Your materials.** Count the files in `inbox/`, not counting `README.md`. 3 or more is green, 1–2 amber, 0 red. Fix: "Add your website copy and price list before Session 2."
7. **Connected tools.** Name any connected tools (connectors) available in this session, without calling them. If none, show amber: "Fine for now. We connect tools on Day 2."
8. **Progress.** Note which of these exist: `workflows/opportunity-map.md`, a blueprint in `workflows/`, a custom skill in `.claude/skills/` other than the two above, a `RUNBOOK.md`. Information only, no colour.

## Output

A short list, under 20 lines:

```
Workspace check — <date>
🟢 1 Workspace folder
🟠 3 Business DNA: 5 files still to fill — normal before Session 2
...
Summary: 5 green, 2 amber, 1 red. Fix the red line first.
```

Finish with the summary line. If everything is green or amber, say "You're ready to go."
