<!-- File 1: workflows/<name>/blueprint.md -->

# Blueprint — <name>
Version: v1.0 · <date> · not yet simulated
<!-- After the simulated run and fixes: v1.1 · <date> · simulated against <n> samples -->
Scope sentence: When <trigger> arrives, produce <one output>, and <role> approves it before <it leaves the business>.

## Trigger
<What arrives, where, and that one arrival starts one run.>

## Inputs
- <The input, e.g. a file per request in `inbox/<folder>/`. If the tool isn't connected yet: "connect <tool> in Session 6".>
- Business DNA: <the files this workflow relies on>.

## Steps
1. **<Step name>**
   - Does: <what happens>
   - Reads: <the input or DNA file → heading>
   - Produces: <what comes out>
2. **<Step name>**
   - Does: …
   - Reads: …
   - Produces: …
<!-- Six steps or fewer. The last step saves a draft to outputs/<name>/ for a person to approve. -->

## Business rules applied
- <Rule in plain words> (`<dna-file>.md → <Heading>`)
- <Rule in plain words> (`<dna-file>.md → <Heading>`)

## Approval points
- **Before the <output> from step <n> is sent to the customer:** <role> checks it, fixes any `[CHECK]`, and sends it. The workflow never sends.
- **Step <n>, <money / date / safety>:** <role> decides before anything goes further.

## Output
<Format and where it's saved, e.g. one markdown file per request in `outputs/<name>/`.>

Filled example (fictional):

> <A complete example output, as it would look for one typical sample.>

## Success criteria
1. <Checkable: a count, e.g. "5 of 5 samples get a draft or a route note">
2. <Checkable: a zero, e.g. "0 prices that aren't in the DNA">
3. <Checkable: a time, e.g. "draft ready within 10 minutes">
<!-- 3 to 5 items. -->

## Out of scope
- <What this version deliberately doesn't do>
- Part 2, later: <anything cut to keep it to six steps>

## Failure handling
- **Missing information:** <what it does; never guesses>
- **Unclear input:** <no draft; route to role with a two-line summary>
- **Out-of-scope input:** <no draft; "Route to <role>: <reason>">

## Check before you use
- **[CHECK] items:**
  - <each placeholder>
- **Assumptions:**
  - <e.g. input arrives as files in inbox/ until Session 6>
- **Needs a human decision:**
  - <e.g. who approves when the usual person is away>
- Nothing has been sent.

<!-- File 2: workflows/<name>/simulation-log.md -->

# Simulation log — <name>
Blueprint version simulated: v1.0 · <date> · samples from `sandbox/<name>/`

## Sample 1 — typical: <one-line description>
- Step 1: read <…> → produced <…>
- Step 2: <…> → <…>
- …
- Result: draft ready for approval | routed to <role> | STALLED at step <n>: <why>
- Fix applied: <fix> | none

## Sample 4 — edge case: <what's missing>
…

## Sample 5 — messy: <what's messy>
…

## Gaps found
| # | Gap | Proposed fix | Owner's decision |
|---|---|---|---|
| 1 | <gap> | <fix> | accepted / rejected |

Version change: v1.0 → v1.1 (<n> fixes applied).

## Check before you use
- **[CHECK] items:** <each placeholder>
- **Assumptions:** <e.g. samples are fictional and stand in for real requests>
- **Needs a human decision:** <rejected gaps still open>
- Nothing has been sent. Nothing has been built.
