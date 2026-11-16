# Example: opportunity map for Northside Plumbing & Gas (fictional)

## What happened in the session (condensed)
- `inbox/kickoff-notes.md` was empty, so the guide started with "What eats most of your time?"
- The owner named three tasks, then the guide prompted area by area (customer service, finance and chasing, marketing, people and rostering, operations and reporting) until there were ten.
- The guide proposed every score with a reason. The owner changed two: hot water quote replies from Complexity 2 to 3 ("photos make it fiddly"), and the job-card retyping hours from 5 to 4.
- The top-scoring task, answering gas safety questions by email, scored Risk 5. The guide said: "A wrong answer here could put someone in danger, so it can't be the first workflow. The next one down is hot water quote replies." The owner agreed.
- The guide ran the scope test out loud, proposed the scope sentence, and asked "Happy with this pick and scope sentence? I'll save the map. (yes / no)". The owner typed yes.

## Output (written to `workflows/opportunity-map.md`)

# Opportunity map — Northside Plumbing & Gas — 2026-11-11

Prepared with the owner. Hours are the owner's estimates.

## Ranked table

Score = Value + Frequency + Return + (6 − Complexity) + (6 − Risk). Maximum 25. Highest first; ties go to lower risk, then higher value.

| # | Task | Owner role | Hours a week | Label | Value | Frequency | Complexity | Risk | Return | Score |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | Answer customer gas safety questions by email | Owner | 5 | Automate | 5 | 5 | 2 | 5 | 5 | 20 |
| 2 | Reply to hot water quote requests | Office Coordinator | 6 | Automate | 4 | 4 | 3 | 2 | 4 | 19 |
| 3 | Weekly job schedule summary for the team | Operations Manager | 2 | Accelerate | 3 | 3 | 2 | 1 | 3 | 18 |
| 4 | Retype paper job cards into the job system | Office Coordinator | 4 | Eliminate | 3 | 5 | 2 | 1 | 1 | 18 |
| 5 | Booking confirmations and reminder texts | Office Coordinator | 4 | Automate | 3 | 5 | 2 | 3 | 3 | 18 |
| 6 | Chase overdue invoices | Office Coordinator | 3 | Automate | 3 | 3 | 2 | 3 | 4 | 17 |
| 7 | Triage rental agency maintenance requests | Office Coordinator | 3 | Automate | 3 | 4 | 3 | 3 | 4 | 17 |
| 8 | Draft social posts | Office Coordinator | 1.5 | Accelerate | 2 | 2 | 1 | 2 | 2 | 15 |
| 9 | Reply to Google reviews | Office Coordinator | 1 | Accelerate | 2 | 3 | 2 | 3 | 3 | 15 |
| 10 | Prepare large commercial quotes | Operations Manager | 4 | Accelerate | 4 | 2 | 5 | 4 | 4 | 13 |

Not eligible to pick: task 1 (risk 5: gas safety advice must come from a licensed gasfitter) · task 4 (Eliminate)

## Eliminate list
- Retype paper job cards (score 18; return only 1 and complexity 2 — the typing shouldn't exist at all): plumbers enter job notes on their phones in the job system instead, so nobody types them twice.

## Top three
1. **Reply to hot water quote requests** (score 19) — First version: draft a reply to each hot water quote request from the website form, with the upfront price range and the photos we still need.
2. **Weekly job schedule summary** (score 18) — First version: turn next week's job list export into a one-page summary for the Monday toolbox meeting.
3. **Booking confirmations and reminder texts** (score 18) — First version: draft a confirmation for each new booking from the day's booking list, for the Office Coordinator to check and send.

## The pick

**Scope sentence:** When a hot water quote request arrives from the website form or the office inbox, produce a draft reply with the upfront price range and what we still need from the customer, and I approve it before it's sent to the customer.

**Why this one:** Highest score after the gas safety task, low risk, happens most days, and enquiries can be saved to `inbox/` as files by Day 2. Faster replies win more hot water jobs.

### Scope test
- **One trigger:** Pass — a hot water quote request arrives.
- **One main output:** Pass — one draft reply.
- **Six steps or fewer:** Pass — about five: read, check fit, price range, gaps, draft.
- **Human approves before anything leaves the business:** Pass — the Office Coordinator approves every draft before it's sent.
- **Input available by Day 2:** Pass — enquiries saved as files in `inbox/`; connect the office inbox in Session 6.

**Out of scope (for now):** booking the job, firm quotes after a site visit, commercial and childcare hot water jobs, electrical upgrades, anything about gas safety.

## Time now and estimated saving
- All ten tasks: about 33.5 hours a week (estimate).
- The pick: about 6 hours a week now. Rough saving once it's running: 3–4 hours a week (estimate only, to be checked in Session 7).

## Check before you use
- **[CHECK] items:**
  - Task 10: [CHECK: rough guess] hours a week for commercial quotes
- **Assumptions:**
  - Hours a week are the owner's estimates, not measured.
  - "Owner role" is the person who mostly does the task today.
- **Needs a human decision:**
  - Task 1 (gas safety questions) is left out because of its risk. Decide separately how those emails reach a licensed gasfitter quickly.
- Nothing has been sent.
