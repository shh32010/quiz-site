-- 2026-10-26：反馈 27「题目相同」处理
-- 336899 是 335843 的 OCR 副本（题干多“17”、A 选项多“运营商”），软删 336899
-- 备份：/opt/quiz-backups/feedback_duplicate_336899_20261026.csv
begin;

do $$
declare
  n int;
begin
  select count(*) into n from t_question
   where id = 336899 and not deleted and not is_golden;
  if n <> 1 then raise exception '336899 不是可软删的活跃非金标题'; end if;
end $$;

update t_question
   set deleted = true
 where id = 336899 and not is_golden and not deleted;

do $$
declare
  n int;
begin
  select count(*) into n from t_question
   where id = 336899 and deleted;
  if n <> 1 then raise exception '336899 软删失败'; end if;

  select count(*) into n from t_question
   where not deleted and review_status = 'ok';
  if n <> 44569 then raise exception '活跃题总数异常：期望 44569，实际 %', n; end if;
end $$;

update feedback
   set status = 'handled',
       admin_note = '已确认 336899 为 335843 的 OCR 重复副本，已软删 336899，保留 335843。',
       handled_at = now()
 where id = 27 and status = 'open';

do $$
declare
  n int;
begin
  select count(*) into n from feedback where id = 27 and status = 'handled';
  if n <> 1 then raise exception '反馈 27 状态更新失败'; end if;
end $$;

commit;
