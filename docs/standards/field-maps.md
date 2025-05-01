---
title: Field Maps – Connected Health
version: 1.0
author: Chris Anderson
updated: 05/01/2025
---
# Field Maps – Connected Health

This document summarizes key field mappings for Connected Health’s intake flows, scoring logic, and CRM/database integration. For full schemas, see the canonical mappings in the system architecture repo.

---

## 1. Gut Health Quiz → Supabase

| GravityForms Field       | Supabase Field     | Notes                                   |
|--------------------------|---------------------|------------------------------------------|
| Email                    | `members.email`     | Primary ID (extracted from JSON)         |
| Final Score              | `assessments.score` | Gut health score                         |
| Assessment Type          | `assessment_type`   | Hardcoded as `'gut_health'`              |
| Submitted At             | `submitted_at`      | Timestamp generated at submission        |

**Supabase Tables Used:** `members`, `assessments`

> Source: `field-mapping-quiz-gut-health.md`

---

## 2. Body Systems Assessment → Supabase

| GravityForms Field                   | Supabase Field           | Notes                                      |
|--------------------------------------|---------------------------|---------------------------------------------|
| First Name                           | `members.first_name`      | Auto-populated                             |
| Total Score (aggregated)             | `assessments.score`       | Overall systems score                      |
| Assessment Type                      | `assessment_type`         | Hardcoded as `'body_systems'`              |
| Priority Tier (flag)                 | `flag_systems_status`     | Calculated tier (Red / Yellow / Green)     |
| Submitted At                         | `submitted_at`            | Timestamp generated at submission          |

**Supabase Tables Used:** `members`, `assessments`

> Source: `field-mapping-assessment-body-systems.md`

---

## 3. Naming Rules

- All GravityForms values are extracted via JSON webhook → parsed to `inputValues`
- Supabase schema uses `snake_case`
- Fields like `assessment_type` are hardcoded to track origin (`gut_health`, `body_systems`)
- Score fields are numeric (`integer`), flags are stored as `text`

---

## 4. Additional Notes

- For lab orders, cleanse scores, and future assessment types, maintain the same schema pattern
- When adding new GravityForms forms:
  - Update the field mapping doc in the architecture repo
  - Add a summarized entry here

---

**Source Files:**
- [`field-mapping-quiz-gut-health.md`](https://github.com/get-connected-health/system-architecture/blob/main/architecture/field-mapping-quiz-gut-health.md)
- [`field-mapping-assessment-body-systems.md`](https://github.com/get-connected-health/system-architecture/blob/main/architecture/field-mapping-assessment-body-systems.md)

