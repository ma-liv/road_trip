create table bucket_list (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) not null,
  place text not null,
  country text,
  status text not null default 'a_visiter',  -- a_visiter | visite
  note text,
  created_at timestamptz default now()
);

create table trips (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) not null,
  title text not null,
  start_date date,
  end_date date,
  countries text,
  stops jsonb not null default '[]',
  notes text,
  created_at timestamptz default now(),
  updated_at timestamptz default now()
);

create table journal_entries (
  id uuid primary key default gen_random_uuid(),
  user_id uuid references auth.users(id) not null,
  trip_id uuid references trips(id) on delete set null,
  place text,
  country text,
  entry_date date,
  title text not null,
  content text,
  created_at timestamptz default now()
);

alter table bucket_list enable row level security;
alter table trips enable row level security;
alter table journal_entries enable row level security;

create policy "select own bucket" on bucket_list for select using (auth.uid() = user_id);
create policy "insert own bucket" on bucket_list for insert with check (auth.uid() = user_id);
create policy "update own bucket" on bucket_list for update using (auth.uid() = user_id);
create policy "delete own bucket" on bucket_list for delete using (auth.uid() = user_id);

create policy "select own trips" on trips for select using (auth.uid() = user_id);
create policy "insert own trips" on trips for insert with check (auth.uid() = user_id);
create policy "update own trips" on trips for update using (auth.uid() = user_id);
create policy "delete own trips" on trips for delete using (auth.uid() = user_id);

create policy "select own journal" on journal_entries for select using (auth.uid() = user_id);
create policy "insert own journal" on journal_entries for insert with check (auth.uid() = user_id);
create policy "update own journal" on journal_entries for update using (auth.uid() = user_id);
create policy "delete own journal" on journal_entries for delete using (auth.uid() = user_id);
