# All Markdown and Policy Docs → Owners must review
*.md                                @get-connected-health/owners

# Policies — Access, Teams, Governance
/docs/policies/                     @get-connected-health/owners

# Standards — Naming, Branching, Tagging
/docs/standards/                    @get-connected-health/dev

# Playbooks and SOPs
/docs/playbooks/                    @get-connected-health/ops

# Troubleshooting Guides
/docs/troubleshooting/             @get-connected-health/qa

# Core Code and Integration Logic
/src/                               @get-connected-health/dev

# Test Files or Make/Webhook Simulations
/tests/                             @get-connected-health/qa

# Fallback — everything else requires Owners
*                                   @get-connected-health/owners