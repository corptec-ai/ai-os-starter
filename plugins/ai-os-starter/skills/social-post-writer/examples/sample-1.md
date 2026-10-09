# Example: social-post-writer

Fictional business: **Northside Plumbing & Gas**, Melbourne north. All names and details are invented.

## Assumed DNA for this example
(In the business's own files; not pasted into the output.)
- `brand-voice.md` → How we sound: friendly, practical, plain-spoken. Spelling and format rules: no emojis; up to 2 hashtags.
- `ideal-customers.md` → Best customers: "Families in older homes" in Melbourne's north.
- `products-services.md` → offer: "Hot water repair and replacement".
- `business-rules.md` → Never say: superlatives we can't back up ("best", "cheapest", "guaranteed").

## Input

```
/social-post-writer Dave and the team swapped out Mrs Karen Lim's burst hot water system at 14 Example St, Preston on Saturday morning — she had no hot water with three kids at home. Best plumbers in the north!
```

No permission is mentioned for the customer or for Dave.

## What the skill did

- Platform not given, so it used LinkedIn.
- Segment: "Families in older homes" from `ideal-customers.md`.
- Removed the customer's name and street address, and flagged both.
- Left out the superlative claim in the idea (removed): the DNA doesn't support it.
- Kept Dave out of the drafts until permission is confirmed.
- Used only what the idea says (Saturday morning, Preston, burst system swapped, three kids, no hot water). Anything about results is marked `[CHECK]`.

## Output (`outputs/social-post-writer/2026-10-08-weekend-hot-water.md`)

```
# Social post options — weekend hot water — 2026-10-08
Platform: LinkedIn · Segment: Families in older homes
Draft only. Nothing has been posted or scheduled.

## Option 1 — Story
Saturday morning in Preston: a family with three kids and no hot water after their system burst.
Our team swapped out the old unit for a new one. [CHECK: confirm the new system was up and running on that visit]
Nobody plans for the hot water to give out. If yours is getting noisy or slow to heat, get in touch about hot water repair and replacement.
#NorthsidePlumbing #HotWater

Note: Customer and staff names removed. Get permission before naming Dave or the customer.

## Option 2 — Useful tip
Three signs your hot water system may be near the end [CHECK: confirm these signs with your plumbers]:
1. Rusty or discoloured hot water.
2. Rumbling or popping from the tank.
3. Water pooling around the base.
Spot one of these? Get in touch about hot water repair and replacement.

Note: Tips are general. Have a plumber confirm them before posting.

## Option 3 — Problem → solution
No hot water, and three kids at home. That was a Preston family's Saturday morning when their system burst.
Our team swapped it out for a new one. [CHECK: confirm the result before describing it further]
Hot water trouble? Get in touch about hot water repair and replacement.

Note: The superlative claim in the idea (removed): not supported by the DNA.

## Check before you use
- **[CHECK] items:**
  - [CHECK: confirm the new system was up and running on that visit] (Option 1)
  - [CHECK: confirm these signs with your plumbers] (Option 2)
  - [CHECK: confirm the result before describing it further] (Option 3)
- **Assumptions:** LinkedIn; "Families in older homes" segment; call to action points to "Hot water repair and replacement".
- **Needs a human decision:**
  - Permission: the customer (named in the idea) and Dave (staff). Get their OK before naming either.
  - Address removed: the idea included a house number and street. Don't add it back, and check any photo doesn't show it.
  - The superlative claim in the idea (removed): only add a claim back if the Business DNA supports it.
- Nothing has been posted.
```
