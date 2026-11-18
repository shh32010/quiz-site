BEGIN;
CREATE TEMP TABLE img2(id integer PRIMARY KEY, tc_id integer NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO img2 VALUES
(374996,375236,$q${"titleContent": "在顺序图中，返回消息的符号是( )。<br/><img src=\"/qimg/q374996.jpg\"/>", "analyze": "返回消息用虚线箭头（开口箭头）表示（选项 B）。", "correct": "B", "questionItemObjects": []}$q$),
(375051,375291,$q${"titleContent": "在顺序图中，返回消息的符号是（）<br/><img src=\"/qimg/q375051.jpg\"/>", "analyze": "返回消息用虚线箭头（开口箭头）表示（选项 B）。", "correct": "B", "questionItemObjects": []}$q$);
UPDATE t_text_content t SET content=e.content FROM img2 e WHERE t.id=e.tc_id;
UPDATE t_question q SET has_image=true FROM img2 e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN img2 e ON e.id=q.id WHERE q.has_image; IF n<>2 THEN RAISE EXCEPTION 'has_image应为2，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN img2 e ON e.tc_id=t.id WHERE t.content=e.content AND pg_input_is_valid(t.content,'json'); IF n<>2 THEN RAISE EXCEPTION '内容应为2，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃应为44419，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标应为200，实际%',n; END IF;
END $$;
COMMIT;
