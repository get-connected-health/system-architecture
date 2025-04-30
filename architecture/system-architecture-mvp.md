---
title: Connected Health – System Architecture (MVP Pivot)
version: 1.4
tags: blueprint, data-model, logic
author: Chris Anderson
updated: 2025-04-29
---
# Connected Health — System Architecture (MVP Pivot)

---

## Purpose
This document defines the full system architecture for Connected Health’s MVP funnel, covering tag-driven access logic, Supabase schema structure, Make.com automations, and platform roles for GHL, GravityForms, and Membership.io..

It integrates corrections to:
- The lead → tripwire → membership → assessment journey
- Dual tripwire options (Energy Reset, REAL Food Journey Trial)
- Membership unlock logic for assessments, labs, and modules
- GHL and Membership.io platform integration via Make.com

This supersedes the v1.2 system blueprint and aligns with the finalized member-journey-overview.

---

#  High-Level System Blueprint

```plaintext
[Lead Magnet Opt-In (GHL Form)]
    ↓
[Tripwire: 3-Day Energy Reset OR REAL Food Journey Trial (GHL Checkout)]
    ↓
[REAL Food Journey Module Access]
    ↓
[Connected Health Membership Purchase (GHL Checkout)]
    ↓
Unlocks:
  ├─ Body Systems Assessment Form (GravityForms) — (tag: access::unlocked::body-systems-assessment)
  ├─ Labs Access — (tag: access::unlocked::labs)
    ↓
[Submit Body Systems Assessment (GravityForms)]
    ↓
Assign Post-Assessment Module:
  ├─ Balance
  ├─ Revitalize-Adrenal
  ├─ Unwind-Adrenal
  ├─ Revitalize-Thyroid
  ├─ Unwind-Thyroid
  ├─ Reset
  ├─ Strengthen
  ├─ Purify
  └─ Harmonize
    ↓
Track in Supabase:
  ├─ `members`
  ├─ `assessments`
  ├─ `module_engagements`
  └─ `events_log`
```

---

## Core Systems & Roles

| System | Role |
|:--|:--|
| GravityForms (WordPress) | Form intake for assessments (Body Systems, Gut, Stress, Sleep) |
| Make.com | Webhook catch, Supabase ingestion, GHL updates |
| Supabase | Master data record (members, assessments, labs, module engagement) |
| GoHighLevel (GHL) | CRM tagging, automations, SMS/email nurture, purchases |
| Membership.io (M.io) | Member dashboard visibility control, module access unlocks |
| Slack (Internal) | Admin alerts on errors, intakes |

---

## Integration Scenarios

| # | Name | Trigger | Core Steps | Output |
|--:|-----|:--------|:-----------|:------|
| 01 | GF → Supabase Intake: Body Systems | GF Submit | Parse payload, insert into `assessments`, Slack success | Record created |
| 02 | GF → Supabase Intake: Gut Health | GF Submit | Parse payload, insert into `assessments`, Slack success | Record created |
| 03 | GHL Purchase → Member Unlock | Checkout in GHL | Apply membership tags; trigger assessment + labs access | Member unlocked |
| 04 | Post-Assessment Module Unlock (Planned) | Assessment complete | Assign module tag based on scores | Trigger module access |

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

## Tag-Driven Unlocks (Critical Architecture)

| Tag Applied | Unlock Action | System(s) |
|:--|:--|:--|
| `module::started::real-food-journey` | REAL Food Journey dashboard visible | M.io, GHL |
| `membership::connected-health::active` | Body Systems Assessment + Labs access unlocked | M.io, GHL |
| `access::unlocked::body-systems-assessment` | Body Systems Form visible | M.io |
| `access::unlocked::labs` | Labs Dashboard Section visible | M.io |
| `module::started::[MODULE-CODE]` | Specific health optimization module unlocked | M.io, GHL |

> All unlocks must sync across GHL and M.io to maintain automation + UX consistency.

---

## Risk Watchpoints

| Risk | Mitigation |
|:--|:--|
| Tag sync failure between GHL and M.io | Implement webhook-based sync or nightly audit jobs |
| Late module assignment after assessment | Ensure Make.com scenarios apply next module tag immediately |
| GravityForms submission errors | Use Slack alerts + retry logic for Webhook failures |

---

## Future Enhancements (Post-MVP)
- Full automation of module assignment workflows
- Predictive re-engagement triggers based on inactivity (e.g., no module start within 7 days)
- Lab panel dynamic status tracking in Supabase + M.io
- Member self-service module switching (long-term)

---

# 💡 Versioning Notes

- **v1.0:** Original intake design (Searchie / Zapier vision)
- **v1.1:** Pivot to GravityForms + Make.com
- **v1.2:** MVP data model alignment (April 15)
- **v1.3:** Full onboarding unlock correction (REAL Food Journey, Membership gates, Module unlock tagging)
- **v1.4:** Updated metadata to accommodate a flattened structure for repo/architecture

---

# 📊 Related Documents

- [Member Journey Overview](./member-journey-overview.md)
- [Tag Taxonomy v1.2](./tag-taxonomy.md)
- [CRM Tag Mapping v1.2](./crm-tag-mapping.md)

---

