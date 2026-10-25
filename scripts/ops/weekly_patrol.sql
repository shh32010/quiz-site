-- 每周数据巡检（只读）
-- 用法：sudo -u postgres psql -d quiz -f /opt/quiz-v2/scripts/ops/weekly_patrol.sql
\pset pager off

-- 1. 近 7 天考生报错（按题目聚合，待处理优先）
select f.question_id,
       count(*) as reports,
       min(f.created_at) as first_report,
       max(f.created_at) as last_report,
       string_agg(distinct f.type, ',') as types,
       left(max(f.content), 120) as sample
  from feedback f
 where f.created_at >= now() - interval '7 days'
   and coalesce(f.status, 'pending') <> 'ignored'
 group by f.question_id
 order by reports desc, last_report desc
 limit 50;

-- 2. 近 30 天“作答 >= 10 次且错误率 >= 85%”的题
select a.question_id,
       count(*) as attempts,
       count(*) filter (where not a.is_correct) as wrong,
       round(100.0 * count(*) filter (where not a.is_correct) / count(*), 1) as wrong_pct,
       min(a.answered_at) as first_answer,
       max(a.answered_at) as last_answer
  from practice_answer a
  join t_question q on q.id = a.question_id
 where a.answered_at >= now() - interval '30 days'
   and not q.deleted
 group by a.question_id
having count(*) >= 10
   and count(*) filter (where not a.is_correct)::numeric / count(*) >= 0.85
 order by wrong_pct desc, attempts desc
 limit 50;

-- 3. 活跃但解析/质检有 error 的题（供后续单题复核）
select qc_grade, count(*) as active_count
  from t_question
 where not deleted and review_status = 'ok'
 group by qc_grade
 order by active_count desc;
