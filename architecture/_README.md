
# Connected Health — Architecture Folder

This folder contains all canonical technical documentation for how Connected Health systems work across platforms.

Unlike the previous split into `/system-blueprints/`, `/data-models/`, and `/system-logic/`, this flattened structure uses **metadata tags** in each file’s frontmatter to clearly indicate its function.

---
## Tag Conventions (in each file’s frontmatter)

| Tag | Purpose |
|-----|---------|
| `blueprint` | Describes platform flows, funnel logic, or automation stack |
| `data-model` | Defines table schemas, field names, and system object shapes |
| `logic` | Documents tag behavior, access rules, and workflow triggers |
| `qa` | Test procedures or validation patterns (planned) |
| `copy-logic` | Visibility conditions, module personalization rules (optional) |

Each file should include YAML frontmatter like:

```yaml
---
title: Member Journey Overview
version: 1.1
tags: [blueprint, logic]
author: Chris Anderson
updated: 2025-04-30
---
```

---
## File Inclusion Standards

- ✅ Use **one document per logical unit** (don’t nest models and blueprints unless necessary)
- ✅ Include all system-wide schemas, tag maps, and onboarding flows
- ✅ Link out to external specs, wireframes, or Make.com scenarios as needed
- ❌ Do not include execution-level Zap configs, scripts, or low-level platform exports here

---
## Find What You Need

Use [`index.md`](./index.md) to browse and filter system artifacts by tag.

Example use cases:
- 🔁 Want to know which tag unlocks the Cleanse? → Search for `access::unlocked::connected_cleanse`
- 🧱 Need the Supabase field for gut_score? → Check `member-object-schema.md`
- 🧠 Looking for the full member journey map? → See `member-journey-overview.md`

---
## Related Docs

- [Documentation Standards](../docs/_README.md)
- [Branch Naming Conventions](../docs/standards/branch-naming.md)
- [.github/PULL_REQUEST_TEMPLATE.md](../../.github/PULL_REQUEST_TEMPLATE.md)

---
