---
title: "Make.com Build Checklist: Body Systems Assessment -> Supabase"
author:
  - Chris Anderson
updated: 2025-04-29
---

# Make.com Build Checklist: Body Systems Assessment → Supabase

---

## **🛠 Setup in Make.com**

- **Create new Scenario**: Name it clearly (GravityForms - Body Systems Assessment Intake)
    
- **Add Webhook Trigger**:
    
    - Create a custom webhook
        
    - Copy the webhook URL
        
    - Paste it into GravityForms Webhook Add-On settings
        
    
- **Set Webhook to POST** from GravityForms
    
- **Test webhook**: Send a test submission to capture the payload structure
    

---

## **🧩 Modules to Configure**

- **JSON Parser Module** (optional but highly recommended)
    
    - Parse raw incoming webhook body for easier field mapping
        
    
- **Supabase - Create Row Module**
    
    - Connect Supabase account (if not already connected)
        
    - Target table: assessments
        
    - Map fields:
        
        - member_id (either pulled from email match or hidden field)
            
        - assessment_type → hardcode as body_systems
            
        - adrenal_score, thyroid_score, gut_score
            
        - primary_body_system
            
        - sub_system
            
        - submitted_at → now()
            
        
    
- **Slack Notification Module (Optional)**
    
    - Notify internal channel on successful submission
        
    - Example: "New Body Systems Assessment submitted for {{email}}"
        
    

---

## **⚠️ Error Handling**

- **Attach error route** from Supabase module
    
- **Slack error notification** or **Store failed submissions** (optional Make Data Store)
    
- **Set retry strategy** (optional: retry on network/server errors)
    

---

## **🔧 Post-Build Sanity Checks**

- Form submission pushes **correct data** into Supabase
    
- Field mappings match GravityForms → Supabase cleanly
    
- Slack alerts (if added) trigger on both success and error
    
- Scenario is **enabled** after testing
    
- Scenario name is clear (for future maintenance)
    
- Add brief notes to Scenario description inside Make for context
    

---

# **✅ Success =**

- New assessment records appear in Supabase immediately after form submission.
    
- No critical data fields missing.
    
- Alerts and error handling functional.