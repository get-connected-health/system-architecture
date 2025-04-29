---
title: Member Object Schema
version: "1.5"
author:
  - Chris Anderson
updated: 2025-04-25
---

# Member Object Schema 

| Field Name              | Type      | Source System                                  | Used In (System)            | Description / Trigger Logic                               |
| ----------------------- | --------- | ---------------------------------------------- | --------------------------- | --------------------------------------------------------- |
| member_id               | String    | Generated at first tripwire purchase or opt‑in | All Systems                 | Persistent identity across lifecycle                      |
| first_name              | String    | GravityForms                                   | CRM, Email                  | Captured at tripwire opt‑in                               |
| last_name               | String    | GravityForms                                   | CRM, Email                  | Captured at tripwire opt‑in                               |
| email                   | String    | GravityForms                                   | GHL, Membership.io          | Core credential + trigger for automation                  |
| lead_status             | Enum      | GHL                                            | CRM, Zapier                 | lead, tripwire, checkout_started, member                  |
| membership_status       | Enum      | GHL                                            | GHL, Membership.io          | not_started, active, paused, cancelled                    |
| membership_tier_current | Enum      | GHL / Stripe                                   | GHL, Dashboard              | pragmatic, pro, premium (plus future tiers)               |
| tier_start_date         | Date      | Stripe / Zapier                                | Audit, billing, logic flags | Timestamp of current tier activation                      |
| tier_source_system      | String    | Zapier / Manual                                | Automation tracking         | Origin of tier change event                               |
| signup_date             | DateTime  | GHL                                            | Analytics, Retention        | When user completed checkout                              |
| tag_list                | Array     | GHL                                            | GHL, Zapier, Membership.io  | All active tags — passive reference only                  |
| cleanse_complete        | Boolean   | GHL (manual/tag)                               | Re‑engagement flows         | Used to trigger next assessment                           |
| assigned_module         | String    | Algorithm Output                               | GHL, Dashboard              | Balance / Revitalize / Reset, etc.                        |
| lab_status              | Enum      | Manual + Workflow                              | Dashboard, Notifications    | See **Lab Status Enum** below                             |
| lab_panel_version       | Enum      | Manual Logic                                   | Dashboard, Scheduling       | level_1, level_2, custom_a, etc.                          |
| lab_collection_method   | Enum      | Zapier / Admin                                 | UI Instructions             | local_draw only at launch                                 |
| lab_result_link         | URL       | Fullscript Manual                              | Dashboard CTA               | Member‑facing portal link                                 |
| lab_status_updated      | Date      | Manual                                         | Audit Trail                 | Timestamp of most recent status change                    |
| group_id                | String    | GHL / Zapier                                   | All Systems                 | Links member to shared plan group (family, team, etc.)    |
| group_role              | Enum      | GHL / Manual                                   | GHL / Dashboard             | primary, child, employee, admin, dependent                |
| is_primary_member       | Boolean   | GHL                                            | CRM Logic                   | True for account holder or payer                          |
| state_code              | String    | GravityForms                                   | GHL, Zapier                 | Used to determine lab eligibility                         |
| is_lab_eligible         | Boolean   | Logic Engine                                   | Dashboard + Onboarding      | False if located in HI, NY, NJ, RI, PR                    |
| terms_accepted          | Boolean   | Zapier / Manual                                | Legal                       | True if member agreed to terms of use                     |
| terms_version           | String    | Static Field                                   | Legal                       | e.g. v1.0, v1.1                                           |
| terms_accepted_at       | Timestamp | Zapier / Manual                                | Legal                       | When member accepted terms                                |
| current_system_code     | String    | Supabase → Zapier                              | GHL, Dashboard              | Body System priority from latest assessment (e.g. BS‑1.3) |
| last_assessment_date    | Date      | Supabase → Zapier                              | GHL, Dashboard              | Last Body Systems Assessment completion date              |
| assessment_version      | String    | Supabase → Zapier                              | GHL                         | v1.0, v1.1, etc. — version of assessment form             |
| assessment_id_latest    | String    | Supabase                                       | GHL (optional reference)    | UUID of most recent assessment in Supabase                |
| gut_score_latest        | Integer   | Supabase                                       | Dashboard, AI Coach         | Latest gut health score                                   |
| gut_score_date          | Date      | Supabase                                       | —                           | Date of latest gut health submission                      |
| stress_score_latest     | Integer   | Supabase                                       | Dashboard, AI Coach         | Latest stress score                                       |
| stress_score_date       | Date      | Supabase                                       | —                           | Date of latest stress score submission                    |
| sleep_score_latest      | Integer   | Supabase                                       | Dashboard, AI Coach         | Latest sleep score                                        |
| sleep_score_date        | Date      | Supabase                                       | —                           | Date of latest sleep score submission                     |

### Lab Status Enum (for `lab_status` field)
- `not_scheduled`
- `scheduled`
- `awaiting_draw`
- `pending_lab`
- `results_ready`
- `viewed_by_user`
- `follow_up_needed`
    

---

### Logic Comments
- If `state_code` ∈ `[HI, NY, NJ, RI, PR]` → set `is_lab_eligible = false`
- Block lab scheduling UI if `is_lab_eligible = false`
- AI Coach should modify prompts if labs are ineligible (e.g., skip prep dialogue)
- Zapier or Slack workflow triggers on:
    - `lab_status = scheduled` → internal alert for tracking
    - `lab_status = results_ready` → GHL notification + Slack alert

- Use `membership_tier_current` to determine lab panel assignment rules (e.g., level_1 vs. level_2)
    

---

## Supabase Schema – `membership_tier_history`

