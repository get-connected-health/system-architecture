# Connected Health — System Architecture CHANGELOG

This changelog tracks significant updates to system blueprints, data models, integration flows, and Supabase schemas inside the `system-architecture` repository.

---

## Format

| Date | Area | Type | Summary | Version (if applicable) |
|:----|:-----|:-----|:--------|:-----------------------|
| YYYY-MM-DD | [Folder or File] | [blueprint / schema / form-map / scenario] | Short description of change | vX.X |

---

## Entries

| Date | Area | Type | Summary | Version |
|:-----|:-----|:-----|:--------|:--------|
| 2025-04-29 | system-blueprints/system-architecture-mvp.md | blueprint | Lock-in of MVP intake architecture: GravityForms → Make → Supabase → GHL → M.io | v1.2 |
| 2025-04-30 | system-blueprints/make-scenario_outlines.md | scenario | Added M.io onboarding scenario and Supabase table sync logic | v0.2 |
| 2025-05-05 | data-models/members/member-object-schema.md | schema | Clean-up of Member Object Schema fields and addition of journaling fields | v1.6 |
| 2025-05-12 | system-blueprints/form-maps.md | form-map | Finalized Stress/Sleep assessment interaction flow | v1.4 |

---

# Best Practices for Updating

- **Always add an entry** when:
  - A system blueprint materially changes
  - A Supabase table is created, altered, or versioned
  - A Make.com scenario is added, removed, or pivoted
  - New form → system interactions are mapped

- **Small doc fixes** (typos, comment clarity) **do NOT need** changelog entries.

- **Link versions to Git commits** when possible in your commit messages:
  - Example commit: `blueprint: add onboarding flow v1.2a`

---

# 🧠 Future Scalability Tip

If needed later, this `CHANGELOG.md` can be machine-parsed to auto-generate **release notes** or **system update digests** for operations or support teams.
Keep it simple now — but it's powerful long-term.

---
