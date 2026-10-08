# Example: weekly-business-brief

Fictional business: **Northside Plumbing & Gas**, Melbourne north. All names, emails and details are invented.

## Input

Run with no arguments and no connectors, so the skill used the sandbox files.

`sandbox/sample-calendar.md` (excerpt):
```
Mon 12 Oct 9:00–10:00  Toolbox talk, all crew
Tue 13 Oct 10:00–11:00 Site meeting — Example Builders, Coburg townhouses
Tue 13 Oct 10:30–11:30 Quote walk-through — Brunswick café fit-out
Wed 14 Oct 12:00–13:00 Dr appointment — skin check results (Dr Patel, Example Medical)
```

`sandbox/sample-emails.md` (excerpt):
```
1. From: sam@examplebuilders.example.com — "Variation approval needed" — 7 Oct. Needs your sign-off on a $4,200 variation by Thursday.
2. From: jo@brunswickcafe.example.com — "Quote please" — 6 Oct. Asked for a revised quote. No reply yet.
3. From: lee@example.com — "Still waiting" — 2 Oct. Customer chasing a callback about a leaking tap. No reply.
```

Response-time promise in `business-rules.md`: "Reply to customers within 1 business day."

## Output (`outputs/weekly-business-brief/2026-10-12.md`)

```
# Week ahead — Mon 12 Oct to Sun 18 Oct
Source: sample files · Focus: all

## This week in 3 lines
1. Tuesday morning has a clash: Example Builders site meeting and the Brunswick café walk-through.
2. Example Builders need your sign-off on a variation by Thursday.
3. One customer has waited 6 business days for a callback.

## Meetings and prep
- Mon 9:00–10:00 — Toolbox talk, all crew. Prep: none
- Tue 10:00–11:00 — Site meeting, Example Builders (Coburg). Prep: read the variation email first
- Tue 10:30–11:30 — Quote walk-through, Brunswick café. Prep: bring the revised quote
- Wed 12:00–1:00 — Personal: busy
- ⚠ Clash: Example Builders site meeting and Brunswick café walk-through, Tue 10:30–11:00

## Waiting on you
- Sam, Example Builders — "Variation approval needed": sign-off on a variation, due Thursday (since 7 Oct)
- Jo, Brunswick café — "Quote please": revised quote requested (since 6 Oct)

## Customers to look after
- Lee — "Still waiting": no reply since 2 Oct, past the 1-business-day promise. Tone is frustrated.
- Brunswick café — quote request unanswered for 4 business days.

## Risks
- Variation deadline Thursday; it touches pricing, so check it against "Always check with a human".
- Lee may leave a bad review if not called back this week.

## Suggested first hour on Monday
1. Call Lee back about the leaking tap.
2. Move one of the Tuesday meetings (you'll need to do this yourself).
3. Review the Example Builders variation before Tuesday.

## Check before you use
- **[CHECK] items:** [CHECK: who signs off variations — see "Always check with a human" in business-rules.md]
- **Assumptions:** used the sample files (no calendar or email connected); 1 item shown as Personal: busy.
- **Needs a human decision:** which Tuesday meeting to move. Nothing has been accepted, declined or moved.
- Nothing has been sent.
```

Self-check: 37 lines (under 60), every section within its cap. Traps handled: the clash is flagged, the personal item shows only as "Personal: busy" with nothing about it named anywhere, the overdue reply is listed, and email bodies are summarised in one line each.
