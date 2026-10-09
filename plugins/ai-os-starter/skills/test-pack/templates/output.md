# Test case files (`workflows/<name>/tests/case-<n>.md`)

```
# Case <n> — <short title>
- **Type:** Normal | Missing information | Out of scope | Long or messy | Business-rule trap
- **Rule tested:** <for the trap case only: business-dna/<file>.md → "<heading>">
- **Expected behaviour:** <one line, e.g. "Asks for the suburb; quotes no price">

## Input
<the fictional request, exactly as the skill would receive it>
```

---

# Test log entry (added to `workflows/<name>/test-log.md`)

```
## Run <n> — YYYY-MM-DD — <skill name> v<version>
Score: <x>/8 (<"first run" | "up from 6/8" | "down from 8/8">)

| # | Type | Result | Reason |
|---|---|---|---|
| 1 | Normal | pass | <one line> |
| 2 | Normal | pass | <one line> |
| 3 | Normal | pass | <one line> |
| 4 | Normal | pass | <one line> |
| 5 | Missing information | pass | <one line> |
| 6 | Out of scope | pass | <one line> |
| 7 | Long or messy | fail | <one line> |
| 8 | Business-rule trap | fail | <one line: what forbidden thing happened> |

Changed since last run: <cases that flipped, or "first run">

### Suggested fixes (not applied)
- Case <n> [DNA]: <file and heading, and the smallest change>
- Case <n> [SKILL]: <step number, and the smallest change>
- Case <n> [APPROVAL]: <where a stop-and-ask point is needed>

<If under 5/8: "Recommend cutting scope back to the first approval point and re-testing.">

### Check before you use
- **[CHECK] items:**
  - <each placeholder>
- **Assumptions:**
  - <e.g. success criteria read from blueprint v1.1>
- **Needs a human decision:**
  - <which suggested fixes to make, and who makes them>
- Nothing has been sent.
```
