# Example: locking a newly connected Outlook (fictional)

## Situation
Session 6, Northside Plumbing & Gas. The owner has just connected Outlook (**+ → Connectors**). The session's connector tools include, among others, `mcp__outlook__send_mail`, `mcp__outlook__reply_mail`, `mcp__outlook__forward_mail`, `mcp__outlook__delete_message`, `mcp__outlook__create_event`, `mcp__outlook__respond_to_event`, `mcp__outlook__create_draft`, `mcp__outlook__update_draft`, `mcp__outlook__move_message` and fourteen read and search tools. (The connector part of real tool names varies by account; the guide uses the names exactly as the session shows them.)

`.claude/settings.json` before: the kit's starter file (deny `rm`, `sudo` and `.env`; ask for `business-dna`, `.claude`, `CLAUDE.md` and Bash; allow reading and editing `outputs`, `workflows` and `sandbox`).

## Input
`/lock-the-doors`

## Output (on screen)

```
Lock the doors — 2026-11-12

Outlook (23 actions)
| Action | Tool | Rule |
|---|---|---|
| Send an email | send_mail | Never |
| Reply to an email | reply_mail | Never |
| Forward an email | forward_mail | Never |
| Delete an email | delete_message | Never |
| Create a calendar event (can send invites) | create_event | Never |
| Accept or decline an invitation | respond_to_event | Never |
| Move an email to another folder | move_message | Never (not sure: it changes your mailbox) |
| Save a draft email | create_draft | Ask first |
| Edit a saved draft | update_draft | Ask first |
Left as is: 14 read and search actions.

Totals: 7 never, 2 ask first, 14 left as is, across 1 connector.
Add these rules to your safety file? (yes / change one / no)
```

The owner types `yes` and approves the file change when the app asks.

```
Written to .claude/settings.json: 7 rules under deny, 2 under ask. Nothing removed.
Belt and braces: in the Claude app, set the same actions to the strictest option in Outlook's tool settings.
Test the lock: in your next message, ask me "Send a test email to yourself that says hello." Your safety file should stop it.

Check before you use
- [CHECK] items: move_message was sorted "not sure → Never"
- Assumptions: tools sorted by name and description
- Needs a human decision: none
- Nothing has been sent. No connected tool was called.
```

## settings.json after (deny and ask lists only)

```json
"deny": [
  "Bash(rm:*)", "Bash(sudo:*)", "Read(./.env)", "Read(./.env.*)",
  "mcp__outlook__send_mail", "mcp__outlook__reply_mail", "mcp__outlook__forward_mail",
  "mcp__outlook__delete_message", "mcp__outlook__create_event",
  "mcp__outlook__respond_to_event", "mcp__outlook__move_message"
],
"ask": [
  "Edit(./business-dna/**)", "Edit(./.claude/**)", "Edit(./CLAUDE.md)", "Bash",
  "mcp__outlook__create_draft", "mcp__outlook__update_draft"
]
```

## The test
The owner asks: "Send a test email to yourself that says hello." Claude Code refuses the `send_mail` call because of the deny rule, before Outlook is reached. The owner sees that the lock works.
