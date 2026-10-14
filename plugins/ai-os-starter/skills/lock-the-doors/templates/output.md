Lock the doors — <date>

<Connector display name> (<N> actions)
| Action | Tool | Rule |
|---|---|---|
| <what it does, in plain words> | <short tool name> | Never |
| <what it does> | <short tool name> | Ask first |
Left as is: <count> read and search actions.

Totals: <n> never, <n> ask first, <n> left as is, across <n> connectors.
Add these rules to your safety file? (yes / change one / no)

<after yes>
Written to .claude/settings.json: <n> rules under deny, <n> under ask. Nothing removed.
Belt and braces: in the Claude app, set the same actions to the strictest option in the connector's tool settings.
Test the lock: in your next message, ask me "Send a test email to yourself that says hello." Your safety file should stop it.

Check before you use
- [CHECK] items: <tools sorted "not sure → Never", or "none">
- Assumptions: tools sorted by name and description
- Needs a human decision: <any rule the person asked to relax, or "none">
- Nothing has been sent. No connected tool was called.
