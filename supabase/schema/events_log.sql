-- Supabase Table: events_log
-- Version: v1.0 (May 2025)
-- Description: Logs form submissions, sync events, and internal system activity

create table if not exists events_log (
  id uuid primary key default gen_random_uuid(),
  member_id uuid references members(member_id), -- nullable
  event_type text not null, -- gf_submit / mioprofile / sync_error
  payload_json jsonb,
  status text default 'success', -- success / error
  created_at timestamp with time zone default now()
);