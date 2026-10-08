---
name: meeting-to-actions
description: Turns meeting notes or a transcript into decisions, action items with owners and due dates, open questions, risks, and a follow-up email draft in the business's voice. Use for "summarise this meeting", "what are the actions", "write the follow-up", or any pasted or attached meeting notes.
---

# Meeting to actions

Turn a meeting's notes or transcript into a clear record and a follow-up email **draft**. Nothing is sent.

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-meeting.md`), or pasted text.
- If there's no input, ask: "Which meeting? Give me a file, or paste the notes."
- If the input isn't a meeting (an article, a price list), say so in one line and stop.

## Steps
1. Read the input. Note the attendees, the date and the purpose, if they're stated.
2. Pull out:
   - **Decisions:** what was agreed. Quote it if it's short.
   - **Actions:** owner, task, due date.
   - **Open questions.**
   - **Risks** that were mentioned.
3. **Owner and date rules:**
   - The owner must be a person named in the input; otherwise write `?`.
   - The due date must be stated in the input; otherwise write `TBD`.
   - Never guess either.
4. **Leave personal remarks out of the email.** Comments about someone's performance, health or private life go in the record under "Flagged, not included", with a one-line note.
5. Draft the follow-up email using `business-dna/brand-voice.md`. If the brand voice is still `[[FILL]]`, use plain, friendly Australian English and add `[CHECK: brand voice not set yet]`.
   - Thank people.
   - Summarise in 3–5 bullets.
   - Include the actions table.
   - End with "Let me know if I've missed anything."
   - Add recipients only if they're named in the input. Never add CCs.
6. Check `business-dna/business-rules.md`. If an action or the email touches a "never say" or "always check with a human" rule, flag it.
7. Write the output file, then show the person a 3-line summary and the file path.

## Output
Write `outputs/meeting-to-actions/YYYY-MM-DD-<short-topic>.md`. Never overwrite: if the name is taken, add `-2`.

```
# <Meeting name> — <date>
## Decisions
## Actions
| Owner | Action | Due |
## Open questions
## Risks
## Follow-up email (draft — not sent)
Subject: …
## Flagged, not included
## Check before you use
- [CHECK] items, assumptions, anything a person must decide
```

## Never
- Send, schedule or create calendar entries.
- Invent attendees, owners, dates, decisions or figures.
- Include personal remarks about people in the email.
