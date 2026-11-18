-- 379802 金标修正：D → B（CREATE OR REPLACE VIEW）
BEGIN;
SET LOCAL session_replication_role = replica;
UPDATE t_question SET
  stem = $q$CREATE OR REPLACE VIEW 的含义是（）。$q$,
  correct = 'B',
  analysis = $q$CREATE OR REPLACE VIEW：视图存在则修改，不存在则创建。故选 B。$q$,
  qc_grade = 'good',
  answer_check = 'match'
WHERE id = 379802;
UPDATE t_text_content SET content = $q${"titleContent": "CREATE OR REPLACE VIEW 的含义是（）。", "analyze": "CREATE OR REPLACE VIEW：视图存在则修改，不存在则创建。故选 B。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "直接创建 v_table 视图", "itemUuid": "37980200000000000000000000000001", "score": null}, {"prefix": "B", "content": "如果视图存在，则修改，如果视图不存在，则创建", "itemUuid": "37980200000000000000000000000002", "score": null}, {"prefix": "C", "content": "直接修改", "itemUuid": "37980200000000000000000000000003", "score": null}, {"prefix": "D", "content": "无操作", "itemUuid": "37980200000000000000000000000004", "score": null}]}$q$ WHERE id = 380042;
DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question WHERE id = 379802 AND correct = 'B' AND qc_grade = 'good' AND answer_check = 'match' AND is_golden;
  IF n <> 1 THEN RAISE EXCEPTION '379802 修正不符'; END IF;
  SELECT count(*) INTO n FROM t_text_content WHERE id = 380042 AND pg_input_is_valid(content,'json') AND position('CREATE OR REPLACE VIEW' in content) > 0;
  IF n <> 1 THEN RAISE EXCEPTION '文本未同步'; END IF;
END $$;
COMMIT;
