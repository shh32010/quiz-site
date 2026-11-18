BEGIN;
UPDATE t_question SET option_json=NULL, question_type=4, blank_count=1, stem=coalesce($q$计算机中最小单位是比特（），存储单元的基本单位是________。$q$,stem)
WHERE id=347283 AND NOT is_golden;
UPDATE t_question SET option_json=NULL, question_type=4, blank_count=1
WHERE id=341857 AND NOT is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id IN (341857,347283) AND question_type=4 AND blank_count=1 AND option_json IS NULL;
 IF n<>2 THEN RAISE EXCEPTION '修复应为2，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE id=347283 AND stem=$q$计算机中最小单位是比特（），存储单元的基本单位是________。$q$;
 IF n<>1 THEN RAISE EXCEPTION '347283题干未修'; END IF;
END $$;
ROLLBACK;
