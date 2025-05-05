---
title: Onboarding Logic Blueprint
version: "1.0"
author:
  - Chris Anderson
updated: 2025‑05‑05
---
# Onboarding Logic Blueprint – Connected Health (v1.0)

**Owner:** @Architect
**Prepared:** 2025‑05‑05
**Status:** **FINAL** – ready for @Developer implementation

---

## 1 · Purpose

Clarifies where onboarding logic lives across GravityForms, Make.com, Supabase, and GoHighLevel so Rubico can implement without ambiguity.

---

## 2 · Process Overview (10‑Step)

| #  | System           | Action                                                                                   |
| -- | ---------------- | ---------------------------------------------------------------------------------------- |
| 1  | **GravityForms** | Member submits Sleep (ID 55) or Stress (ID 56) quiz                                      |
| 2  | GravityForms     | Webhook ⇒ Make.com (JSON payload, includes hidden `{sleep_score}` or `{stress_score}`)   |
| 3  | **Make.com**     | Parse, lookup `member_id` via email in Supabase REST API                                 |
| 4  | Make.com         | **Insert** into `assessments` (`member_id`, `sleep_quality_score`, `stress_level_score`) |
| 5  | Make.com         | Compare score to thresholds table (§3)                                                   |
| 6  | Make.com         | Apply `quiz::<system>` tag via GoHighLevel API                                           |
| 7  | Make.com         | If score ≥ triage threshold → apply `triage::<system>` tag                               |
| 8  | **GoHighLevel**  | `triage::<system>` tag triggers *Triage Series* (3‑email micro‑nurture + coach task)     |
| 9  | **Supabase**     | RLS‑safe row auto‑timestamped; dashboards read directly                                  |
| 10 | **Events Log**   | Make writes sync status to `events_log` (success / fail)                                 |

---

## 3 · Quiz Thresholds & Tag Rules

| Quiz              | Form ID | Score Field      | Threshold Bands                                                       | Triage Trigger                                 |
| ----------------- | ------- | ---------------- | --------------------------------------------------------------------- | ---------------------------------------------- |
| **Sleep Quality** | 55      | `{sleep_score}`  | **Poor** 1‑5 · **Fair** 6‑7 · **Good** 8‑10                           | `triage::sleep` on **Poor**                    |
| **Stress Level**  | 56      | `{stress_score}` | **Healthy** 1‑5 · **Mild** 6‑25 · **Moderate** 26‑38 · **Severe** 39+ | `triage::stress` on **Moderate** or **Severe** |

*Radio choices already carry weights 0‑4, so no extra math in Make.*

---

## 4 · Supabase Mapping

Source: `README.md` schema index. Key tables used by onboarding logic:

| Table         | Key Columns (relevant)                                                                                              | Notes                                                           |
| ------------- | ------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------- |
| `members`     | `member_id` UUID PK, `email`                                                                                        | System‑wide FK anchor                                           |
| `assessments` | `member_id` FK, `sleep_quality_score` SMALLINT, `stress_level_score` SMALLINT, `created_at` TIMESTAMP DEFAULT now() | Stores raw quiz scores                                          |
| `events_log`  | `event_id`, `member_id`, `event_type`, `payload`, `created_at`                                                      | Make writes “quiz\_sync\_success” / “…\_failure” rows           |
| *others*      | `module_engagements`, `lab_activity_log`, `membership_tier_history`                                                 | Not touched by onboarding scenario but referenced by dashboards |

**Insert Example:**

```sql
INSERT INTO assessments (member_id, sleep_quality_score, stress_level_score)
VALUES (:member_id, :sleep_score, :stress_score);
```

---

## 5 · GoHighLevel Configuration

* **Tags to Create**

  * `quiz::sleep` · `quiz::stress`
  * `triage::sleep` (Poor)
  * `triage::stress` (Moderate + Severe)

* **Workflows**

  1. **Triage Series** – Trigger: `triage::<system>` tag; 3‑email sequence; task to coach if no click in 48 h.
  2. **Tag Cleanup** – Remove `triage::<system>` tag on series completion to prevent looped re‑entry.

---

## 6 · Observability & Error Handling

* Make.com Scenario sends status JSON (`member_id`, `form_id`, `status`, `error_message`) ⇒ `events_log`.
* Slack **#ch‑alerts** channel receives Make error notifications.
* Supabase row‑level security ensures only backend service role can write to `assessments`.


---

### Approval
> Sign‑off below and forward to **@Developer** with `/build onboarding-logic`.

| Role          | Name  | Signature               | Date       |
| ------------- | ----- | ----------------------- | ---------- |
| Architect     | Chris | Christopher E. Anderson | 2025‑05‑05 |
