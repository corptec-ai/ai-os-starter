# Changelog

## 0.5.1 (workshop fixes)
- Fixes from the 2 Nov dry run and the workshop run sheet.
- Workspace `CLAUDE.md`: no more sample offer in the Business DNA section; says plainly that Claude can list and read the files in this folder; flags any irreversible action first.
- `business-dna-interview`: the closing summary now asks you to open each of the five files and check them.
- `workspace-check`: sample-business content no longer counts as filled. An empty `kickoff-notes.md` doesn't count as material.
- `opportunity-mapper`: real words in the scope sentence, aim for 10 scored tasks, one optional question on your role.
- `workflow-blueprint`: checks for Plan mode first and asks through the question box. `sample-data-maker`: offers fixes in a question box.
- `test-pack`: finds the blueprint for a renamed skill, such as a `-v2` copy. `go-live-runbook`: offers `sandbox/sample-emails.md` when there's no real item.
- Workspace template: ships an empty `inbox/kickoff-notes.md`.
- Pressing the key on a blank message does nothing in the desktop app, so eleven guides now ask you to type: `Accept` (or `return`) takes the stated default, and `skip` carries on without an answer. Questions that write default to no: only an explicit yes writes.
- New fallback install: `dist/ai-os-starter-plugin.zip`, built by `scripts/build-plugin-zip.sh` and checked on every pull request.

## 0.5.0 (library hardening)
- All ten ready-made workflows hardened with 80 new test cases (normal, messy, sensitive, edge and adversarial; 8 per workflow) run 3 times each and graded against each workflow's rules. Final: every workflow at 22/24 or better, with no Never-list breaches.
- Fixes include: never repeating a child's name or medical details (proposal-drafter); holding replies that name the documented decision-maker and never claim an email was passed on (email-reply-drafter); stop-and-ask only when the Business DNA doesn't settle a safety or order question, with verb-first steps (sop-writer); no unsupported claims and DNA-aware client confidentiality (social-post-writer); no figures nobody stated, and only assigned actions (meeting-to-actions); no invented deadlines (weekly-business-brief); red-flag leads only in the red-flag section (enquiry-triage); a stop means stop (invoice-follow-up); each specific concern addressed and no personal details (review-responder).
- Test sets and results live in the workshop's kit-tests/hardening folder.
- Licensed under MIT (LICENSE at the repo root and inside the plugin).

## 0.4.0 (connector lock)
- New guide `lock-the-doors` (Session 6): finds the send, reply, post, delete and pay actions of each connected tool and, after approval, adds exact "never" rules (and "ask first" rules for drafts) to `.claude/settings.json`, then shows how to test the lock. Found in the 14 Oct dry run: connector send actions default to Ask in the app, and the starter safety file had no connector rules.
- `workspace-check`: line 4 turns amber when tools are connected but not locked, pointing to `/lock-the-doors`.
- Plugin version now matches the release (0.3.1 shipped with the manifest still at 0.3.0).

## 0.3.1 (kit guide)
- Workspace template: `START-HERE.html`, the take-home kit guide (the ten workflows, and building your next one at home).
- `skill-builder`: "Manual mode" wording, matching the app's mode menu.

## 0.3.0 (workshop kit)
- Nine workshop guides: workspace-check (full), business-dna-interview, dna-check, opportunity-mapper, workflow-blueprint, sample-data-maker, skill-builder, test-pack, go-live-runbook.
- Workspace template: use file tools only (no shell commands, no surprise permission prompts); example blueprint in the sandbox.
- Opportunity mapper shows Eliminate tasks scored with the reason; skill builder references Business DNA (text, prices, thresholds) instead of copying it and maps every approval point to a stop-and-ask; interview handles a business that isn't trading yet.
- Tested on three fictional businesses: library 33/33; guides chain Sessions 2–8 passing.

## 0.2.1 (tested)
- All ten workflows pass the kit test suite on three sample businesses (trades, services, hospitality).
- enquiry-triage: a red flag overrides the grade and sits in its own section.
- job-ad-writer: one ad per role when the notes cover several; per-role language check and unpaid-trial flag.
- proposal-drafter: shows totals as plain arithmetic on listed prices; applies discounts the owner's rules allow and names them; only states deposit rules that apply.
- sop-writer: every step starts with a verb; implied safety, security and compliance steps are flagged for an adviser.
- weekly-business-brief: stays under 60 lines; personal items never described.

## 0.2.0 (library draft)
- Nine new workflows: email-reply-drafter, enquiry-triage, proposal-drafter, social-post-writer, weekly-business-brief, sop-writer, review-responder, job-ad-writer, invoice-follow-up. Each has a template and a worked example.
- Consistent "Check before you use" box and HUMAN FIRST wording across all workflows.
- Sandbox: full Northside Plumbing & Gas sample set for every workflow; example Business DNA adds rules on naming people in public.

## 0.1.0 (test kit v0)
- Plugin `ai-os-starter` with `workspace-check` and `meeting-to-actions`.
- Workspace template `my-ai-workspace` with Business DNA templates, safety rules and sample data.
