with recursive roots as (
  select id, code as root_code from t_chapter where parent_id is null
  union all
  select c.id, r.root_code from t_chapter c join roots r on c.parent_id = r.id
)
select json_agg(row_to_json(x)) from (
  select q.id, q.stem, coalesce(r.root_code, '') as root_code
    from t_question q
    left join roots r on r.id = q.chapter_id
   where not q.deleted and q.review_status = 'ok'
   order by q.id
) x;
