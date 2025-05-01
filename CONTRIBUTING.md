---
title: Contributing to Connected Health
version: 1.0
author: Chris Anderson
updated: 05/01/2025
---
# Contributing to Connected Health
Welcome — and thank you for collaborating with the Connected Health development team. This guide outlines how to contribute effectively and responsibly to this repository.

---

## Pull Request Process
1. **Branch from**: `main`
2. **Use clear branch naming**:
   ```
   feature/[short-name]
   bugfix/[short-name]
   hotfix/[ticket-or-date]
   ```
3. **Write clean commits**:
   ```
   feat: add webhook validation logic
   fix: correct field map typos
   ```
4. **Submit a pull request**:
   - PRs must pass CODEOWNERS review before merge
   - Do not merge your own PR — wait for approval

---

## Testing Requirements

- Run all test workflows (e.g. Make, webhook simulation) before opening PRs
- QA team must verify integration functionality if your PR affects logic flow
- Functional test > unit test — this is a low-code integration repo

---

## Branch Prefix Table

| Type     | Prefix     |
|----------|------------|
| Feature  | `feature/` |
| Bugfix   | `bugfix/`  |
| Hotfix   | `hotfix/`  |

---

## Code of Conduct

We operate with speed, clarity, and care. Respect fellow contributors. Raise blockers early. Do not push to protected branches.

---

## 📚 Related Docs

- [Access Policy](../docs/policies/access-policy.md)
- [Team Responsibilities](../docs/policies/teams.md)
- [Standards & Naming](../docs/standards/naming-conventions.md)

---

For help or questions, tag `@chris-rifm` or `@connected-health-admin`.

