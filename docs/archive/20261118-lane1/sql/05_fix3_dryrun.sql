BEGIN;
CREATE TABLE t_question_backup_20261118_lane1c AS SELECT * FROM t_question WHERE id IN (357389,370339);
CREATE TABLE t_text_content_backup_20261118_lane1c AS SELECT * FROM t_text_content WHERE id IN (357629,370579);
CREATE TEMP TABLE img_expected(id integer PRIMARY KEY, tc_id integer NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO img_expected VALUES
(357389,357629,$q${"titleContent": "如题图所示,由关系 R 和 S 得到关系 T 的运算是 ()<br/><img src=\"/qimg/q357389.jpg\"/>", "analyze": "关系 T 的元组 y 是 R 中有而 S 中没有的，属差运算（R−S），故选 D。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "自然连接", "itemUuid": "a4cbb25e191f450ca4311a3df0b71e28", "score": null}, {"prefix": "B", "content": "并", "itemUuid": "62907dc4edbd4956a500f59b17178335", "score": null}, {"prefix": "C", "content": "交", "itemUuid": "13cfe799fa0b4ed783ad169a794b7b0f", "score": null}, {"prefix": "D", "content": "差<br/><br/>| A | B | C |<br/>| --- | --- | --- |<br/>| x | 5 | 6 |<br/>| y | 12 | 9 |<br/>| z | 2 | 1 |<br/><br/>| A | B | C |<br/>| --- | --- | --- |<br/>| x | 5 | 6 |<br/>| z | 2 | 1 |<br/><br/>| A | B | C |<br/>| --- | --- | --- |<br/>| y | 12 | 9 |", "itemUuid": "df6837d994b845fd8abcc11b4d3d97a3", "score": null}]}$q$),
(370339,370579,$q${"titleContent": "<br/><br/>部门、员工和项目的关系模式及它们之间的E-R图如下所示，其中，关系模式中带实下画线的属性表示主键；图中部门（部门代码，部门名称，电话）；<br/><br/>员工（员工代码，姓名，部门代码，联系方式，薪资）<br/><br/>项目（项目编号，项目名称，承担任务）<br/><br/><br/><br/>若部门和员工关系进行自然连接运算，其结果集为____元（即多少个属性）关系。由于员工与项目系统之间的类型为____，所以员工和项目之间的联系需要转成一个独立的关系模式，该关系模式的主键是____。<br/><img src=\"/qimg/q370339.jpg\"/>", "analyze": "部门(3)与员工(5)自然连接得 7 元关系；员工与项目为多对多，联系模式主键为（项目编号，员工代码），故选 A。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "7, 多对多；（项目编号，员工代码）", "itemUuid": "434b2dd08f9e4e5bb23775158cc6c66c", "score": null}, {"prefix": "B", "content": "8, 多对多；（项目编号，员工代码）", "itemUuid": "44716d2a3fc841b287587391a739ea55", "score": null}, {"prefix": "C", "content": "7,一对多；（项目名称，员工代码）", "itemUuid": "cf734bdf86284f11aaf9b1c496106a0d", "score": null}, {"prefix": "D", "content": "8;一对多；（项目名称，员工代码）", "itemUuid": "4c5285ae87fd446797390357763187c9", "score": null}]}$q$);
UPDATE t_text_content t SET content=e.content FROM img_expected e WHERE t.id=e.tc_id;
UPDATE t_question q SET has_image=true FROM img_expected e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN img_expected e ON e.id=q.id WHERE q.has_image; IF n<>2 THEN RAISE EXCEPTION 'has_image'; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN img_expected e ON e.tc_id=t.id WHERE t.content=e.content AND pg_input_is_valid(t.content,'json'); IF n<>2 THEN RAISE EXCEPTION 'content'; END IF;
END $$;
ROLLBACK;
