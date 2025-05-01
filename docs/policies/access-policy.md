---
title: Connected Health GitHub Teams
version: 1.0
author: Chris Anderson
updated: 2025-05-01
---
# Connected Health: GitHub Teams

This document defines the structure, responsibilities, and composition of all GitHub teams within the `get-connected-health` organization.

---

## Team Directory

###  `owners`
- **Role**: Admin control of all repositories and org settings
- **Members**: `connected-health-admin`, `@chris-rifm`
- **Access**: Admin across all repos
- **Responsibilities**:
  - Invite/remove collaborators
  - Set access policies and protection rules
  - Approve sensitive PRs

###  `dev`
- **Role**: All engineering and automation contributors (e.g., Rubico)
- **Access**: Write access to development repos
- **Responsibilities**:
  - Implement code and workflows
  - Submit PRs for review (never commit directly to `main`)
  - Coordinate with QA for testing cycles

### `design`
- **Role**: UI/UX, frontend layout, and styling contributors
- **Access**: Write or Read, depending on repo (e.g., design-system)
- **Responsibilities**:
  - Style and page templates
  - Figma-to-code implementations
  - Optional reviews of frontend PRs

###  `ops`
- **Role**: Project managers and operational coordinators (internal + vendor PMs)
- **Access**: Triage access to all repos
- **Responsibilities**:
  - Label, organize, and assign issues/PRs
  - Track dependencies and sprint progress
  - No code merges permitted

###  `qa`
- **Role**: Reviewers and testers for pre-release validation
- **Access**: Triage access
- **Responsibilities**:
  - Run simulation workflows
  - Log issues and edge cases
  - Confirm fixes from dev team

### 📈 `advisors`
- **Role**: Strategic stakeholders with view-only access
- **Access**: Read
- **Responsibilities**:
  - Review documentation and system maps
  - Give high-level feedback
  - No code, issues, or PR interaction
