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
   - List each meeting with its purpose and any prep needed (a document to read, a quote to bring). One line each. Merge routine items (e.g. "Daily 7:00 crew start, Mon–Fri").
   - **Flag clashes**: two items overlapping in time. Name both.
   - Flag back-to-back days (no break of 30 minutes or more between 9am and 5pm).
   - **Personal, family or medical items:** show only the day, time and "Personal: busy". Never name the person, practitioner, place or appointment type, **anywhere** in the brief, including the Check box and assumptions.
2. **Read email.**
   - **Waiting on you:** questions to the owner, approvals, quotes requested. Max 7, most urgent first.
   - Apply the matching `business-dna/business-rules.md` "Response-time promises" promise to every Waiting on you item; for a payroll question tied to a pay day, use its payroll promise and do not write a pay-run-ready deadline without client-manager confirmation.
   - **Overdue replies:** customer email with no reply within the response-time promise.
   - Summarise each in one line with sender and subject. Never quote email bodies at length.
3. **Spot risks:** overdue promises, unhappy or angry tone, deadlines this week, anything that hits "Always check with a human".
4. **Write the brief** using the template below, within these caps:
   - This week in 3 lines: exactly 3 lines.
   - Meetings and prep: max 8 bullets, one line each, no table. Clash and back-to-back flags count as bullets.
   - Waiting on you: max 7. Customers to look after: max 5. Risks: max 4. Suggested first hour: max 3.
   - Check before you use: max 6 lines.
5. **Self-check before writing.** Count every line of the brief, including headings, blank lines and the Check box. It must be **under 60**. If not, merge or cut the lowest-priority items and recount. Then check no personal item is named anywhere.
6. Write the file. **Show** the "This week in 3 lines" section and the file path.

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
## This week in 3 lines          (3 lines)
## Meetings and prep             (max 8 bullets, no table)
- <Day time> — <what>. Prep: <what to read or bring>
- <Day time> — Personal: busy
- ⚠ Clash: <item A> and <item B>, <day time>
## Waiting on you                (max 7)
- <sender> — "<subject>": <what they need> (since <date>)
## Customers to look after       (max 5)
- <customer> — <why: no reply within promise, unhappy tone, big job this week>
## Risks                         (max 4)
## Suggested first hour on Monday (max 3)
## Check before you use          (max 6 lines)
- **[CHECK] items:** · **Assumptions:** (source, promise used, "1 item shown as Personal: busy"; include "unclear item treated as Personal: busy" whenever that edge case is used) · **Needs a human decision:**
- Nothing has been sent.
```
The whole brief is under 60 lines.

## Never
- Send, reply, forward, accept or decline invites, move or create meetings, or mark email as read. Read only. If a tool refuses an action, don't look for a way around it.
- Quote email bodies at length. One line, with sender and subject.
- Include personal or medical calendar items in detail. Show them only as "Personal: busy". Never name the person, practitioner or appointment type, anywhere.
- Go over 60 lines, or over any section cap.
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
- **Over a section cap** (e.g. 7 waiting items): show the top items and add "(plus <n> more)" to the end of the last item, not as a new line.

Worked example: see `examples/sample-1.md`.
