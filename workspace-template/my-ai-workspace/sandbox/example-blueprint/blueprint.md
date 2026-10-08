# Blueprint — hot-water-quote-reply
Version: v1.0 · 8 Oct 2026 · fallback blueprint for Northside Plumbing & Gas (fictional) · not yet simulated: run the simulated run against your sandbox samples before `/skill-builder`
Scope sentence: When a hot water quote request arrives from the website form or the office inbox, produce a draft reply with the upfront price range and what we still need from the customer, and the Office Coordinator approves it before it's sent to the customer.

## Trigger
A homeowner asks for a price to replace or install a hot water system, through the website form or by email to the office inbox. One request starts one run.

## Inputs
- The request, saved as a file in `inbox/hot-water/` (one request per file) until the office inbox is connected. Connect the office inbox in Session 6.
- Photos, if the customer attached them. The workflow only notes whether photos came; it doesn't judge them.
- Business DNA: `products-services.md`, `pricing-positioning.md`, `ideal-customers.md`, `business-rules.md`, `brand-voice.md`.

## Steps
1. **Read the request**
   - Does: pulls out the requester's first name, suburb, contact details, the current system (gas or electric, storage or continuous flow), its rough age, what's wrong, whether photos came, and how urgent it is.
   - Reads: the request file.
   - Produces: a short fact sheet, with each missing fact marked "not given".
2. **Check fit and safety**
   - Does: checks the suburb is inside the service area, the job is residential, and there are no red flags. Stops and routes to a person if the request mentions a gas smell, a gas leak, scorching or water near electrics, is commercial, or is a complaint.
   - Reads: the fact sheet; `ideal-customers.md → Who we are not for` and `Red flags in an enquiry`; `business-rules.md → Always check with a human`.
   - Produces: "Fit: go", or "Route to <role>: <reason>" with no draft.
3. **Match the offer and price range**
   - Does: matches the request to Hot water replacement, states what's included and not included, and gives the typical price range only where the DNA states one (gas storage). For any other system type the price becomes `[CHECK: upfront price after photos]`.
   - Reads: `products-services.md → Our offers`; `pricing-positioning.md → Pricing basis per offer`, `Rates or ranges we're happy to state` and `Discount rules`.
   - Produces: the offer, the price line (including GST) and the included / not included lines.
4. **List what we still need**
   - Does: picks up to three things we need before giving an upfront price: usually photos of the unit and its compliance plate, gas or electric, and access to the unit.
   - Reads: the fact sheet.
   - Produces: a short "what we need from you" list.
5. **Draft the reply**
   - Does: writes the reply in the Northside voice: thanks, the price range or `[CHECK]`, what we need, and one clear next step. It never gives an arrival time or a booking.
   - Reads: steps 1–4; `brand-voice.md → How we sound`, `Words we use`, `Spelling and format rules`; `business-rules.md → Response-time promises`.
   - Produces: a draft reply, marked "not sent".
6. **Check and hand over for approval**
   - Does: checks the draft against "Never say" and "Words we avoid", removes anything that slipped in, adds the Check before you use box, and saves the file for the Office Coordinator.
   - Reads: the draft; `business-rules.md → Never say`; `brand-voice.md → Words we avoid`.
   - Produces: `outputs/hot-water-quote-reply/YYYY-MM-DD-<suburb>-<first-name>.md`.

## Business rules applied
- Only quote the price range the business states, including GST, and only for the system it applies to (`pricing-positioning.md → Rates or ranges we're happy to state`).
- Hot water is a fixed upfront price after photos or a site visit, so the reply asks for photos (`pricing-positioning.md → Pricing basis per offer`).
- Old unit removal is included; electrical upgrades are not (`products-services.md → Our offers`).
- The pensioner discount is mentioned only if the customer says they're a pensioner; no other discounts (`pricing-positioning.md → Discount rules`; `business-rules.md → Never do`).
- Anything about gas safety goes to a licensed gasfitter; commercial quotes over the stated threshold go to the Operations Manager (`business-rules.md → Always check with a human`).
- Never promise an arrival time we haven't confirmed; never say "guaranteed" except for the written workmanship warranty (`business-rules.md → Never say`).
- Reply the same business day (`business-rules.md → Response-time promises`).
- Outside the service area, new builds and "cash job" requests are not for us (`ideal-customers.md → Who we are not for`, `Red flags in an enquiry`).
- Straight-talking, clear about money, no "cheap" or "emergency surcharge", Australian spelling, no emojis, sign off with first name and "Northside Plumbing & Gas" (`brand-voice.md → How we sound`, `Words we avoid`, `Spelling and format rules`).

