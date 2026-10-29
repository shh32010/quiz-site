-- 2026-10-29：做题历史/答题记录/错题本改为软删除
-- 清空操作只写 deleted_at；再次答错同一题时由触发器恢复错题行
begin;

alter table practice_session
  add column if not exists deleted_at timestamptz;

alter table practice_answer
  add column if not exists deleted_at timestamptz;

alter table wrong_question
  add column if not exists deleted_at timestamptz;

create index if not exists idx_practice_session_user_active
  on practice_session (user_id, started_at desc)
  where deleted_at is null;

create index if not exists idx_practice_answer_user_active
  on practice_answer (user_id, answered_at desc)
  where deleted_at is null;

create index if not exists idx_wrong_question_user_active
  on wrong_question (user_id)
  where deleted_at is null;

-- 清空后再次答错时，upsert 会更新 last_wrong_at；借此恢复软删的错题行
create or replace function revive_wrong_question() returns trigger
language plpgsql as $$
begin
  if new.last_wrong_at is distinct from old.last_wrong_at then
    new.deleted_at := null;
  end if;
  return new;
end $$;

drop trigger if exists trg_wrong_question_revive on wrong_question;
create trigger trg_wrong_question_revive
  before update on wrong_question
  for each row execute function revive_wrong_question();

commit;
