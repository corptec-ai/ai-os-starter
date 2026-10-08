# Example: five hot water quote requests for Northside Plumbing & Gas (fictional)

## Input
`/sample-data-maker hot-water-quote-reply`

It read the Trigger and Inputs from `workflows/hot-water-quote-reply/blueprint.md`: homeowners asking for a price to replace a hot water system, by website form or email, saved one per file in `inbox/hot-water/`.

The owner had also put one real enquiry in `inbox/`. It was used for shape only (short, phone-typed, mentions the age of the unit). None of its names, numbers or address appear below.

**Format check:** "Five hot water quote requests, one markdown file each, some as website forms and some as emails. OK?" Owner pressed Return.

## Output (written to `sandbox/hot-water-quote-reply/`)

### README.md

# Sample data — hot-water-quote-reply

Fictional test inputs for replying to hot water quote requests. All names, businesses, emails and phone numbers are invented.

| File | Type | What it tests |
|---|---|---|
| sample-1.md | typical | Homeowner, gas storage, photos attached (the easy case) |
| sample-2.md | typical | Homeowner, electric storage, wants to switch to continuous flow (no price range in the DNA) |
| sample-3.md | typical | Real estate agency asking for a rental property (different segment, tenant access) |
| sample-4.md | edge case | No suburb and no system type given |
| sample-5.md | messy | Long email: hot water plus a leaking tap, and a "funny gas smell" near the unit |

## Check before you use
- **[CHECK] items:**
  - [CHECK: real requests often include photos; these samples only say whether photos were attached]
- **Assumptions:**
  - Format confirmed as one request per markdown file.
- **Needs a human decision:**
  - None.
- Nothing has been sent.

### sample-1.md

# Sample 1 — typical: gas storage, Preston, photos attached

**Form:** Website quote request
**Name:** Lachlan Brereton
**Suburb:** Preston
**Phone:** 0400 000 311
**Email:** lachlan.b@example.com
**Received:** Tuesday 10/11/2026, 6:52am

**Message:** Hi, our gas hot water (storage, outside on the side of the house) is about 13 years old and only gives us a 5 minute shower now. Photos attached of the unit and the sticker. Can I get a price to replace with the same type? Weekdays after 3 are best to call.

### sample-4.md

# Sample 4 — edge case: no suburb, no system type

**From:** Grace Okonkwo-Hale <grace.oh@example.com>
**Received:** Tuesday 10/11/2026, 9:15pm
**Subject:** hot water quote

Hi there, need a quote for a new hot water system please, ours is pretty old now. Thanks Grace

### sample-5.md

# Sample 5 — messy: mixed requests and a safety mention

**From:** Bev Tamworth-Shaw <bevts@example.com>
**Phone:** 0400 000 342
**Received:** Wednesday 11/11/2026, 11:48am
**Subject:** Few things!!

Hello, my neighbour recommended you, she said you did her place in Bundoora last year (or was it the year before). Anyway our hot water system is making a ticking noise and there's a funny gas smell near it some mornings, not sure if that's normal. We were going to replace it anyway before Christmas, it's an electric one I think, or maybe gas, my husband would know. Also the kitchen tap drips all night. Can you give us a price for everything and come Saturday? We're in Bundorra (sorry, Bundoora).
Bev

(Samples 2 and 3 follow the same layout.)

## What the person saw
"Five samples saved in `sandbox/hot-water-quote-reply/`: three typical (gas, electric to continuous flow, rental agency), one edge case (no suburb or system type) and one messy (mixed requests and a gas smell). Next: run the simulated run in `/workflow-blueprint`."
