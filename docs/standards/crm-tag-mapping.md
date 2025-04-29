---
title: CRM Tag Mapping Matrix
author:
  - Chris Anderson
version: "1.0"
updated: 2025-04-29
---
# CRM Tag Mapping 
---
> 📎 Related: See [Tag Taxonomy](./tag-taxonomy.md) for full tag definitions and governance.
---
## Matrix — Connected Health Onboarding

| Stage | Event | Tag(s) Applied | Notes |
|:------|:------|:---------------|:------|
| Lead Magnet Signup | Lead nurture triggered | `lead` | All new opt-ins |
| Tripwire Purchase (3-Day Energy Reset) | Purchase complete | `tripwire::energy-reset` |  |
| REAL Food Journey Trial Start | $1 trial checkout complete | `tripwire::real-food-journey-trial` | Trial sequence initiated |
| REAL Food Journey Full Purchase | $42 full product purchase | `product::real-food-journey::full` |  |
| Connected Health Membership Purchase | Membership checkout complete | `membership::connected-health::active` | Triggers lab, assessment unlocks |
| REAL Food Journey Started | Enroll member into module | `module::real-food-journey::started` | Whether through trial or full membership |
| Body Systems Assessment Complete | Form submit | `assessment::complete::body_systems` |  |
| Connected Cleanse Start | Member onboarding to cleanse | `module::connected-cleanse::started` | Post-assessment trigger |

---

## Tag-Driven Unlock Logic

| Asset | Unlock Tag(s) Required |
|:------|:----------------------|
| REAL Food Journey Dashboard | `module::real-food-journey::started` |
| Body Systems Assessment Form | `membership::connected-health::active` |
| Lab Panel Access | `membership::connected-health::active` |
| Connected Cleanse Module | `assessment::complete::body_systems` |

---

## Versioning Notes
Version 1.0