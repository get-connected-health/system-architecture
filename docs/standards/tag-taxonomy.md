---
title: Connected Health Tag Taxonomy
version: "1.2"
author:
  - Chris Anderson
updated: 2025-04-29
---

# Connected Health Tag Taxonomy

## Purpose
Define a unified, cross-platform tagging structure for GHL and Membership.io that balances:
- Automation reliability
- User segmentation
- Feature access control
- Clean UX personalization

> ⚠️ Note: Tags are **secondary logic inputs only**. Core states (e.g. `membership_status`, `lab_status`) should be tracked as fields. Tags are used for **temporary, flexible flags** where structured fields are not viable.

---
> 📎 Related: See [CRM Tag Mapping Matrix](./crm-tag-mapping.md) for how tags are applied in workflows.
---

## 1. Lifecycle Tags
| Tag Name                | System      | Purpose                                  |
|------------------------|-------------|------------------------------------------|
| `stage::lead`          | GHL         | Pre-purchase funnel (cold lead)          |
| `stage::tripwire`      | GHL         | Purchased a tripwire but not joined      |
| `stage::member`        | GHL         | Active paying member                     |
| `stage::cancelled`     | GHL         | Past member, access revoked              |

---

## 2. Membership Tier Tags
| Tag Name                      | System       | Purpose                                 |
|------------------------------|--------------|-----------------------------------------|
| `tier::pragmatic`            | GHL          | Used to trigger tier-specific workflows |
| `tier::pro`                  | GHL          | --                                      |
| `tier::premium`              | GHL          | --                                      |
| `tier::migrated_from_v1`     | GHL          | Legacy mapping (optional cleanup)       |

---

## 3. Module Status Tags

| Tag Name                               | System    | Purpose                           |
| -------------------------------------- | --------- | --------------------------------- |
| `module::started::real-food-journey`   | GHL, M.io | Trial module unlocked and active  |
| `module::complete::real-food-journey`  | GHL, M.io | Trial module completed            |
| `module::started::connected_cleanse`   | GHL, M.io | Cleanse module access granted     |
| `module::complete::connected_cleanse`  | GHL, M.io | Cleanse module marked as finished |
| `module::started::balance`             | GHL, M.io | BS-1.0 Balance Module started     |
| `module::complete::balance`            | GHL, M.io | BS-1.0 Balance Module complete    |
| `module::started::revitalize-adrenal`  | GHL, M.io | BS-1.1 Module started             |
| `module::complete::revitalize-adrenal` | GHL, M.io | BS-1.1 Module complete            |
| `module::started::unwind-adrenal`      | GHL, M.io | BS-1.2 Module started             |
| `module::complete::unwind-adrenal`     | GHL, M.io | BS-1.2 Module complete            |
| `module::started::revitalize-thyroid`  | GHL, M.io | BS-1.3 Module started             |
| `module::complete::revitalize-thyroid` | GHL, M.io | BS-1.3 Module complete            |
| `module::started::unwind-thyroid`      | GHL, M.io | BS-1.4 Module started             |
| `module::complete::unwind-thyroid`     | GHL, M.io | BS-1.4 Module complete            |
| `module::started::reset`               | GHL, M.io | BS-2 Module started               |
| `module::complete::reset`              | GHL, M.io | BS-2 Module complete              |
| `module::started::strengthen`          | GHL, M.io | BS-3 Module started               |
| `module::complete::strengthen`         | GHL, M.io | BS-3 Module complete              |
| `module::started::purify`              | GHL, M.io | BS-4 Module started               |
| `module::complete::purify`             | GHL, M.io | BS-4 Module complete              |
| `module::started::harmonize`           | GHL, M.io | BS-5 Module started               |
| `module::complete::harmonize`          | GHL, M.io | BS-5 Module complete              |

> ✳️ These tags are used by Membership.io to control visibility of module pages and content blocks.

---

## 4. Access Control Tags
| Tag Name                          | System          | Purpose                                |
|----------------------------------|------------------|----------------------------------------|
| `access::unlocked::body-systems-assessment` | M.io | Enables Body Systems form visibility   |
| `access::unlocked::labs`         | M.io             | Grants access to Labs dashboard section |
| `access::locked::body-systems-assessment` | M.io | Prevents premature access              |
| `access::locked::labs`           | M.io             | Default for non-members                |

---

## 5. Assessment Flags
| Tag Name                  | System          | Purpose                                 |
|--------------------------|------------------|-----------------------------------------|
| `assessment::complete::body_systems` | GHL    | Trigger post-assessment workflows       |
| `assessment::score::bs-1.3`          | GHL    | System priority flag (BS = body system) |
| `assessment::quiz::gut_score_high`   | GHL    | Gut sub-score routing flag              |

---

## 6. Engagement & Re-engagement
| Tag Name                    | System  | Purpose                                 |
|----------------------------|---------|-----------------------------------------|
| `engagement::active`       | GHL     | Recent login, quiz, or module activity  |
| `engagement::inactive_7d`  | GHL     | No tracked event in 7+ days             |
| `engagement::milestone::30d` | GHL   | Trigger monthly survey or prompt        |
| `engagement::streak::weekly_rhythm` | GHL | 3+ reflections in a row                 |

---

## 7. Support Flags
| Tag Name                    | System  | Purpose                                 |
|----------------------------|---------|-----------------------------------------|
| `support::manual_override` | GHL     | For admin-triggered logic bypass        |
| `support::flagged`         | GHL     | Member needs human follow-up            |
| `support::lab_exception`   | GHL     | Member in lab-ineligible state          |

---

## 8. Marketing & Referral
| Tag Name                      | System | Purpose                                  |
|------------------------------|--------|------------------------------------------|
| `marketing::testimonial_ready` | GHL  | Trigger testimonial request               |
| `marketing::referral_opt_in`  | GHL  | Ready for referral program                |
| `marketing::use_case::family` | GHL  | Segment for B2C family story              |
| `marketing::use_case::employer` | GHL | Segment for B2B sales logic               |

---

## Versioning Notes
- v1.2 adds nine body systems modules
- v1.1 adds module unlock tags for Real Food Journey, Connected Cleanse, Labs, and Body Systems Assessment
- Clarifies distinction between module status (`module::*`) and access control (`access::*`)
- Retains all original v1.0 logic and mappings for lifecycle and engagement

---