## Approval points
- **Before the reply from step 5 is sent to the customer:** the Office Coordinator reads the draft, fixes any `[CHECK]`, and sends it from the office inbox. The workflow never sends.
- **Step 2, gas safety:** any mention of a gas smell or gas leak stops the run. A licensed gasfitter decides what happens next, the same day.
- **Step 2, money and complaints:** commercial jobs go to the Operations Manager; complaints or refund requests go to the Operations Manager. No draft is written for either.
- **Step 3, discounts:** the Office Coordinator confirms pensioner status before the discount line stays in.

## Output
One markdown file per request in `outputs/hot-water-quote-reply/`, with: the fact sheet, the fit result, the draft reply (not sent), and the Check before you use box.

Filled example (fictional):

> **Fact sheet:** Rosa · Thornbury · rosa.m@example.com · 0400 000 318 · gas storage, about 12 years old · lukewarm water, rusty patch at the base · photos: no · wants it done before her family visits.
> **Fit:** go (residential, inside the service area, no safety words).
>
> **Draft reply (not sent)**
> Subject: Re: Hot water replacement quote
>
> Hi Rosa,
>
> Thanks for getting in touch. A 12-year-old gas storage unit with rust at the base is usually due for replacement. A typical gas storage replacement is $1,800–$2,600 including GST, with removal of the old unit included.
>
> To give you an upfront price, could you send us:
> - a photo of the unit and the sticker on its side;
> - a photo of where it sits, so we can see the access.
>
> Once we have those, we'll come back with a fixed upfront price within 2 business days.
>
> Cheers,
> [CHECK: first name of the person sending]
> Northside Plumbing & Gas

## Success criteria
1. Every request in the test set gets a draft or a "Route to <role>" note; none is skipped (5 of 5 samples).
2. No draft states a price, discount or arrival time that isn't in the DNA (0 found when the Office Coordinator checks).
3. Every sample that mentions gas safety, commercial work or a complaint is routed with no draft (2 of 2 planted cases).
4. The Office Coordinator approves at least 4 of 5 drafts with under 2 minutes of edits each.
5. A draft is ready within 10 minutes of the request being saved to `inbox/hot-water/`.

## Out of scope
- Sending replies, booking jobs, or offering times.
- The fixed upfront price after photos or a site visit (that's the plumber's call).
- Commercial, childcare and multi-unit hot water jobs (quoted per job).
- Electrical upgrades, leak repairs and gas safety questions.
- Part 2, later: a follow-up reminder when the customer hasn't sent photos after 2 business days.

## Failure handling
- **Missing information** (no suburb, no system type): the draft asks for it in the "what we need" list. Never guess. If there's no way to contact the customer, mark it "Route to Office Coordinator: no contact details".
- **Unclear input** (can't tell if it's a replacement or a repair): no draft. Write "Route to Office Coordinator: unclear request" with a two-line summary.
- **Out-of-scope input** (commercial, outside the service area, a red flag, a complaint): no draft. Write "Route to <role>: <reason>" using `business-rules.md → Escalation contacts by role`.
- **Gas safety words:** stop at step 2 and route to a licensed gasfitter. Nothing else is drafted.

## Check before you use
- **[CHECK] items:**
  - The sign-off name on each draft.
  - Upfront prices for electric and continuous flow systems aren't in the DNA, so drafts for those show `[CHECK: upfront price after photos]`.
- **Assumptions:**
  - Requests are saved as one file per request in `inbox/hot-water/` until the office inbox is connected in Session 6.
  - "Quote within 2 business days" comes from `business-rules.md → Response-time promises`.
- **Needs a human decision:**
  - Who covers Office Coordinator approvals when they're away.
- Nothing has been sent.
