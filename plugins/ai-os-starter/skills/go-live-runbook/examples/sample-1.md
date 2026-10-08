# Example: runbook for `hot-water-quote-reply` at Northside Plumbing & Gas (fictional)

## Input
`/go-live-runbook hot-water-quote-reply`

Pre-filled from the files: blueprint v1.1 (four approval points), build log v1.2, test log run 2 = 8/8 on 12 Nov. `business-rules.md` → "Escalation contacts by role" lists the Operations Manager and Office Coordinator.

## Questions asked (one at a time, defaults in brackets)
1. Who owns this workflow? → "Office Coordinator"
2. Who covers when they're away? → "Operations Manager" (default accepted)
3. When does it run? → "On demand" (default accepted)
4. Hours a week spent on hot water quote replies today? → "About 5"
5. Expected hours after? → "2"
6. 30-day check date? → 12 Dec 2026 (default accepted)

## Output (written to `workflows/hot-water-quote-reply/RUNBOOK.md` after the owner said yes)

```
# Runbook — Hot water quote reply
**Status: LIVE** · Version 1.2 · 12 Nov 2026

## What it does
Reads hot water quote requests and drafts a reply with the price range and what we still need.
Saves the Office Coordinator time on routine quotes. Drafts only; nothing is sent.

## Owner and backup
- Owner: Office Coordinator
- Backup: Operations Manager

## How to run it
- Command: `/hot-water-quote-reply inbox/hot-water/<file>` in the Code tab of this workspace.
- Inputs come from: website form and office inbox requests saved to `inbox/hot-water/` (office inbox once connected).
- When: on demand, each morning and after lunch.

## Approval steps
1. Gas smell or gas leak: no draft; a licensed gasfitter decides the same day.
2. Commercial jobs and complaints: no draft; the Operations Manager decides.
3. Pensioner discount: the Office Coordinator confirms pensioner status before the line stays in.
4. Office Coordinator reads and approves every draft before it goes to a customer.

## Weekly check
1. Read two drafts in full. Would you have sent them as they are?
2. Any `[CHECK]` items left unresolved?
3. Anything sent without approval? (Should be none.)

## When it goes wrong
- Rewind: press Esc twice (or `/rewind`) to go back to before the run.
- Tell: Operations Manager.
- Switch it off: rename `.claude/skills/hot-water-quote-reply` to `hot-water-quote-reply-off`.

## What it must never do
- Send, book or promise an arrival time.
- Offer a discount or price match outside the Discount rules.
- Quote commercial, out-of-area or new-build jobs, or answer gas safety questions.

## Measure
- Baseline: 5 hours a week today.
- Expected: 2 hours a week after (expected, not yet measured).
- Quality: no price, discount or arrival time outside the DNA, checked weekly.
- 30-day check: 12 Dec 2026.

## Test status
8/8 on 12 Nov 2026 (run 2, up from 6/8). LIVE.

## Change log
- 12 Nov v1.1: next step uses the response-time promise.
- 12 Nov v1.2: discount requests are flagged for the Operations Manager; forwarded threads answer the latest message.
- 12 Nov: Runbook written.

**Check before you use** · **[CHECK] items:** none · **Assumptions:** hours are the owner's estimate · **Needs a human decision:** keep or change at the 30-day check · Nothing has been sent.
```

## If the latest test had been 6/8
The status line would read: **Status: PILOT** (6/8 on 12 Nov; trap case failed, needs 7/8 to go live), and Test status would say the same.
