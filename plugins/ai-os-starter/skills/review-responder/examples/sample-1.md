# Example: review-responder

Fictional business: **Northside Plumbing & Gas**. Business DNA filled in.

## Assumed DNA for this example
- `business-rules.md` → Escalation contacts by role: complaints, "Customer Care Manager", public line 0400 000 111 or care@example.com.
- `business-rules.md` → Always check with a human: reviews naming staff, safety or legal issues, with the Customer Care Manager.
- Brand rules do not allow naming staff in public replies.

## Input (pasted)

```
1. Priya — 5 stars — "Hot water system replaced the same day. Tidy, on time, explained everything. Highly recommend."

2. Mark — 1 star — "Dave turned up two hours late, was rude, and left mud all through the hallway. Worst tradie I've dealt with."

3. Sam — 2 stars — "Fixed the leak but the quote was higher than I expected and nobody called back about it."
```

## Output (saved to `outputs/review-responder/2026-10-08-replies.md`)

# Review replies — 2026-10-08

Source: pasted · 3 reviews · 1 positive · 0 mixed · 1 negative · 1 HUMAN FIRST

| # | Reviewer | Stars | Type | Flags |
|---|---|---|---|---|
| 1 | Priya | 5 | Positive | none |
| 2 | Mark | 1 | HUMAN FIRST | staff member named negatively |
| 3 | Sam | 2 | Negative | none |

---

## Review 1 — Priya, 5★, Positive

> "Hot water system replaced the same day. Tidy, on time, explained everything."

**Flags:** none

**Draft reply (not posted) — 33 words:**

Thanks so much, Priya. Getting your hot water back the same day, and leaving the place tidy, is exactly what we aim for. We really appreciate you taking the time to recommend us.

---

## Review 2 — Mark, 1★, HUMAN FIRST

> "Dave turned up two hours late, was rude, and left mud all through the hallway."

**HUMAN FIRST — no draft.** Summary: reviewer says a named staff member was late and rude and left mud in the hallway. · Reason: names a staff member negatively; a manager should look into it before anything is said in public · Who decides: Customer Care Manager

**Suggested holding line (not posted):** Thanks for letting us know, Mark. We take this seriously and would like to talk with you directly. Please contact our Customer Care Manager on 0400 000 111.

---

## Review 3 — Sam, 2★, Negative

> "Fixed the leak but the quote was higher than I expected and nobody called back about it."

**Flags:** none

**Draft reply (not posted) — 40 words:**

Thanks for the feedback, Sam. We're glad the leak is sorted, and we hear you on the quote and the missed call-back. We'd like to understand what happened. Please contact our Customer Care Manager on 0400 000 111 or care@example.com.

*(Kept out on purpose: no admission of fault, no offer of money back, no job or price details beyond what Sam wrote.)*

---

## Check before you use

- **[CHECK] items:** none
- **Assumptions:** star ratings taken as given in the pasted text.
- **Needs a human decision:** Review 2 (Mark) names a staff member negatively. The Customer Care Manager should talk to the team and decide whether, and how, to reply publicly.
- Copy each reply into the platform yourself once you're happy with it.
- Nothing has been posted.
