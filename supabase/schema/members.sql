-- Supabase Table: members
-- Version: v1.0 (May 2025)
-- Description: Stores identity, contact info, and basic biometric metadata

create table if not exists members (
  member_id uuid primary key default gen_random_uuid(),
  email text unique not null,
  first_name text,
  last_name text,
  dob date,
  gender text, -- 'male', 'female', 'prefer_not_to_say'
  height_cm numeric(5,2),
  weight_kg numeric(5,2),
  membership_tier_current text, -- pragmatic, pro, premium
  signup_date timestamp with time zone default now(),
  created_at timestamp with time zone default now(),
  updated_at timestamp with time zone default now()
);
