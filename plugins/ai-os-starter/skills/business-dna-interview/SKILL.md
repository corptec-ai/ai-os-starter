---
name: business-dna-interview
description: Interviews the business owner and drafts or updates their Business DNA files (brand voice, ideal customers, products and services, pricing, business rules) from their materials and answers. Use when someone says "build my business DNA", "set up my brand voice", "fill in my business profile", or when other skills report missing DNA.
---

# Business DNA interview

Turn what the owner already has (the materials in `inbox/` plus their answers) into the five Business DNA files, in about 40 minutes, without the owner facing a blank page. **Draft first, ask second.** The AI drafts every heading from their materials, then asks only about the gaps.

## Input
- `inbox/`, read in full: website copy, price lists, quotes, proposals, emails, brand guides, procedures. PDF, Word and pasted text all count. Ignore `inbox/README.md`. List and read files with the file tools, never a shell command.
- Word files: ask the owner to save as PDF or paste the text (reading .docx needs a permission prompt).
- Optionally, one DNA file named in `$ARGUMENTS` to redo just that one: `brand-voice` (or "voice"), `ideal-customers` ("customers"), `products-services` ("products", "services"), `pricing-positioning` ("pricing"), `business-rules` ("rules"). With no argument, do all five in order.
- The existing `business-dna/*.md`. On a re-run, **update rather than restart**: keep what's filled, work on the `[[FILL]]` headings and anything the new materials change.

## What it writes
- The five files in `business-dna/`, using the headings already in each file (the kit's headings). Never rename, drop or reorder a heading. Template: `templates/output.md`.
- A sources log at `outputs/business-dna-interview/YYYY-MM-DD-sources.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on.

## Steps
1. **Read `inbox/`.** Say what you found in 3 lines at most, e.g. "Your website, a 2025 price list, 4 quotes and 5 customer emails."
   - **If `inbox/` is empty,** ask: "There's nothing in your inbox folder yet. What's your website address? (Return to skip and work from the interview alone)". If they give a web address and this session can open web pages, read the public pages only (home, services, about, pricing). If it can't, ask them to paste the text instead.
   - **If the materials cover more than one brand,** ask which brand this workspace is for. One workspace, one brand. Set the others aside.
   - **If the business is in a regulated industry** (health, finance, legal), note it now for step 6.
2. **Work through the files in this order:** brand voice → ideal customers → products and services → pricing → business rules. For each file:
   - **Draft every heading** from the materials. Summarise; never paste whole documents.
   - **Show the draft in short form:** one or two lines per heading, with gaps shown as `[[FILL]]`.
3. **Ask gap questions, one at a time.** Ask only where the materials are silent or contradict each other.
   - **At most 5 questions per file.** If a gap is still open after 5, leave `[[FILL]]` and move on. The session is timed. Keep the whole interview **under 25 questions**, counting the website and brand questions.
   - **Every question has a suggested answer** they can accept with Return, e.g. "Your 2025 price list says $165/hr but two quotes use $180. Which is current? (Return for $180, the newer one)".
   - **Contradictions** (old versus new prices, two different payment terms): always ask. Record the answer and today's date in the file, e.g. "Labour $180/hr inc. GST (confirmed 2026-11-11)".
   - If the owner says they'd rather write a file themselves, let them. Afterwards offer to tidy it to the headings, changing nothing else.
4. **Brand voice comes from evidence.**
   - **"We say":** quote 2 real phrases, word for word, from their own emails or website. Take out any customer names.
   - **"We don't say":** show 3 alternative phrasings of one of their sentences (e.g. stiff, salesy, over-casual) and ask which ones don't sound like them. What they reject becomes "we don't say". This counts as one question.
   - Traits must be specific to this business ("tells you the price upfront"), not generic ("friendly, professional").
5. **Pricing:** only rates the materials state or the owner confirms. Never suggest a price, a rate or a discount yourself. Unknown means `[[FILL]]`.
6. **Business rules are owner-stated only.** Ask directly: "What should the AI never say? Never do? What must a person always check, and who?" Offer these 6 to tick, one line each:
   - discounts · refunds · legal claims · health and safety advice · naming staff · promising dates.
   - Use roles, never names: "Refunds: Operations Manager".
   - **Never invent compliance obligations.** "Legal and compliance notes" holds only what the owner states or their own materials say; otherwise `[[FILL]]`.
   - **Regulated industry:** add "Always check with a human: anything that could be advice", and tell them you've added it.
7. **Write each file only after a "yes".** Show a summary (what's filled, what's still `[[FILL]]`), then ask "Write <file>? (yes / change something)". Keep each file under about 80 lines.
8. **Write the sources log**: for every section, which inbox file (or "owner's answer") each fact came from. It must contain the exact line `Questions asked: <n>`, where n counts every question put to the owner, including the website and brand questions. A merged follow-up ("and who approves it?") counts as its own question.
9. **Close with a summary:** what's filled, what's still `[[FILL]]`, the sources log path, then: "Type `/context` to see these load."

## Approval points
- **Before writing each DNA file,** show its summary and get a "yes". The safety file also asks before any change to `business-dna/`.
- **Before overwriting a file that has no `[[FILL]]` left,** show what will change, line by line ("was … / now …"), and ask again.
- Default for any write question is **no**: Return means "show me again", not "write it".

## Automated test runs
If the request includes "This is an automated test run", don't wait for answers.
- If the request includes scripted answers, use them in order.
- Otherwise use the suggested answer you would have offered for each question, and mark each one in the DNA `[CHECK: test-run default, owner to confirm]`.
- Still count questions (the 5-per-file cap applies) and list each one with the answer used in the sources log.
- Still write all five files and the sources log, with no "yes" step. Business rules from the 6 tick-box items go under "Always check with a human" marked `[CHECK: …]`; never invent compliance notes or prices.
- The safety file still asks before DNA writes; never work around it.
- If `inbox/` is empty, don't ask for a website. Draft from nothing, leave `[[FILL]]` and say so.

## Output
On screen: the closing summary. In files: the five DNA files and the sources log (see `templates/output.md`).

```
# Business DNA sources — <date>
| File | Section | Came from |
## Questions asked
Questions asked: <n>
## Check before you use
- **[CHECK] items:** each `[CHECK: …]` left in the DNA
- **Assumptions:** e.g. "newest price list treated as current"
- **Needs a human decision:** each heading still `[[FILL]]`, contradictions not settled
- Nothing has been sent.
```

## Never
- Paste whole documents into the DNA. Summarise.
- Put staff personal phone numbers, home addresses, personal emails or customer names into the DNA. Use roles, e.g. "Ops manager".
- Set a price or rate the owner hasn't confirmed and that isn't in their materials.
- Ask more than 5 questions on any one file, or more than one question at a time.
- Invent rules, compliance obligations, testimonials or facts. Unknown means `[[FILL]]`.
- Write to anywhere except `business-dna/` and `outputs/business-dna-interview/`.
- Send, post or contact anyone. Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Materials contradict each other:** ask, then record the answer and its date.
- **Multi-brand business:** ask which brand. One workspace, one brand.
- **The owner wants to write a file themselves:** let them, then offer to tidy it to the headings.
- **Regulated industry (health, finance, legal):** add "Always check with a human: anything that could be advice" by default, and tell them.
- **Sensitive material in `inbox/`** (bank details, medical notes, passwords): don't use it, and suggest they remove it.
- **A DNA file is missing:** recreate it with the kit headings (see `templates/output.md`), then carry on.
- **Inbox has a customer's name in a great phrase:** quote the phrase, drop the name.

Worked example: see `examples/sample-1.md`.
