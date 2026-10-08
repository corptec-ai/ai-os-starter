# Example: building `hot-water-quote-reply` for Northside Plumbing & Gas (fictional)

## Input
`/skill-builder hot-water-quote-reply`

The blueprint (`workflows/hot-water-quote-reply/blueprint.md`, v1.1 · 11 Nov · simulated against 5 samples) has all nine headings. In short:
- **Trigger:** a homeowner asks for a price to replace or install a hot water system, through the website form or the office inbox ("how much for a new hot water system", "can you quote a replacement").
- **Steps (6):** 1 read the request · 2 check fit and safety · 3 match the offer and price range · 4 list what we still need · 5 draft the reply · 6 check and hand over for approval.
- **Business rules applied:** `products-services.md` → Our offers (Hot water replacement); `pricing-positioning.md` → Pricing basis per offer, Rates or ranges we're happy to state, Discount rules; `ideal-customers.md` → Who we are not for, Red flags in an enquiry; `business-rules.md` → Never say, Always check with a human, Response-time promises; `brand-voice.md` → How we sound, Words we avoid, Spelling and format rules.
- **Approval points (4):** before any reply goes to a customer (Office Coordinator); gas safety words stop the run (licensed gasfitter); commercial jobs and complaints (Operations Manager); a pensioner discount line (Office Coordinator confirms).
- **Success criteria (5):** every request gets a draft or a route note · no price, discount or arrival time outside the DNA · gas safety, commercial and complaint cases routed with no draft · Office Coordinator approves 4 of 5 drafts with under 2 minutes of edits · draft ready within 10 minutes.
- **Simulation log fixes carried over:** a missing suburb is asked for in step 4 rather than stopping step 2; the route note lists every request in the email.

## What the builder did
1. Checked the blueprint: nine headings, six steps, four approval points. Ready.
2. No existing skill with that name.
3. Wrote `.claude/skills/hot-water-quote-reply/SKILL.md` (92 lines), `templates/output.md` and `examples/sample-1.md`. Self-check before saving: 4 approval points in the blueprint, 4 "Stop and ask" lines in the skill, match; every cited heading found in the DNA; no DNA sentence copied, so the Never list says "Anything in `business-rules.md` → Never say" rather than repeating it.
4. Showed the diff and explained it:
   - **Description:** picks up "how much for a new hot water system" and "can you quote a replacement", in your words.
   - **Input:** a request file from `inbox/hot-water/`; your office inbox once it's connected in Session 6.
   - **Steps:** your six steps, in the order you designed.
   - **Rules:** points to your offers, prices, red flags, response times and voice. It doesn't copy them, so changing your DNA changes the skill.
   - **Approval points:** four "stop and ask" lines: before any reply, gas safety, commercial jobs and complaints, and the pensioner discount.
   - **Output:** a draft reply file in `outputs/hot-water-quote-reply/`, ending with the Check box.
   - **Never and When something's wrong:** the drafts-only rules plus your out-of-scope list.
   The owner accepted in the diff view.

## Extract from the generated SKILL.md
```
## Steps
3. **Match the offer and price range.** Does: matches the request to Hot water replacement
   and gives the typical range only where the DNA states one.
   Reads: `products-services.md` → Our offers (Hot water replacement);
   `pricing-positioning.md` → Pricing basis per offer, Rates or ranges we're happy to state.
   Produces: the offer, the price line (including GST), or `[CHECK: upfront price after photos]`.
...
## Approval points
- **Stop and ask** (approval point 1, step 6) before treating any reply as ready to send:
  "Office Coordinator to check this draft before it goes to <customer>?" Default is no.
- **Stop and ask** (approval point 2, step 2) if the request mentions a gas smell or gas leak: write
  no draft and route to a licensed gasfitter, per `business-rules.md` → Always check with a human (gas safety).
- **Stop and ask** (approval point 3, step 2) for commercial jobs and complaints: no draft; route to
  the Operations Manager, per `business-rules.md` → Always check with a human.
- **Stop and ask** (approval point 4, step 5) before adding a pensioner discount line: "Office
  Coordinator to confirm the discount?" per `pricing-positioning.md` → Discount rules. Default is no.
...
## Never
- Anything in `business-rules.md` → Never say, or `business-rules.md` → Never do.
- Quote a price the DNA doesn't state, or answer anything about a gas smell.
```

## First run
Default sample accepted: `/hot-water-quote-reply sandbox/hot-water-quote-reply/sample-1.md` (gas storage, Preston, photos attached), in Ask-permissions mode. The new skill wrote its draft to `outputs/hot-water-quote-reply/2026-11-12-preston-<first-name>.md`.

| Success criterion | Result | Note |
|---|---|---|
| Draft or route note for the request | pass | Draft written, fit "go" |
| No price, discount or arrival time outside the DNA | pass | Used the stated gas storage range, including GST |
| Gas safety, commercial and complaints routed | pass | None in this sample; correctly not routed |
| Approved with under 2 minutes of edits | miss | Ended "we'll be in touch soon", not the 2-business-day promise |
| Draft ready within 10 minutes | pass | |

Check before you use box: present.

**Proposed fix (smallest change, a workflow step):** in step 5, "end with the next step from `business-rules.md` → Response-time promises". Shown as a one-line diff, accepted, re-run: 5/5 pass.

## Build log entry (`workflows/hot-water-quote-reply/build-log.md`)
```
## v1.0 — 2026-11-12
- Built from: blueprint v1.1 · 11 Nov · simulated against 5 samples
- Sections:
  - Description: picks up "how much for a new hot water system" and "can you quote a replacement"
  - Input: a request file from inbox/hot-water/; office inbox once connected in Session 6
  - Steps: the six blueprint steps, in order
  - Rules: points to DNA files and headings; copies nothing
  - Approval points: four stop-and-ask lines (blueprint has 4; count matches)
  - Output: a draft in outputs/hot-water-quote-reply/ with the Check box
  - Never and When something's wrong: drafts-only rules plus the out-of-scope list
### Run 1 — sandbox/hot-water-quote-reply/sample-1.md
| Success criterion | Pass / miss | Note |
| Draft or route note | pass | |
| Nothing outside the DNA | pass | |
| Safety, commercial, complaints routed | pass | none in this sample |
| Under 2 minutes of edits | miss | vague "soon" |
| Ready within 10 minutes | pass | |
### Changes
- v1.1: step 5 now names the response-time promise · skill · run 1 miss
### Run 2 (v1.1) — same sample: 5/5 pass
### Check before you use
- **[CHECK] items:** sign-off name on each draft; upfront prices for electric and continuous flow systems
- **Assumptions:** first run used sample 1 only; other request types untested until /test-pack
- **Needs a human decision:** who covers Office Coordinator approvals when they're away
- Nothing has been sent.
```