|Field Name|Type|Description|
|---|---|---|
|change_id|UUID|Primary key|
|member_id|String|FK to Members table|
|from_tier|String|Previous tier|
|to_tier|String|Updated tier|
|effective_date|Date|When change took effect|
|source_trigger|Enum|user, admin, upsell, billing|
|notes|Text|Optional admin context|

---

## Supabase Schema – `lab_activity_log`

|Field Name|Type|Description|
|---|---|---|
|lab_id|UUID|Primary key|
|member_id|String|FK to Members table|
|panel_version|String|e.g. level_1, level_2, custom_x|
|status|String|Lab status snapshot (see enum)|
|status_changed_at|Date|Timestamp of change|
|triggered_by|String|Admin or system that triggered change|
|notes|Text|Optional annotation|

---

## Supabase Schema – `program_feedback`

|Field Name|Type|Description|
|---|---|---|
|feedback_id|UUID|Primary key|
|member_id|String|FK to Members table|
|overall_experience|Integer|1–10 rating of total program satisfaction|
|most_valuable_part|Text|Freeform answer|
|least_valuable_part|Text|Freeform answer|
|how_can_we_improve|Text|Suggestions for product improvement|
|would_you_renew|Boolean|Signal of intent to stay subscribed|
|referral_interest|Enum|yes / maybe / no|
|submitted_at|Timestamp|Survey date|
|version|String|Survey logic version|

---

## Supabase Schema – `testimonial_opportunities`

|Field Name|Type|Description|
|---|---|---|
|opportunity_id|UUID|Primary key|
|member_id|String|FK to Members table|
|source_module_code|String|Where the testimonial prompt appeared|
|snippet|Text|Captured quote or impression|
|tone_label|Enum|inspiring / practical / emotional|
|allow_marketing_use|Boolean|Permission to reuse|
|created_at|Timestamp|Timestamp of submission|
|surfaced_by|Enum|manual / AI / auto‑prompt|

---

## Supabase Schema – `friction_flags`

|Field Name|Type|Description|
|---|---|---|
|flag_id|UUID|Primary key|
|member_id|String|FK to Members table|
|module_code|String|Optional context for friction signal|
|flag_type|Enum|abandon / confusion / support-needed|
|flag_triggered_by|Enum|AI / user / auto-detection|
|auto_escalated|Boolean|Whether it triggered support ops|
|created_at|Timestamp|Time of flagging|
|notes|Text|Optional explanation|

---

## Supabase Schema – `daily_rhythm_entries`

|Field Name|Type|Description|
|---|---|---|
|entry_id|UUID|Primary key|
|member_id|String|FK to Members table|
|date|Date|Journal entry date|
|meals_logged|Boolean|Flag for food tracking participation|
|how_did_you_feel|Text|Daily mood summary|
|stress_rating|Integer|1–5 self‑rated stress level|
|energy_rating|Integer|1–5 self‑rated energy level|
|health_rating|Integer|1–5 self‑rated perceived health|
|why_you_felt_this_way|Text|Reason or narrative reflection|
|gratitude_1|Text|First gratitude entry|
|gratitude_2|Text|Second gratitude entry|
|gratitude_3|Text|Third gratitude entry|
|notes|Text|Optional catch‑all or coaching notes|
|submitted_at|Timestamp|Timestamp of form submission|

---

## Supabase Schema – `weekly_rhythm_reflections`

|Field Name|Type|Description|
|---|---|---|
|reflection_id|UUID|Primary key|
|member_id|String|FK to Members table|
|week_ending|Date|Reference week for context|
|energy_rating|Integer|1–5 weekly average rating|
|energized_days|Text|Days with best energy levels|
|sleep_impact_notes|Text|How sleep affected mood/actions|
|effortless_habits|Text|What worked automatically|
|hardest_habits|Text|High-friction practices|
|success_times|Text|Time of day best practices landed|
|stress_strategies|Text|Techniques that helped manage stress|
|food_effect_notes|Text|Noted food impact on wellbeing|
|favorite_meals|Text|Highlight meals|
|hardest_food_moments|Text|Low points in nutrition compliance|
|mindset_story|Text|Narratives driving health behavior|
|unexpected_insight|Text|Weekly “aha” moment|
|most_helpful_support|Text|External help that made a difference|
|new_habit_focus|Text|Micro‑habit for next week|
|environment_prep_plan|Text|Setup to support habit success|
|upcoming_obstacles_plan|Text|Anticipated friction and mitigation plan|
|reflection_quote_snippet|Text|Extractable quote for testimonial system|
|submitted_at|Timestamp|Time of journal completion|

---

## AI Coach Context Table (denormalized read‑model)

|Field Name|Type|Description|
|---|---|---|
|member_id|String|Used to fetch context|
|assigned_module|String|Drives coach script logic|
|current_system_code|String|BS‑1.3, etc. (determines focus)|
|gut_score_latest|Integer|Live indicator of gut health|
|stress_score_latest|Integer|Stress level measurement|
|sleep_score_latest|Integer|Sleep quality score|
|last_assessment_date|Date|Recent diagnostic touchpoint|
|cleanse_complete|Boolean|Gateway signal for introducing deeper modules|
|lab_status|Enum|Status of annual/quarterly labs|
|lab_results_json|JSON|Optional if AI is given lab data context|
|membership_plan|String|e.g. family, business, solo — can alter tone|
|module_feedback_ready|Boolean|Checks if user reflection has been captured|

---

## Versioning Notes

- **v1.5** merges all fields and tables from v1.3 and v1.4
- Adds compliance fields (`terms_*`), audit tables (`membership_tier_history`, `lab_activity_log`)
- Restores feedback & journaling schemas and AI‑Coach context removed in v1.4
- Ensures no loss of backward‑compatibility with existing data pipelines