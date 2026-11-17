-- 清理孤儿链接 dry-run
BEGIN;
DELETE FROM t_question_kp k USING t_question q WHERE k.question_id = q.id AND q.deleted;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question_kp;
  IF n <> 106922 THEN RAISE EXCEPTION '剩余链接应为 106922，实际 %', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp k JOIN t_question q ON q.id=k.question_id WHERE q.deleted;
  IF n <> 0 THEN RAISE EXCEPTION '仍有孤儿链接 %', n; END IF;
  SELECT count(*) INTO n FROM (SELECT question_id,kp_id FROM t_question_kp GROUP BY 1,2 HAVING count(*)>1) x;
  IF n <> 0 THEN RAISE EXCEPTION '仍有重复链接 %', n; END IF;
END $$;
COMMIT;
