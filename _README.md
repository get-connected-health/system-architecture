# Connected Health - System Architecture Repository

This repository contains the technical architecture, system blueprints, form configurations, and integration logic for the Connected Health platform launch.

---

## Purpose

To maintain a clean, auditable, and collaborative version-controlled record of all technical systems supporting the Connected Health project, including:

- System blueprints and architecture diagrams
- GravityForms exports and custom scripts
- Zapier and Make.com automation documentation
- GoHighLevel tag maps and API integration notes
- Membership.io portal configuration and webhook logic
- Troubleshooting guides and playbooks for developers

This repo **does not** house marketing materials, CRM content exports, design files, or final customer-facing assets.

---

## Directory Structure

| Folder | Purpose |
| :--- | :--- |
| `/architecture/` | System blueprints, data models, rollout/version plans |
| `/forms-and-integrations/` | GravityForms configs, Zapier/Make workflows, GHL notes |
| `/docs/` | Standards, troubleshooting guides, developer playbooks |
| `/.github/` | (Optional) Issue templates, pull request templates |

Each folder contains its own `_README.md` with a description of its contents.

---

## Working Practices

- Use **feature branches** for new changes (e.g., `feature/gravity-forms-cleanse-quiz`).
- All changes must go through a **Pull Request (PR)** with a simple review before merging.
- Direct commits to `main` are **prohibited**.
- Documentation is mandatory for all new scripts, integrations, and models.

---

## Tech Stack Overview

- **Forms:** GravityForms (WordPress)
- **Automations:** Zapier / Make.com
- **CRM:** GoHighLevel
- **Membership:** Membership.io
- **Database:** Supabase (for score tracking)

---

## Questions?

Please open an Issue in this repository and assign it to the @Architect for clarification or further discussion.

---