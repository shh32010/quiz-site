BEGIN;
CREATE TEMP TABLE tmp_fix(id int, correct text);
\copy tmp_fix from '/tmp/answer_fix_high.csv' with (format csv, header true)
\copy (select q.id, q.correct from t_question q join tmp_fix f on f.id=q.id order by q.id) to '/opt/quiz-backups/c4_answer_fix_high_20261023.csv' with (format csv, header true)
UPDATE t_question q SET correct = f.correct FROM tmp_fix f WHERE q.id = f.id;
COMMIT;
