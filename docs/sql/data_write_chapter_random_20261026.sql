-- 2026-10-26：章节内随机组卷
-- 为 practice_session.mode 新增 chapter_random，target_id 存章节 id
-- 回滚：删除 chapter_random 会话后，按原定义重建约束即可
begin;

do $$
declare
  n int;
begin
  select count(*) into n
    from practice_session
   where mode not in ('chapter','kp','paper','wrong','random','exam','random_exam','course','single');
  if n <> 0 then
    raise exception '存在未预期的会话 mode：% 条', n;
  end if;
end $$;

alter table practice_session drop constraint practice_session_mode_check;
alter table practice_session add constraint practice_session_mode_check
  check (mode = any (array[
    'chapter','kp','paper','wrong','random','exam','random_exam','course','single','chapter_random'
  ]));

do $$
declare
  def text;
begin
  select pg_get_constraintdef(oid) into def
    from pg_constraint
   where conrelid = 'practice_session'::regclass
     and conname = 'practice_session_mode_check';
  if def not like '%chapter_random%' then
    raise exception '约束未包含 chapter_random：%', def;
  end if;
end $$;

commit;

-- 回滚（先删除 chapter_random 会话）：
-- alter table practice_session drop constraint practice_session_mode_check;
-- alter table practice_session add constraint practice_session_mode_check
--   check (mode = any (array['chapter','kp','paper','wrong','random','exam','random_exam','course','single']));
