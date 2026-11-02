select json_agg(row_to_json(x)) from (
  select q.id, 'multi_format' as kind, q.question_type as "questionType",
         q.stem, q.option_json as "optionJson", q.correct, q.analysis,
         null::int as "blankCount"
    from t_question q
   where not q.deleted and q.review_status = 'ok' and q.question_type = 2 and not q.is_golden
     and q.correct not like '%,%'
  union all
  select q.id, 'blank_count' as kind, q.question_type,
         q.stem, q.option_json, q.correct, q.analysis,
         q.blank_count
    from t_question q
   where not q.deleted and q.review_status = 'ok' and q.question_type = 4 and not q.is_golden
     and q.blank_count <> regexp_count(q.correct, '[;；]') + 1
) x;
