---
name: opportunity-mapper
description: Builds a prioritised AI opportunity map. Lists the recurring tasks in the business, scores each on value, frequency, complexity, risk and return, and helps pick one well-scoped workflow to build first. Use for "where should I use AI", "what should I automate", "map my opportunities", or Session 3 of the workshop.
---

# Opportunity mapper

Help the owner list the recurring work in their business, score it, and pick **one** first workflow that's worth building and small enough to finish by the end of Day 2. **This is a planning guide. Nothing is built, sent or changed.**

## Input
- Anything in `$ARGUMENTS`: a list of tasks, or a note like "start with quoting".
- The three candidate tasks from the kick-off call, if `inbox/kickoff-notes.md` has anything in it (the kit ships it empty). Start the list with them and say so in one line.
- If there's nothing, start with: "Let's list the jobs that come round every week. What eats most of your time?"

## What it reads
- `business-dna/products-services.md` and `business-dna/ideal-customers.md`: which work matters most, so you can suggest tasks and judge value.
- `business-dna/business-rules.md` → "Always check with a human" and "Legal and compliance notes": to judge risk.
- If a file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders.

## Steps
Where a question states a default, the typed word `Accept` or `return`, in any capitals, chooses that default.

1. **List ten tasks.** First ask one optional question: "What's your role in the business? (type skip to carry on without it)". If they answer, lean your suggested tasks and your recommendation among the top three toward work that role does, and say so in one line. It never changes a score or the risk rules.
   Aim for 10 scored tasks. Start with the kick-off candidates, but they're only a start. Then prompt by area, one area at a time, until there are ten: sales and enquiries · customer service · quoting and admin · finance and chasing · marketing · people and rostering · operations and reporting. For each task ask one question: "Who does it, how often, and about how long each time?" Offer a guess from the DNA they can accept by typing the word Accept, shown as "(type Accept for <guess>)".
2. **Label each task:**
   - **Eliminate:** it shouldn't exist at all (a fix to the process, not AI).
   - **Automate:** AI does it, a human approves.
   - **Accelerate:** a human does it faster with AI.
   Eliminate tasks are **scored like every other task and stay in the ranked table**, labelled Eliminate, so the owner can see why: the scores (often low value or return, or high risk) plus a one-line reason. They can't be in the top three or be picked. Repeat each in the Eliminate list with its total and reason.
3. **Score 1–5 on five criteria.** Propose each score with a short reason and let the owner adjust.
   - **Value:** hours a week × who does it. Under 1 hr = 1, 1–2 = 2, 3–4 = 3, 5–8 = 4, 9+ = 5. Add 1 (max 5) if the owner or a manager does it, because their hour counts more.
   - **Frequency:** monthly or less = 1, a few times a month = 2, weekly = 3, a few times a week = 4, daily = 5.
   - **Complexity:** steps, systems touched, judgement needed. 1 = simple, 5 = many systems and lots of judgement. Lower is better.
   - **Risk:** what a mistake costs in money, reputation or compliance. 1 = easily fixed, 5 = safety, legal or compliance harm. Lower is better.
   - **Return:** what's gained besides time: faster replies, fewer errors, more sales. 1 = little, 5 = a lot.
   - **Score = Value + Frequency + Return + (6 − Complexity) + (6 − Risk).** The maximum is 25. Do the sum yourself and double-check it.
4. **Show the ranked table**, highest score first. Ties: lower risk first, then higher value. Then show the **top three**: the three highest-scoring tasks that aren't Eliminate and don't have a risk of 5. For each, give a one-line **first version** that passes the scope test, e.g. "Draft replies to hot water quote requests from the website form."
   - **Risk 5 is never picked**, even if it tops the table. Say why in one line ("a mistake here could hurt someone or breach compliance") and move to the next one down.
   - If a top task is too big ("handle all customer service"), cut it to its first approval point ("draft replies to booking-change emails").
