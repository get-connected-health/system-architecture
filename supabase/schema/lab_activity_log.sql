-- Supabase Table: lab_activity_log
-- Version: v1.0 (May 2025)
-- Description: Tracks lab test orders, panel versions, and status changes

create table if not exists lab_activity_log (
  lab_id uuid primary key default gen_random_uuid(),
  member_id uuid not null references members(member_id) on delete cascade,
  panel_version text,
  status text default 'scheduled', -- scheduled / results_ready
  status_changed_at timestamp with time zone,
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);
