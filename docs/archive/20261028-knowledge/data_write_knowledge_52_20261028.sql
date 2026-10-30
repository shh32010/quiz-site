-- 知识点 52 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_52
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_52 as
select * from t_knowledge_point where id in (22182,22238,22988,24986,25184,26706,27288,28066,28930,28951,29947);

update t_knowledge_point set title = $kp$指纹传感器$kp$, content = $kp$功能：自动采集用户指纹，实现对用户的身份认证。

实现原理：采用半导体电容（或电感）式传感器，在一块集成有成千上万半导体器件的平板上，手指贴在其上与其构成电容（电感）器的另一极；由于手指平面凸凹不平，接触平板的实际距离大小不一，形成的电容（电感）数值也就不一样。设备将采集到的这些数值汇总，即完成指纹采集。$kp$, section = '' where id = 22182;
update t_knowledge_point set title = $kp$3D 触摸传感器$kp$, content = $kp$嵌在液晶屏的背光层，可测量出用户触摸屏幕的力量大小。3D Touch 与振动器结合，后者可向用户提供力反馈。$kp$, section = '' where id = 22238;
update t_knowledge_point set title = $kp$多点触摸屏$kp$, content = $kp$多点触摸又称多点触控，即一个屏幕允许多点操作，并能感应到手指滑动的快慢以及力度，从而使操控更加人性化。

通过拇指与食指在屏幕上的滑动，可以实现图片、网页的拖拽、放大、缩小等操作，也可以方便地阅读地图信息。

常见操作：点击、拖拽页面、按住弹出右键菜单、放大、缩小、切换到下一标签、切换到上一标签；轻拍两次页面放大 200%，放大状态下轻拍两次页面还原。$kp$, section = '' where id = 22988;
update t_knowledge_point set title = $kp$重力传感器（加速度感应器）$kp$, content = $kp$感知用户晃动手机的速度、角度、方向和力量的大小，在玩游戏的时候很有用处。$kp$, section = '' where id = 24986;
update t_knowledge_point set title = $kp$磁力计（电子罗盘）$kp$, content = $kp$用作电子指南针、帮助 GPS 定位等。$kp$, section = '' where id = 25184;
update t_knowledge_point set title = $kp$常用输入设备$kp$, content = $kp$用于把原始数据和处理这些数据的程序输入到计算机中，如键盘、鼠标、触摸屏、麦克风、传感器、摄像头、扫描仪、光笔、手写输入板、游戏杆、语音输入装置等。

不论信息的原始形态如何，输入到计算机中的信息都能使用二进制位来表示。$kp$, section = '' where id = 26706;
update t_knowledge_point set title = $kp$切换到下一张幻灯片的方法$kp$, content = $kp$① 单击鼠标。
② 按空格键或【Enter】键。
③ 用鼠标右键单击，再在弹出的快捷菜单中单击“下一张”。
④ 按向下光标键。
⑤ 按【PgDn】键。
⑥ 按向右光标键。$kp$, section = '' where id = 27288;
update t_knowledge_point set title = $kp$传感器属于输入设备$kp$, content = $kp$传感器属于输入设备。$kp$, section = '' where id = 28066;
update t_knowledge_point set title = $kp$系统实施与运行维护$kp$, content = $kp$系统实施与运行维护（了解）。

其后为 Windows 部分，先从键盘与鼠标讲起。$kp$, section = '' where id = 28930;
update t_knowledge_point set title = $kp$数码相机（图像输入设备）$kp$, content = $kp$CCD（电荷耦合器件）完成光电转换，产生电流并输出。数码相机属于图像输入设备。$kp$, section = '' where id = 28951;
update t_knowledge_point set title = $kp$特殊对象的输入$kp$, content = $kp$1）特殊符号（小图标）：方法为“插入”→“符号”，选择字体 Wingdings。
2）特殊汉字：输入偏旁部首给文字注音，格式为“中文版式—拼音指南”。
3）数字序列：插入→数字。

插入日期：Alt+Shift+D；插入时间：Alt+Shift+T。$kp$, section = '' where id = 29947;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22182,22238,22988,24986,25184,26706,27288,28066,28930,28951,29947) and not deleted) <> 11 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
