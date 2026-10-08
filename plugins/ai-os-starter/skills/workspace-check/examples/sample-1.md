# Example: a half-done workspace on the morning of Day 1 (fictional)

## What's in the folder
(The check sees this by listing and reading files. None of it is printed.)
- `CLAUDE.md` with all five `@business-dna/…` lines.
- `business-dna/`: all five files. `brand-voice.md` and `pricing-positioning.md` are filled; the other three still have `[[FILL]]`. `products-services.md` has only 2 lines of real content.
- `.claude/settings.json`: a `deny` list with `rm` and `sudo`, an `ask` rule covering `business-dna/`, but nothing about sending.
- Skills available: `ai-os-starter:meeting-to-actions`, `ai-os-starter:email-reply-drafter`, `enquiry-triage`, `ai-os-starter:proposal-drafter`, `ai-os-starter:social-post-writer`, `ai-os-starter:weekly-business-brief`, `ai-os-starter:sop-writer` (7 of the 10; three are missing).
- `inbox/`: `README.md`, `website.txt`, `price-list.pdf`.
- No connected tools.
- `workflows/`: only `README.md`.

## Input
`/workspace-check`

## Output (on screen)

```
Workspace check — 2026-11-11
🟢 1 Kit folder
🟢 2 CLAUDE.md loads all 5 DNA files
🟠 3 Business DNA: 3 of 5 files still have [[FILL]]; products-services looks thin — normal before Session 2
🟢 4 Safety file: deletes blocked, Business DNA changes ask first (send rules are added when you connect tools in Session 6)
🟠 5 Workflow library: 7 of 10 ready, 3 missing — ask a helper to reinstall ai-os-starter
🟠 6 Materials: 2 files in inbox — add a couple of quotes and customer emails
🟠 7 Connected tools: none yet — fine for now, we connect tools in Session 6
–  8 Progress: opportunity map – · blueprint – · skill – · runbook –
Summary: 3 green, 4 amber, 0 red. You're ready to go.
```

## Notes on this example
- `enquiry-triage` counted even without the `ai-os-starter:` prefix.
- `inbox/README.md` wasn't counted as a material.
- No file was changed, no shell command was run and no connected tool was called. Without `--save`, nothing was written.
