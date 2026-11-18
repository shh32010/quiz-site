BEGIN;
CREATE TABLE t_question_backup_20261118_389801 AS SELECT * FROM t_question WHERE id=389801;
CREATE TABLE t_text_content_backup_20261118_389801 AS SELECT * FROM t_text_content WHERE id=390081;
UPDATE t_question SET has_image=true WHERE id=389801 AND NOT is_golden;
UPDATE t_text_content SET content=$q${"titleContent": "题 56 图所示的 Word 视图是____。<br/><br/>◇经验杂谈:<br/><br/>◇1. 改变光标跟随状态<br/>◇2. 调整状态条的位置<br/>◇3. 输入法的缺省设置<br/>◇4. GB/GBK 字符集的切换<br/>◇5. 在线选词 Ctrl+<br/>◇6. 手工选词功能,兼可选字。<br/>◇7. 巧用极品五笔输入生僻字<br/>◇8. 迁移你的自选词库<br/>◇9. IE 保护模式下极品五笔的使用<br/><br/>- IE保护模式是微软由史以来最严厉的保护措施。其虚拟重定向技术、加速器等优先加载项，改变了输入法的运行模式并使用运行空间变得狭隘。<br/>- 极品五笔在保护模式下的 IE 浏览器中可正常输入汉字,但调用前须关闭其他正在编辑的文档,否则容易出错。<br/>- 如需实现 IE 保护模式下多线程任务, 可先在 IE 里调用极品五笔, 后开启其他编辑工具(如 Word)。<br/><img src=\"/qimg/q389801.jpg\"/>", "analyze": "在 Word 中, 大纲视图适合于编辑文档的大纲, 方便审阅和修改文档结构。因此, 本题选 A。", "correct": null, "questionItemObjects": [{"prefix": "A", "content": "大纲视图", "itemUuid": "988360e1dfd347269488a2928c98fcb8", "score": null}, {"prefix": "B", "content": "页面视图", "itemUuid": "1ec044271af649a3a21f810fd1affc38", "score": null}, {"prefix": "C", "content": "Web版式视图", "itemUuid": "382119a07fba4bac89e8c1461d602b41", "score": null}, {"prefix": "D", "content": "普通视图", "itemUuid": "e22fdfea36834822baba8a2b73dbc217", "score": null}]}$q$ WHERE id=390081;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=389801 AND has_image; IF n<>1 THEN RAISE EXCEPTION 'h'; END IF;
 SELECT count(*) INTO n FROM t_text_content WHERE id=390081 AND pg_input_is_valid(content,'json') AND position('/qimg/q389801.jpg' in content)>0; IF n<>1 THEN RAISE EXCEPTION 'c'; END IF;
END $$;
COMMIT;
