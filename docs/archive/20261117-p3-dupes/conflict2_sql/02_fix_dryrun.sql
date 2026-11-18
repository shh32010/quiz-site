BEGIN;
CREATE TEMP TABLE c2(id integer PRIMARY KEY, correct text NOT NULL) ON COMMIT DROP;
INSERT INTO c2 VALUES (358468,$q$0~255$q$),(345588,$q$字数统计、语法检查、文语转换（TTS）、文本压缩等$q$),(369492,$q$字数统计、语法检查、文语转换（TTS）、文本压缩等$q$),(338738,$q$程序 + 数据 + 相关文档$q$),(357231,$q$16$q$);
UPDATE t_question q SET correct=e.correct FROM c2 e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN c2 e ON e.id=q.id WHERE q.correct=e.correct;
 IF n<>5 THEN RAISE EXCEPTION '更新应为5，实际%',n; END IF;
END $$;
ROLLBACK;
