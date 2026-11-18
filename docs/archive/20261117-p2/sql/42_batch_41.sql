-- P2 第 41 批（4 道；html=4 colon=0 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(390588, $q${"A": "printf(\"d * %d = %d\\n\", a, b, a * b);", "B": "printf(\"%d * %d = %d\\n\",a,b,a * b);", "C": "printf(\"%d * %d = %d\\n\",a,b);", "D": "printf(\"%d = %d * %d\\n\",a,b,a * b);"}$q$, NULL, NULL),(390589, $q${"A": "char s[6] = \"\" ;", "B": "char s[6] = {\"abcd\"} ;", "C": "char s[6] = \"abcdef\";", "D": "char s[6] = {'a', 'b', 'c', 'd'} ;"}$q$, NULL, NULL),(390594, $q${"A": "insert into person (age, info, id, name) values ('lawyer', 1,20, 'zhangsan');", "B": "insert into person (age, info, id, name) values (20,'lawyer',1, 'zhangsan');", "C": "inser tinto person (id,name,age,info ) values ('zhangsan',20,'lawyer');", "D": "insert into person (id,name,age,info) values (1,'zhangsan',20,'lawyer',20);"}$q$, NULL, NULL),(390595, $q${"A": "select xh from cj where sum(score)>=160;", "B": "select xh from cj where count(score)>=160;", "C": "select xh from cj group by xh having sum (score)>=160;", "D": "select xh from cj group by xh having count (score)>=160;"}$q$, NULL, NULL)
;
UPDATE t_question q
SET option_json = coalesce(e.option_new, q.option_json),
    analysis = coalesce(e.analysis_new, q.analysis),
    stem = coalesce(e.stem_new, q.stem)
FROM p2_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.option_new IS NOT NULL AND q.option_json = e.option_new;
  IF n <> 4 THEN RAISE EXCEPTION '第 41 批 HTML 更新数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 41 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 41 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 41 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 41 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
