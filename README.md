# AI OS Starter

**From Corptec Technology Partners · for the *Put AI to Work in Your Business* workshop**

A starter AI operating system for small and mid-sized businesses, built on Claude Code. It gives you two things:

- **A workspace folder** that holds your Business DNA (brand voice, customers, offers, pricing, rules), your safety rules, and everything you build.
- **A library of workflows** (Claude skills) that read your Business DNA and draft real work: meeting actions, email replies, quotes and more. **Everything is a draft. Nothing is sent, deleted or paid without you.**

## Install

You need the Claude desktop app (or Claude Code) and a paid Claude plan.

**1. Get your workspace folder.** Download `my-ai-workspace.zip` from the [latest release](https://github.com/corptec-ai/ai-os-starter/releases/latest), unzip it into Documents, then open it in the Claude app's **Code** tab. Choose **Trust** if asked.

**2. Add the workflow library.** In the Code tab, click **+** → Plugins → add marketplace, and enter:

```
corptec-ai/ai-os-starter
```

Then install **ai-os-starter**. Or, in Claude Code:

```
/plugin marketplace add corptec-ai/ai-os-starter
/plugin install ai-os-starter@corptec
```

**3. Check it.** Type `/workspace-check` and press Return.

## What's inside

### Ready-made workflows

| Workflow | What it does |
|---|---|
| `/workspace-check` | Green, amber or red health check of your workspace |
| `/meeting-to-actions` | Meeting notes into decisions, actions and a follow-up email draft |
| `/email-reply-drafter` | Replies to customer emails in your voice; flags anything a person must handle |
| `/enquiry-triage` | Sorts new enquiries by fit and suggests the next step |
| `/proposal-drafter` | Quote or proposal from a brief, using your offers and pricing |
| `/social-post-writer` | Three on-brand post options from one idea |
| `/weekly-business-brief` | One-page week ahead from your calendar and email |
| `/sop-writer` | Rough notes into a step-by-step procedure |
| `/review-responder` | Replies to online reviews, calm and careful |
| `/job-ad-writer` | Job ad and screening questions in your voice |
| `/invoice-follow-up` | Overdue-invoice reminders in the right tone |

### Workshop guides (Sessions 1–8)

| Guide | What it does |
|---|---|
| `/workspace-check` | Green, amber or red health check of your workspace |
| `/business-dna-interview` | Turns your materials and answers into your five Business DNA files |
| `/dna-check` | Scores a draft against your Business DNA and says what to fix |
| `/opportunity-mapper` | Maps your recurring work and helps you pick your first workflow |
| `/workflow-blueprint` | Designs the workflow step by step and simulates it on sample data |
| `/sample-data-maker` | Makes safe, fictional sample inputs to test with |
| `/skill-builder` | Turns your blueprint into your own working workflow |
| `/lock-the-doors` | Locks your connected tools so nothing can be sent, posted or deleted through them |
| `/test-pack` | Tests your workflow on normal and unusual cases |
| `/go-live-runbook` | Writes the one-page runbook: owner, checks, how to switch it off |

*Version 0.5.0: the full workshop kit, with ten guides; all ten workflows hardened.*

## Updates

Improvements arrive through the plugin. In Claude Code, run `/plugin marketplace update corptec` to fetch the latest.

## About

Built and maintained by [Corptec Technology Partners](https://www.corptec.com.au), Melbourne. Questions about the workshop: talk to your Corptec contact.

Licence: [MIT](LICENSE). © 2026 Corptec Technology Partners Pty Ltd. Free to use, copy and adapt; provided as is, with no warranty.
