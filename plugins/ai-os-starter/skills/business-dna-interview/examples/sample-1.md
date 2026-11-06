# Example: pricing file for Northside Plumbing & Gas (fictional)

Run as `/business-dna-interview pricing`, so only `pricing-positioning.md` is redone. The other four files are left alone.

## What was in `inbox/`
- `website-services.txt`: services page copy
- `price-list-2025.pdf`: "Call-out $129 inc GST. Labour $165/hr inc GST."
- `quote-hot-water-preston.docx` and `quote-leak-reservoir.docx`: both use labour at $180/hr inc GST; the hot water quote says "30% deposit on commercial jobs over $5,000"
- `emails-sample.txt`: 5 customer emails with the office's replies

## The conversation (abridged)

**AI:** I found your services page, a 2025 price list, 2 quotes and 5 customer emails. Working on pricing only.

Here's my draft:
- **Pricing basis:** hot water fixed after photos or a visit; leaks call-out plus hourly; commercial quoted per job.
- **Rates:** call-out $129 inc GST. Labour: `[[FILL]]` (two figures, see question 1).
- **Deposits and terms:** 30% deposit on commercial over $5,000. Payment terms `[[FILL]]`.
- **Against competitors:** `[[FILL]]`
- **Discount rules:** `[[FILL]]`

**AI (question 1 of up to 5):** Your 2025 price list says labour is $165/hr, but both recent quotes use $180/hr. Which is current? (type Accept for $180, the newer one)

**Owner:** $165. The quotes were a mistake by a new estimator.

**AI (question 2):** How many days do customers have to pay? (type Accept for 14 days from invoice, which your emails mention twice)

**Owner:** Accept

**AI (question 3):** How do you compare with other plumbers on price? (type Accept for "mid-market on price, top on reliability and paperwork", which is how your website puts it)

**Owner:** Accept

**AI (question 4):** When is a discount allowed? (type Accept for "no discounts without approval")

**Owner:** 10% for pensioners on residential jobs.

**AI (question 5):** Who approves any other discount? (type Accept for the Operations Manager)

**Owner:** Accept

**AI:** Here's the summary for `pricing-positioning.md`:
- Labour $165/hr inc GST (confirmed 2026-11-11; the $180 in two quotes was an error)
- Call-out $129 inc GST · 30% deposit on commercial over $5,000 · 14 days from invoice
- Mid-market on price, top on reliability · 10% pensioner discount, others need the Operations Manager
- Still `[[FILL]]`: none

Write `pricing-positioning.md`? (yes / no / change something)

**Owner:** yes

## File written: `business-dna/pricing-positioning.md`

```
# Pricing and positioning

## Pricing basis per offer
Hot water replacement: fixed upfront price after photos or a site visit. Leak repairs: call-out fee plus hourly. Commercial gas and grease trap work: quoted per job.

## Rates or ranges we're happy to state
Call-out fee $129 including GST. Labour $165 per hour including GST (confirmed 2026-11-11; the $180 in two 2026 quotes was an error).

## Minimums, deposits and payment terms
Commercial jobs over $5,000: 30% deposit. Payment terms 14 days from invoice.

## Where we sit against competitors
Mid-market on price, top on reliability and paperwork.

## Discount rules
10% for pensioners on residential jobs. Any other discount needs the Operations Manager's approval.
```

## Sources log: `outputs/business-dna-interview/2026-11-11-sources.md`

# Business DNA sources — 2026-11-11

Business: Northside Plumbing & Gas · Brand covered: Northside Plumbing & Gas · Files written: 1 of 5 (pricing only)

## Where each fact came from
| File | Section | Came from |
|---|---|---|
| pricing-positioning.md | Pricing basis per offer | inbox/website-services.txt |
| pricing-positioning.md | Rates or ranges we're happy to state | inbox/price-list-2025.pdf; owner's answer (Q1) |
| pricing-positioning.md | Minimums, deposits and payment terms | inbox/quote-hot-water-preston.docx; inbox/emails-sample.txt (Q2) |
| pricing-positioning.md | Where we sit against competitors | inbox/website-services.txt (Q3) |
| pricing-positioning.md | Discount rules | owner's answer (Q4, Q5) |

## Questions asked
Questions asked: 5

| # | File | Question | Answer used |
|---|---|---|---|
| 1 | pricing-positioning.md | $165 or $180 labour? | $165; quotes were an error |
| 2 | pricing-positioning.md | Payment terms? | 14 days (suggested answer accepted) |
| 3 | pricing-positioning.md | Position against competitors? | Mid-market, top on reliability (suggested answer accepted) |
| 4 | pricing-positioning.md | When is a discount allowed? | 10% for pensioners on residential jobs |
| 5 | pricing-positioning.md | Who approves other discounts? | Operations Manager (suggested answer accepted) |

## Still to fill
- None in this file.

## Check before you use
- **[CHECK] items:** none.
- **Assumptions:**
  - "Including GST" applies to all stated rates, as on the 2025 price list.
- **Needs a human decision:**
  - Two recent quotes used $180/hr. Decide whether to contact those customers. This interview hasn't changed them.
- Nothing has been sent.

---

## If this had been an automated test run
With "This is an automated test run" in the request and no scripted answers, question 1 would have used the suggested answer: "Labour $180 per hour including GST [CHECK: test-run default, owner to confirm]". Every other answer would be the suggestion shown above, also marked `[CHECK: …]`, and the file would be written with no "yes" step.
