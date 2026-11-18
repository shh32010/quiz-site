BEGIN;
UPDATE t_question SET stem=$q$再使用修改表结构语句，在 s_sex 建立一个 s_SexIdx 普通索引。

________ TABLE student ________ ________ ________ (s_sex);$q$ WHERE id=390711;
UPDATE t_text_content SET content=$q${"titleContent": "再使用修改表结构语句，在 s_sex 建立一个 s_SexIdx 普通索引。<br/><br/>________ TABLE student ________ ________ ________ (s_sex);", "analyze": "ALTER TABLE student ADD INDEX s_SexIdx (s_sex);", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "ALTER", "itemUuid": "00390711000000000000000000000000", "score": null}, {"prefix": "2", "content": "ADD", "itemUuid": "00390711010000000000000000000000", "score": null}, {"prefix": "3", "content": "INDEX", "itemUuid": "00390711020000000000000000000000", "score": null}, {"prefix": "4", "content": "s_SexIdx", "itemUuid": "00390711030000000000000000000000", "score": null}]}$q$ WHERE id=391004;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=390711 AND stem=$q$再使用修改表结构语句，在 s_sex 建立一个 s_SexIdx 普通索引。

________ TABLE student ________ ________ ________ (s_sex);$q$; IF n<>1 THEN RAISE EXCEPTION 'q'; END IF;
 SELECT count(*) INTO n FROM t_text_content WHERE id=391004 AND pg_input_is_valid(content,'json') AND position('(s_sex)' in content)>0; IF n<>1 THEN RAISE EXCEPTION 'c'; END IF;
END $$;
COMMIT;
