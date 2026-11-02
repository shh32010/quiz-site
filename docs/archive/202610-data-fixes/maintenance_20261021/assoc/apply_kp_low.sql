BEGIN;
CREATE TEMP TABLE tmp_link(kp_id int, question_id int, confidence text);
\copy tmp_link from '/tmp/kp_low_links.csv' with (format csv)
INSERT INTO t_question_kp(id, question_id, kp_id, match_source, confidence)
SELECT (SELECT coalesce(max(id), 0) FROM t_question_kp) + row_number() OVER (),
       question_id, kp_id, 'KP补挂v4_20261023_low', confidence
  FROM tmp_link
ON CONFLICT (question_id, kp_id) DO NOTHING;
SELECT count(*) AS input_links FROM tmp_link;
COMMIT;
