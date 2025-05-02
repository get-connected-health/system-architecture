-- Supabase Table: module_engagements
-- Version: v1.0 (May 2025)
-- Description: Tracks member progress through assigned health modules

create table if not exists module_engagements (
  id uuid primary key default gen_random_uuid(),
  member_id uuid not null references members(member_id) on delete cascade,
  module_code text not null, -- e.g. connected_cleanse, balance, unwind_adrenal
  status text default 'started', -- started / complete
  updated_at timestamp with time zone default now(),
  created_at timestamp with time zone default now()
);
