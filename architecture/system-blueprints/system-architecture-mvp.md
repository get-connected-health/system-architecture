---
title: Connected Health – System Architecture (MVP Pivot)
version: 1.2
last-updated: 2025-04-29
author: Chris Anderson
replaces: Data-Flow Map v1.1 + Form Interaction Map v1.2
---

# Connected Health – System Architecture (MVP Pivot)

## Purpose

This document locks the **GravityForms → Make.com → Supabase → GoHighLevel → Membership.io** integration architecture for the Connected Health MVP launch by July 31, 2025.

It supersedes all prior drafts of the Data-Flow Map (v1.1) and Form Interaction Map (v1.2).

---

## 1. High-Level System Architecture
┌───────────────────────────┐

│  GravityForms (WordPress) │  <─ Member completes Tripwire checkout + Assessments

└──────────┬────────────────┘
│  JSON webhook (Make.com)
┌──────────▼──────────────┐
│     Make.com (iPaaS)    │  – Scenario 01: GF → Supabase
│                          │  – Scenario 02: Supabase → GHL sync
│                          │  – Scenario 03: M.io onboarding → Supabase
└──────────┬───────────────┘
│ upsert
┌──────────▼──────────────┐
│  Supabase (Postgres + RT)│   ← **System-of-Record** (6 MVP tables)
└──────────┬────┬──────────┘
│    └──────────► Slack (admin alerts)
│
└───────────────► GoHighLevel CRM  (tags + custom fields)
│
└──────────► Email / SMS automations

  Membership.io  (LMS + Forum + Read-only Dashboard v1)
       ▲
       └──── pulls scores & lab-status from Supabase via Make API---
---
## 2. Integration Scenario Blueprints

| # | Name | Trigger | Core Steps | Outputs |
|:--|:----|:--------|:------------|:--------|
| 01 | GF → Supabase Upsert | Webhook (GF submit) | Parse payload, insert/update `member_id`, map fields to Supabase tables | HTTP 200 response to GF, Slack success alert |
| 02 | Supabase → GHL Sync | Row inserted in Supabase | Detect changes, update GHL custom fields/tags, post Slack event | CRM enrichment |
| 03 | M.io → Supabase | Onboarding form submit | Parse M.io data, map to `members` table, tag in GHL | Enriched member profile |

> **Error handling:** Each scenario ends with a Slack alert if errors occur; all failures logged into `events_log` with `status = "error"`.

---

## 3. Supabase MVP Table Summaries

### 3.1 `members`
| Field | Type | Notes |
|:------|:-----|:------|
| member_id (PK) | UUID | Persistent ID across all systems |
| email | Text | Lowercased |
| first_name | Text |  |
| last_name | Text |  |
| dob | Date | From M.io onboarding |
| gender | Text | "male" / "female" / "prefer_not_to_say" |
| height_cm | Numeric(5,2) | In centimeters |
| weight_kg | Numeric(5,2) | In kilograms |
| membership_tier_current | Text | pragmatic / pro / premium |
| signup_date | Timestamp | UTC |

### 3.2 `assessments`
| Field | Type | Notes |
|:------|:-----|:------|
| id (PK) | UUID | |
| member_id (FK) | UUID | |
| assessment_type | Text | gut / stress / sleep / body_systems |
| score | Integer | Raw integer |
| version | Text | e.g., v1.0 |
| submitted_at | Timestamp | |

### 3.3 `module_engagements`
| Field | Type | Notes |
|:------|:-----|:------|
| id (PK) | UUID | |
| member_id | UUID | |
| module_code | Text | connected_cleanse, balance, etc. |
| status | Text | started / complete |
| updated_at | Timestamp | |

### 3.4 `lab_activity_log`
| Field | Type | Notes |
|:------|:-----|:------|
| lab_id (PK) | UUID | |
| member_id | UUID | |
| panel_version | Text | |
| status | Text | scheduled / results_ready |
| status_changed_at | Timestamp | |

### 3.5 `membership_tier_history`
| Field | Type | Notes |
|:------|:-----|:------|
| change_id (PK) | UUID | |
| member_id | UUID | |
| from_tier | Text | |
| to_tier | Text | |
| effective_date | Date | |
| source_trigger | Text | user / admin / billing |

### 3.6 `events_log`
| Field | Type | Notes |
|:------|:-----|:------|
| id (PK) | UUID | |
| member_id | UUID | Nullable |
| event_type | Text | gf_submit / mioprofile / sync_error |
| payload_json | JSONB | Raw snapshot |
| status | Text | success / error |
| created_at | Timestamp | Default `now()` |

---

## 4. Form Interaction Matrix

| Form (Location) | Status | Supabase Table | GHL Field/Tag |
|:----------------|:-------|:---------------|:--------------|
| Tripwire Checkout (GF) | ✅ Live | `members` | `stage::tripwire` |
| Body Systems Assessment (GF) | ✅ Live | `assessments` | `assessment::complete::body_systems` |
| Gut Quiz (GF) | ✅ Live | `assessments` | `gut_score_latest` |
| Stress Quiz (GF) | ⬜ Build | `assessments` | `stress_score_latest` |
| Sleep Quiz (GF) | ⬜ Build | `assessments` | `sleep_score_latest` |
| M.io Onboarding Profile | ✅ Live | `members` | `onboarding::profile_complete` |
| Cleanse Feedback (GF) | ⬜ Week 3 | `program_feedback` | `feedback::submitted` |

---

## 5. GHL Field & Tag Mapping (Excerpt)

| Source | Destination | Notes |
|:-------|:------------|:------|
| `assessment.score` (gut) | GHL field `Gut Score Latest` | |
| `assessment.score` (stress) | GHL field `Stress Score Latest` | |
| `member.signup_date` | GHL tag `stage::member` | |
| M.io onboarding complete | GHL tag `onboarding::profile_complete` | |

---

## 6. Versioning & File Structure Notes

```plaintext
/architecture/system-blueprints/
  ├─ system-architecture-mvp_v1.2.md   # ← (this file)
  ├─ supabase-schema_v1.0.sql
  ├─ make-scenario_outlines_v0.1.md
  ├─ form-maps_v1.3.md
  └─ CHANGELOG.md
```

- SQL schema dump separately maintained.    
- Keep Make.com scenarios mapped in markdown before export.
- Maintain CHANGELOG for blueprint pivots.

---

## 7. CHANGELOG
|**Date**|**Version**|**Summary**|
|---|---|---|
|2025-04-29|v1.2 DF / v1.3 FI|Pivot to GravityForms intake, Membership.io read-only dashboard|
|2025-04-30|v1.2a|Add M.io onboarding webhook, Supabase schema refinement|
