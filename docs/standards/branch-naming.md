---
title: Branch Naming Convention
last-updated: 2025-04-29
author: Chris Anderson
---

# Branch Naming Convention

To ensure clarity, traceability, and clean collaboration in the `system-architecture` repo, all Git branches must follow the format below.

---

## ✅ Prefixes and Use Cases

| Prefix | Use Case | Example |
|--------|----------|---------|
| `feature/` | New functionality, flows, integrations, or blueprints | `feature/member-dashboard-v1`, `feature/onboarding-flow-sync` |
| `fix/` | Bug fixes, sync failures, broken logic | `fix/lab-score-update`, `fix/supabase-write-error` |
| `docs/` | Markdown edits, schema versioning, README updates | `docs/member-object-v1.6`, `docs/system-blueprint-update` |
| `chore/` | Non-functional updates: repo cleanup, templates, naming | `chore/pr-template`, `chore/add-changelog` |
| `refactor/` | Logic cleanup or structural rework (no behavior change) | `refactor/form-mapping-layer` |
| `hotfix/` | Urgent fix to critical system breakage | `hotfix/slack-alert-bug`, `hotfix/onboarding-trigger` |

---

## ✅ Formatting Rules

- Use **lowercase and dashes**: `feature/gut-score-pipeline`, not `Feature/GutScorePipeline`
- Keep names descriptive but short (3–6 words max)
- Match the branch name to **the system area or feature affected**
- Never commit directly to `main` — always open a Pull Request

---

## 💡 Examples

| Task | Branch Name |
|------|-------------|
| Add lab results logic to AI Coach | `feature/ai-coach-lab-handler` |
| Fix broken GravityForms payload in Make.com | `fix/gf-make-payload-error` |
| Add Supabase journaling schema | `docs/journaling-schema-v1.0` |
| Refactor tag-to-field mapping logic | `refactor/ghl-tag-map` |
| Create README + onboarding flow outline | `docs/onboarding-flow-readme` |

---

## 📌 Related Standards

- [Pull Request Template](../../.github/PULL_REQUEST_TEMPLATE.md)
- [CHANGELOG.md](../../architecture/system-blueprints/CHANGELOG.md)

---