-- 2026-11-20 清理转义美元符：Excel 绝对引用题的 \$ 应显示为 $
-- 题干为单反斜杠（chr(92)||'$'）；option_json 为 JSON 文本，存双反斜杠（chr(92)||chr(92)||'$'）
BEGIN;

CREATE TABLE IF NOT EXISTS t_question_backup_20261120_dollar AS
SELECT * FROM t_question
 WHERE deleted = false
   AND (strpos(stem, chr(92) || '$') > 0
        OR strpos(option_json, chr(92) || chr(92) || '$') > 0);

UPDATE t_question
   SET stem = replace(stem, chr(92) || '$', '$')
 WHERE deleted = false AND strpos(stem, chr(92) || '$') > 0;

UPDATE t_question
   SET option_json = replace(option_json, chr(92) || chr(92) || '$', '$')
 WHERE deleted = false AND strpos(option_json, chr(92) || chr(92) || '$') > 0;

DO $$
DECLARE
  n int;
BEGIN
  SELECT count(*) INTO n FROM t_question
   WHERE deleted = false AND strpos(stem, chr(92) || '$') > 0;
  IF n <> 0 THEN
    RAISE EXCEPTION '题干仍残留 % 道转义美元符', n;
  END IF;
  SELECT count(*) INTO n FROM t_question
   WHERE deleted = false AND strpos(option_json, chr(92) || chr(92) || '$') > 0;
  IF n <> 0 THEN
    RAISE EXCEPTION '选项仍残留 % 道转义美元符', n;
  END IF;
  -- 受影响选项 JSON 合法性校验
  PERFORM option_json::jsonb FROM t_question
   WHERE deleted = false AND id IN (
     SELECT id FROM t_question_backup_20261120_dollar
      WHERE option_json IS NOT NULL AND option_json <> ''
   );
END $$;

COMMIT;
