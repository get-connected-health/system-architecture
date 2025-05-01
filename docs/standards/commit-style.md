---
title: Commit Style Guidelines – Connected Health
version: 1.0
author: Chris Anderson
updated: 05/01/2025
---
# Commit Style Guidelines – Connected Health

All commit messages should be clean, structured, and easy to understand. Consistent formatting improves readability, history tracking, and changelog generation.

---

## Format

Use the following structure:

```
[type]: [short summary in lowercase, imperative voice]
```

### Example:

```
feat: add webhook for Body Systems intake
fix: correct GHL field map for gut score
docs: update CONTRIBUTING with test instructions
```

---

## Common Commit Types

| Type       | Use When...                                      |
|------------|--------------------------------------------------|
| `feat`     | Adding a new feature or endpoint                 |
| `fix`      | Bugfix, correction, or cleanup                   |
| `docs`     | Documentation-only changes                       |
| `style`    | Code formatting, whitespace, linter-only edits  |
| `refactor` | Code change that neither fixes nor adds a feature |
| `test`     | Adding or updating tests or simulations          |
| `chore`    | Tooling, build scripts, or dependency updates    |

---

## Message Style Tips

- Use the **imperative mood** ("add", not "adds" or "added")
- Keep summaries under 72 characters when possible
- Use a commit body (optional) to explain context or reasoning:

```
fix: handle null lab values in intake webhook

Labs without scores were crashing the Make scenario. This fixes with a null check and fallback.
```

---

## Commit Hygiene Rules

- **Squash** before merging if the PR has more than 3 commits
- Avoid vague messages like `update`, `misc`, or `stuff`
- Reference issues or tasks when applicable (e.g., `fix: resolve #42`)

---

## Reference

- All PRs are reviewed under `CODEOWNERS`
- Commit messages that don’t follow this format may be rejected or squashed during review

For questions or training, tag `@chris-rifm`.

