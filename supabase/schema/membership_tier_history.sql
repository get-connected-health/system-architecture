-- Supabase Table: membership_tier_history
-- Version: v1.0 (May 2025)
-- Description: Records changes to a member's Connected Health membership tier over time

create table if not exists membership_tier_history (
  change_id uuid primary key default gen_random_uuid(),
  member_id uuid not null references members(member_id) on delete cascade,
  from_tier text,
  to_tier text,
  effective_date date,
  source_trigger text -- e.g. 'user', 'admin', 'billing'
);
