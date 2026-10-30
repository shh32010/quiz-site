-- 2026-10-30：处理反馈 51（题目 382823）
begin;

create table t_question_backup_20261030_feedback as
select * from t_question where id = 382823 and not deleted;

update t_question
   set stem = '微机主板上安装了____、主存、快存、总线等计算机主要部件。',
       analysis = '微机主板上安装了 CPU、主存、快存、总线等主要部件，故填 CPU。'
 where id = 382823;

update feedback
   set status = 'handled',
       admin_note = '题干缺少填空标记，已补全；本题与 334778 近似，但保留“快存”这一差异。',
       handled_at = now()
 where id = 51 and status = 'open';

do $$ declare n int; begin
  select count(*) into n from feedback where status = 'open';
  if n <> 0 then raise exception '仍有未处理反馈: %', n; end if;
end $$;

commit;
