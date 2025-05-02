# Supabase Schema – Connected Health

This folder contains versioned SQL schema files and seed data for the Supabase backend used in the Connected Health platform.

---

## Purpose

To track the structure and evolution of Supabase tables, enabling:

* Consistent schema replication across staging and production
* Easier onboarding for external vendors (e.g. Rubico)
* Reusable patterns for tagging, scoring, and intake workflows

---

## Folder Structure

```plaintext
/supabase/
├── schema/          # Table definitions (1 SQL file per table)
├── seed/            # Optional: mock data for dev/test
└── README.md        # This file
```

---

## Conventions

* **File format:** One table per file, named after the table (e.g. `members.sql`)
* **Versioning:** Schema files include a version comment header and match GitHub release milestones where possible
* **Style:** Prefer `snake_case` for field names; use `uuid` for primary keys where appropriate
* **Defaults:** Use `now()` and `gen_random_uuid()` for `created_at` and `id` where applicable

---

## Suggested Table Index

| Table             | Status   | Description                          |
| ----------------- | -------- | ------------------------------------ |
| `members`         | ✅ Added  | Core member info + contact fields    |
| `assessments`     | Planned  | Score + flag outputs from GF quizzes |
| `labs_orders`     | Planned  | Order status, tier, and tracking     |
| `dashboard_state` | Optional | Store view logic per member          |
| `system_logs`     | Optional | Internal activity tracking           |

---

## Next Steps

* Add `assessments.sql` based on `field-mapping-assessment-body-systems.md`
* Generate mock data in `/seed/` for `members`
* Document tag→field expectations for Make/GHL → Supabase flows

For schema questions, contact `@connected-health-admin`. For architecture dependencies, ping `@chris-rifm`.
