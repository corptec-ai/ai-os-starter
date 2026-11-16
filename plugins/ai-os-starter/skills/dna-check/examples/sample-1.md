# Example: checking a quote reply for Northside Plumbing & Gas (fictional)

## Assumed DNA for this example
(The filled example in `sandbox/example-business-dna/`.)
- `brand-voice.md`: straight-talking, local and friendly, clear about money. Words we avoid: "cheap", "emergency surcharge". Australian spelling, no emojis, sign off with first name and "Northside Plumbing & Gas".
- `pricing-positioning.md`: call-out $129 inc GST; labour $165/hr inc GST; gas storage hot water replacement $1,800–$2,600 inc GST; 10% pensioner discount, any other discount needs the Operations Manager.
- `business-rules.md` → Never say: "Guaranteed" (except the written 12-month workmanship warranty); any arrival time not confirmed in the schedule.
- `products-services.md`: no line on whether the business relocates a hot water unit.

## Input
`/dna-check outputs/email-reply-drafter/2026-11-11-replies.md`

The file holds one draft:

> Hi Rachel,
> Thanks for reaching out! We can definitely swap your hot water unit next Tuesday, guaranteed arrival by 8am. A like-for-like gas storage replacement is $1,450 and we'll move it 2 metres along the wall at no extra cost. We'll also throw in 15% off as a welcome discount 😊
> Kind regards,
> The Team

## Output (on screen)

# DNA check — outputs/email-reply-drafter/2026-11-11-replies.md — 2026-11-11

| Line | Score | Evidence |
|---|---|---|
| Voice | 3/5 | Friendly, but "Thanks for reaching out!" and "Kind regards, The Team" aren't your "Thanks for getting in touch" or your sign-off. |
| Accuracy | 1/5 | "$1,450" is below your stated $1,800–$2,600 range; "15% off" isn't a discount you allow; free relocation isn't in your offers. |
| Rules | 1/5 | "guaranteed arrival by 8am" uses a Never say word and promises an unconfirmed arrival time. |
| Customer fit | 4/5 | Homeowner in Bundoora replacing hot water: your segment 1. |
| Spelling and format | 2/5 | Emoji used; sign-off doesn't follow your rule. |

**Verdict: Don't use** — breaks two Never say rules and states a price and a discount the DNA doesn't allow.

## Fixes
1. **[OUTPUT]** "guaranteed arrival by 8am" → "We'll confirm a time with you once it's in the schedule." Remove "guaranteed".
2. **[OUTPUT]** "$1,450" and "15% off as a welcome discount" → remove both. Use "Typical replacement is $1,800–$2,600 including GST; we'll confirm an upfront price from your photos." A discount needs the Operations Manager.
3. **[DNA]** Add to `products-services.md` → What we never do (or Our offers): "Relocating a hot water unit: <quoted separately / not something we do>". The DNA doesn't say, so the draft guessed.
4. **[OUTPUT]** "Kind regards, The Team" and the emoji → "Cheers, <first name>, Northside Plumbing & Gas", no emoji.
5. **[SKILL]** `email-reply-drafter`: any discount not named in Discount rules goes to HUMAN FIRST, never into the draft.

## Check before you use
- **[CHECK] items:** none in the draft (that's part of the problem: the price and date should have been `[CHECK: …]`).
- **Assumptions:**
  - Checked the file named in the command.
  - "Next Tuesday" treated as an unconfirmed date.
- **Needs a human decision:**
  - Whether you relocate hot water units, and how you price it (fix 3).
  - Whether to fix this draft or re-run `/email-reply-drafter` after fix 5.
- Nothing has been sent.

---

## Follow-on: `/dna-check --apply`

**AI:** One [DNA] fix to apply. It needs a value from you first: do you relocate hot water units, and how is it priced? (For example "quoted separately after a site visit" or "not something we do".)

**Owner:** We do it, quoted separately after a site visit.

**AI:** Add this to `products-services.md` under "Our offers"?
"Relocating a hot water unit: quoted separately after a site visit."
(yes / no)

**Owner:** yes

**AI:** Added. Fixes 1, 2, 4 and 5 are for you to make; I haven't changed the draft or the workflow.
