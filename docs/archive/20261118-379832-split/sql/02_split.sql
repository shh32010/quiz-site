-- 379832 拆分：保留金标原题隔离，新建 7 道可练题（2026-11-18）
BEGIN;

CREATE TEMP TABLE split379832(
  id integer PRIMARY KEY, tc_id integer NOT NULL, no integer NOT NULL,
  stem text NOT NULL, correct text NOT NULL, analysis text NOT NULL,
  blank smallint NOT NULL, content text NOT NULL, src_id text NOT NULL
) ON COMMIT DROP;
INSERT INTO split379832 VALUES
(390707,391000,1,$q$根据上述提供的信息，在数据库创建 student 表，存储引擎采用 InnoDB，创建表的同时在 s_id 字段上添加名称为 s_UniqIdx 的唯一索引。
CREATE TABLE student (
s_id INT(11) ________ ________ NOT NULL AUTO_INCREMENT,
s_name VARCHAR(50) NOT NULL,
s_sex CHAR(2) NOT NULL,
s_age CHAR(2) NOT NULL,
s_addres VARCHAR(255),
s_introduction VARCHAR(255), ________ INDEX s_UniqIdx (s_id)
)engine=________;$q$,$q$PRIMARY；KEY；UNIQUE；InnoDB$q$,$q$s_id 为主键，需 PRIMARY KEY；s_UniqIdx 为唯一索引，需 UNIQUE；存储引擎为 InnoDB。$q$,4,$q${"titleContent": "根据上述提供的信息，在数据库创建 student 表，存储引擎采用 InnoDB，创建表的同时在 s_id 字段上添加名称为 s_UniqIdx 的唯一索引。<br/>CREATE TABLE student (<br/>s_id INT(11) ________ ________ NOT NULL AUTO_INCREMENT,<br/>s_name VARCHAR(50) NOT NULL,<br/>s_sex CHAR(2) NOT NULL,<br/>s_age CHAR(2) NOT NULL,<br/>s_addres VARCHAR(255),<br/>s_introduction VARCHAR(255), ________ INDEX s_UniqIdx (s_id)<br/>)engine=________;", "analyze": "s_id 为主键，需 PRIMARY KEY；s_UniqIdx 为唯一索引，需 UNIQUE；存储引擎为 InnoDB。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "PRIMARY", "itemUuid": "00390707000000000000000000000000", "score": null}, {"prefix": "2", "content": "KEY", "itemUuid": "00390707010000000000000000000000", "score": null}, {"prefix": "3", "content": "UNIQUE", "itemUuid": "00390707020000000000000000000000", "score": null}, {"prefix": "4", "content": "InnoDB", "itemUuid": "00390707030000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-1$q$),
(390708,391001,2,$q$student 表已经创建完成了，使用修改表结构语句在 s_name 字段上建立 s_NameIdx 的普通索引。
________ TABLE student ________ ________ ________ (s_name);$q$,$q$ALTER；ADD；INDEX；s_NameIdx$q$,$q$ALTER TABLE student ADD INDEX s_NameIdx (s_name);$q$,4,$q${"titleContent": "student 表已经创建完成了，使用修改表结构语句在 s_name 字段上建立 s_NameIdx 的普通索引。<br/>________ TABLE student ________ ________ ________ (s_name);", "analyze": "ALTER TABLE student ADD INDEX s_NameIdx (s_name);", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "ALTER", "itemUuid": "00390708000000000000000000000000", "score": null}, {"prefix": "2", "content": "ADD", "itemUuid": "00390708010000000000000000000000", "score": null}, {"prefix": "3", "content": "INDEX", "itemUuid": "00390708020000000000000000000000", "score": null}, {"prefix": "4", "content": "s_NameIdx", "itemUuid": "00390708030000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-2$q$),
(390709,391002,3,$q$再使用创建语句在 s_age 和 s_address 字段上面建立名称为 s_MultiIdx 的组合索引。
________ ________ s_MultiIdx ________ student(s_age, s_address);$q$,$q$CREATE；INDEX；ON$q$,$q$CREATE INDEX s_MultiIdx ON student(s_age, s_address);$q$,3,$q${"titleContent": "再使用创建语句在 s_age 和 s_address 字段上面建立名称为 s_MultiIdx 的组合索引。<br/>________ ________ s_MultiIdx ________ student(s_age, s_address);", "analyze": "CREATE INDEX s_MultiIdx ON student(s_age, s_address);", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "CREATE", "itemUuid": "00390709000000000000000000000000", "score": null}, {"prefix": "2", "content": "INDEX", "itemUuid": "00390709010000000000000000000000", "score": null}, {"prefix": "3", "content": "ON", "itemUuid": "00390709020000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-3$q$),
(390710,391003,4,$q$再使用创建语句在 s_introduction 建立一个 s_FTIdex 全文索引。
________ ________ ________ s_FTIdex ________ student(________);$q$,$q$CREATE；FULLTEXT；INDEX；ON；s_introduction$q$,$q$CREATE FULLTEXT INDEX s_FTIdx ON student(s_introduction);$q$,5,$q${"titleContent": "再使用创建语句在 s_introduction 建立一个 s_FTIdex 全文索引。<br/>________ ________ ________ s_FTIdex ________ student(________);", "analyze": "CREATE FULLTEXT INDEX s_FTIdx ON student(s_introduction);", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "CREATE", "itemUuid": "00390710000000000000000000000000", "score": null}, {"prefix": "2", "content": "FULLTEXT", "itemUuid": "00390710010000000000000000000000", "score": null}, {"prefix": "3", "content": "INDEX", "itemUuid": "00390710020000000000000000000000", "score": null}, {"prefix": "4", "content": "ON", "itemUuid": "00390710030000000000000000000000", "score": null}, {"prefix": "5", "content": "s_introduction", "itemUuid": "00390710040000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-4$q$),
(390711,391004,5,$q$再使用修改表结构语句，在 s_sex 建立一个 s_SexIdx 普通索引。
________ TABLE student ________ ________ ________;$q$,$q$ALTER；ADD；INDEX；s_SexIdx$q$,$q$ALTER TABLE student ADD INDEX s_SexIdx (s_sex);$q$,4,$q${"titleContent": "再使用修改表结构语句，在 s_sex 建立一个 s_SexIdx 普通索引。<br/>________ TABLE student ________ ________ ________;", "analyze": "ALTER TABLE student ADD INDEX s_SexIdx (s_sex);", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "ALTER", "itemUuid": "00390711000000000000000000000000", "score": null}, {"prefix": "2", "content": "ADD", "itemUuid": "00390711010000000000000000000000", "score": null}, {"prefix": "3", "content": "INDEX", "itemUuid": "00390711020000000000000000000000", "score": null}, {"prefix": "4", "content": "s_SexIdx", "itemUuid": "00390711030000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-5$q$),
(390712,391005,6,$q$查看一下 student 表上都定义了哪些索引。
________ ________ ________ student;$q$,$q$SHOW；INDEX；FROM$q$,$q$SHOW INDEX FROM student;$q$,3,$q${"titleContent": "查看一下 student 表上都定义了哪些索引。<br/>________ ________ ________ student;", "analyze": "SHOW INDEX FROM student;", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "SHOW", "itemUuid": "00390712000000000000000000000000", "score": null}, {"prefix": "2", "content": "INDEX", "itemUuid": "00390712010000000000000000000000", "score": null}, {"prefix": "3", "content": "FROM", "itemUuid": "00390712020000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-6$q$),
(390713,391006,7,$q$发现 s_sex 列不适合创建索引，现将 s_sex 列下创建的索引删除。
________ ________ s_SexIdx ________ student; 或 ALTER TABLE ________ ________ INDEX s_SexIdx;$q$,$q$DROP；INDEX；ON；student；DROP$q$,$q$DROP INDEX s_SexIdx ON student; 或 ALTER TABLE student DROP INDEX s_SexIdx;$q$,5,$q${"titleContent": "发现 s_sex 列不适合创建索引，现将 s_sex 列下创建的索引删除。<br/>________ ________ s_SexIdx ________ student; 或 ALTER TABLE ________ ________ INDEX s_SexIdx;", "analyze": "DROP INDEX s_SexIdx ON student; 或 ALTER TABLE student DROP INDEX s_SexIdx;", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "DROP", "itemUuid": "00390713000000000000000000000000", "score": null}, {"prefix": "2", "content": "INDEX", "itemUuid": "00390713010000000000000000000000", "score": null}, {"prefix": "3", "content": "ON", "itemUuid": "00390713020000000000000000000000", "score": null}, {"prefix": "4", "content": "student", "itemUuid": "00390713030000000000000000000000", "score": null}, {"prefix": "5", "content": "DROP", "itemUuid": "00390713040000000000000000000000", "score": null}]}$q$,$q$Q-S2-9169-7$q$);

INSERT INTO t_text_content (id, content, create_time)
SELECT tc_id, content, now() FROM split379832;

INSERT INTO t_question (
  id, question_type, subject_id, score, difficult, correct, info_text_content_id,
  create_time, deleted, chapter_id, stem, option_json, analysis, source,
  answer_source, analysis_source, confidence, src_id, quality_flags, blank_count,
  difficulty_labeled, audit_v, cat_l1, cat_l2, cat_l3, cat_alt,
  qc_grade, answer_check, answer_ai, audit_json, review_status, is_golden, has_image
)
SELECT v.id, 4, t.subject_id, 2, t.difficult, v.correct, v.tc_id,
       now(), false, t.chapter_id, v.stem, NULL, v.analysis, t.source,
       '重构自379832', '重构自379832', '中', v.src_id, '{}', v.blank,
       false, t.audit_v, t.cat_l1, t.cat_l2, t.cat_l3, t.cat_alt,
       'good', 'match', NULL, NULL, 'ok', false, false
FROM t_question t CROSS JOIN split379832 v
WHERE t.id = 379832;

-- 复制原题知识点到 7 道新题
WITH base AS MATERIALIZED (SELECT coalesce(max(id),0) AS max_id FROM t_question_kp),
pairs AS (
  SELECT v.id AS qid, k.kp_id, k.match_source, k.confidence
  FROM split379832 v CROSS JOIN t_question_kp k
  WHERE k.question_id = 379832
)
INSERT INTO t_question_kp (id, question_id, kp_id, match_source, confidence)
SELECT (b.max_id + row_number() OVER (ORDER BY p.qid, p.kp_id))::int, p.qid, p.kp_id, p.match_source, p.confidence
FROM pairs p CROSS JOIN base b;

DO $$ DECLARE n int; BEGIN
  SELECT count(*) INTO n FROM t_question WHERE id BETWEEN 390707 AND 390713 AND question_type = 4 AND review_status = 'ok' AND NOT deleted;
  IF n <> 7 THEN RAISE EXCEPTION '新题应为7，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_text_content WHERE id BETWEEN 391000 AND 391006 AND pg_input_is_valid(content,'json');
  IF n <> 7 THEN RAISE EXCEPTION '文本应为7，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question_kp WHERE question_id BETWEEN 390707 AND 390713;
  IF n <> 21 THEN RAISE EXCEPTION '知识点应为21，实际%', n; END IF;
  SELECT count(*) INTO n FROM t_question WHERE id = 379832 AND is_golden AND review_status = 'quarantined';
  IF n <> 1 THEN RAISE EXCEPTION '379832 原题被改'; END IF;
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n <> 44390 THEN RAISE EXCEPTION '活跃应为44390，实际%', n; END IF;
END $$;
COMMIT;
