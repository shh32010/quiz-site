with m as (
  select epq.paper_id as "paperId", epq.item_order as "itemOrder", epq.section_name as "sectionName",
         q.id as id, q.question_type as "questionType", q.stem, q.option_json as "optionJson",
         q.correct, q.analysis, q.score, q.is_golden,
         case when epq.section_name like '%单项%' then 1
              when epq.section_name like '%多项%' or epq.section_name like '%多选%' then 2
              when epq.section_name like '%判断%' then 3
              when epq.section_name like '%填空%' then 4
              when epq.section_name like '%综合%' or epq.section_name like '%简答%' or epq.section_name like '%操作%' then 5
         end as "expectedType"
    from exam_paper_question epq
    join t_question q on q.id = epq.question_id
   where epq.is_active and not q.deleted and q.review_status = 'ok' and not q.is_golden
)
select json_agg(row_to_json(x)) from (
  select 'paper_type' as source, "paperId", "itemOrder", "sectionName", id,
         "questionType", "expectedType", stem, "optionJson", correct, analysis, score
    from m
   where "expectedType" is not null and "questionType" <> "expectedType"
  union all
  select 'paper_answer', null::int, null::int, null::text, q.id,
         q.question_type, null::int, q.stem, q.option_json, q.correct, q.analysis, q.score
    from t_question q
   where q.id in (350238, 389675, 339141, 361731, 361558)
     and not q.deleted and not q.is_golden
) x;
