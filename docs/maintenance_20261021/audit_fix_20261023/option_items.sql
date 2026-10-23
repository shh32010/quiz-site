select json_agg(row_to_json(x)) from (
  select q.id, 'options' as source, q.stem, q.option_json as "optionJson", q.correct, q.analysis
    from t_question q
   where not q.deleted and q.review_status = 'ok' and q.question_type = 1 and not q.is_golden
     and q.option_json is not null
     and pg_input_is_valid(q.option_json, 'jsonb')
     and (
       not q.option_json::jsonb ? 'A' or not q.option_json::jsonb ? 'B'
       or not q.option_json::jsonb ? 'C' or not q.option_json::jsonb ? 'D'
     )
   order by q.id
) x;
