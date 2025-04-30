# Connected Health — Architecture CHANGELOG
This changelog tracks significant updates to system blueprints, data models, tag-driven logic, and platform workflows in the `/architecture/` folder.

---

## Updates

| Updated    | File                                     | Type       | Summary                                                | Version |
| ---------- | ---------------------------------------- | ---------- | ------------------------------------------------------ | ------- |
| 2025-04-29 | crm-tag-mapping.md                       | logic      | CRM Tag Mapping Matrix                                 | v1.2    |
| 2025-04-29 | fields-assessment-body-systems.md        | data-model | Field Mapping - Assessment - Body Systems              | v1.1    |
| 2025-04-29 | system-architecture-mvp.md               | blueprint  | Connected Health – System Architecture (MVP Pivot)     | v1.4    |
| 2025-04-30 | field-mapping-assessment-body-systems.md | data-model | Field Mapping - Assessment - Body Systems              | v1.1    |
| 2025-04-30 | field-mapping-quiz-gut-health.md         | data-model | Field Mapping - Quiz - Gut Health                      | v1.1    |
| 2025-04-30 | fields-quiz-gut-health.md                | data-model | Fields - Quiz - Gut Health                             | v1.1    |
| 2025-04-30 | member-object-schema.md                  | data-model | Member Object Schema                                   | v1.6    |
| 2025-04-30 | tag-taxonomy.md                          | logic      | Connected Health Tag Taxonomy                          | v1.3    |
| 2025-04-30 | member-journey-overview.md               | blueprint  | Member Journey Overview (REAL Food Journey Onboarding) | v1.1    |

---

## 🧠 Best Practices

- Add an entry when:
  - A system blueprint changes
  - A Supabase schema is added or modified
  - Tag logic or unlock flow is updated
  - A Make.com scenario or form → system flow is introduced
- Skip typo or formatting-only edits
  - Link to commits or PRs when possible:
  - Example: `data-model: expand member schema v1.7`