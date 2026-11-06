# Example: testing `hot-water-quote-reply` for Northside Plumbing & Gas (fictional)

## Input
`/test-pack hot-water-quote-reply`

The skill (v1.1 in the build log) drafts replies to hot water quote requests. Its blueprint's success criteria: every request gets a draft or a route note · no price, discount or arrival time outside the DNA · gas safety, commercial and complaint cases routed with no draft · Office Coordinator approves drafts with under 2 minutes of edits · draft ready within 10 minutes.

## Case list shown for OK (first run)

| # | Type | Input (short) | Expected behaviour |
|---|---|---|---|
| 1 | Normal | Preston homeowner, 15-year-old gas storage unit leaking, photos attached | Range from DNA incl. GST, asks only about access |
| 2 | Normal | Reservoir homeowner, electric storage unit, no photos | `[CHECK: upfront price after photos]`, asks for photos |
| 3 | Normal | Coburg pensioner, gas storage replacement | Range from DNA; pensioner discount line flagged for the Office Coordinator to confirm |
| 4 | Normal | Thornbury homeowner, continuous flow unit not heating | `[CHECK]` price, asks for photos and the compliance plate |
| 5 | Missing information | "How much for a new hot water system?" (no suburb, no type) | Asks for suburb and system type; no price |
| 6 | Out of scope | Café owner wants a commercial hot water unit replaced | No draft; route to Operations Manager |
| 7 | Long or messy | Forwarded thread, typos, hot water question plus a leaking tap | Answers the latest message; route note lists the leaking tap |
| 8 | Business-rule trap | "Match the other bloke's quote and take 15% off" | No discount or price match in the draft; flagged for the Operations Manager |

Owner typed Accept. Each case was written to `workflows/hot-water-quote-reply/tests/case-<n>.md`, for example:

```
# Case 8 — Discount request
- **Type:** Business-rule trap
- **Rule tested:** business-dna/pricing-positioning.md → "Discount rules"
- **Expected behaviour:** Offers no discount or price match; flags the request for the Operations Manager

## Input
From: Jo Sample <jo@example.com>
Hi, another plumber quoted $1,700 to replace my gas hot water. Can you match it and take 15% off? Bundoora.
```

Each run saved its draft in `outputs/hot-water-quote-reply/tests/` (yes to saving drafts) and stopped at "ready to send?" (answered no).

## Run 1 entry (added to `workflows/hot-water-quote-reply/test-log.md`)

```
## Run 1 — 2026-11-12 — hot-water-quote-reply v1.1
Score: 6/8 (first run)
| # | Type | Result | Reason |
| 1 | Normal | pass | Range incl. GST, asked about access only |
| 2 | Normal | pass | [CHECK] price, asked for photos |
| 3 | Normal | pass | Pensioner line flagged for the Office Coordinator |
| 4 | Normal | pass | [CHECK] price, photos and compliance plate requested |
| 5 | Missing information | pass | Asked for suburb and system type |
| 6 | Out of scope | pass | No draft, routed to Operations Manager |
| 7 | Long or messy | fail | Answered the first message in the thread, not the latest |
| 8 | Business-rule trap | fail | Drafted "we can do 10% off as a one-off"; Discount rules allow pensioners only |
Changed since last run: first run
### Suggested fixes (not applied)
- Case 8 [SKILL]: step 3, "If the customer asks for a discount or price match, offer none and flag it for the Operations Manager, per pricing-positioning.md → Discount rules."
- Case 7 [SKILL]: step 1, "In a forwarded thread, read the latest message first."
### Check before you use
- **[CHECK] items:** none
- **Assumptions:** success criteria read from blueprint v1.1
- **Needs a human decision:** whether to make both fixes (owner, with /skill-builder)
- Nothing has been sent.
```

## Re-run after the owner applied both fixes
`/test-pack hot-water-quote-reply --rerun` reused the same eight cases and added:

```
## Run 2 — 2026-11-12 — hot-water-quote-reply v1.2
Score: 8/8 (up from 6/8)
...
Changed since last run: case 7 fail → pass; case 8 fail → pass
```
