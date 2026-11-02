select json_agg(row_to_json(x)) from (
  select x.question_id as "questionId", x.kp_id as "kpId",
         q.stem, k.title as "kpTitle",
         q.subject_id as "qSubject", k.subject_id as "kpSubject",
         x.confidence, x.match_source as "matchSource"
    from t_question_kp x
    join t_question q on q.id = x.question_id
    join t_knowledge_point k on k.id = x.kp_id
   where not q.deleted and q.review_status = 'ok' and not k.deleted
     and q.subject_id is not null and k.subject_id is not null
     and q.subject_id <> k.subject_id
   order by x.question_id, x.kp_id
) x;