5. **Ask the owner to pick one** (default: the highest-scoring of the top three, or the one you recommended for their role). Then run the **scope test** out loud. All five must pass:
   1. **One trigger:** one thing arrives that starts it.
   2. **One main output:** it produces one thing.
   3. **Six steps or fewer.**
   4. **A human approves before anything leaves the business.**
   5. **The input is available as a file or a connected tool by Day 2.**
   If an item fails, propose a cut-down version and test again.
6. **Write the scope sentence:** "When ___ arrives, produce ___, and I approve it before ___." Fill every blank with real words from their pick, and tell the owner to replace anything that isn't their own. X, Y or a blank is not an answer: if they type one, ask what actually arrives and what it produces. Show it with the pick, why it was chosen, and what's deliberately out of scope.
7. **Confirm, then write.** Ask: "Happy with this pick and scope sentence? I'll save the map. (yes / no)". Write the file only after an explicit yes. Then show a 3-line summary and the file path.

## Approval points
- **Stop and ask before writing the file:** the owner confirms the pick and the scope sentence. Default is **no**: anything other than an explicit yes, including `Accept` and `return`, means no and writes nothing. Any change goes back to step 5.
- The owner can change any proposed score or label before the table is final.

## Output
Write `workflows/opportunity-map.md`. Never overwrite: if it exists, write `workflows/opportunity-map-2.md` (then `-3`) and say so. Template: `templates/output.md`.

```
# Opportunity map — <business name> — <date>
(If the owner insisted on a high-risk pick: **FACILITATOR: high-risk pick. See The pick.**)

## Ranked table
| # | Task | Owner role | Hours a week | Label | Value | Frequency | Complexity | Risk | Return | Score |

## Eliminate list
- <task>: <one-line note on how to remove it>

## Top three
1. <task> (score) — First version: <one line>

## The pick
**Scope sentence:** When ___ arrives, produce ___, and I approve it before ___.
**Why this one:** …
### Scope test
- **One trigger:** Pass — …
- **One main output:** Pass — …
- **Six steps or fewer:** Pass — …
- **Human approves before anything leaves the business:** Pass — …
- **Input available by Day 2:** Pass — <file in inbox/ or connected tool>
**Out of scope (for now):** …

## Time now and estimated saving
<hours a week across all ten tasks> · <the pick: hours now, rough saving> (estimate only)

## Check before you use
- **[CHECK] items:** …
- **Assumptions:** e.g. hours are the owner's estimates
- **Needs a human decision:** e.g. a high-risk task left out, overlap with another owner's map
- Nothing has been sent.
```

**Time, not money.** Show hours only, always labelled as estimates. Never write a dollar figure or a dollar sign anywhere in the map.

## Never
- Pick a workflow that sends, pays or makes a commitment without a human approving it first.
- Pick a task whose risk scores 5, even if its total is highest. Explain why and offer the next one down.
- Promise or estimate dollar savings. Hours only, labelled as estimates.
- Invent tasks, hours or staff. If the owner doesn't know, use their best guess and mark it `[CHECK: rough guess]`.
- Build anything, write anywhere except `workflows/`, or contact anyone.
- Give legal, tax, financial or HR-law advice about a task. Flag it: "Have your adviser check this."

## Edge cases
- **Two owners from one business:** one map each (the second is `opportunity-map-2.md`), then point out any tasks that overlap.
- **The owner insists on a risk-5 task:** record their choice as the pick, add "high risk: extra approval at every step" to the scope, and put the **FACILITATOR** flag at the top of the file.
- **Fewer than ten tasks after every area:** suggest common ones from the DNA, marked `[CHECK: suggested, not from the owner]`, until there are ten.
- **Nothing passes the scope test:** cut the best task down to its first approval point and test that.
- **The input isn't ready by Day 2** (no export, tool not connected): plan for a file in `inbox/` and note "connect <tool> in Session 6".

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers. Use the tasks given (or the suggested defaults), accept every proposed score and the default pick, mark each default `[CHECK: default used in test run]`, and write the file.

Worked example: see `examples/sample-1.md`.
