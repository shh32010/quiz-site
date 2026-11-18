BEGIN;
CREATE TEMP TABLE img_expected(id integer PRIMARY KEY, tc_id integer NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO img_expected VALUES (364320,364560,$q${"titleContent": "下图是邮件收发示意图，图中标识为 B 的协议常用的是 协议。<br/><img src=\"/qimg/q364320.jpg\"/>", "analyze": "图中标识 B 的协议用于接收邮件，常用 POP3 协议，故填 POP3。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "POP3", "itemUuid": "6ab8adfaa6e247a2a611b11ebfb389f8", "score": null}]}$q$),(364696,364936,$q${"titleContent": "下图是属于虚拟化中的（）架构。<br/><img src=\"/qimg/q364696.jpg\"/>", "analyze": "图中层次为物理机资源←虚拟化器 VMM←客户操作系统（Guest OS）←应用，VMM 直接运行在硬件之上、无宿主操作系统层，属裸金属（Type-1）虚拟化。故选 C。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "寄居虚拟化", "itemUuid": "d3dfd9c3b15e47c3843546546dc32350", "score": null}, {"prefix": "B", "content": "操作系统虚拟化", "itemUuid": "88d9b671f0754dd8a9d7db183bef6924", "score": null}, {"prefix": "C", "content": "裸金属虚拟化", "itemUuid": "2a71957b800241b0b9c1dccc7d51ad5b", "score": null}, {"prefix": "D", "content": "混合虚拟化", "itemUuid": "beceb4f3eae647d2961692a8d09bfb25", "score": null}]}$q$),(365240,365480,$q${"titleContent": "下图是一种（）传感器设备。<br/><img src=\"/qimg/q365240.jpg\"/>", "analyze": "该设备为红外额温枪（题源解析：额温枪，一种温度传感器装置），属于温度检测设备，故选 A。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "温度检测", "itemUuid": "85447b169d6a41369a1dd6ec8a5adaa8", "score": null}, {"prefix": "B", "content": "湿度检测", "itemUuid": "e9021286397e4d7bad2a17fa739d35db", "score": null}, {"prefix": "C", "content": "空气检测", "itemUuid": "fa52f11275564239b9ed1708559fc679", "score": null}, {"prefix": "D", "content": "心率检测<br/><br/>答案:A<br/><br/>答案解析:额温枪，一种温度传感器装置。<br/><br/>难度: 易<br/><br/>知识点:", "itemUuid": "bc1d1b4d394a4ea3b9a2de673c50b7fe", "score": null}]}$q$);
UPDATE t_text_content t SET content=e.content FROM img_expected e WHERE t.id=e.tc_id;
UPDATE t_question q SET has_image=true FROM img_expected e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN img_expected e ON e.id=q.id WHERE q.has_image;
 IF n<>3 THEN RAISE EXCEPTION 'has_image应为3，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN img_expected e ON e.tc_id=t.id WHERE t.content=e.content AND pg_input_is_valid(t.content,'json') AND position('/qimg/q'||e.id||'.jpg' in t.content)>0;
 IF n<>3 THEN RAISE EXCEPTION '内容更新应为3，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261118_imgpilot2 b ON b.id=q.id WHERE q.correct IS DISTINCT FROM b.correct;
 IF n<>0 THEN RAISE EXCEPTION '不应改答案%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted; IF n<>44419 THEN RAISE EXCEPTION '活跃应为44419，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden; IF n<>200 THEN RAISE EXCEPTION '金标应为200，实际%',n; END IF;
END $$;
ROLLBACK;
