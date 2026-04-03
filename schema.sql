-- Execute este arquivo no SQL Editor do Supabase

create extension if not exists pgcrypto;

create table if not exists public.tracker_data (
  id bigint generated always as identity primary key,
  user_id uuid not null unique references auth.users(id) on delete cascade,
  math integer not null default 0,
  port integer not null default 0,
  hours integer not null default 0,
  streak integer not null default 0,
  labs integer not null default 0,
  scripts integer not null default 0,
  linux integer not null default 0,
  net integer not null default 0,
  run numeric not null default 0,
  bar integer not null default 0,
  simulados integer not null default 0,
  flex integer not null default 0,
  abd integer not null default 0,
  nata integer not null default 0,
  pmb integer not null default 0,
  last_date text,
  version text default 'cloud-1.0',
  created_at timestamp with time zone not null default now(),
  updated_at timestamp with time zone not null default now()
);

create or replace function public.set_updated_at()
returns trigger
language plpgsql
as $$
begin
  new.updated_at = now();
  return new;
end;
$$;

DROP TRIGGER IF EXISTS set_tracker_data_updated_at ON public.tracker_data;
create trigger set_tracker_data_updated_at
before update on public.tracker_data
for each row
execute function public.set_updated_at();

alter table public.tracker_data enable row level security;

DROP POLICY IF EXISTS "users_select_own_tracker" ON public.tracker_data;
create policy "users_select_own_tracker"
on public.tracker_data
for select
using (auth.uid() = user_id);

DROP POLICY IF EXISTS "users_insert_own_tracker" ON public.tracker_data;
create policy "users_insert_own_tracker"
on public.tracker_data
for insert
with check (auth.uid() = user_id);

DROP POLICY IF EXISTS "users_update_own_tracker" ON public.tracker_data;
create policy "users_update_own_tracker"
on public.tracker_data
for update
using (auth.uid() = user_id)
with check (auth.uid() = user_id);
