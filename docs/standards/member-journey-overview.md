---
title: Member Journey Overview (REAL Food Journey Onboarding)
last-updated: 2025-04-29
author: Chris Anderson
---
# Member Journey Overview — Connected Health (Dual Path Model)

This document defines both entry pathways into Connected Health, integrating the REAL Food Journey as an independent trial product and accounting for direct membership purchases.

---

## 📋 Entry Paths Overview

### A) Standard Journey: Lead → Tripwire(s) → Membership

1. **Lead Magnet Opt-In**
   - Form: GHL
   - Captures first name, email
   - Triggers:
     - Stage: `lead`
     - Events: Confirmation email + Lead Nurture Sequence

2. **Tripwire #1: 3-Day Energy Reset ($7)**
   - Checkout via GHL
   - Captures name, email, phone, state
   - Post-purchase:
     - Stage: `tripwire`
     - Tag: `tripwire::energy-reset`

3. **Tripwire #2: REAL Food Journey Trial ($1 / 7 Days)**
   - Checkout via GHL
   - Triggers:
     - Tag: `tripwire::real-food-journey-trial`
   - After 7 days:
     - Offer to purchase full REAL Food Journey ($42)
     - OR upgrade to full Connected Health Membership

4. **Conversion Options Post-Trial:**
   - **Option 1:** Purchase full Real Food Journey ($42)
     - Tag: `product::real-food-journey::full`
   - **Option 2:** Upgrade to Connected Health Membership
     - Tag: `membership::connected-health::active`

5. **Post-Conversion Access if Membership Purchased:**
   - Unlock Body Systems Assessment (GravityForms)
   - Unlock Annual Lab Panel (via M.io Tag)
   - Unlock Connected Cleanse Personalization Journey

---

### B) Direct Path: Connected Health Membership Purchase

1. **Lead (optional)** → **Direct Checkout: Connected Health Membership**
   - Immediate Tags:
     - `membership::connected-health::active`
     - `module::real-food-journey::started`
   - Immediate Unlock:
     - REAL Food Journey
     - Body Systems Assessment
     - Labs
     - Connected Cleanse personalization flow

---

## 📚 Important Access Control Rules

| Item | Access Requires |
|:-----|:----------------|
| REAL Food Journey (trial) | Purchase of $1 trial |
| Full REAL Food Journey (post-trial) | Purchase of $42 product OR Connected Health Membership |
| Body Systems Assessment | Active Connected Health Membership |
| Annual Lab Panel Access | Active Connected Health Membership |
| Connected Cleanse | Triggered post-assessment with membership |

---

## 📌 Member Experience Notes

- Users who do NOT upgrade to Connected Health after the REAL Food Journey **cannot access assessments or labs**.
- Direct CH buyers get a streamlined onboarding: no friction between signup and full assessment access.
- All dashboard logic and email sequences must reflect membership status before unlocking diagnostic tools.

---