BEGIN;
CREATE TEMP TABLE tmp_fix(id int, question_type smallint, correct text, blank_count smallint);
\copy tmp_fix from '/tmp/audit_fix_changes.csv' with (format csv, header true, null '')
\copy (select q.id, q.question_type, q.correct, q.blank_count from t_question q join tmp_fix f on f.id=q.id order by q.id) to '/tmp/audit_fix_backup_20261023.csv' with (format csv, header true)
UPDATE t_question q
   SET question_type = coalesce(f.question_type, q.question_type),
       correct = coalesce(f.correct, q.correct),
       blank_count = coalesce(f.blank_count, q.blank_count)
  FROM tmp_fix f
 WHERE q.id = f.id;
COMMIT;
