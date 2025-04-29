---
title: CRM Tag Mapping Matrix
author:
  - Chris Anderson
version: "1.2"
updated: 2025-04-29
---
# CRM Tag Mapping Matrix
---
> 📎 Related: See [Tag Taxonomy](./tag-taxonomy.md) for tag definitions and governance.
---

## Matrix — Connected Health Onboarding

| Stage                                  | Event                        | Tag(s) Applied                         | Platform(s) | Notes                                    |
|:--------------------------------------|:-----------------------------|:---------------------------------------|:------------|:-----------------------------------------|
| Lead Magnet Signup                     | Lead nurture triggered       | `lead`                                 | GHL         | All new opt-ins                          |
| Tripwire Purchase (3-Day Energy Reset) | Purchase complete            | `tripwire::energy-reset`               | GHL         |                                          |
| REAL Food Journey Trial Start          | $1 trial checkout complete   | `tripwire::real-food-journey-trial`    | GHL         | Trial sequence initiated                 |
| REAL Food Journey Full Purchase        | $42 full product purchase    | `product::real-food-journey::full`     | GHL         |                                          |
| Connected Health Membership Purchase   | Membership checkout complete | `membership::connected-health::active` | GHL         | Triggers assessment and labs unlocks     |
| REAL Food Journey Module Started       | Enrollment into module       | `module::started::real-food-journey`   | GHL, M.io   | Module visibility unlocked |
| Body Systems Assessment Complete       | Form submit                  | `assessment::complete::body_systems`   | GHL         | Updates eligibility for Connected Cleanse |
| Connected Cleanse Module Start         | Post-assessment onboarding   | `module::started::connected_cleanse`   | GHL, M.io   | Module visibility unlocked |

---

## Tag-Driven Unlock Logic

| Asset | Unlock Tag(s) Required | Platform(s) | Notes |
|:------|:----------------------|:------------|:------|
| REAL Food Journey Dashboard | `module::started::real-food-journey` | M.io | |
| Body Systems Assessment Form | `membership::connected-health::active` | M.io | |
| Lab Panel Access | `membership::connected-health::active` | M.io | |
| Connected Cleanse Module | `assessment::complete::body_systems` | M.io | Unlocks after assessment completion |

---

## Module Unlocks (Body Systems Modules)

| Event or Module | Tag Applied                            | Unlock Target         | Platform(s) |
|:----------------|:---------------------------------------|:----------------------|:------------|
| Start Balance                  | `module::started::balance`               | Balance Module Page | GHL, M.io |
| Complete Balance               | `module::complete::balance`              | Triggers feedback email/survey | GHL |
| Start Revitalize Adrenal       | `module::started::revitalize-adrenal`    | Revitalize-Adrenal Page | GHL, M.io |
| Complete Revitalize Adrenal    | `module::complete::revitalize-adrenal`   | Triggers progress reminders | GHL |
| Start Unwind Adrenal           | `module::started::unwind-adrenal`        | Unwind-Adrenal Page | GHL, M.io |
| Start Revitalize Thyroid       | `module::started::revitalize-thyroid`    | Revitalize-Thyroid Page | GHL, M.io |
| Start Unwind Thyroid           | `module::started::unwind-thyroid`        | Unwind-Thyroid Page | GHL, M.io |
| Start Reset                    | `module::started::reset`                 | Reset Module Page | GHL, M.io |
| Start Strengthen               | `module::started::strengthen`            | Strengthen Module Page | GHL, M.io |
| Start Purify                   | `module::started::purify`                | Purify Module Page | GHL, M.io |
| Start Harmonize                | `module::started::harmonize`             | Harmonize Module Page | GHL, M.io |

> 🧠 `started` tags unlock the page in M.io; parallel tags in GHL enable onboarding emails, check-ins, or module-specific drip sequences.

---

## Versioning Notes
- Version 1.2 clarifies platform ownership (GHL + M.io) for all modules
- Version 1.1 added initial post-assessment modules
- Version 1.0 established core onboarding flow mapping

---