# AGENTS.md: ai-os-starter

Owner: Corptec Technology Partners (GitHub organisation `corptec-ai`). Maintainer: Ant McCallum.

- This repo is **public** and is what workshop attendees install. Nothing internal goes in it: no build plans, no test traps, no client or attendee names, no secrets.
- Plugin: `plugins/ai-os-starter/`. Marketplace catalogue: `.claude-plugin/marketplace.json` (marketplace name `corptec`).
- Workspace template: `workspace-template/my-ai-workspace/`. It ships as the release asset `my-ai-workspace.zip`, not as a clone.
- All changes go through a pull request, and a human maintainer approves the merge. Bump `version` in `plugin.json` and add a CHANGELOG entry with every change to the plugin.
- Every skill follows the shared contract: drafts only; never send, delete or pay; no made-up facts; end with a "Check before you use" box.
- Run `claude plugin validate .` and `claude plugin validate plugins/ai-os-starter --strict` before opening a PR.
