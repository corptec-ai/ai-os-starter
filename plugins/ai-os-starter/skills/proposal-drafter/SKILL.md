---
name: proposal-drafter
description: Drafts a quote or short proposal from a customer brief using the business's own products, inclusions, exclusions, pricing basis and payment terms, with gaps clearly marked for the owner. Use for "write a quote", "draft a proposal", "price this job", or a pasted brief or enquiry.
---

# Proposal drafter

Draft a quote or short proposal from a customer brief, using only the business's real offers and pricing. Anything that needs a site visit, a measurement or a judgement is left as a clearly marked gap. **Draft only. Nothing is sent to the customer.**

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-brief.md`), an enquiry, or pasted notes.
- Optionally, the name of the offer to use ("use Hot water replacement").
- If there's no input, ask: "Which job? Give me the brief or enquiry, or paste your notes."
- If the input isn't a job request (an invoice, meeting notes), say so in one line and stop.

## What it reads
- `business-dna/products-services.md`: each offer's name, what's included, what's not, typical timeframe; "What we never do".
- `business-dna/pricing-positioning.md`: "Pricing basis per offer", "Rates or ranges we're happy to state", "Minimums, deposits, payment terms", "Discount rules".
- `business-dna/brand-voice.md`: "How we sound", "Words we use", "Words we avoid", "Spelling and format rules".
- `business-dna/business-rules.md`: "Never say", "Always check with a human", "Legal and compliance notes".
- `business-dna/ideal-customers.md`: "Who we are not for", "Red flags in an enquiry".
- Never paste DNA text in bulk. Use the offer's inclusions and exclusions as the business wrote them, nothing more.
- If a file is missing or still has `[[FILL]]`, say which one in one line, suggest `/business-dna-interview`, and carry on with `[CHECK: …]`. If `products-services.md` or `pricing-positioning.md` is unfilled, every price is `[CHECK: price]`.

## Steps
1. Read the brief. Note what the customer wants, in their words, plus location, size, timing and any budget they mention.
2. **Check "What we never do".** If the brief asks for something on that list, don't quote it. Write a polite decline in the summary, suggest an alternative offer if one genuinely exists, and stop there (no pricing section).
3. **Match to offers** in `products-services.md`. Use the offer the person named, if any.
   - **If no offer fits, stop.** Say so in one line, and give a short suggested reply to the customer (thank them, say it's not something we do, suggest who might help if the DNA says). Don't stretch an offer to fit.
   - **Stop and ask** if two offers fit equally: "This could be <A> or <B>. Which one? (Return for <A>)".
   - **If the brief asks for something the matched offer excludes** (e.g. a different system type), don't quote the offer as a like-for-like substitute. **Stop and ask:** "They asked for <X>, which <offer> doesn't include. Draft a short decline offering <offer> as the alternative, or stop here? (Return for the decline)". The decline has no pricing section.
4. **If the brief is vague,** list the 3 questions to ask before quoting, then draft with gaps.
5. **Draft the proposal** in the brand voice, with these sections:
   - **What you asked for:** a summary in the customer's own terms.
   - **What we'll do:** from the offer's inclusions.
   - **What's not included:** from the offer's exclusions.
   - **Timeframe:** the offer's typical timeframe, or `[CHECK: timeframe]`. Never a start date.
   - **Investment:** see the pricing rules below.
   - **Payment terms:** from "Minimums, deposits, payment terms", or `[CHECK: payment terms]`.
   - **Next step:** e.g. "Reply to book a site visit". No dates promised.
6. **Pricing rules:**
   - Use only rates or ranges stated in `pricing-positioning.md`. Every dollar figure must appear there.
   - **Quote-based work:** show the basis (e.g. "$165/hr, estimated 6–8 hrs") only if the DNA allows ranges for this offer; otherwise write `[CHECK: price after site visit]`.
   - **No totals you've worked out yourself** unless the DNA states the total. Show the rate and the basis; let the owner do the sum.
   - **GST:** mention it only if the DNA says how they quote it (inc. or ex.). Never calculate it.
   - **Discounts:** apply one only if "Discount rules" clearly covers this case, and name the rule. Otherwise none, and if the customer asked for one, flag it for a human.
7. **Check against "Never say" and "Always check with a human".** Flag anything that needs the owner.
8. Write the output file. Offer an optional plain-text version (no Markdown) at the end of the same file for pasting into their quoting tool. Show the person a 3-line summary and the file path.

## Approval points
- **Stop and ask** when two offers fit (step 3).
- **Stop and ask** when the brief asks for something the offer excludes (step 3).
- **Stop and ask** before including any discount: "The discount rules allow <rule> here. Include it? (Return for no)".
- Never send the proposal or contact the customer. If asked to, say: "I've drafted it. You send it when you're happy."

## Output
Write `outputs/proposal-drafter/YYYY-MM-DD-<customer-or-job>.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# Proposal — <job> for <customer> (draft, not sent)
Offer used: <offer name from products-services.md>
## What you asked for
## What we'll do
## What's not included
## Timeframe
## Investment
## Payment terms
## Next step
## Questions to ask first (only if the brief is vague)
## Plain-text version (optional)
## Check before you use
- **Every dollar figure, and its source**
- **[CHECK] items:** each placeholder
- **Assumptions:** offer matched, GST handling
- **Needs a human decision:** discounts, start dates asked for, red flags
- Nothing has been sent.
```

## Never
- Send, email or share the proposal, or contact the customer.
- Invent a price, total, GST calculation, warranty, guarantee or testimonial.
- Commit to a start date or completion date.
- Write terms and conditions. If the DNA links standard T&Cs, reference them; don't rewrite them.
- Apply a discount the "Discount rules" don't allow.
- Quote anything in "What we never do".
- Give legal, tax or compliance advice (including licensing or permits). Flag it: "Have your adviser check this."
- Copy personal details beyond the customer's name and suburb.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Vague brief:** 3 questions to ask, then a draft with gaps.
- **Excluded service:** no quote; polite decline plus an alternative offer if one exists.
- **Red flag in the brief** (from "Red flags in an enquiry"): draft as normal, quote the phrase, and flag it in the Check box for the owner.
- **Customer names a budget below the minimum:** don't lower the price. Note the minimum from the DNA and flag it.
- **Several jobs in one brief:** one section per offer under "What we'll do" and "Investment"; no combined total unless the DNA states one.

Worked example: see `examples/sample-1.md`.
