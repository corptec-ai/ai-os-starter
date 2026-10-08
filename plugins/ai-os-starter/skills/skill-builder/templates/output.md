---
name: <blueprint name, e.g. hot-water-quote-reply>
description: <What it does, in one sentence, from the blueprint's Trigger and Output.> Use for "<owner's phrase 1>", "<owner's phrase 2>", or "<owner's phrase 3>".
---

# <Workflow name in plain words>

<Two lines: what it does and for whom.> **Drafts only. Nothing is sent.**

## Input
- <What arrives, from the blueprint's Inputs: a file path in `$ARGUMENTS`, pasted text, or a file in `inbox/`.>
- <If it arrives through a tool not yet connected: "Uses <tool> once connected in Session 6. Until then, read the file from `inbox/`.">
- If there's no input, ask: "<one plain question, with a sensible default>".

## What it reads
- `business-dna/<file>.md` → "<heading>": <why, in a few words>
- `business-dna/<file>.md` → "<heading>": <why>
- Use these to write; never copy their wording into the output.
- If a file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders.

## Steps
1. **<Blueprint step 1 name>.** Does: <…>. Reads: <…>. Produces: <…>.
2. **<Blueprint step 2 name>.** Does: <…>. Reads: <…>. Produces: <…>.
3. **<Blueprint step 3 name>.** <…> **Stop and ask:** "<approval question>" (default: no).
4. <One numbered step per blueprint step, six at most. A judgement step reads: "Prepare the information and **stop for a human**: <role>.">

## Approval points
- **Stop and ask** <before what, from blueprint approval point 1>: "<question>". Default is no.
- **Stop and ask** <approval point 2>: "<question>". Default is no.
- Never send, post, book or pay. If a tool refuses something, don't look for a way around it.

## Output
Write `outputs/<name>/YYYY-MM-DD-<short-slug>.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# <Output title> — <date>
<The blueprint's output format>

## Check before you use
- **[CHECK] items:** each placeholder
- **Assumptions:** <what the skill assumed>
- **Needs a human decision:** <approval points reached, judgement steps, who decides>
- Nothing has been sent.
```

## Never
- Send, post, publish, reply, delete, pay, book or contact anyone. Drafts only.
- Make up prices, policies, dates, names or figures. Gaps become `[CHECK: …]`.
- Give legal, tax, financial, medical or HR-law advice. Flag it: "Have your adviser check this."
- Copy personal details into the output beyond what the task needs.
- Ask for or store passwords, API keys or card numbers.
- <Each item from the blueprint's Out of scope and "must never happen".>

## When something's wrong
- **Missing information:** <from Failure handling>
- **Unclear input:** <from Failure handling>
- **Out of scope:** <from Failure handling, usually "say so in one line and hand it to <role>">

Worked example: see `examples/sample-1.md`.
