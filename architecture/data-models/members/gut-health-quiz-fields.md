---
title: Gut Health Quiz Field Map
updated:
  - 2025-04-29
author:
  - Chris Anderson
---
# Gut Health Quiz Field Documentation

> 📎 Related: See [GravityForms Export](../../../forms-and-integrations/gravity-forms/gf-quiz-gut-health-2025-04-29.json) for raw form source.

| Field Label        | Field Type   | Required   | Visibility   | Notes   |
|:-------------------|:-------------|:-----------|:-------------|:--------|
| First Name         | text         | Yes        | Hidden       | From dashboard profile |
| Gender             | select       | Yes        | Hidden       | Auto-populated |
| Baseline           | number       | No         | Hidden       | Pre-assessment score |
| Current Score      | number       | No         | Hidden       | Current gut health score |
| Previous Score     | number       | No         | Hidden       | Last gut health score |
| Quiz Question 1    | radio        | Yes        | Visible      | Weighted scoring |
| Quiz Question 2    | radio        | Yes        | Visible      | Weighted scoring |
| Quiz Question ...  | radio        | Yes        | Visible      | Weighted scoring |
| Final Score        | calculation  | Yes        | Hidden       | Captured in Score field |
| Email              | email        | Yes        | Visible      | Primary ID |
| Program            | text         | No         | Hidden       | Membership program linked |

---
