# Example: four enquiries for Northside Plumbing & Gas (fictional)

## Assumed DNA for this example
(In the business's own files; not pasted into the output.)
- `ideal-customers.md` → Best customers: "Homeowners in Melbourne's north" and "Small cafés and shops". Red flags in an enquiry: "wants cash-only work with no invoice".
- `products-services.md` → offers: "Hot water replacement", "Blocked drain clear", "Gas appliance service". What we never do: "unlicensed or non-compliant gas work".
- `business-rules.md` → Always check with a human: any red-flag enquiry, with the Operations Manager.
- `business-rules.md` → Escalation contacts by role: new enquiries, Office Manager; red flags and gas work questions, Operations Manager.

## Input (pasted)

1. Sam Example, Coburg (sam@example.com, 0400 000 101): "Our hot water system died this morning. Two-storey house, family of five. Can someone come this week?"
2. Lee Sample, Preston café owner (0400 000 102): "Kitchen sink drain keeps backing up during the lunch rush. Need it sorted before Friday."
3. Jo Example (jo@example.com): "Can you hook up my gas BBQ to the house line? Happy to pay cash, no invoice needed, keeps it cheaper for both of us."
4. Alex Sample (alex@example.com): "Need a plumber. When are you free?"

## Output (written to `outputs/enquiry-triage/2026-10-08-triage.md`)

# Enquiry triage — 2026-10-08

Summary: 1 A · 1 B · 0 C · 2 ? (all enquiries) · 1 of them red-flagged

| # | Enquiry | Grade | Segment | Red flags | Next step (offer) | Owner (role) |
|---|---|---|---|---|---|---|
| 1 | Sam, Coburg: hot water system failed | A | Homeowners in Melbourne's north | none | Call today; book a site visit for Hot water replacement | Office Manager |
| 2 | Lee, Preston café: sink drain backing up | B | Small cafés and shops | none | Call; book Blocked drain clear | Office Manager |
| 3 | Jo: gas BBQ hook-up | ? | — | "Happy to pay cash, no invoice needed" | Hold for the owner; if it goes ahead, ask question; then Gas appliance service (with an invoice) | Operations Manager |
| 4 | Alex: "Need a plumber" | ? | — | none | Ask question; then Blocked drain clear or Hot water replacement, depending on the job | Office Manager |

## Why the A's
- #1 Sam: homeowner in Coburg with a failed hot water system, wants it this week. Matches our main segment and a core offer.

## Red-flagged enquiries
Also shown in the main table above.

| # | Enquiry | Grade | Quoted phrase | Matches red flag | Next step | Owner (role) |
|---|---|---|---|---|---|---|
| 3 | Jo: gas BBQ hook-up | ? | "Happy to pay cash, no invoice needed" | wants cash-only work with no invoice | Hold; owner to decide. Gas appliance service may fit only if done the normal way, with an invoice. | Operations Manager |

## Need more information (?)
- #3 Jo: no suburb and no detail on the BBQ, so it can't be matched to a segment. Ask "Which suburb are you in, and is the BBQ a fixed outdoor unit you want connected to your home's gas supply?"
- #4 Alex: ask "What's the job, and which suburb are you in?"

## Check before you use
- **[CHECK] items:**
  - #2: [CHECK: is a café kitchen drain within Blocked drain clear, or is it commercial work?]
  - #3: [CHECK: is a BBQ connection covered by Gas appliance service?]
- **Assumptions:** Coburg and Preston are inside the service area. #2 graded B because "before Friday" may not fit the usual timeframe.
- **Needs a human decision:** #3 (red flag), for the Operations Manager. Contact details left out of this file on purpose.
- Nothing has been sent.
