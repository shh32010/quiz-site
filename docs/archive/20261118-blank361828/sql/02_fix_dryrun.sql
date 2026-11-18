-- 361828：截掉误并入的第 35 题表格，规范两个空线
BEGIN;
CREATE TEMP TABLE b361828(id integer PRIMARY KEY, stem text NOT NULL, correct text NOT NULL, analysis text NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO b361828 VALUES (
  361828,
  $q$在 Word 中，________视图和最后打印输出纸张的效果完全一致，使用________功能可以将 Excel 中的数据（如：大量姓名）一次性显示在 Word 文档的某个模板（如：尚无姓名的请柬）中。$q$,
  $q$页面；邮件合并$q$,
  $q$页面视图的显示效果与打印输出一致；邮件合并可以把 Excel 中的数据批量填入 Word 模板。故填：页面；邮件合并。$q$,
  $q${"titleContent": "在 Word 中，________视图和最后打印输出纸张的效果完全一致，使用________功能可以将 Excel 中的数据（如：大量姓名）一次性显示在 Word 文档的某个模板（如：尚无姓名的请柬）中。", "analyze": "页面视图的显示效果与打印输出一致；邮件合并可以把 Excel 中的数据批量填入 Word 模板。故填：页面；邮件合并。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "页面", "itemUuid": "3c481f34b0a44e9bb1b6919a0b3e6fe8", "score": null}, {"prefix": "2", "content": "邮件合并", "itemUuid": "7d5b7d0a3f0e4a1c9b0f6e2a4c8d1e35", "score": null}]}$q$
);
UPDATE t_question q SET stem = e.stem, correct = e.correct, analysis = e.analysis, blank_count = 2
FROM b361828 e WHERE q.id = e.id AND NOT q.is_golden;
UPDATE t_text_content t SET content = e.content FROM b361828 e WHERE t.id = 362068;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN b361828 e ON e.id = q.id
   WHERE q.stem = e.stem AND q.correct = e.correct AND q.analysis = e.analysis AND q.blank_count = 2;
  IF n <> 1 THEN RAISE EXCEPTION '更新应为1，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_text_content WHERE id = 362068 AND pg_input_is_valid(content, 'json')
   AND content::jsonb->>'titleContent' = (SELECT stem FROM b361828)
   AND jsonb_array_length(content::jsonb->'questionItemObjects') = 2;
  IF n <> 1 THEN RAISE EXCEPTION '文本未同步'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44419 THEN RAISE EXCEPTION '活跃应为44419，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n <> 200 THEN RAISE EXCEPTION '金标应为200，实际%', n; END IF;
END $$;
ROLLBACK;
