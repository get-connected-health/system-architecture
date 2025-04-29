---
title: Make.com Build Checklist: Gut Health Quiz -> Supabase
author:
  - Chris Anderson
updated: 2025-04-29
---

# Make.com Build Checklist: Gut Health Quiz → Supabase

---

## 🛠 Setup in Make.com

- **Create new Scenario**: Name it clearly (GravityForms - Gut Health Quiz Intake)
- **Add Webhook Trigger**:
    - Create a custom webhook
    - Copy the webhook URL
    - Paste it into GravityForms Webhook Add-On settings
- **Set Webhook to POST** from GravityForms
- **Test webhook**: Send a test submission to capture the payload structure

---

## 🧩 Modules to Configure

- **JSON Parser Module** (optional but highly recommended)
    - Parse incoming webhook for easier mapping
- **Supabase - Create Row Module**
    - Connect Supabase
    - Target table: assessments
    - Map fields:
        - member_id (pulled via email or hidden)
        - assessment_type → hardcode as 'gut_health'
        - score (final quiz score)
        - submitted_at → now()

- **Slack Notification Module (Optional)**
    - Notify admin channel on successful intake

---

## ⚠️ Error Handling

- **Attach error route** from Supabase module
- **Send Slack error alert** or **log to Make Data Store**

---

## 🔧 Post-Build Sanity Checks

- Validate correct record creation in Supabase
- Confirm Slack alert triggers
- Confirm field mapping accuracy

---

# ✅ Success =
- Gut Health quiz submissions appear in Supabase.
- No missing or mismapped fields.
- Alerts and error handling functional.
