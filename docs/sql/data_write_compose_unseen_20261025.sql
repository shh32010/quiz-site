-- 2026-10-25：随机组卷优先抽取用户未做过的题
-- 保持原有题型配比、课程占比、难度 3:5:2 不变；
-- 仅在同一抽题桶内把“该用户从未作答过”的题排在前面，不足时自动回落到做过的题。
-- 依赖索引：idx_answer_user_q (user_id, question_id)

begin;

create or replace function pick_questions_for_user(
  p_user uuid,
  p_subject integer,
  p_type integer,
  p_codes text[],
  p_count integer,
  p_difficult integer default null,
  p_exclude integer[] default null
) returns setof integer
language sql
stable
security definer
set search_path to 'public'
as $function$
  with recursive sub as (
    select id from t_chapter where not deleted and code = any(p_codes)
    union all
    select c.id from t_chapter c join sub s on c.parent_id = s.id where not c.deleted
  )
  select q.id
  from t_question q
  join sub on sub.id = q.chapter_id
  where q.subject_id = p_subject
    and q.question_type = p_type
    and not q.deleted
    and q.review_status = 'ok'
    and (p_difficult is null or q.difficult = p_difficult)
    and (p_exclude is null or q.id <> all(p_exclude))
  order by
    -- false（未做过）排在 true（做过）前面，同组内随机
    exists (
      select 1 from practice_answer pa
       where pa.user_id = p_user and pa.question_id = q.id
    ) asc,
    random()
  limit greatest(p_count, 0);
$function$;

commit;
