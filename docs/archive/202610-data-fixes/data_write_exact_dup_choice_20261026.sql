-- 2026-10-26：处理“题干+选项原文完全一致”的选择题（85 组安全重复）
-- 依赖审计映射表 exact_dup_choice_map_20261026（85 行）
-- 规则：
--   1. 同章节、同答案、非金标；每题组保留 1 道
--   2. 有用户作答/会话/错题/收藏引用的一侧优先保留
--   3. 其余按 qc_grade、知识点数、解析长度、ID 选择保留
--   4. 被删题的试卷引用改到保留题（同题同选项，试卷内容不变）
--   5. 被删题的知识点关联合并到保留题
-- 备份：
--   /opt/quiz-backups/exact_dup_choice_85_questions_20261026.csv
--   /opt/quiz-backups/exact_dup_choice_85_map_20261026.csv
--   /opt/quiz-backups/exact_dup_choice_85_paper_refs_20261026.csv
--   /opt/quiz-backups/exact_dup_choice_85_kp_links_20261026.csv
begin;

do $$
declare
  n int;
begin
  select count(*) into n from exact_dup_choice_map_20261026;
  if n <> 85 then raise exception '重复映射应为 85 组，实际 %', n; end if;

  select count(*) into n from exact_dup_choice_map_20261026 m
   where exists (select 1 from t_question q where q.id = m.deleted and q.is_golden);
  if n <> 0 then raise exception '待删题中包含金标 % 道', n; end if;

  select count(*) into n from exact_dup_choice_map_20261026 m
   where exists (select 1 from practice_answer x where x.question_id = m.deleted)
      or exists (select 1 from session_question x where x.question_id = m.deleted)
      or exists (select 1 from wrong_question x where x.question_id = m.deleted)
      or exists (select 1 from favorite_question x where x.question_id = m.deleted);
  if n <> 0 then raise exception '待删题仍有用户数据引用 % 处', n; end if;
end $$;

-- 保留题 qc 较弱时，吸收被删题的解析/质检等级（当前仅 334720 这一组）
update t_question k
   set analysis = d.analysis,
       qc_grade = d.qc_grade
  from exact_dup_choice_map_20261026 m
  join t_question d on d.id = m.deleted
 where k.id = m.keeper
   and (case k.qc_grade when 'good' then 3 when 'warn' then 2 when 'error' then 1 else 0 end)
     < (case d.qc_grade when 'good' then 3 when 'warn' then 2 when 'error' then 1 else 0 end);

-- 知识点关联合并：保留题已有的关联不重复插入
insert into t_question_kp (id, question_id, kp_id, match_source, confidence)
select ((select max(id) from t_question_kp) + row_number() over (order by m.keeper, k.kp_id))::int,
       m.keeper, k.kp_id, k.match_source, k.confidence
  from exact_dup_choice_map_20261026 m
  join t_question_kp k on k.question_id = m.deleted
on conflict (question_id, kp_id) do nothing;

-- 试卷引用改到保留题；两题内容相同，试卷题量/分值不变
update exam_paper_question e
   set question_id = m.keeper
  from exact_dup_choice_map_20261026 m
 where e.question_id = m.deleted;

-- 软删重复题
update t_question q
   set deleted = true
  from exact_dup_choice_map_20261026 m
 where q.id = m.deleted
   and not q.is_golden;

do $$
declare
  n int;
begin
  select count(*) into n from t_question where not deleted and review_status = 'ok';
  if n <> 44484 then raise exception '活跃题总数异常：期望 44484，实际 %', n; end if;

  select count(*) into n from t_question where is_golden;
  if n <> 200 then raise exception '金标数异常：%', n; end if;

  select count(*) into n from t_question q
    join exact_dup_choice_map_20261026 m on m.deleted = q.id
   where not q.deleted;
  if n <> 0 then raise exception '待删题仍有未软删 % 道', n; end if;

  select count(*) into n from exam_paper_question e
    join exact_dup_choice_map_20261026 m on m.deleted = e.question_id;
  if n <> 0 then raise exception '试卷仍引用待删题 % 条', n; end if;
end $$;

commit;
