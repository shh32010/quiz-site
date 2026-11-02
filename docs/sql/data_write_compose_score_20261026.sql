-- 2026-10-26：全站随机组卷只抽符合大纲分值的题
-- 理论：判断 1 分，单选/多选/填空 2 分
-- 实操：判断 1 分，单选/填空 2 分，综合 6 分
-- 这样抽满 80/40 题后，卷面总分稳定为 150/80
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
    and q.score = case
      when p_subject = 4 then case p_type
        when 3 then 1 when 1 then 2 when 2 then 2 when 4 then 2 else q.score end
      when p_subject = 5 then case p_type
        when 3 then 1 when 1 then 2 when 4 then 2 when 5 then 6 else q.score end
      else q.score end
    and (p_exclude is null or q.id <> all(p_exclude))
  order by
    exists (
      select 1 from practice_answer pa
       where pa.user_id = p_user and pa.question_id = q.id
    ) asc,
    random()
  limit greatest(p_count, 0);
$function$;

commit;
