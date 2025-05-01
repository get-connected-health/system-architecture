---
title: Scenario Naming Guidelines – Connected Health
version: 1.0
author: Chris Anderson
updated: 05/01/2025
---
# Scenario Naming Guidelines – Connected Health

This guide defines naming conventions for Make.com and Zapier scenarios that power intake, tagging, scoring, and CRM sync workflows.

---

## Format

Use this pattern for all scenario names:

```
[System] Area: Trigger → Destination
```

### Example:

```
[Intake] Body Systems: GF Webhook → Supabase
[Intake] Gut Health: GF → Make → GHL Tags
[CRM Sync] Labs: GHL Custom Fields → Supabase
[UX] Bonus Viewed: GHL Tag → GHL Note
```

---

## Prefix Categories

| Prefix         | Purpose                               |
|----------------|----------------------------------------|
| `[Intake]`     | Gravity Forms or frontend submissions  |
| `[CRM Sync]`   | Writes to or reads from GHL / Supabase |
| `[Labs]`       | Lab ordering, flagging, or tracking    |
| `[UX]`         | User interaction-based triggers        |
| `[System]`     | Maintenance, retry logic, fallback     |

---

## Labeling Notes

- Use **title case** for scenario names (capitalize key words)
- Use `→` to visually mark data flow (Make's visual UI aligns with this)
- Avoid duplicate names across workspaces (add suffix if needed)
- Never use `V1`, `Copy`, or `Final` in production names

---

## Optional Suffixes

Use suffixes to indicate environments or tests:

```
[Intake] Body Systems: GF → Supabase [TEST]
[CRM Sync] Labs: GHL → Supabase [STAGING]
```

---

## Anti-Patterns to Avoid

| Problematic Name | Why It’s Bad                |
|------------------|-----------------------------|
| `Form Webhook`   | Too vague                   |
| `Labs V1 Final`  | Confusing, untrackable      |
| `Intake Sync 4`  | Non-descriptive and fragile |

---

## Reference

- Scenario logic should match the flow described in `/docs/blueprints/onboarding-intake.md`
- All scenarios should include a brief internal note in Make/Zapier describing what the scenario handles and which tags or fields are involved

For architecture changes, consult `@connected-health-admin`. For naming updates, ping `@chris-rifm`.

