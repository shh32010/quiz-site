-- 2026-10-30：联系作者反馈不关联具体题目，允许 feedback.question_id 为空
begin;
alter table feedback alter column question_id drop not null;
do $$ begin
  if exists (
    select 1 from information_schema.columns
     where table_name='feedback' and column_name='question_id' and is_nullable='NO'
  ) then
    raise exception 'feedback.question_id 仍为 NOT NULL';
  end if;
end $$;
commit;
