BEGIN;
CREATE TEMP TABLE b6(id integer PRIMARY KEY, tc_id integer NOT NULL, stem text NOT NULL, correct text NOT NULL, analysis text NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO b6 VALUES
(369578,369818,$q$图像获取的过程大体分为________、________、________和________四个步骤。$q$,$q$扫描；分色；取样；量化$q$,$q$图像获取的过程大体分为扫描、分色、取样、量化四个步骤。$q$,$q${"titleContent": "图像获取的过程大体分为________、________、________和________四个步骤。", "analyze": "图像获取的过程大体分为扫描、分色、取样、量化四个步骤。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "扫描", "itemUuid": "00369578000000000000000000000000", "score": null}, {"prefix": "2", "content": "分色", "itemUuid": "00369578010000000000000000000000", "score": null}, {"prefix": "3", "content": "取样", "itemUuid": "00369578020000000000000000000000", "score": null}, {"prefix": "4", "content": "量化", "itemUuid": "00369578030000000000000000000000", "score": null}]}$q$),
(370025,370265,$q$修改表 book 的结构，添加一个名为 pub_post 的列，用于关联图书的出版社信息，该列值允许为 NULL，数据类型为整型。

________ TABLE book ________ pub_post INT;

ALTER TABLE book

________ CONSTRAINT FK_book_pub_post

________ ________ (pub_post) ________ publisher(pub_id);$q$,$q$ALTER；ADD；ADD；FOREIGN；KEY；REFERENCES$q$,$q$ALTER TABLE book ADD pub_post INT; ALTER TABLE book ADD CONSTRAINT FK_book_pub_post FOREIGN KEY (pub_post) REFERENCES publisher(pub_id); 依次填 ALTER、ADD、ADD、FOREIGN、KEY、REFERENCES。$q$,$q${"titleContent": "修改表 book 的结构，添加一个名为 pub_post 的列，用于关联图书的出版社信息，该列值允许为 NULL，数据类型为整型。<br/><br/>________ TABLE book ________ pub_post INT;<br/><br/>ALTER TABLE book<br/><br/>________ CONSTRAINT FK_book_pub_post<br/><br/>________ ________ (pub_post) ________ publisher(pub_id);", "analyze": "ALTER TABLE book ADD pub_post INT; ALTER TABLE book ADD CONSTRAINT FK_book_pub_post FOREIGN KEY (pub_post) REFERENCES publisher(pub_id); 依次填 ALTER、ADD、ADD、FOREIGN、KEY、REFERENCES。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "ALTER", "itemUuid": "00370025000000000000000000000000", "score": null}, {"prefix": "2", "content": "ADD", "itemUuid": "00370025010000000000000000000000", "score": null}, {"prefix": "3", "content": "ADD", "itemUuid": "00370025020000000000000000000000", "score": null}, {"prefix": "4", "content": "FOREIGN", "itemUuid": "00370025030000000000000000000000", "score": null}, {"prefix": "5", "content": "KEY", "itemUuid": "00370025040000000000000000000000", "score": null}, {"prefix": "6", "content": "REFERENCES", "itemUuid": "00370025050000000000000000000000", "score": null}]}$q$),
(370432,370672,$q$删除 book 表中 price 默认值，重新设置默认值为 40 元。

ALTER TABLE book ________ price ________ ________;

ALTER TABLE book ________ price ________ ________ 40;$q$,$q$ALTER；DROP；DEFAULT；ALTER；SET；DEFAULT$q$,$q$ALTER TABLE book ALTER price DROP DEFAULT; ALTER TABLE book ALTER price SET DEFAULT 40; 依次填 ALTER、DROP、DEFAULT、ALTER、SET、DEFAULT。$q$,$q${"titleContent": "删除 book 表中 price 默认值，重新设置默认值为 40 元。<br/><br/>ALTER TABLE book ________ price ________ ________;<br/><br/>ALTER TABLE book ________ price ________ ________ 40;", "analyze": "ALTER TABLE book ALTER price DROP DEFAULT; ALTER TABLE book ALTER price SET DEFAULT 40; 依次填 ALTER、DROP、DEFAULT、ALTER、SET、DEFAULT。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "ALTER", "itemUuid": "00370432000000000000000000000000", "score": null}, {"prefix": "2", "content": "DROP", "itemUuid": "00370432010000000000000000000000", "score": null}, {"prefix": "3", "content": "DEFAULT", "itemUuid": "00370432020000000000000000000000", "score": null}, {"prefix": "4", "content": "ALTER", "itemUuid": "00370432030000000000000000000000", "score": null}, {"prefix": "5", "content": "SET", "itemUuid": "00370432040000000000000000000000", "score": null}, {"prefix": "6", "content": "DEFAULT", "itemUuid": "00370432050000000000000000000000", "score": null}]}$q$),
(374604,374844,$q$删除视图 v_student(no,name,age,smajor) 中名字中第二个字是“签”字的所有学生信息。

________ FROM ________ WHERE name ________ ________;$q$,$q$DELETE；v_student；LIKE；'_签%'$q$,$q$完整语句：DELETE FROM v_student WHERE name LIKE '_签%'; 依次填 DELETE、v_student、LIKE、'_签%'。$q$,$q${"titleContent": "删除视图 v_student(no,name,age,smajor) 中名字中第二个字是“签”字的所有学生信息。<br/><br/>________ FROM ________ WHERE name ________ ________;", "analyze": "完整语句：DELETE FROM v_student WHERE name LIKE '_签%'; 依次填 DELETE、v_student、LIKE、'_签%'。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "DELETE", "itemUuid": "00374604000000000000000000000000", "score": null}, {"prefix": "2", "content": "v_student", "itemUuid": "00374604010000000000000000000000", "score": null}, {"prefix": "3", "content": "LIKE", "itemUuid": "00374604020000000000000000000000", "score": null}, {"prefix": "4", "content": "'_签%'", "itemUuid": "00374604030000000000000000000000", "score": null}]}$q$),
(378661,378901,$q$状态栏分左右两部分，左边给出________及________，如输入、就绪等，右边给出一些________的当前________。$q$,$q$操作状态；提示信息；控制键；状态$q$,$q$依次填 操作状态、提示信息、控制键、状态。$q$,$q${"titleContent": "状态栏分左右两部分，左边给出________及________，如输入、就绪等，右边给出一些________的当前________。", "analyze": "依次填 操作状态、提示信息、控制键、状态。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "操作状态", "itemUuid": "00378661000000000000000000000000", "score": null}, {"prefix": "2", "content": "提示信息", "itemUuid": "00378661010000000000000000000000", "score": null}, {"prefix": "3", "content": "控制键", "itemUuid": "00378661020000000000000000000000", "score": null}, {"prefix": "4", "content": "状态", "itemUuid": "00378661030000000000000000000000", "score": null}]}$q$),
(378666,378906,$q$默认情况下，1 个 Excel 工作簿有 3 个工作表，其中第一个工作表的默认表名是________，为了改变工作表的名字，可以________弹出快捷菜单，选择“重命名”命令。$q$,$q$Sheet1；在工作表名上单击鼠标右键$q$,$q$依次填 Sheet1、在工作表名上单击鼠标右键。$q$,$q${"titleContent": "默认情况下，1 个 Excel 工作簿有 3 个工作表，其中第一个工作表的默认表名是________，为了改变工作表的名字，可以________弹出快捷菜单，选择“重命名”命令。", "analyze": "依次填 Sheet1、在工作表名上单击鼠标右键。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "Sheet1", "itemUuid": "00378666000000000000000000000000", "score": null}, {"prefix": "2", "content": "在工作表名上单击鼠标右键", "itemUuid": "00378666010000000000000000000000", "score": null}]}$q$);
UPDATE t_question q SET stem=e.stem, correct=e.correct, analysis=e.analysis, blank_count=array_length(string_to_array(e.correct,'；'),1)
FROM b6 e WHERE q.id=e.id AND NOT q.is_golden;
UPDATE t_text_content t SET content=e.content FROM b6 e WHERE t.id=e.tc_id;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN b6 e ON e.id=q.id
  WHERE q.stem=e.stem AND q.correct=e.correct AND q.analysis=e.analysis
    AND q.blank_count=array_length(string_to_array(e.correct,'；'),1);
 IF n<>6 THEN RAISE EXCEPTION '更新应为6，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN b6 e ON t.id=e.tc_id
  WHERE t.content=e.content AND pg_input_is_valid(t.content,'json');
 IF n<>6 THEN RAISE EXCEPTION '文本应为6，实际%',n; END IF;
 SELECT count(*) INTO n FROM practice_answer WHERE question_id IN (369578,370025,370432,374604,378661,378666); IF n<>0 THEN RAISE EXCEPTION '有作答记录'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃数'; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标数'; END IF;
END $$;
COMMIT;
