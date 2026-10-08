# Example: catering quote for Little Collins Café Group (fictional)

## Assumed DNA for this example
(In the business's own files; not pasted into the output.)
- Offer "Office catering": includes platters delivered to CBD offices, disposable plates and napkins, pickup of platters next business day; excludes waiting staff, alcohol, and setting up furniture. Typical timeframe: 48 hours' notice.
- Pricing: fixed per item. Rates we're happy to state: "Sandwich platter $18.50 per person", "Fruit platter $65.00 each". "Prices include GST."
- Minimums, deposits, payment terms: "Minimum order 10 people. 50% deposit on orders over $1,000. Invoice payable within 7 days of delivery."
- Discount rules: 10% off for repeat corporate accounts with 5+ orders a year.
- Brand voice: warm and plain; sign off "Cheers, the Little Collins team".

## Input (pasted)

From Priya Example, an office on Collins St (priya@example.com, 0400 000 301):
"Hi, we'd like lunch for our team training day. Sandwiches for about 24 people (could be 26) and 2 fruit platters. Can you deliver by 12? Thanks."

## What the skill did

- Matched "Office catering". Nothing in the brief is excluded or on "What we never do".
- Calculated line totals from DNA prices × brief quantities and showed the working. "About 24 (could be 26)" is uncertain, so it calculated on 24 and added [CHECK: final numbers].
- The total is $574.00, under the $1,000 deposit threshold, so no deposit is mentioned.
- No discount: the brief doesn't say they're a repeat corporate account.
- No delivery date promised; the brief gives no date.

## Output (written to `outputs/proposal-drafter/2026-10-08-priya-collins-st-catering.md`)

# Proposal — training day lunch for Priya, Collins St (draft, not sent)

Offer used: Office catering

## What you asked for
Lunch for your team training day: sandwiches for about 24 people (could be 26) and 2 fruit platters, delivered by 12.

## What we'll do
- Platters delivered to your office
- Disposable plates and napkins
- Pickup of platters the next business day

## What's not included
- Waiting staff
- Alcohol
- Setting up furniture

## Timeframe
We need 48 hours' notice. We'll confirm the delivery day and time once you're ready to go ahead. [CHECK: confirm we can deliver by 12 on the day they choose]

## Investment

| Item | Working | Line total |
|---|---|---|
| Sandwich platter | 24 × $18.50 | $444.00 |
| Fruit platter | 2 × $65.00 | $130.00 |
| **Total** | $444.00 + $130.00 | **$574.00** |

[CHECK: final numbers] You said about 24, could be 26. At 26 people the sandwich line would change; we'll update it once you confirm.

Prices include GST.

## Payment terms
Invoice payable within 7 days of delivery.

## Next step
Reply with your final numbers and the day you'd like, and we'll lock it in.

Cheers,
the Little Collins team

---

## Plain-text version (optional)
Proposal: training day lunch for Priya, Collins St. Office catering. Sandwich platter 24 x $18.50 = $444.00. Fruit platter 2 x $65.00 = $130.00. Total $574.00. Prices include GST. Includes delivery to your office, plates and napkins, pickup next business day. Not included: waiting staff, alcohol, setting up furniture. 48 hours' notice needed. Invoice payable within 7 days of delivery.

---

## Check before you use
- **Every dollar figure, and its source:**
  - $18.50, $65.00: pricing-positioning.md, "Rates or ranges we're happy to state"
  - $444.00: calculated, 24 × $18.50
  - $130.00: calculated, 2 × $65.00
  - $574.00: calculated, $444.00 + $130.00
- **[CHECK] items:**
  - [CHECK: final numbers] (24 or 26 people)
  - [CHECK: confirm we can deliver by 12 on the day they choose]
- **Assumptions:** matched to Office catering; calculated on 24 people, the figure stated first; GST as the DNA states it ("Prices include GST"). No deposit: $574.00 is under the $1,000 threshold.
- **Needs a human decision:** none on discounts (no rule applies). No delivery date promised.
- Nothing has been sent.
