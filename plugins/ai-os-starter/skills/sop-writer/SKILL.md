---
name: sop-writer
description: Turns a rough process description, voice-note transcript or checklist into a clear standard operating procedure (SOP) with purpose, roles, numbered steps, checks and what to do when things go wrong. Use for "write an SOP", "document this process", "turn this into a procedure", or rough process notes.
---

# SOP writer

Turn rough notes, a voice-note transcript or a checklist into a clear step-by-step procedure a new staff member could follow, with the safety and approval steps called out. It's a **draft** for the owner to check. It never says the procedure is compliant or certified.

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-process-notes.md`), or pasted text.
- Optional audience, for example "new apprentice" or "casual staff". If none is given, write for a new staff member in their first week. Don't ask.
- If there's no input, ask: "Which process? Give me a file, or paste or talk me through the steps."
- If the input isn't a process (a price list, a meeting), say so in one line and stop.

## What it reads
- `business-dna/business-rules.md`: "Never do", "Always check with a human (with who)", "Legal and compliance notes" and "Escalation contacts by role".
- `business-dna/brand-voice.md`: "Spelling and format rules" and "Words we avoid", so the SOP reads like the business.

If either file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders. Never stop with an error.

## Steps
1. **Read the notes.** Find the process name, purpose, trigger (what starts it), roles, tools and materials, and the steps in order.
2. **Check scope.** If the notes cover more than one process, list them and stop and ask: "These notes cover <A>, <B> and <C>. Which one first?" Default: the first one.
3. **Ask at most 3 questions**, one at a time, and only where the order of steps or a safety step is unclear. Offer a default each time (for example "I'll put the isolation step before removing the old unit — OK?"). If the steps contradict each other, list both versions and ask which is right.
4. **Write the SOP** with these 9 headings, in this order:
   1. **Purpose**
   2. **When to use**
   3. **Who** (roles, not personal names unless the notes give them)
   4. **Before you start** (tools, materials, permits, information)
   5. **Steps**: numbered, one action each, each starting with a verb ("Turn off…", "Check…", "Photograph…")
   6. **Checks** (what "done right" looks like)
   7. **If something goes wrong**
   8. **Records to keep**
   9. **Version and owner**
5. **Mark approval steps.** Any step that hits "Always check with a human" in `business-rules.md`, or that involves money, a customer promise or a change from the usual way, gets **⚠ Check with <role>**, using the role from "Escalation contacts by role". If no role is set, write **⚠ Check with [CHECK: which role approves this]**.
6. **Handle safety and regulatory steps.** If the notes imply a safety, licensing, food-safety, gas, electrical or WHS requirement, keep the step but never state the rule as fact. Add `[CHECK: confirm the requirement with your WHS adviser]` (or the relevant adviser, for example "your food safety adviser"). Never add safety requirements the notes don't mention.
7. **Fill gaps with placeholders.** Anything missing (a form name, a record location, a timeframe) becomes `[CHECK: …]`. Never guess. Nothing in the SOP (steps, checks, fallbacks, records) may come from outside the notes or the DNA unless it is marked `[CHECK: …]`.
8. **Write the output file**, then show the person the step count, the number of `[CHECK]` items, and the file path.

## Output
Write `outputs/sop-writer/YYYY-MM-DD-<process>.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. The template is in `templates/output.md`.

```
# SOP — <process name>
Draft — for the owner to review before staff use it.
## Purpose
## When to use
## Who
## Before you start
## Steps
1. <Verb> …
2. <Verb> … ⚠ Check with <role>
## Checks
## If something goes wrong
## Records to keep
## Version and owner
Version: 0.1 draft · Owner: [CHECK: who owns this SOP] · Date: <date> · Review by: [CHECK: review date]
## Check before you use
- **[CHECK] items:** each placeholder, with its step
- **Assumptions:** audience, order of steps, roles used
- **Needs a human decision:** contradictions, approval steps, anything to confirm with an adviser
- Nothing has been sent.
```

## Never
- Invent safety, legal or regulatory requirements (WHS, food safety, licensing). If the notes imply one, add `[CHECK: confirm the requirement with your WHS adviser]`.
- Present the SOP as compliant, certified, approved or "meets Australian Standards", or use words like "compliant", "certified" or "fully safe".
- Give legal, WHS-law or HR-law advice. Draft the wording and add "Have your adviser check this."
- Make up tools, forms, timeframes, prices or names. Use `[CHECK: …]`.
- Copy personal details (phone numbers, home addresses) into the SOP. Use roles.
- Send, share or publish the SOP, or contact anyone.
- Ask for or store passwords, API keys or card numbers. If a step needs a login, write "Log in to <system>" and nothing more.

## Edge cases
- **Several processes in one set of notes:** split them and ask which to do first.
- **Steps contradict each other:** list both versions and ask.
- **A step bundles several actions** ("isolate, drain and remove"): split it into one action per step.
- **Notes give a personal mobile number for escalation:** replace it with the role and flag it.
- **Very short notes** (3 lines): write what you can and mark the gaps with `[CHECK: …]` rather than asking more than 3 questions.
- **Audience is "casual staff":** use simpler words and add a "Ask your supervisor if unsure" line to "If something goes wrong".

Worked example: see `examples/sample-1.md`.
