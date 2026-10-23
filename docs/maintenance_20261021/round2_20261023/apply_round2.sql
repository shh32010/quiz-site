BEGIN;
CREATE TEMP TABLE tmp_q(kp_id int, question_id int, confidence text);
\copy tmp_q from '/tmp/q_deleted_links.csv' with (format csv)
INSERT INTO t_question_kp(id, question_id, kp_id, match_source, confidence)
SELECT (SELECT coalesce(max(id), 0) FROM t_question_kp) + row_number() OVER (),
       question_id, kp_id, 'KP补挂v4_20261023_deletedonly', confidence
  FROM tmp_q
ON CONFLICT (question_id, kp_id) DO NOTHING;

CREATE TEMP TABLE tmp_kp(question_id int, kp_id int, confidence text);
\copy tmp_kp from '/tmp/kp_noq_links.csv' with (format csv)
INSERT INTO t_question_kp(id, question_id, kp_id, match_source, confidence)
SELECT (SELECT coalesce(max(id), 0) FROM t_question_kp) + row_number() OVER (),
       question_id, kp_id, 'KP补挂v4_20261023_kp2', confidence
  FROM tmp_kp
ON CONFLICT (question_id, kp_id) DO NOTHING;
COMMIT;
