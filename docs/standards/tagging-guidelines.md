---
title: Tagging Guidelines - Connected Health
version: 1.0
author: Chris Anderson
updated: 05/01/2025
---
# Tagging Guidelines – Connected Health

Consistent tagging helps us track feature rollouts, automate workflows, and manage state across GHL, Make, GitHub, and Membership.io.

---

## GitHub Release Tags

Use semantic versioning with milestone suffixes when appropriate.

```
v1.2          ← Minor feature bump
v1.2-onboarding-flow
v2.0-beta     ← Pre-launch test
v2.0-labs-ready
```

- Always start with `v`
- Use kebab-case suffixes if labeling functionality or rollout phase
- Match production deploys to GitHub tags

---

## GHL Tags (CRM + Workflow)

Use consistent, automation-ready tags to enable filtering, segmenting, and triggers.

```
[System] Intake: Gut Health Complete
[System] Labs: Ordered - Tier 1
[Member] Cleanse: Completed
[UX] Bonus: REAL Food Journey - Viewed
```

### Tag Categories

| Prefix         | Purpose                            |
|----------------|-------------------------------------|
| `[System]`     | Internal triggers, webhook flags    |
| `[Member]`     | Lifecycle stage or program phase    |
| `[UX]`         | Interaction tracking                |
| `[Labs]`       | Lab order status or eligibility     |

---

## Make.com / Zapier Naming (Internal Fields)

Use the same structure as GHL tags for internal filters:

```
[Trigger] Intake: Body Systems Completed
[Status] Member Score: Sleep = 23
[Tag] Cleanse: Completed
```

- All filter-based logic should use a prefix (`[Trigger]`, `[Tag]`, `[Status]`)
- Central logic routing should map tag → module with clarity

---

## Anti-Patterns to Avoid

- No spaces in GitHub tags (`v2.0 onboarding` → ❌)
- No vague labels like `Complete` or `Final` — always qualify the tag
- Don’t use date-based versions unless needed for hotfix (`v2.0.1-20250428`)

---

## Reference

- For approved GHL tags, see: `/docs/org-policies/tag-map-v1.2.md`
- For active logic filters in Make, see: `Intake → Logic Layer → Tag Conditions`

For questions or proposals, tag `@chris-rifm`.

