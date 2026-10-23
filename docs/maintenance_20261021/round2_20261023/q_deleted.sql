with recursive roots as (
  select id, code as root_code from t_chapter where parent_id is null
  union all
  select c.id, r.root_code from t_chapter c join roots r on c.parent_id = r.id
)
select json_agg(row_to_json(x)) from (
  select q.id, q.stem, coalesce(q.correct, '') as correct, coalesce(r.root_code, '') as root_code
    from t_question q
    join roots r on r.id = q.chapter_id
   where not q.deleted and q.review_status = 'ok'
     and exists (select 1 from t_question_kp x where x.question_id = q.id)
     and not exists (
       select 1 from t_question_kp x
         join t_knowledge_point k on k.id = x.kp_id
        where x.question_id = q.id and not k.deleted
     )
   order by q.id
) x;
