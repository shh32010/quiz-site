BEGIN;
CREATE TABLE t_knowledge_point_backup_20261118_l3move AS
  SELECT * FROM t_knowledge_point WHERE id BETWEEN 32729 AND 32734;

UPDATE t_knowledge_point SET node_id = CASE id
  WHEN 32729 THEN 72
  WHEN 32730 THEN 105
  WHEN 32731 THEN 239
  WHEN 32732 THEN 279
  WHEN 32733 THEN 302
  WHEN 32734 THEN 116
END
WHERE id BETWEEN 32729 AND 32734;

DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_knowledge_point
   WHERE id=32729 AND node_id=72 AND chapter_id=5
      OR id=32730 AND node_id=105 AND chapter_id=6
      OR id=32731 AND node_id=239 AND chapter_id=19
      OR id=32732 AND node_id=279 AND chapter_id=22
      OR id=32733 AND node_id=302 AND chapter_id=23
      OR id=32734 AND node_id=116 AND chapter_id=7;
  IF n <> 6 THEN RAISE EXCEPTION '移动应为6，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE kp_id BETWEEN 32729 AND 32734;
  IF n <> 387 THEN RAISE EXCEPTION '链接应为387，实际%', n; END IF;
END $$;
COMMIT;
