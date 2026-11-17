-- P0-C 第 12 批（25 道：23 写入 + 2 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(389511, $q$另存为命令作用于整个文件，即当前工作簿，可用新文件名或新格式保存全部工作表及内容；它不能只保存当前工作表、选定单元格或选定工作表，这些需要复制、拆分等操作实现。故选 B。$q$, NULL, 'keep'),(389515, NULL, NULL, 'manual'),(389587, $q$购买商品软件，得到的是在许可协议范围内使用该软件的权利，即使用权。版权仍归著作权人，修改权和拷贝权也受许可条款限制，未经授权不得自行改动或复制传播。故选 B。$q$, NULL, 'keep'),(389602, $q$显示器借助红、绿、蓝三种发光单元加色混合来呈现颜色，采用 RGB 颜色模型。CMYK 用于印刷，HSB 是面向人的色彩描述方式，YUV 多见于模拟视频传输。故选 C。$q$, NULL, 'keep'),(389675, $q$主频是芯片的时钟频率，它决定内部各操作节拍的快慢，是影响 CPU 内部数据传输与运算速度的最主要因素。cache 容量、指令系统、运算器结构也影响性能，但都不是最主要的决定因素。故选 C。$q$, NULL, 'keep'),(389682, $q$液晶显示器按光源利用方式可分为反射型、透射型和反射透射结合型，D 正确。它同样需要显示卡输出信号；画面亮度主要取决于背光，并非液晶自身发光；响应时间越短越好，因此 A、B、C 均错误。故选 D。$q$, NULL, 'keep'),(389690, $q$按异或规则逐位运算：1 与 0 异或得 1，0 与 0 异或得 0，0 与 1 异或得 1，1 与 1 异或得 0，结果为 1010。注意 A 项末位是字母 l 而非数字 1，属于干扰项。故选 C。$q$, NULL, 'keep'),(389765, NULL, NULL, 'manual'),(389782, $q$FDDI 采用双环拓扑，用两个方向相反的光纤环提高可靠性，正常时主环传数据、副环备用，站点故障可自动旁路重新构环，因此不属于星形、总线型或网状结构。故选 B。$q$, NULL, 'keep'),(389784, $q$拨打 IP 电话时，双方通过网络实时传递语音，属于点对点的实时交互应用，归入即时通信类；它不是网页信息浏览、文件传输，也不是远程登录到他人主机操作。故选 C。$q$, NULL, 'keep'),(389785, $q$CuteFTP 是文件传输工具，IE 是浏览器，Visio 是绘图软件，均不具备收发邮件功能；Outlook 是电子邮件客户端，可添加多个邮箱账户并同时接收各账户的邮件，符合题干描述。故选 C。$q$, NULL, 'keep'),(389789, $q$GB2312 收录 6763 个汉字，BIG5 约 1.3 万字符，GBK 收录 21886 个字符，而 GB18030 收录字符超过两万七千并覆盖全部 Unicode 字符，是四者中字符集最大者。故选 C。$q$, NULL, 'keep'),(389792, $q$声音数字化只包含取样、量化和编码，没有分量这一步，分量属于彩色图像数字化的环节。全频带声音频率范围宽、采样频率高，与语音采用不同的压缩标准，故 B 叙述有误。故选 B。$q$, NULL, 'keep'),(389795, $q$丰富格式文本是带有字体、字号、颜色、表格、图片等排版信息的文本。Word、WPS、Adobe Acrobat 均可编辑或呈现此类文本；Notepad 只能处理纯文本，无法保存格式信息。故选 B。$q$, NULL, 'keep'),(389797, $q$SELECT 子句挑选所需列属于投影运算，WHERE 子句按性别=男逐行筛选满足条件的元组，对应关系运算中的选择操作；连接用于多表关联，分组对应 GROUP BY。故选 A。$q$, NULL, 'keep'),(389799, $q$DELETE FROM S 未加 WHERE 条件，表示删除表中全部记录，30 条记录被清空，但表的结构仍然保留，只是变成空表；删除表结构需使用 DROP 语句。故选 D。$q$, NULL, 'keep'),(389841, $q$两数均为负数：11110010 的真值为 -14，11010111 的真值为 -41，相加得 -55，结果仍在 8 位补码表示范围内。A、B 是常见误算，D 忽略了符号位。故选 C。$q$, NULL, 'keep'),(389844, $q$当前显卡普遍采用 PCI-Express 接口，AGP 是已被淘汰的旧接口，故 D 错误。GPU 决定显卡档次、显存已达 GB 级、显示控制器可集成于 CPU 或芯片组，均符合实际。故选 D。$q$, NULL, 'keep'),(389846, $q$激光打印机既有黑白机型也有彩色机型，说其不能进行彩色打印与事实不符；硒鼓是主要耗材，速度以每分钟页数（ppm）、精度以每英寸点数（dpi）衡量均正确。故选 A。$q$, NULL, 'keep'),(389852, $q$结构化程序设计主张自顶向下、逐步求精、模块化，核心目标是使程序结构清晰、易于阅读和维护，而不是追求规模、执行效率或可移植性。故选 B。$q$, NULL, 'keep'),(389854, $q$已证明任何可计算问题的程序都可由顺序、选择（分支）、循环三种基本控制结构组合描述，这是结构化程序设计的理论基础；I/O、跳转、返回均不属于这三类基本结构。故选 D。$q$, NULL, 'keep'),(389861, $q$防火墙部署在内网与外部网络之间，通过访问控制策略将子网隔离、过滤进出数据，可软件也可硬件实现；数字证书与加密机解决身份和保密问题，入侵检测系统只做监测报警。故选 C。$q$, NULL, 'keep'),(389865, $q$网络协议由语法、语义和时序（同步）三要素组成，分别规定数据格式、各字段含义及事件执行顺序；进程是操作系统中的概念，不属于网络协议的组成要素。故选 D。$q$, NULL, 'keep'),(389866, $q$B 类地址首字节范围为 128～191。61.177.7.1 属 A 类，129.248.1.253 落在 128～191 之间属 B 类，193.1.109.1 属 C 类，229.1.189.1 属 D 类组播地址。故选 B。$q$, NULL, 'keep'),(389872, $q$MIDI 记录的是音符、音色、力度等演奏指令，由合成器发声，本身不含声音波形，因此不可能包含真实人声；CD、MP3、WAV 均存储采样后的音频波形数据。故选 B。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0c_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0c_expected e
WHERE q.id = e.id AND e.action = 'manual' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 23 THEN RAISE EXCEPTION '第 12 批写入数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 2 THEN RAISE EXCEPTION '第 12 批人工数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 12 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
