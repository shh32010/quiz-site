with recursive roots as (
  select id, code as root_code from t_chapter where parent_id is null
  union all
  select c.id, r.root_code from t_chapter c join roots r on c.parent_id = r.id
)
select json_agg(row_to_json(x)) from (
  select k.id, k.title, coalesce(k.content, '') as content, coalesce(r.root_code, '') as root_code
    from t_knowledge_point k
    left join roots r on r.id = k.node_id
   where not k.deleted
     and not exists (
       select 1 from t_question_kp x
         join t_question q on q.id = x.question_id
        where x.kp_id = k.id and not q.deleted and q.review_status = 'ok'
     )
   order by k.id
) x;
