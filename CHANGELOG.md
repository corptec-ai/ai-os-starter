# Changelog

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
