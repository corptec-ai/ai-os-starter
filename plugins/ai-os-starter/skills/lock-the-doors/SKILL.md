---
name: lock-the-doors
description: Locks the connected tools (email, calendar, files, chat, CRM, accounting) so the AI can never send, reply, post, delete or pay through them from this workspace. It finds the risky actions each connector offers, writes exact "never" rules (and "ask first" rules for drafts) into .claude/settings.json once you approve, and shows you how to test the lock. Use for "lock the doors", "make sure it can't send", "lock my connectors", straight after connecting a tool in Session 6, or when /workspace-check says connected tools aren't locked.
---

# Lock the doors

Connecting a tool gives the AI new actions: read, but also send, reply, post and delete. The Claude app usually sets those to **Needs approval** (or even **Always allow**), so one "yes", or none, sends. Rules in `.claude/settings.json` are different: a **never** rule blocks the action in every mode, Auto included, however the request is worded. This guide writes those rules for the tools actually connected, so "drafts only" is enforced, not just intended.

## Input
- Nothing: lock every connected tool.
- Or a connector name in `$ARGUMENTS` (for example `outlook` or `gmail`): lock just that one.

## How it works
- Use only file tools (Read, Edit) on `.claude/settings.json`. **No shell commands.**
- **Never call a connected tool.** Work only from the names and descriptions of the tools available in this session.

## Steps
1. **List the connected tools.** From the tools available in this session, take every connector tool (full names start `mcp__`). Group them by connector: the part between `mcp__` and the next `__`. Use each connector's display name if you know it (Gmail, Outlook, Slack…), and keep the full tool names for the rules.
   - **None connected:** say "Nothing to lock yet. Connect a tool first: **+ → Connectors**. Then run `/lock-the-doors` again." Then stop.
2. **Sort every tool into one of three groups**, by its name and description:
   - **Never:** anything that can **reach another person or remove something**. That covers send, reply, forward, post, publish, share, invite, schedule a message; delete, trash, remove, void; pay, transfer, refund; accept, decline or respond to an invitation; create or change a calendar event (it can send invites); change who has access.
   - **Ask first:** anything that changes only **your own** things and reaches nobody: create or update a draft, add a label, create a folder, upload a file, create or update a record in your own system.
   - **Leave as is:** read, get, list, search, find.
   - **Not sure?** Put it in **Never**. It's easy to relax a rule later, and impossible to unsend an email.
3. **Show the plan** before changing anything. One short table per connector (template: `templates/output.md`): the action in plain words, the tool's short name, and the rule. Then give totals ("12 never, 3 ask first, 20 left as is") and ask:
   **"Add these rules to your safety file? (yes / change one / no)"**. Only the word `yes`, in any capitals, writes the rules. Anything else, including `Accept`, means no and writes nothing.
4. **Write the rules,** after a "yes" (the safety file's own ask-first rule will prompt as well):
   - Add each full tool name, exactly as it appears (for example `mcp__<connector>__send_mail`), to `deny` for Never or `ask` for Ask first.
   - **Keep every existing rule.** Add to the lists; don't reorder, remove or weaken anything, and don't duplicate a rule that's already there.
   - **Never add connector tools to `allow`.**
   - Keep the file valid JSON. Read it back once after writing; if it doesn't parse, restore what was there and say so.
5. **Show the result:** "Open `.claude/settings.json`: the new lines are under `deny` and `ask`." Then give these two steps:
   - **Belt and braces:** "In the Claude app, open the connector's tool settings and set the same send, reply, post and delete actions to **Blocked** (the options are Always allow, Needs approval, Blocked and Custom). That covers chat as well as this folder."
   - **Test the lock:** "In your next message, ask me: *Send a test email to yourself that says hello.* I should be stopped by your safety file before anything is sent. If it isn't, tell a helper."
6. **Finish** with the Check before you use box.

## Output
On screen only, **under 40 lines**: one table per connector, totals, what was written, the two steps above, then:

```
Check before you use
- [CHECK] items: any tool marked "not sure → Never"
- Assumptions: how each tool was sorted, by its name and description
- Needs a human decision: whether any "never" tool should be relaxed (we suggest not)
- Nothing has been sent. No connected tool was called.
```

## Approval points
- **Stop and ask** before writing to `.claude/settings.json` (step 3). Default: no.
- If the person asks to move a Never tool to Ask first or Leave as is, do it only after they type the word `yes` twice, in two separate replies, in any capitals. Anything else keeps the lock. While a move is being confirmed, `yes` counts only towards the move, not the plan. After the second `yes`, show the changed plan and ask the plan question again. Note the move in the Check box under **Needs a human decision**.

## Never
- Call a connected tool, or run a shell command.
- Add a connector tool to `allow`, or remove or weaken an existing rule.
- Write to any file except `.claude/settings.json`.
- Print secrets, tokens or anything inside the connected tools.
- Promise the lock covers more than it does: these rules protect **this folder's sessions**. The connector's own settings in the app cover chat.

## Edge cases
- **Run again after connecting another tool:** lock only the new connector's tools; leave existing rules alone and say how many were already in place.
- **A connector was reconnected and its tool names changed:** add rules for the new names, list the old ones as "no longer connected", and leave removing them to the person.
- **Very many tools** (over 40 on one connector): show the Never and Ask first rows in full, and summarise "Leave as is" as a count.
- **`settings.json` missing or not valid JSON:** stop. "Your safety file needs restoring from the kit: ask a helper." Don't create a new one.
- **The person wants the AI to send on its own:** explain that this workshop's kit is drafts only, and that they can edit the safety file themselves after the workshop. Don't do it for them.
- **The test in step 5 isn't blocked:** say so plainly, keep the rules, and ask them to tell a helper. Don't retry the send.

Worked example: see `examples/sample-1.md`.
