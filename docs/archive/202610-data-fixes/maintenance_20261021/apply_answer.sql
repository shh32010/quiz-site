BEGIN;
CREATE TEMP TABLE tmp_ans(id int primary key, correct text, answer_check text, qc_grade text);
\copy tmp_ans from '/tmp/answer_updates.csv' with (format csv)
\copy (select q.id, q.correct, q.answer_check, q.qc_grade from t_question q join tmp_ans t on t.id = q.id order by q.id) to '/tmp/answer_review_backup.csv' with (format csv, header)
UPDATE t_question q
   SET correct = coalesce(nullif(t.correct, ''), q.correct),
       answer_check = t.answer_check,
       qc_grade = t.qc_grade
  FROM tmp_ans t
 WHERE q.id = t.id;
SELECT count(*) AS updated FROM tmp_ans;
COMMIT;
