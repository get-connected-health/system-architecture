-- Supabase Table: assessments
-- Version: v1.0 (May 2025)
-- Description: Stores quiz scores from Gut, Stress, Sleep, and Body Systems

create table if not exists assessments (
  id uuid primary key default gen_random_uuid(),
  member_id uuid not null references members(member_id) on delete cascade,
  assessment_type text not null, -- gut / stress / sleep / body_systems
  score integer not null,
  version text, -- e.g. 'v1.0'
  submitted_at timestamp with time zone default now(),
  created_at timestamp with time zone default now()
);
