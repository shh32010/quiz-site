BEGIN;
UPDATE t_question SET stem=$q$想将数据库 school 删除。
____ ____ school;$q$, blank_count=2, correct='DROP；DATABASE' WHERE id=370013 AND NOT is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=370013 AND stem=$q$想将数据库 school 删除。
____ ____ school;$q$ AND blank_count=2 AND correct='DROP；DATABASE';
 IF n<>1 THEN RAISE EXCEPTION '修复失败'; END IF;
END $$;
COMMIT;
