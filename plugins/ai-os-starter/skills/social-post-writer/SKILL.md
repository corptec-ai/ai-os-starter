---
name: social-post-writer
description: Writes three social media post options (LinkedIn, Facebook or Instagram) from one idea, job, photo description or update, in the business's brand voice, each with a different hook. Use for "write a post", "social content", "LinkedIn post about…", or a short idea to share.
---

# Social post writer

Turn one idea, job or piece of news into **three** on-brand post options, each with a different hook. The owner picks one, edits it and posts it themselves. Nothing is posted or scheduled.

## Input
- An idea in a sentence or two in `$ARGUMENTS`, a file path (for example `sandbox/sample-post-ideas.md`), or pasted text.
- Optional: the platform (LinkedIn, Facebook or Instagram) and the customer segment.
- If there's no input, ask: "What's the post about? A recent job, a tip, some news — one or two sentences is plenty."
- If the platform isn't given, use LinkedIn. Don't ask.
- If a file holds several ideas, ask which one to do first, and offer the first one as the default.

## What it reads
- `business-dna/brand-voice.md`: "How we sound", "Words we use", "Words we avoid", "Spelling and format rules" (emojis and hashtags live here), "One good example".
- `business-dna/ideal-customers.md`: "Best customers" (to pick the segment) and "Their problems in their words".
- `business-dna/products-services.md`: each offer's name, so the call to action points to something real.
- `business-dna/business-rules.md`: "Never say" and "Always check with a human".

If any of these files is missing or still has `[[FILL]]`, say which one in one line, suggest running `/business-dna-interview`, and carry on with `[CHECK: …]` placeholders. Never stop with an error.

## Steps
1. **Read the idea.** Note who it's about, where, and what happened. Note any names of customers or staff, addresses, or photos of people.
2. **Check it's safe to post.** If the idea is about an accident, injury, complaint, dispute, or a staff member leaving: stop and say "I'd suggest not posting about this one." Write no draft or output file; state any required business-rules escalation in the stop reply. Do not mention, invite or pre-offer a neutral public statement unless the current request asks for one.
3. **Pick the segment.** Match the idea to a segment in `ideal-customers.md` → "Best customers". If two fit equally, stop and ask: "Who's this mainly for — <segment A> or <segment B>?" with the closer match as the default.
4. **Write exactly 3 options**, one per hook type:
   - **Client confidentiality takes priority.** If `business-rules.md` forbids revealing a client, its business, location, figures or client relationship, do not write an anonymised case story; use a fully generic service example with no client-specific facts or omit the story hook. Client-specific facts are forbidden anywhere in the output, including preambles, Notes, Check items, Assumptions and Needs a human decision; refer only to “the client name”, “location” and “figure”.
   - **Story** — what happened on the job or in the business.
   - **Useful tip** — one practical thing the reader can do.
   - **Problem → solution** — a customer problem in their words, then how it gets fixed.
5. **For each option:**
   - Fit the platform length: LinkedIn up to about 150 words; Facebook up to about 80; Instagram a short caption up to about 60.
   - Use the "How we sound" traits and "Words we use". Leave out every word in "Words we avoid".
   - End with a soft call to action that matches an offer in `products-services.md` (for example "Get in touch if your hot water's on its last legs"). No hard sell.
   - Add hashtags only if "Spelling and format rules" allows them, and never more than 3.
   - Use no emojis unless "Spelling and format rules" says emojis are fine.
   - Every option touching legal, financial, tax or HR-law content must include "Have your adviser check this." in that option's Note, as well as any required referral.
6. **Run a voice and rules check on each option** and write a one-line note. Look for:
   - **A named or pictured customer or staff member** without written permission already confirmed → "Mentions <name>: written permission is required before posting." Swap the name for a neutral description in the draft ("a family in Preston").
   - **An identifiable address** in the text or photo description → "Remove house number or street."
   - **A factual assertion, customer story, operational pattern or outcome** the idea or DNA doesn't support → remove it; never use a `[CHECK]` placeholder for unsupported material. Treat “one of the jobs we do most”, “we do it all the time” and “we hear it a lot” as unsupported operational patterns unless the idea or DNA proves them; delete them rather than flagging them.
   - **Prices, dates, figures or results** not in the DNA or the input → `[CHECK: confirm the figure]`.
   - **Anything in "Never say"** or **"Always check with a human"** → flag it, naming the role to check with.
   - Before writing the file, audit the whole output, including drafts, Notes and Check before you use; delete unsupported claims, never recasting them as general knowledge or a check item.
7. **Write the output file**, then show the person the three hooks in one line each, and the file path. Ask: "Want me to tweak any of these?"

## Output
Write `outputs/social-post-writer/YYYY-MM-DD-<topic>.md`. Never overwrite: if the name is taken, add `-2`, `-3` and so on. The template is in `templates/output.md`.

```
# Social post options — <topic> — <date>
Platform: <platform> · Segment: <segment>
Draft only. Nothing has been posted or scheduled.

## Option 1 — Story
<post text>
Note: <one-line voice and rules note>

## Option 2 — Useful tip
<post text>
Note: <one-line note>

## Option 3 — Problem → solution
<post text>
Note: <one-line note>

## Check before you use
- **[CHECK] items:** in the order they appear
- **Assumptions:** platform, segment, offer the call to action points to
- **Needs a human decision:** permissions (customer or staff named or pictured), claims removed, anything to decide before posting
- Nothing has been posted.
```

## Never
- Post, schedule, publish or send anything. Drafts only. If a tool refuses an action, don't look for a way around it.
- Name or picture a customer or staff member unless written permission is already confirmed.
- Make no factual assertion, customer story, operational pattern or outcome unless the idea or Business DNA supports it; remove unsupported material.
- Use emojis unless the brand voice says so.
- Make up prices, figures, testimonials, reviews, dates or results.
- Give legal, financial or HR-law advice. If a post touches it, add "Have your adviser check this."
- Include personal details (phone numbers, emails, addresses) the post doesn't need.
- Ask for or store passwords, API keys or card numbers.

## Edge cases
- **Sensitive topic** (an accident, a complaint, a staff departure): suggest not posting; offer a neutral version only if asked.
- **Job photo with an identifiable address:** flag "remove house number or street".
- **Idea is too thin** ("post something about plumbing"): ask one question — "What happened recently that you're proud of?" — with "a tip about winter hot water" as the default.
- **Idea names a person:** keep the name only when written permission is already confirmed; otherwise replace it and state that written permission is required.
- **Platform not supported** (TikTok, X): write the three options for LinkedIn and note the assumption.
- **Brand voice says no hashtags:** use none, even if the person asks for some, and flag it for their decision.

Worked example: see `examples/sample-1.md`.
