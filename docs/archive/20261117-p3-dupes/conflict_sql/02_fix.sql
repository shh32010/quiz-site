-- 12 组答案冲突统一（只改 correct）
BEGIN;
CREATE TEMP TABLE conflict_expected(id integer PRIMARY KEY, correct text NOT NULL) ON COMMIT DROP;
INSERT INTO conflict_expected(id,correct) VALUES (364311,$q$锚点$q$),(368475,$q$锚点$q$),(384498,$q$Ctrl+F4$q$),(384501,$q$Ctrl+F4$q$),(358467,$q$二$q$),(362452,$q$二$q$),(358609,$q$闪存（Flash ROM）$q$),(362546,$q$闪存（Flash ROM）$q$),(358435,$q$服务器；客户机$q$),(363135,$q$服务器；客户机$q$),(337160,$q$刷新频率$q$),(367094,$q$刷新频率$q$),(362087,$q$高速缓冲存储器（Cache）$q$),(367149,$q$高速缓冲存储器（Cache）$q$),(338532,$q$一个指令序列$q$),(338806,$q$一个指令序列$q$),(358453,$q$上传；下载$q$),(363215,$q$上传；下载$q$),(347213,$q$高速率、低时延、大连接$q$),(361042,$q$高速率、低时延、大连接$q$),(384935,$q$CREATE VIEW v_student AS SELECT * FROM tb_student WHERE sex='男' WITH CHECK OPTION;$q$),(384937,$q$CREATE VIEW v_student AS SELECT * FROM tb_student WHERE sex='男' WITH CHECK OPTION;$q$),(354959,$q$模拟$q$),(355072,$q$模拟$q$);
UPDATE t_question q SET correct=e.correct FROM conflict_expected e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN conflict_expected e ON e.id=q.id WHERE q.correct=e.correct;
  IF n<>24 THEN RAISE EXCEPTION '更新应为24，实际%',n; END IF;
  SELECT count(*) INTO n FROM t_question q JOIN conflict_expected e ON e.id=q.id WHERE q.is_golden;
  IF n<>0 THEN RAISE EXCEPTION '触及金标%',n; END IF;
END $$;
COMMIT;
