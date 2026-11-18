BEGIN;
CREATE TEMP TABLE img_expected(id integer PRIMARY KEY, tc_id integer NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO img_expected VALUES
(344390,344630,$q${"titleContent": "题3图中，有关描述，错误的是（）<br/><img src=\"/qimg/q344390.jpg\"/>", "analyze": "dhcp 表示动态获取（非静态），B 错误，故选 B。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "Ethernet表示是以太网", "itemUuid": "24b14afab36149a4bb091975a2aa5ab8", "score": null}, {"prefix": "B", "content": "dhcp 表示是静态获取 IP", "itemUuid": "76105fc4a8334fed938501fa77c60171", "score": null}, {"prefix": "C", "content": "IPV6INT=&quot;yes&quot;表示启用IPV6功能", "itemUuid": "df2fae6285c34130a665f8eac39e7ffe", "score": null}, {"prefix": "D", "content": "ONBOOT=&quot;yes&quot;表示开启自动网络连接", "itemUuid": "6733a8a59e0844afb3d19af9e83bcd76", "score": null}]}$q$),
(366683,366923,$q${"titleContent": "下图是用 Excel 统计的个人驾考成绩，科目-成绩大于等于 90 分的合格，否则不合格。若要用函数判断每个人是否合格，则 C2 单元格的判断函数是 ____。<br/><img src=\"/qimg/q366683.jpg\"/>", "analyze": "C2 单元格应填 =IF(B2>=90,「合格」,「不合格」)：成绩大于等于 90 分显示合格、否则不合格，故填该 IF 函数。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "=IF(B2&gt;=90,&quot;合格&quot;,&quot;不合格&quot;)", "itemUuid": "d0652cfb33ee4569a0679abdcbd47cf9", "score": null}]}$q$),
(368523,368763,$q${"titleContent": "下图是邮件收发示意图，图中标识为 A 的协议常用的是____协议。<br/><img src=\"/qimg/q368523.jpg\"/>", "analyze": "图中标识 A 的协议用于发送邮件，常用 SMTP 协议，故填 SMTP。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "SMTP", "itemUuid": "38a66d7b767840cf9cdbc62e6b727d26", "score": null}]}$q$),
(385604,385844,$q${"titleContent": "以下类图中部分内容，其中 “+” 表示()<br/><br/>D. 无<br/><img src=\"/qimg/q385604.jpg\"/>", "analyze": "+ 表示 public。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "private", "itemUuid": "866284ae4b784f689093669c71d86d54", "score": null}, {"prefix": "B", "content": "protected", "itemUuid": "4c5666bacef34b74b217493f95843c73", "score": null}, {"prefix": "C", "content": "public", "itemUuid": "aaae8d903fe844478322be351aa262c1", "score": null}, {"prefix": "D", "content": "无", "itemUuid": "0eab3bb9cae24f0b938dbc99ee024028", "score": null}]}$q$);
UPDATE t_text_content t SET content=e.content FROM img_expected e WHERE t.id=e.tc_id;
UPDATE t_question q SET has_image=true FROM img_expected e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN img_expected e ON e.id=q.id WHERE q.has_image; IF n<>4 THEN RAISE EXCEPTION 'has_image应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN img_expected e ON e.tc_id=t.id WHERE t.content=e.content AND pg_input_is_valid(t.content,'json'); IF n<>4 THEN RAISE EXCEPTION '内容应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261118_lane1a b ON b.id=q.id WHERE q.correct IS DISTINCT FROM b.correct OR q.question_type IS DISTINCT FROM b.question_type; IF n<>0 THEN RAISE EXCEPTION '改答案或题型%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃应为44419，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标应为200，实际%',n; END IF;
END $$;
ROLLBACK;
