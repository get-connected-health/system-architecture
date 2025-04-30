---
title: Field Mapping - Quiz - Gut Health
version: 1.1
tags: data-model
author: Chris Anderson
updated: 2025-04-30
---
# Gut Health Quiz — GravityForms to Supabase Mapping

This table defines how GravityForms fields map to Supabase database fields.

| GravityForms Field Label | GF Field ID | Supabase Table | Supabase Field Name | Notes |
|:-------------------------|:------------|:---------------|:--------------------|:------|
| Email                    | (from JSON) | members        | email               | Primary user ID |
| Final Score              | (from JSON) | assessments    | score               | Final gut health quiz score |
| Assessment Type          | (n/a)       | assessments    | assessment_type     | Hardcoded as 'gut_health' |
| Submitted At             | (n/a)       | assessments    | submitted_at        | Timestamp now() |

---
> 📎 Related: See [GravityForms Export](../../../forms-and-integrations/gravity-forms/gf-quiz-gut-health-2025-04-29.json)

---

## Versioning Notes
- **v1.1** updates name and metadata for flattened /architecture