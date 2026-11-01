---
name: invoice-follow-up
description: Drafts overdue-invoice reminders from an invoice list or export, choosing a friendly, firm or final tone by days overdue and the business's payment terms. Use for "chase overdue invoices", "payment reminders", "who owes us", or an accounts-receivable export.
---

# Invoice follow-up

From a list of open invoices, draft polite but firm payment reminders in three escalating tones, matched to how overdue each one is. **Drafts only. Nothing is sent, and nothing in the accounting system is changed.**

## Input
- A file path in `$ARGUMENTS` (for example `sandbox/sample-invoices.csv`), or a pasted list. Each row needs: customer, invoice number, amount, issue date, due date. Optional: contact, notes.
- After Session 6, a connected accounting tool, **read only**.
- If there's no input, ask: "Which invoices? Give me an export file, or paste the list."
- If a required column is missing for every row (say, no amounts), say which one in one line and stop. Do not write anything else: no overdue, band, contact or draft analysis, output file or Check before you use box. Don't guess figures.

## What it reads
- `business-dna/pricing-positioning.md`: "Minimums, deposits, payment terms" (the payment terms and how to pay).
- `business-dna/brand-voice.md`: "How we sound", "Words we avoid", "Spelling and format rules".
- `business-dna/business-rules.md`: "Never say", "Never do", "Always check with a human (with who)" (including any dollar threshold, and key customers: those listed there), "Legal and compliance notes" (any stated late fees, interest or next steps), "Escalation contacts by role".
- If any of these is missing or still has `[[FILL]]`, say which file in one line, suggest running `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders.

## Steps
1. **Set today's date.** Use the current date and state it at the top of the output ("Days overdue as at 8 October 2026"). If the person gives a different "as at" date, use theirs and say so.
2. **Read every row** and sort it:
   - **Not yet due** (due date is today or later): skip, list by invoice number only.
   - **Credit note or negative amount:** exclude, list it and say why.
   - **No due date:** work out the due date from the issue date plus the DNA payment terms, and note the assumption. If there are no DNA terms, write `[CHECK: due date]` and don't place it in a band.
   - **Partial payment in the notes:** chase the balance only, and say so in the draft. Use the balance as written in the notes. If the notes give only the amount paid, show the subtraction and add `[CHECK: balance owing]`.
3. **Calculate days overdue** = today minus due date, in calendar days.
4. **Check for HUMAN FIRST**, before choosing a tone:
   - disputed (the notes mention a dispute, complaint, query or "won't pay until…");
   - over the "always check" dollar threshold in `business-rules.md`;
   - a key customer, meaning one listed under "Always check with a human" in `business-rules.md`.
   **HUMAN FIRST, no draft:** for these write **HUMAN FIRST — no draft.** Summary: … · Reason: … · Who decides: <role from `business-rules.md`, or `[CHECK: who decides]`>.
5. **Choose the tone.** Use the DNA payment terms if they set different stages. Otherwise the default bands:
   - **1–14 days: Friendly.** A gentle reminder; it may have been missed.
   - **15–44 days: Firm.** Restates the payment terms and asks for a payment date.
   - **45+ days: Final.** Clear that this is the final reminder. Name a next step **only if** `business-rules.md` states one, word for word. Otherwise end with "Please contact us by [CHECK: date] so we can sort this out."
6. **Draft each email** with: subject, greeting (contact name if given, otherwise "Hi there"), invoice number, the amount from the export (displayed as $X,XXX.XX), due date, how to pay (from `pricing-positioning.md` or `[CHECK: how to pay]`), the tone-appropriate close, and a sign-off by role.
7. **Summarise:** total overdue (excluding not-yet-due, credit notes and disputed invoices), the disputed total shown separately, count per band, count HUMAN FIRST, and the oldest invoice.
8. Write the output file, then show the person a 3-line summary and the file path.

## Rules
- **Amounts:** keep the export's value, displayed as $X,XXX.XX (e.g. 1320.00 → $1,320.00). Never round, recalculate, add GST, or total a customer's invoices into one new figure in a draft.
- **Total overdue:** the sum of overdue amounts (balances for part-paid), **excluding** disputed invoices. Show the disputed total on its own line.
- **Fees, interest, legal action, debt collection:** mention them only if `business-rules.md` or `pricing-positioning.md` states them explicitly. Quote the DNA wording.
- Keep notes about disputes or private matters out of drafts. They belong in the summary only.
- One draft per invoice, even when one customer has several.

## Output
Write `outputs/invoice-follow-up/YYYY-MM-DD-reminders.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. Template: `templates/output.md`.

```
# Invoice reminders — <date>
Days overdue as at <date used>. Payment terms: <from DNA or [CHECK]>.

## Summary
| Invoice | Customer | Amount | Due | Days overdue | Band |
Total overdue (excl. disputed): $… · Disputed (shown separately): $…
Friendly: n · Firm: n · Final: n · HUMAN FIRST: n
Oldest: <invoice>, <days> days
Skipped (not yet due): … · Excluded (credit notes): …

## HUMAN FIRST — no draft
- <invoice> — <customer>: **HUMAN FIRST — no draft.** Summary: … · Reason: … · Who decides: <role>

## Drafts (not sent)
### <invoice> — <customer> — <Band>, <days> days
To: <contact or [CHECK: contact]>
Subject: …
<email>

## Check before you use
- **[CHECK] items:** each placeholder
- **Assumptions:** due dates worked out, balances used, "as at" date
- **Needs a human decision:** each HUMAN FIRST invoice and why
- Nothing has been sent.
```

## Never
- Send emails, or change, void or mark anything in the accounting system. Drafts only.
- Threaten debt collection, legal action, interest or late fees unless the DNA states them explicitly.
- Recalculate or change amounts. Use the export's figures, displayed as $X,XXX.XX.
- Make up payment details, bank accounts, due dates, contacts or payment terms. Use `[CHECK: …]`.
- Give legal or financial advice about recovering debts. Flag it: "Have your adviser check this."
- Copy notes about disputes, hardship or personal circumstances into a draft.
- Ask for or store card numbers or bank passwords.

## Edge cases
- **Missing due date:** DNA terms from the issue date; note the assumption.
- **Partial payment:** chase the balance only and say so in the draft.
- **Credit note or negative line:** exclude it and mention it in the summary.
- **Due today:** not overdue yet; skip it.
- **Dates in different formats:** read as Australian day/month/year. If a date could be either way (03/04), add `[CHECK: date format]`.
- **Nothing overdue:** say so, write a short output with the summary and the Check box, no drafts.

Worked example: see `examples/sample-1.md`.
