BEGIN;
CREATE TEMP TABLE img_expected(id integer PRIMARY KEY, tc_id integer NOT NULL, content text NOT NULL) ON COMMIT DROP;
INSERT INTO img_expected VALUES (336356,336596,$q${"titleContent": "题 16 图所示的是（）设备。<br/><br/><br/><br/>intel®<br/>CORE™ i5<br/>7th Gen<br/><br/>题 16 图<br/><img src=\"/qimg/q336356.jpg\"/>", "analyze": "A：图中为Intel Core i5，属CPU。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "CPU", "itemUuid": "368f28ba8bae440ca2982f00c4d4267a", "score": null}, {"prefix": "B", "content": "内存条", "itemUuid": "a9102f7882344cceb6ff67fe58f2f6b9", "score": null}, {"prefix": "C", "content": "显卡", "itemUuid": "cdd6012741994b4fad1a959d874f8f88", "score": null}, {"prefix": "D", "content": "声卡", "itemUuid": "0799591e2c2a43ff8876a47b94e1158d", "score": null}]}$q$),(338655,338895,$q${"titleContent": "在配置【允许远程连接到此计算机】可以【选择用户】。下图中需要（）可以将用户列表显示。<br/><br/><br/><br/>选择用户<br/>选择此对象类型(S):<br/>用户或内容安全主体<br/>对象类型(O)...<br/>查找位置(E):<br/>DESKTOP-NU4OK5U<br/>位置(L)...<br/>一般性查询<br/>名称(A): 起始为<br/>描述(D): 起始为<br/>□禁用的帐户(B)<br/>□不过期密码(X)<br/>自上次登录后的天数(I):<br/>列(C)...<br/>立即查找(N)<br/>停止(T)<br/>确定 取消<br/>搜索结果(U):<br/>名称 所在文件夹<br/><img src=\"/qimg/q338655.jpg\"/>", "analyze": "题源口径：在“选择用户”对话框中点击【立即】（查找）按钮即可显示用户列表。", "correct": "C", "questionItemObjects": []}$q$),(340736,340976,$q${"titleContent": "下图是一个二叉树，以下（）不是该树的遍历序列。<br/><br/><br/><img src=\"/qimg/q340736.jpg\"/>", "analyze": "关键是遍历须与树的层次、父子关系一致：A 逐层输出 0,1,2,…,9，是层次遍历；B 的 0,1,3,7,8,4,9,2,5,6 符合先序；C 的 7,8,3,9,4,1,5,6,2,0 符合后序，三者吻合为同一棵树。D 是 9,8,…,0 倒序排列，只有链状树才可能，故 D 不是其遍历序列。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "0123456789", "itemUuid": "c66491b2533c44aea9f83fd75857096a", "score": null}, {"prefix": "B", "content": "0137849256", "itemUuid": "e9d59fc4532b45d7bc6fd3d637960d40", "score": null}, {"prefix": "C", "content": "7839415620", "itemUuid": "b808714cd1d94e5b97132f4c532025fc", "score": null}, {"prefix": "D", "content": "9876543210", "itemUuid": "b23029cfb13b44718b1cc8506597151b", "score": null}]}$q$),(354973,355213,$q${"titleContent": "图中星号位置应该属于____概念<br/><br/><br/><br/>机器学习<br/>深度<br/>学习<br/><img src=\"/qimg/q354973.jpg\"/>", "analyze": "机器学习、深度学习的嵌套关系图中，最外层的概念是人工智能，故填 人工智能。", "correct": null, "questionItemObjects": [{"prefix": "1", "content": "人工智能", "itemUuid": "ad4e69c7e4c04820a38eb0ca032e9777", "score": null}]}$q$);
UPDATE t_text_content t SET content=e.content FROM img_expected e WHERE t.id=e.tc_id;
UPDATE t_question q SET has_image=true FROM img_expected e WHERE q.id=e.id AND NOT q.is_golden;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question q JOIN img_expected e ON e.id=q.id WHERE q.has_image;
 IF n<>4 THEN RAISE EXCEPTION 'has_image 应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_text_content t JOIN img_expected e ON e.tc_id=t.id
  WHERE t.content=e.content AND pg_input_is_valid(t.content,'json') AND position('/qimg/q'||e.id||'.jpg' in t.content)>0;
 IF n<>4 THEN RAISE EXCEPTION '内容更新应为4，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question q JOIN t_question_backup_20261118_imgpilot b ON b.id=q.id WHERE q.correct IS DISTINCT FROM b.correct;
 IF n<>0 THEN RAISE EXCEPTION '不应改答案%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE NOT deleted;
 IF n<>44419 THEN RAISE EXCEPTION '活跃应为44419，实际%',n; END IF;
 SELECT count(*) INTO n FROM t_question WHERE is_golden;
 IF n<>200 THEN RAISE EXCEPTION '金标应为200，实际%',n; END IF;
END $$;
ROLLBACK;
