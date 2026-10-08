# Example: sop-writer

Fictional business: **Northside Plumbing & Gas**, Melbourne north. All names and details are invented.

## Input

```
/sop-writer sandbox/sample-process-notes.md
```

`sandbox/sample-process-notes.md`:
```
hot water swap - how we do it
get the job sheet from the office. check the new unit is the right one before you leave the yard.
at the house turn the gas off at the meter and the water off, make sure its isolated properly obviously.
drain the old tank, take it out, put the new one in, connect up, test for leaks.
if the customer wants a bigger unit than quoted ring Mick on 0400 000 123 before doing anything.
take photos before and after. compliance cert done by the licensed guy.
old unit back to the yard for recycling.
```

`business-rules.md` → "Always check with a human": "Any change to a quoted price — Operations Manager."

## What the skill did

- One process, order clear, so it asked no questions.
- Split "drain, take out, put in, connect, test" into one action per step.
- Kept the gas isolation step but didn't state a rule; added an adviser check.
- Replaced Mick's mobile number with the role from business-rules.md and flagged it.
- Did not describe the compliance certificate as proof the job is compliant.
- Added nothing the notes don't say unless it's marked `[CHECK]`.

## Output (`outputs/sop-writer/2026-10-08-hot-water-replacement.md`)

```
# SOP — Hot water system replacement
Draft — for the owner to review before staff use it.

## Purpose
Replace a customer's hot water system the same way every time.

## When to use
When a hot water swap is on the job sheet.

## Who
- Plumber: does the swap.
- Licensed tradesperson: does the compliance certificate. [CHECK: which licence or role]
- Operations Manager: approves any change to the quoted unit or price.

## Before you start
- Job sheet from the office.
- The new unit, checked as the right one.
- [CHECK: tools and fittings list for a standard swap]

## Steps
1. Collect the job sheet from the office.
2. Check the new unit is the right one before leaving the yard.
3. Turn off the gas at the meter. [CHECK: confirm the requirement with your WHS adviser]
4. Turn off the water.
5. Confirm the gas and water are isolated. [CHECK: confirm the isolation test method with your WHS adviser]
6. Photograph the old unit (before photo).
7. Drain the old tank.
8. Remove the old unit.
9. Put the new unit in.
10. Connect the new unit. [CHECK: connections needed]
11. Test for leaks.
12. Photograph the new unit (after photo).
13. Get the compliance certificate done by the licensed tradesperson. [CHECK: confirm the requirement with your WHS adviser]
14. Take the old unit back to the yard for recycling.

## Checks
- No leaks found in the leak test.
- Before and after photos taken.
- Old unit back at the yard.
- Job sheet marked complete. [CHECK: confirm]

## If something goes wrong
- Customer wants a bigger unit than quoted → stop and call the Operations Manager before doing anything. ⚠ Check with Operations Manager
- A leak you can't fix → isolate the supply again and call the Operations Manager. [CHECK: confirm]

## Records to keep
- Before and after photos [CHECK: where these are stored]
- Compliance certificate [CHECK: where this is filed]
- Completed job sheet [CHECK: confirm]

## Version and owner
Version: 0.1 draft · Owner: [CHECK: who owns this SOP] · Date: 2026-10-08 · Review by: [CHECK: review date]

## Check before you use
- **[CHECK] items:**
  - [CHECK: which licence or role] (Who)
  - [CHECK: tools and fittings list for a standard swap] (Before you start)
  - [CHECK: confirm the requirement with your WHS adviser] (steps 3 and 13)
  - [CHECK: confirm the isolation test method with your WHS adviser] (step 5)
  - [CHECK: connections needed] (step 10)
  - [CHECK: confirm] the job-sheet check, the leak fallback and the job-sheet record (not in the notes)
  - [CHECK: where photos and the compliance certificate are stored]
  - [CHECK: SOP owner and review date]
- **Assumptions:** written for a new plumber in their first week. "Ring Mick" mapped to the Operations Manager, the role business-rules.md names for changes to a quoted price.
- **Needs a human decision:** the notes gave a personal mobile number for approvals; it's replaced with the role. This is a draft. Have your adviser check the gas and safety steps before staff use it.
- Nothing has been sent.
```
