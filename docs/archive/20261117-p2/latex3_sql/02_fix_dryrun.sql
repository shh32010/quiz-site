BEGIN;
CREATE TEMP TABLE l3(id integer PRIMARY KEY, options text NOT NULL) ON COMMIT DROP;
INSERT INTO l3 VALUES (343205,$q${"A": "1000Mbps", "B": "100Mbps", "C": "10Mbps", "D": "1Mbps"}$q$),(351329,$q${"A": "-2^(n-1)+1", "B": "-2n +1", "C": "-2^(n-1)-1", "D": "-2n-1"}$q$);
UPDATE t_question q SET option_json=e.options FROM l3 e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN l3 e ON e.id=q.id WHERE q.option_json=e.options;
 IF n<>2 THEN RAISE EXCEPTION '更新应为2，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261117_latex3 b ON b.id=q.id WHERE q.correct IS DISTINCT FROM b.correct;
 IF n<>0 THEN RAISE EXCEPTION '不应改答案%',n; END IF;
END $$;
ROLLBACK;
