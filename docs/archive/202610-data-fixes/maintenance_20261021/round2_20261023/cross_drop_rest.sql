BEGIN;
CREATE TEMP TABLE tmp_drop(question_id int, kp_id int);
\copy tmp_drop from '/tmp/cross_drop_rest.csv' with (format csv)
\copy (select x.id, x.question_id, x.kp_id, x.match_source, x.confidence from t_question_kp x join tmp_drop d on d.question_id=x.question_id and d.kp_id=x.kp_id order by x.id) to '/opt/quiz-backups/cross_subject_drop_rest_20261023.csv' with (format csv, header true)
DELETE FROM t_question_kp x USING tmp_drop d
 WHERE x.question_id = d.question_id AND x.kp_id = d.kp_id;
COMMIT;
