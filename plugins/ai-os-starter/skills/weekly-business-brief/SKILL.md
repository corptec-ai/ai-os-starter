---
name: weekly-business-brief
description: Writes a one-page week-ahead brief from the connected calendar and email (and files if provided): key meetings, items waiting on the owner, customers needing attention and risks. Use for "brief me on the week", "what's on this week", "Monday brief", or a scheduled weekly run.
---

# Weekly business brief

A one-page "week ahead" for the owner: what's on, what's waiting on them, which customers need attention, and what's at risk. It **reads** the calendar and email. It never replies, accepts, declines, moves or sends anything.

## Input
- `$ARGUMENTS` may hold an optional focus: `sales`, `ops` or `cash`. With a focus, give that area more room; still cover every section.
- `$ARGUMENTS` may also hold a file or folder path. If it does, use those files instead of connectors.
- **No arguments:** don't ask anything. Cover everything, using the sources below.

## Sources, in this order
1. **Connected calendar and email, read only.**
   - Calendar: the next 7 days.
   - Email: the last 7 days that is unread, flagged, or from a sender named under Best customers (`ideal-customers.md`).
2. **Fallback, no connectors:** `sandbox/sample-calendar.md` and `sandbox/sample-emails.md`, or any files in `inbox/`.
3. **Nothing at all:** say in one line "Connect your calendar and email (or put files in `inbox/`) and run me again", then stop. Write no file.

Say which source you used at the top of the brief.

## What it reads from the DNA
- `business-dna/business-rules.md`: "Response-time promises" (to spot overdue replies), "Always check with a human" and "Escalation contacts by role".
- `business-dna/ideal-customers.md`: "Best customers" (to spot email from a sender named there) and "Red flags in an enquiry".

If either file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on. With no response-time promise, use 2 business days and add `[CHECK: response-time promise not set — assumed 2 business days]`.

## Steps
1. **Read the calendar** for the next 7 days.
   - List each meeting with its purpose and any prep needed (a document to read, a quote to bring).
   - **Flag clashes**: two items overlapping in time. Name both.
   - Flag back-to-back days (no break of 30 minutes or more between 9am and 5pm).
   - **Personal, family or medical items:** show only the time and "Personal: busy". Never the title, place, people or notes.
2. **Read email.**
   - **Waiting on you:** questions to the owner, approvals, quotes requested. Max 7, most urgent first.
   - **Overdue replies:** customer email with no reply within the response-time promise.
   - Summarise each in one line with sender and subject. Never quote email bodies at length.
3. **Spot risks:** overdue promises, unhappy or angry tone, deadlines this week, anything that hits "Always check with a human".
4. **Write the brief** using the template below. Keep it under 60 lines.
5. **Show** the "This week in 3 lines" section and the file path.

## Running as a scheduled task
- Ask **no** questions. Make sensible choices and list them under "Check before you use".
- If the connectors fail, use the sandbox or `inbox/` fallback and say so in the brief.
- Finish with the file written. Never try to send or share it.

## Approval points
None. Read only. When run by hand:
- If the person asks you to reply, accept, decline or move something: stop and say "I can only read your calendar and email. I can list it under Waiting on you, or `/email-reply-drafter` can draft a reply for you to send."
- Otherwise, don't ask. The brief should just appear.

## Output
Write `outputs/weekly-business-brief/YYYY-MM-DD.md` (the date of the Monday the brief covers, or today). Never overwrite: if the name is taken, add `-2`, `-3` and so on. The template is in `templates/output.md`.

```
# Week ahead — <Mon date> to <Sun date>
Source: <connected calendar and email | sample files | inbox files> · Focus: <all | sales | ops | cash>

## This week in 3 lines
## Meetings and prep
| Day | Time | What | Prep |
⚠ Clash: <item A> and <item B>, <day time>
## Waiting on you (max 7)
- <sender> — <subject>: <what they need> (since <date>)
## Customers to look after
- <customer> — <why: no reply within promise, unhappy tone, big job this week>
## Risks
## Suggested first hour on Monday
1. … 2. … 3. …
## Check before you use
- **[CHECK] items:** each placeholder
- **Assumptions:** source used, response-time promise used, items treated as personal
- **Needs a human decision:** anything only the owner can decide
- Nothing has been sent.
```

## Never
- Send, reply, forward, accept or decline invites, move or create meetings, or mark email as read. Read only. If a tool refuses an action, don't look for a way around it.
- Quote email bodies at length. One line, with sender and subject.
- Include personal or medical calendar items in detail. Show them as "Personal: busy".
- Make up meetings, senders, deadlines, figures or promises. Anything unclear becomes `[CHECK: …]`.
- Give legal, tax, financial or HR-law advice. Flag it: "Have your adviser check this."
- Copy phone numbers, home addresses or other personal details into the brief.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **No connectors and no files:** explain what to connect in one line and stop.
- **Very busy inbox (over 200 emails a week):** limit to flagged, unread and Best-customers email, and say so under "Check before you use".
- **Empty week:** say "Nothing booked" and use the space for waiting items and risks.
- **Unclear if an item is personal** (for example "Appointment"): treat it as "Personal: busy" and note the assumption.
- **A red-flag enquiry** (per `ideal-customers.md`): list it under Risks, not Customers to look after.
- **Over 7 waiting items:** show the top 7 and say "plus <n> more".

Worked example: see `examples/sample-1.md`.
