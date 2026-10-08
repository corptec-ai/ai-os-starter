# Example: hot water quote replies for Northside Plumbing & Gas (fictional)

A condensed run. The full blueprint this produces is in the workspace at `sandbox/example-blueprint/blueprint.md`.

## Input
`/workflow-blueprint` with no argument. It read **The pick** from `workflows/opportunity-map.md`:

> When a hot water quote request arrives from the website form or the office inbox, produce a draft reply with the upfront price range and what we still need from the customer, and I approve it before it's sent to the customer.

Scope test: one trigger, one output, about five steps, approval before sending, input available as files by Day 2. Pass.

## Name
Proposed `hot-water-quote-reply`. Owner pressed Return.

## Interview (six questions, defaults offered from the DNA)
1. **What arrives, and where?** Website form and office inbox. Owner: "Save them as files for now." → design for `inbox/hot-water/`; note "connect the office inbox in Session 6".
2. **What does a good output look like?** Owner pasted a reply Priya wrote last month. Used for shape only.
3. **Which rules matter most?** Accepted the default: price range including GST, same-day reply, no arrival times, gas safety to a licensed gasfitter.
4. **Who checks it?** Office Coordinator.
5. **What must never happen?** "Quoting a price we haven't stated, or answering anything about a gas smell."
6. **How will you know it worked?** "Draft ready in 10 minutes; Office Coordinator only tweaks it."

## The plan (approved in Plan mode)
The draft had the nine headings and six steps: read the request · check fit and safety · match the offer and price range · list what we still need · draft the reply · check and hand over for approval. The owner edited one line in the plan pane. Shown back as: "You changed: success criterion 4 from 'under 5 minutes of edits' to 'under 2 minutes'." Saved `workflows/hot-water-quote-reply/blueprint.md` as v1.0.

## Simulated run (from `sandbox/hot-water-quote-reply/`, 5 samples)

Written to `workflows/hot-water-quote-reply/simulation-log.md`:

## Sample 1 — typical: gas storage, Preston, photos attached
- Step 1: read the form → fact sheet complete.
- Step 2: residential, in area, no safety words → go.
- Step 3: gas storage → typical range from the DNA.
- Step 4: photos already sent → asks only about access.
- Step 5: draft written. Step 6: no "Never say" words → saved for approval.
- Result: draft ready for approval. Fix applied: none.

(Samples 2–3 omitted here; the real log covers all 5.)

## Sample 4 — edge case: no suburb given
- Step 2: can't check the service area → STALLED.
- Fix applied: gap 1 (ask for the suburb in step 4 and keep going).

## Sample 5 — messy: long email, mentions "a funny gas smell near the unit"
- Step 2: gas safety words → routed to a licensed gasfitter, no draft. Correct.
- Also asks about a leaking tap (out of scope). Not mentioned in the route note → STALLED.
- Fix applied: gap 2 (route note lists every request in the email).

## Gaps found
| # | Gap | Proposed fix | Owner's decision |
|---|---|---|---|
| 1 | Missing suburb stops step 2 | Ask for the suburb in step 4; mark fit `[CHECK]` | accepted |
| 2 | Route note drops the second request | List every request in the route note | accepted |
| 3 | Continuous flow has no price range in the DNA | Add a range to `pricing-positioning.md` | rejected (owner will price these after photos) |

Version change: v1.0 → v1.1 (2 fixes applied). Blueprint version line now reads `v1.1 · 11 Nov · simulated against 5 samples`.

## What the person saw
"Blueprint saved and walked against 5 samples. Two gaps fixed, one left for you (continuous flow prices). Files: `workflows/hot-water-quote-reply/blueprint.md` and `simulation-log.md`. Next: `/skill-builder hot-water-quote-reply` in Session 5."

## Check before you use
- **[CHECK] items:** the sign-off name on drafts; prices for continuous flow systems.
- **Assumptions:** requests arrive as files in `inbox/hot-water/` until Session 6.
- **Needs a human decision:** gap 3 (rejected) stays open; who approves when the Office Coordinator is away.
- Nothing has been sent. Nothing has been built.
