---
title: Onboarding Logic Blueprint
version: "1.2"
author:
  - Chris Anderson
updated: 2025‑05‑05
---
# Onboarding Logic Blueprint – Connected Health (v1.2)

**Owner:** @Architect
**Prepared:** 2025‑05‑05

> **Change‑Log v1.2**
> • Corrected Phase ordering (Phase 1 = Membership.io + Body Systems + Gut Health; Phase 2 = Sleep + Stress).
> • Added detailed *Membership.io Onboarding* spec and field‑to‑Supabase mapping.
> • Restored Body Systems & Gut Health process tables from v0 draft.
> • Consolidated tag taxonomy cross‑reference.
> • Marked unknown GF Form IDs as **TBD** (awaiting confirmation).

---

## Phase Matrix

| Phase              | Assessments / Forms                                                                                     | System                         | Go‑Live   | Notes                       |
| ------------------ | ------------------------------------------------------------------------------------------------------- | ------------------------------ | --------- | --------------------------- |
| **1 – Launch Day** | 1. Membership.io Onboarding<br>2. Body Systems Assessment (GF ID TBD)<br>3. Gut Health Quiz (GF ID TBD) | Membership.io<br>Gravity Forms | Day 0     | Must ship for MVP dashboard |
| **2 – Expansion**  | 4. Sleep Quality Quiz (GF ID 55)<br>5. Stress Level Quiz (GF ID 56)                                     | Gravity Forms                  | Sprint +1 | Adds Sleep & Stress metrics |

---

## Process Overview (Phase 1 & 2 combined)

| # | Trigger / Source                         | Tool             | Action / Logic                            | Destination      | Tags / Events                                        |
| --- | ---------------------------------------- | ---------------- | ----------------------------------------- | ---------------- | ---------------------------------------------------- |
| 1 | User submits **M.io Onboarding**         | Membership.io    | Webhook (Zapier/Make) fires on submission | Make Scenario 01 | `onboarding::complete` when Make writes to DB        |
| 2 | User submits **Body Systems Assessment** | GravityForms TBD | Webhook JSON payload                      | Make Scenario 02 | Score→`quiz::body_systems`                           |
| 3 | User submits **Gut Health Quiz**         | GravityForms TBD | Webhook JSON payload                      | Make Scenario 03 | Score→`quiz::gut` · '`triage::gut` if Severe         |
| 4 | User submits **Sleep Quality Quiz**      | GravityForms 55  | Webhook JSON payload                      | Make Scenario 04 | Score→`quiz::sleep` · `triage::sleep` if Poor        |
| 5 | User submits **Stress Level Quiz**       | GravityForms 56  | Webhook JSON payload                      | Make Scenario 05 | Score→`quiz::stress` · `triage::stress` if Moderate+ |
| 6 | Make upserts data                        | Make             | Upsert to Supabase tables (see mapping)   | Supabase         | —                                                    |
| 7 | Make applies tag(s)                      | Make → GHL API   | Apply triage & quiz tags                  | GoHighLevel      | Triggers onboarding emails / coach tasks             |
| 8 | GHL automation fires                     | GoHighLevel      | Send email series / task                  | Member / Coach   | Clears triage tag after series                       |

---

## Membership.io Onboarding (Phase 1)

| Field (UI Label)                | Supabase Table → Column       | Notes                                            |
| ------------------------------- | ----------------------------- | ------------------------------------------------ |
| **Gender**                      | `members.gender`              | Enum \ `male` `female`                           |
| **Date of Birth**               | `members.date_of_birth`       | ISO date                                         |
| **Current Height (in)**         | `members.height_in`           | Integer inches                                   |
| **Current Weight (lbs)**        | `members.weight_lb`           | Integer lbs                                      |
| **Health Goals** (multi‑select) | `member_profile.health_goals` | Array<string> (supabase text\[])                 |
| **Slug / URL**                  | `/onboarding`                 | Form ID in M.io admin = **onboarding-intake-v1** |

**Webhook Endpoint:** `https://hooks.make.com/xxxxx` (Scenario 01).
**Post‑submission Action:** Make writes member demographic row → applies `onboarding::complete` tag in GHL (starts welcome sequence).

---

