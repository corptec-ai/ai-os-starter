# Example: invoice-follow-up

Fictional business: **Northside Plumbing & Gas**. Business DNA filled in:
- `pricing-positioning.md` payment terms: 14 days from invoice; pay by bank transfer (details on the invoice) or card over the phone on 0400 000 222.
- `business-rules.md`: accounts queries go to the "Office Manager". No late fees, interest or next steps are stated. No dollar threshold or key customers are listed under "Always check with a human".

Run on **8 October 2026**.

## Input (`sandbox/sample-invoices.csv`, cut down)

```
customer,invoice,amount,issue_date,due_date,contact,notes
Riverbend Cafe,INV-1041,1320.00,2026-09-01,2026-09-15,accounts@example.com,
J. Nguyen,INV-1048,385.00,2026-09-17,2026-10-01,jn@example.com,
Preston Medical Centre,INV-1022,2640.00,2026-07-27,2026-08-10,admin@example.com,
Bell St Laundromat,INV-1037,990.00,2026-09-06,2026-09-20,bell@example.com,Disputed - says leak came back
Oak Ave Body Corp,INV-1050,550.00,2026-09-10,,strata@example.com,
Harlow Dental,INV-1045,1800.00,2026-09-11,2026-09-25,office@example.com,Part paid $800.00 on 28/09; balance $1000.00
Kerr Family,INV-1052,420.00,2026-10-01,2026-10-15,kerr@example.com,
Riverbend Cafe,CN-0007,-120.00,2026-09-20,,accounts@example.com,Credit note
```

## Output (saved to `outputs/invoice-follow-up/2026-10-08-reminders.md`, drafts shortened)

# Invoice reminders — 2026-10-08

Days overdue as at **8 October 2026**. Payment terms: 14 days from invoice.

## Summary

| Invoice | Customer | Amount | Due | Days overdue | Band |
|---|---|---|---|---|---|
| INV-1022 | Preston Medical Centre | $2,640.00 | 2026-08-10 | 59 | Final |
| INV-1041 | Riverbend Cafe | $1,320.00 | 2026-09-15 | 23 | Firm |
| INV-1037 | Bell St Laundromat | $990.00 | 2026-09-20 | 18 | HUMAN FIRST |
| INV-1050 | Oak Ave Body Corp | $550.00 | 2026-09-24 (worked out) | 14 | Friendly |
| INV-1045 | Harlow Dental | $1,000.00 balance | 2026-09-25 | 13 | Friendly |
| INV-1048 | J. Nguyen | $385.00 | 2026-10-01 | 7 | Friendly |

- **Total overdue (excl. disputed):** $5,895.00
- **Disputed (shown separately):** $990.00 (INV-1037)
- **Friendly:** 3 · **Firm:** 1 · **Final:** 1 · **HUMAN FIRST:** 1
- **Oldest:** INV-1022, Preston Medical Centre, 59 days
- **Skipped (not yet due):** INV-1052
- **Excluded:** CN-0007 (credit note, -$120.00)

## HUMAN FIRST — no draft

- **INV-1037 — Bell St Laundromat — $990.00, 18 days.** **HUMAN FIRST — no draft.** Summary: customer disputes the invoice. · Reason: disputed (notes say the leak came back) · Who decides: Office Manager

## Drafts (not sent)

### INV-1022 — Preston Medical Centre — Final, 59 days overdue

**To:** admin@example.com
**Subject:** Final reminder: invoice INV-1022, $2,640.00

Hi there,

This is our final reminder that invoice INV-1022 for $2,640.00 was due on 10 August 2026 and is still unpaid. Our terms are 14 days from invoice.

You can pay by bank transfer using the details on the invoice, or by card on 0400 000 222.

Please pay or contact us by [CHECK: date] so we can sort this out.

Kind regards,
Office Manager, Northside Plumbing & Gas

*(No penalties or next step mentioned: none are stated in the business rules.)*

### INV-1045 — Harlow Dental — Friendly, 13 days overdue

**To:** office@example.com
**Subject:** Friendly reminder: balance on invoice INV-1045

Hi there,

Thanks for your payment of $800.00 on 28 September. Just a quick note that a balance of $1,000.00 remains on invoice INV-1045, which was due on 25 September 2026. If it's already on its way, please ignore this.

Kind regards,
Office Manager, Northside Plumbing & Gas

*(Drafts for INV-1041, INV-1050 and INV-1048 follow the same pattern.)*

---

## Check before you use

- **[CHECK] items:**
  - [CHECK: date] for the reply-by date in the INV-1022 final reminder
- **Assumptions:**
  - Days counted as at 8 October 2026.
  - INV-1050 had no due date. Worked out as 24 September 2026 (issue date + 14-day terms).
  - INV-1045: chasing the $1,000.00 balance as written in the notes, not the original $1,800.00.
- **Needs a human decision:** INV-1037 (Bell St Laundromat) is disputed. The Office Manager should talk to the customer before any reminder goes out.
- Amounts are taken from the export and shown as $X,XXX.XX (e.g. 1320.00 → $1,320.00). Check them against your accounting system before sending.
- Nothing has been sent.
