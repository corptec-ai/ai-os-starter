---
name: workspace-check
description: Checks the AI workspace is set up correctly (folder, Business DNA files, safety rules, workflow library, connected tools, materials) and shows a green/amber/red checklist with fixes. Use for "check my setup", "is everything working", "workspace check", or before starting any workshop session.
---

# Workspace check

A one-glance health check of this workspace: green, amber or red per line, with the one action that fixes each problem. Helpers on the floor use it to triage in seconds. **Read files only.** No shell commands, no changes to any file, no calls to connected tools, and never print what's inside a file. Report status only.

## Input
- None. It reads the current folder.
- Optional `--save`: also write the checklist to `outputs/workspace-check/YYYY-MM-DD.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. This is the only file it ever writes.

## How to check
- Use only file reading and file listing (Read, Glob, Grep). **No shell commands,** so the check never triggers a permission prompt.
- Look for files and count lines or markers. Don't quote file contents in the result.

## Checks
Work through these in order. Mark each line 🟢, 🟠 or 🔴 (line 8 is information only), with at most one short fix per line.

1. **In the kit folder.** 🟢 `CLAUDE.md` and the `business-dna/` folder both exist here.
   - 🔴 Otherwise. Show **only this line**: "Open the `my-ai-workspace` folder in the Code tab." Then stop.
2. **CLAUDE.md loads the Business DNA.** Count the five `@business-dna/<file>.md` lines.
   - 🟢 all 5 · 🟠 1–4 (name the missing ones) · 🔴 none: "Restore CLAUDE.md from the kit."
3. **Business DNA filled.** The five files: `brand-voice.md`, `ideal-customers.md`, `products-services.md`, `pricing-positioning.md`, `business-rules.md`.
   - 🟢 all five exist with no `[[FILL]]` left.
   - 🟠 some `[[FILL]]` left: say how many files. Also 🟠 "looks thin" for a file with under 5 lines of real content (not counting headings and `[[FILL]]`).
   - 🔴 a file is missing: "Run `/business-dna-interview`."
4. **Safety file.** Read `.claude/settings.json`.
   - 🟢 it has a `deny` list that blocks deleting (e.g. `rm`) and an `ask` list that covers `business-dna`. If it also has deny rules naming connected tools (full names starting `mcp__`), say "connected tools locked". If not, and no tools are connected (line 7), add "(send rules are added when you connect tools in Session 6)" and stay green.
   - 🟠 tools are connected (line 7) but none of their tools appear in `deny`: "Connected tools aren't locked yet: run `/lock-the-doors`."
   - 🟠 present but no delete rule, or no `ask` rule covering `business-dna`: "Ask a helper to restore the safety file from the kit."
   - 🔴 missing: "Restore it from the kit; ask a helper."
5. **Workflow library.** Check the skills available in this session for the ten ready-made workflows: `meeting-to-actions`, `email-reply-drafter`, `enquiry-triage`, `proposal-drafter`, `social-post-writer`, `weekly-business-brief`, `sop-writer`, `review-responder`, `job-ad-writer`, `invoice-follow-up`. Count each one whether or not it has the `ai-os-starter:` prefix.
   - 🟢 all 10 · 🟠 some missing (say how many) · 🔴 none: "Click + → Plugins → install ai-os-starter."
6. **Your materials.** Count the files in `inbox/`, not counting `README.md`.
   - 🟢 3 or more · 🟠 1–2 · 🔴 empty: "Add your website copy and price list before Session 2."
7. **Connected tools.** Name the connected tools (connectors) available in this session, by name only. **Don't call them.**
   - 🟢 one or more: list their names. (Whether they're locked is reported on line 4.)
   - 🟠 none: "Fine for now. We connect tools in Session 6."
   - 🔴 none, and the person has said they've finished Session 6: "Ask a helper to connect your email or calendar."
8. **Workflow progress** (information only, no colour). Say which of these exist:
   - opportunity map: `workflows/opportunity-map.md`;
   - blueprint: any `workflows/*/blueprint.md`;
   - skill: a folder in `.claude/skills/` with a `SKILL.md`;
   - runbook: any `workflows/*/RUNBOOK.md`.

## Output
On screen only, **under 25 lines**, finishing with the summary line. **Before writing the summary, count the 🟢, 🟠 and 🔴 lines you've just written** (line 8 has no colour) and use those exact counts:

```
Workspace check — <date>
🟢 1 Kit folder
🟢 2 CLAUDE.md loads all 5 DNA files
🟠 3 Business DNA: 3 of 5 files still have [[FILL]] — normal before Session 2
🟢 4 Safety file: deletes blocked, Business DNA changes ask first (send rules are added when you connect tools in Session 6)
🟢 5 Workflow library: all 10 workflows ready
🔴 6 Materials: inbox is empty — add your website copy and price list
🟠 7 Connected tools: none yet — fine for now, we connect tools in Session 6
–  8 Progress: opportunity map ✓ · blueprint – · skill – · runbook –
Summary: 4 green, 2 amber, 1 red. Fix the red first.
```

- If nothing is red, finish with "You're ready to go."
- With `--save`, write the same lines to the file and say where it went.
- There's no Check before you use box here: this is a status screen, not a draft.

## Never
- Change any file, even to fix something. Tell the person what to do instead. (`--save` is the one exception, and it writes only to `outputs/workspace-check/`.)
- Print the contents of `settings.json`, the DNA files or `inbox/` files. Report status only.
- Call a connected tool, or run a shell command.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Run outside the kit folder:** return only check 1 as red, with the fix.
- **DNA files exist but are near-empty** (under 5 lines of real content): amber, "looks thin".
- **`settings.json` can't be read** (it isn't valid): treat it as missing, red.
- **Extra skills installed** beyond the ten: ignore them on line 5; a custom skill in `.claude/skills/` shows on line 8.
- **The person asks you to fix a red line:** say what to do; don't do it yourself.

Worked example: see `examples/sample-1.md`.
