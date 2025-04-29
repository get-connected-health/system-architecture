# Architecture Folder

This folder contains the core **technical system architecture** for Connected Health.

It is organized to capture **system blueprints**, **data models**, **integration designs**, and **version control plans** — serving as the technical backbone for how all Connected Health platforms interoperate.

---

## 📂 Folder Structure

| Folder | Purpose |
|:-------|:--------|
| `system-blueprints/` | End-to-end flowcharts, Make.com scenarios, data intake paths, Supabase sync logic |
| `data-models/` | Schema designs for key objects (e.g., members, labs, journaling, modules) |
| `version-plans/` | Rollout, rollback, or migration planning for major architecture changes |

---

## 📌 Standards

- **One blueprint or model per file**: keep separation clean and readable.
- **Version inside documents**, not filenames.
- **Update `/system-blueprints/CHANGELOG.md`** whenever a material system flow or table changes.
- **Keep technical descriptions strategic** (no low-level config dump — unless separately versioned).

---

## 📚 Related References

- [docs/standards/branch-naming.md](../../docs/standards/branch-naming.md)
- [architecture/system-blueprints/CHANGELOG.md](./system-blueprints/CHANGELOG.md)

---