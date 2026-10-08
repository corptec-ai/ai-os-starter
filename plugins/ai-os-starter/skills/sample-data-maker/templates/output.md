<!-- README: sandbox/<workflow-name>/README.md -->

# Sample data — <workflow-name>

Fictional test inputs for <one-line description of the workflow>. All names, businesses, emails and phone numbers are invented. Use them with the simulated run in `/workflow-blueprint` and the first runs of your skill.

| File | Type | What it tests |
|---|---|---|
| sample-1.md | typical | <customer segment or request type 1> |
| sample-2.md | typical | <segment or request type 2> |
| sample-3.md | typical | <segment or request type 3> |
| sample-4.md | edge case | <the key detail that's missing> |
| sample-5.md | messy | <rambling / mixed requests / wrong details / out of scope> |

## Check before you use
- **[CHECK] items:**
  - <e.g. [CHECK: real ones arrive as PDF; test with one real file on Day 2]>
- **Assumptions:**
  - <e.g. format confirmed as one email per file>
- **Needs a human decision:**
  - <e.g. whether sample 5's out-of-scope request should be routed or declined>
- Nothing has been sent.

<!-- Each sample: sandbox/<workflow-name>/sample-<n>.md -->

# Sample <n> — <type>: <one-line description>

**From:** <Invented Name> <<first.last>@example.com>
<!-- Every email ends exactly in @example.com, no subdomain (quotes.northside@example.com, not quotes@northside.example.com). Phones only 0400 000 xxx. -->
**Phone:** 0400 000 <xxx>
**Received:** <Day DD/MM/YYYY, time>
**Subject:** <subject>

<Body written the way this kind of customer actually writes.>

<!-- Tabular inputs: sandbox/<workflow-name>/sample-<n>.csv -->
<!-- header row with realistic column names, then 10–20 rows; the messy file has at least one bad row -->
