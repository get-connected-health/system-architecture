# Connected Health Docs

Welcome to the internal documentation index for the `get-connected-health` system architecture and operational repos. This folder organizes everything your team, vendors, and contributors need to collaborate effectively.

---

## Folder Guide

### `/policies/`
Organizational rules and access controls  
- Who gets access, under what conditions  
- Role and team definitions  
- Governance and permission boundaries  

### `/standards/`
Project-wide conventions for naming, branching, tagging, and structure  
- How we build, label, and manage the codebase  
- Shared formatting and integration patterns  

Includes:
- `branch-naming.md`
- `tagging-guidelines.md`
- `commit-style.md`
- `scenario-naming.md`
- `field-maps.md`

### `/playbooks/`
Reusable checklists and procedures for common workflows  
- Release notes template and samples  
- QA protocols, contributor onboarding  

### `/troubleshooting/`
Known issues and resolution guides  
- Webhook and Make errors  
- Integration fallbacks and fixes

---

## Governance & Contributor Standards

All contributors must follow:
- [`CONTRIBUTING.md`](../CONTRIBUTING.md) – commit style, PR flow, testing checklist
- [CODEOWNERS](../.github/CODEOWNERS) – enforced team-based review rules
- [`/policies/access-policy.md`](./policies/access-policy.md) – who gets access, and how
- [`/standards/`](./standards/) – how we name, tag, and track system elements
- [`/playbooks/release-notes-template.md`](./playbooks/release-notes-template.md) – required for version tagging

For questions or suggestions, tag `@chris-rifm` or `@connected-health-admin`.

