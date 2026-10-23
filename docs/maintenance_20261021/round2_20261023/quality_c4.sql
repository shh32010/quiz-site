select json_agg(row_to_json(x)) from (
  select id, question_type as "questionType", stem, option_json as "optionJson",
         correct, analysis, qc_grade as "qcGrade", answer_check as "answerCheck"
    from t_question
   where not deleted and review_status = 'ok' and qc_grade = 'error' and not is_golden
   order by id
) x;