## Body Systems Assessment (Phase 1)

| Item                 | Value                                                                 |
| -------------------- | --------------------------------------------------------------------- |
| GravityForms Form ID | 62                                                                    |
| Score Field          | `{body_score}` hidden field                                           |
| Threshold Bands      | *See Triangle of Health algorithm – v0 draft*                         |
| `quiz::<system>` Tag | `quiz::body_systems`                                                  |
| Triage Trigger       | `triage::<system>` (highest‑priority system ≥ Moderate)               |
| Supabase Destination | `assessments.body_systems_score`, `assessments.body_systems_priority` |

---

## Gut Health Quiz (Phase 1)

| Item                 | Value                                                      |
| -------------------- | ---------------------------------------------------------- |
| GravityForms Form ID | **82**                                                     |
| Score Field          | `{gut_score}` hidden field                                 |
| Threshold Bands      | **Healthy** 0‑7 · **Fair** 8‑14 · **Poor** 15‑20\* (TBD)\* |
| `quiz::gut` Tag      | `quiz::gut`                                                |
| Triage Trigger       | `triage::gut` on **Poor**                                  |
| Supabase Destination | `assessments.gut_score`                                    |

---

## Sleep Quality Quiz (Phase 2)

| Item                 | Value                                       |
| -------------------- | ------------------------------------------- |
| GravityForms Form ID | **55**                                      |
| Score Field          | `{sleep_score}`                             |
| Threshold Bands      | **Poor** 1‑5 · **Fair** 6‑7 · **Good** 8‑10 |
| `quiz::sleep` Tag    | `quiz::sleep`                               |
| Triage Trigger       | `triage::sleep` on **Poor**                 |
| Supabase Destination | `assessments.sleep_score`                   |

---

## Stress Level Quiz (Phase 2)

| Item                 | Value                                                                 |
| -------------------- | --------------------------------------------------------------------- |
| GravityForms Form ID | **56**                                                                |
| Score Field          | `{stress_score}`                                                      |
| Threshold Bands      | **Healthy** 1‑5 · **Mild** 6‑25 · **Moderate** 26‑38 · **Severe** 39+ |
| `quiz::stress` Tag   | `quiz::stress`                                                        |
| Triage Trigger       | `triage::stress` on **Moderate or Severe**                            |
| Supabase Destination | `assessments.stress_score`                                            |

---

## Tag Taxonomy Cross‑Reference

| Purpose               | Tag Name                                                            | Fires From                   |
| --------------------- | ------------------------------------------------------------------- | ---------------------------- |
| Onboarding complete   | `onboarding::complete`                                              | Membership.io form submit    |
| Quiz recorded         | `quiz::body_systems` · `quiz::gut` · `quiz::sleep` · `quiz::stress` | Make after GF webhook        |
| Triage alerts         | `triage::gut` · `triage::sleep` · `triage::stress`                  | Make threshold logic         |
| System focus priority | `focus::gut` · `focus::adrenal` …                                   | Make after Body Systems calc |

*(Full taxonomy lives at `/architecture/tag-taxonomy.md`; keep tag names in sync.)*

---

## Supabase Table Mapping (concise)

| Table            | Columns Added / Used                                                                      | Source                              |
| ---------------- | ----------------------------------------------------------------------------------------- | ----------------------------------- |
| `members`        | `gender`, `date_of_birth`, `height_in`, `weight_lb`                                       | M.io onboarding                     |
| `member_profile` | `health_goals` (text\[])                                                                  | M.io onboarding                     |
| `assessments`    | `body_systems_score`, `body_systems_priority`, `gut_score`, `sleep_score`, `stress_score` | GF quizzes                          |
| `events_log`     | `member_id`, `event_type`, `payload_json`                                                 | Make scenario insert per submission |

---

## Open Questions

1. @Rubico: Confirm Make webhook URLs & scenario numbers for all five flows.
2. @Rubico: Validate Supabase column names (`assessments` table) match SQL schema in repo.

---

## Completion Criteria

* All Phase 1 & Phase 2 forms mapped with accurate IDs and thresholds.
* Supabase / GHL mappings verified.
* Blueprint approved → `/build onboarding‑logic` task dispatched to Rubico.

---
