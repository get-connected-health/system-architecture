# Supabase Schema Index – Connected Health (MVP v1.0)

This folder contains fully implemented SQL schemas for Connected Health’s Supabase backend, aligned to the v1.4 system architecture.

Each file defines a standalone table. All tables use `member_id` as the primary foreign key reference across the system.

---

## Table Summary (v1.0)

| Table                     | File Name                     | Description                                                    |
| ------------------------- | ----------------------------- | -------------------------------------------------------------- |
| `members`                 | `members.sql`                 | Stores core identity and biometric info                        |
| `assessments`             | `assessments.sql`             | Records scores from Gut, Body Systems, etc.                    |
| `lab_activity_log`        | `lab-activity-log.sql`        | Tracks lab panel orders and status changes                     |
| `module_engagements`      | `module-engagements.sql`      | Tracks module progress (Cleanse, Balance, etc.)                |
| `membership_tier_history` | `membership-tier-history.sql` | Logs changes in membership tier                                |
| `events_log`              | `events-log.sql`              | Records internal events like sync failures or form submissions |

---

## Versioning Notes

* **v1.0** was built directly from `system-architecture-mvp.md` (version 1.4)
* All schemas are Supabase-native (UUID PKs, timestamp defaults, no composite keys)
* Minor aliases (e.g. `labs_orders` → `lab_activity_log`) have been reconciled for clarity

---

## Usage

To deploy any table manually:

1. Open Supabase SQL Editor
2. Paste the contents of the table’s `.sql` file
3. Click Run

> All tables are RLS-ready. No seed data included — see `/supabase/seed/` for examples.

For questions or changes, contact `@connected-health-admin` or `@chris-rifm`.
