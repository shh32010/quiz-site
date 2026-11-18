-- 342247：type5 -> type1，按迈成题库原文恢复题干
BEGIN;
CREATE TEMP TABLE m342247(id integer PRIMARY KEY, stem text NOT NULL, analysis text NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO m342247 VALUES (
  342247,
  $q$IP 地址是一串很难记忆的数字，于是人们开发了________，该系统给主机赋予一个用字符组成的名字，并负责 IP 地址与名字之间的转换。$q$,
  $q$IP 地址难于记忆，DNS（域名系统）给主机赋予字符串名字，并负责 IP 地址与名字之间的转换。故选 A。$q$,
  $q${"titleContent": "IP 地址是一串很难记忆的数字，于是人们开发了________，该系统给主机赋予一个用字符组成的名字，并负责 IP 地址与名字之间的转换。", "analyze": "IP 地址难于记忆，DNS（域名系统）给主机赋予字符串名字，并负责 IP 地址与名字之间的转换。故选 A。", "correct": null, "questionItemObjects": []}$q$
);
UPDATE t_question q
SET question_type = 1,
    stem = e.stem,
    correct = 'A',
    analysis = e.analysis,
    blank_count = 1
FROM m342247 e
WHERE q.id = e.id AND NOT q.is_golden;
UPDATE t_text_content t SET content = e.content FROM m342247 e WHERE t.id = 342487;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN m342247 e ON e.id = q.id
   WHERE q.question_type = 1 AND q.correct = 'A' AND q.stem = e.stem AND q.analysis = e.analysis;
  IF n <> 1 THEN RAISE EXCEPTION '转换应为1，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_text_content WHERE id = 342487 AND pg_input_is_valid(content, 'json')
   AND content::jsonb->>'titleContent' = (SELECT stem FROM m342247);
  IF n <> 1 THEN RAISE EXCEPTION '文本内容未同步'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type = 1; IF n <> 23979 THEN RAISE EXCEPTION 'type1 应为23979，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND question_type = 5; IF n <> 1539 THEN RAISE EXCEPTION 'type5 应为1539，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44419 THEN RAISE EXCEPTION '活跃应为44419，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为200，实际%', n; END IF;
END $$;
ROLLBACK;
