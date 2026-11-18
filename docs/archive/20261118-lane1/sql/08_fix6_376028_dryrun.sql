BEGIN;
SET LOCAL session_replication_role = replica;
CREATE TABLE t_question_backup_20261118_376028 AS SELECT * FROM t_question WHERE id=376028;
CREATE TABLE t_text_content_backup_20261118_376028 AS SELECT * FROM t_text_content WHERE id=376268;
UPDATE t_question SET has_image=true WHERE id=376028;
UPDATE t_text_content SET content=$q${"titleContent": "STEP 2 打开【系统属性】对话框的【____】选项卡，要启用远程协助功能，需要选中【____】复选框，如下图所示。<br/><br/><br/><br/>系统属性<br/>计算机名 硬件 高级 系统保护 远程<br/>远程协助<br/>☑ 允许远程协助连接这台计算机(R)<br/>有关应用远程协助的信息<br/>高级(V)...<br/>远程桌面<br/>选择一个选项，然后指定谁可以连接。<br/>⑥ 不允许远程连接到此计算机(D)<br/>○ 允许远程连接到此计算机(L)<br/>☑ 仅允许运行使用网络级别身份验证的远程桌面的计算机连接(建议)<br/>(N)<br/>帮助我选择 选择用户(S)...<br/>确定 取消 应用(A)<br/><br/><br/><br/>远程协助设置<br/>你可以设置在这台计算机上使用远程协助的限制。<br/>远程控制<br/>☑ 允许此计算机被远程控制(A)<br/>邀请<br/>设置邀请可以保持为打开的最长时间(S)<br/>12 小时<br/>□ 创建仅可以从运行 Windows Vista 或更新版本的计算机使用的邀请(V)<br/>确定 取消<br/><img src=\"/qimg/q376028.jpg\"/>", "analyze": "【远程】选项卡，勾选【允许远程协助连接这台计算机】。", "correct": "远程；允许远程协助连接这台计算机", "questionItemObjects": []}$q$ WHERE id=376268;
DO $$ DECLARE n int; BEGIN
 SELECT count(*) INTO n FROM t_question WHERE id=376028 AND has_image AND is_golden; IF n<>1 THEN RAISE EXCEPTION 'h'; END IF;
 SELECT count(*) INTO n FROM t_text_content WHERE id=376268 AND pg_input_is_valid(content,'json') AND position('/qimg/q376028.jpg' in content)>0; IF n<>1 THEN RAISE EXCEPTION 'c'; END IF;
END $$;
ROLLBACK;
