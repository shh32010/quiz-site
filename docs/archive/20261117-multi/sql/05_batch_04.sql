-- 多选第 4 批（23 道：21 keep + 0 change + 2 unresolved）
BEGIN;
CREATE TEMP TABLE multi_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO multi_expected (id, analysis, correct, action) VALUES
(381036, NULL, NULL, 'unresolved'),(388799, $q$加密强度再高也不能保证数据绝不会被窃取；身份鉴别才是访问控制的基础，选项把关系说反了；硬件加密不一定优于软件加密；生理特征鉴别在单机环境下同样有效，故四项叙述均错误。$q$, NULL, 'keep'),(388999, $q$无线局域网与有线局域网使用的传输介质不同，网卡不同，MAC 层通信协议也不同（802.11 与 802.3），并且无线组网、配置和维护更灵活，四项均正确。$q$, NULL, 'keep'),(389066, $q$高强度加密不能保证数据不被窃取，身份鉴别才是访问控制的基础，硬件加密并非必然优于软件加密，生理特征鉴别在单机上也有效，因此四项叙述全部错误。$q$, NULL, 'keep'),(389100, $q$DOC、HTM、PDF 都能携带字体、颜色、图形等格式信息，属于丰富格式文本；TXT 文件只保存字符编码，属于纯文本，故不选 D。$q$, NULL, 'keep'),(389101, NULL, NULL, 'unresolved'),(389105, $q$幻灯片放映时，按↓键、PgDn键、Enter键以及用鼠标左键单击幻灯片都能切换到下一张，四项均正确。$q$, NULL, 'keep'),(389225, $q$幻灯片母版包含标题母版，A的说法错误；母版中不仅能设置文字格式，还可插入图片、图表等对象，B的说法错误。母版中插入的对象需进入母版视图才能修改，普通视图不能编辑，C正确；母版中可设置动画效果，D正确。$q$, NULL, 'keep'),(389321, $q$目前数据库访问主要采用B/S（浏览器/服务器）和C/S（客户机/服务器）两种模式，C、D正确；B-B、B-C不是数据库访问模式的规范术语。$q$, NULL, 'keep'),(389619, $q$数字签名可用于验证发送者身份（真实性鉴别）和防止发送方事后抵赖（防止否认），A、C正确；数据加密依靠加密算法实现，审计管理属于日志与审计手段，通常不采用数字签名技术。$q$, NULL, 'keep'),(389718, $q$CPU不能直接读取硬盘数据，必须经内存中转，A错误；CPU主要由寄存器组、控制器和运算器组成，B正确；CPU能直接与内存储器交换数据，C正确；系统软件和应用软件最终都由CPU执行，D正确。$q$, NULL, 'keep'),(389806, $q$触发器的两个稳态、电容的充电与未充电状态、磁介质的磁化状态、盘片光滑表面的凹坑与平面均可表示0和1，四项都能用于存储二进制信息。$q$, NULL, 'keep'),(389809, $q$同轴电缆和光纤属于有线传输介质，微波属于无线传输介质，均可用于信息传输；紫外线在大气中衰减大、方向性差，不用于计算机网络传输。$q$, NULL, 'keep'),(389843, $q$CD-ROM、U盘及各类外存储器都必须先经接口调入内存后CPU才能访问，不能直接访问；Cache位于CPU与内存之间，CPU可直接访问。$q$, NULL, 'keep'),(389867, $q$一台主机只有一个IP地址时仍可对应多个域名，A错误；域名从右到左级别升高，正确格式应为“计算机名.网络名.机构名.最高域名”，B顺序说反，错误；域名可用字母、数字和连字符，C错误；没有域名服务器就无法进行域名解析，D正确。$q$, NULL, 'keep'),(389886, $q$百度机器人、无人驾驶汽车、AlphaGo、人脸识别寻亲都属于典型的人工智能应用，分别涉及自然语言交互、环境感知与决策、博弈搜索和计算机视觉，四项均采用人工智能技术。$q$, NULL, 'keep'),(389888, $q$算法可用自然语言描述，也可用流程图、伪代码和程序设计语言等更规范的形式表示，四种都是常见的算法描述形式，故全选。$q$, NULL, 'keep'),(389971, $q$电话拨号、非对称数字用户线（ADSL）、电缆调制解调以及光纤接入网都是接入互联网的常用方式，四项均正确。$q$, NULL, 'keep'),(390049, $q$邮件由发送方服务器经收件人邮件服务器暂存，并非直接抵达收件人计算机，A 错；发送用 SMTP、接收常用 POP3 或 IMAP，B 错；邮箱地址全网唯一，C 对；一封邮件可发给多个收件人，D 对。$q$, NULL, 'keep'),(390050, $q$UNIX、Linux 和 Windows Server 2012 都是服务器端操作系统，可提供网络资源共享与管理功能；Windows 10 属于客户端桌面操作系统，不作为网络操作系统。$q$, NULL, 'keep'),(390130, $q$按数据传送方向，通信方式分为单工、半双工和全双工三种；“半单工通信”并不存在，故排除 A，选 B、C、D。$q$, NULL, 'keep'),(390206, $q$浮点数由阶码和尾数组成，A 对；定点数的小数点位置是隐含约定的，不占用二进制位，B 错；浮点运算电路更复杂，C 错；在位数相同时浮点数可表示的范围远大于定点数，D 对。$q$, NULL, 'keep'),(390208, $q$评价算法优劣要综合考察正确性、易理解性（可读性）、时间资源（时间复杂度）和空间资源（空间复杂度），四项都是主要因素，故全选。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM multi_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM multi_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 21 THEN RAISE EXCEPTION '第 4 批写入数应为 21，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 2 THEN RAISE EXCEPTION '第 4 批保留数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN multi_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_multi b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN multi_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
