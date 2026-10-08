# Runbook — <workflow name>
<If no test log: "Not yet tested: run `/test-pack <name>` before relying on it.">
**Status: LIVE | PILOT** (<if PILOT, why: e.g. "6/8 on 12 Nov; trap case failed">) · Version <v> · <date>

## What it does
<Line 1: what arrives and what it drafts.>
<Line 2: who it helps. Drafts only; nothing is sent.>

## Owner and backup
- Owner: <role>
- Backup: <role>

## How to run it
- Command: `/<name> <input>` in the Code tab of this workspace.
- Inputs come from: <`inbox/` files, or <tool> once connected>.
- When: <on demand | daily | weekly> <if scheduled: plan needed, laptop awake and app open>

## Approval steps
1. <Approval point 1>: <role> approves before <what>.
2. <Approval point 2>: <role> approves before <what>.

## Weekly check
1. Read two outputs in full. Would you have sent them as they are?
2. Any `[CHECK]` items left unresolved?
3. Anything sent without approval? (Should be none.)

## When it goes wrong
- Rewind: press Esc twice (or `/rewind`) to go back to before the run.
- Tell: <role>.
- Switch it off: rename `.claude/skills/<name>` to `<name>-off` <or remove the <tool> connector>.

## What it must never do
- <From the skill's never list>
- <From the blueprint's Out of scope>

## Measure
- Baseline: <n> hours a week today.
- Expected: <n> hours a week after (expected, not yet measured).
- Quality: <one measure from the success criteria>.
- 30-day check: <date>.

## Test status
<x>/8 on <date> (run <n>). <LIVE | PILOT, and why>.

## Change log
- <date> v<x>: <change, from the build log>
- <date>: Runbook written.

**Check before you use** · **[CHECK] items:** <each> · **Assumptions:** <e.g. hours as estimated by owner> · **Needs a human decision:** <e.g. go live after 30-day check> · Nothing has been sent.
