BEGIN;
CREATE TEMP TABLE tmp_q(id int);
\copy tmp_q from '/tmp/quarantine_missing_options.csv' with (format csv, header true)
\copy (select q.id, q.review_status from t_question q join tmp_q f on f.id = q.id order by q.id) to '/opt/quiz-backups/option_missing_quarantine_20261023.csv' with (format csv, header true)
UPDATE t_question q SET review_status = 'quarantined' FROM tmp_q f WHERE q.id = f.id;

CREATE TEMP TABLE tmp_m(id int, correct text);
\copy tmp_m from '/tmp/manual_multi_fix.csv' with (format csv, header true)
\copy (select q.id, q.correct from t_question q join tmp_m f on f.id = q.id order by q.id) to '/opt/quiz-backups/manual_multi_fix_20261023.csv' with (format csv, header true)
UPDATE t_question q SET correct = f.correct FROM tmp_m f WHERE q.id = f.id;
COMMIT;
