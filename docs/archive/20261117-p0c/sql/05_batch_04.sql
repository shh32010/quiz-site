-- P0-C 第 4 批（25 道：22 写入 + 3 人工）
BEGIN;
CREATE TEMP TABLE p0c_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0c_expected (id, analysis, correct, action) VALUES
(344131, $q$防火墙由软件和硬件组合而成，位于内网与外网、专用网与公共网之间，构成保护屏障，能增强内部网络的安全性；但其最基本的构件应是软件，过滤规则与访问控制逻辑都由软件实现，把硬件说成最基本构件是错误的。故选 B。$q$, NULL, 'keep'),(344137, $q$病毒预防需技术和管理并重，常见措施包括加强计算机安全教育、建立健全法律法规和相关制度、提高技术水平并配合防病毒软件。提高网络技术能力只属于网络性能范畴，并不针对病毒，因此不是病毒预防措施。故选 B。$q$, NULL, 'keep'),(344503, $q$丰富格式文本除字符外还含字体、字号、颜色等排版信息，可插入图片、表格、超链接并保留排版结果，Word 与 WPS 文档均属此类；超文本以超链接组织信息，同样是丰富格式文本的一种，并非与之对立。故选 B。$q$, NULL, 'keep'),(344558, $q$HFC 用频分复用划分上行、下行与电视频段，并以时分方式共享信道，用户可一直在线；但同轴段由众多用户共享带宽，高峰期速率明显下降，并非每人较快且稳定，该说法把共享介质说成稳定独享。故选 A。$q$, NULL, 'keep'),(344584, $q$HTML5 并非简单升级，而是新增语义标签、音视频原生支持与离线应用缓存等能力的重大版本；各浏览器支持程度不一，也并非只面向移动端优化。其标志性新特性之一正是离线缓存机制。故选 C。$q$, NULL, 'keep'),(344588, $q$调制解调器实现数字信号与模拟信号的双向转换，既调制又解调，是模拟信道上传输数字信号不可缺少的 DCE 设备；56kb/s 调制解调器下行高于上行。说它仅仅把数字信号转为模拟信号十分片面。故选 A。$q$, NULL, 'keep'),(344592, $q$Android 自上而下分为应用程序层、应用框架层、系统库与运行环境层、Linux 内核层。应用框架层提供活动与资源管理等平台基本管理功能和组件重用机制；A 属应用层，C、D 分属内核层与系统库层。故选 B。$q$, NULL, 'keep'),(344660, NULL, NULL, 'manual'),(344666, $q$网络切片在同一套物理基础设施上按业务需求划分并隔离出多个端到端逻辑网络，每片可独立配置带宽、时延与可靠性，正契合切分出多个虚拟端到端网络的描述；优化、隔离、传输均无此含义。故选 A。$q$, NULL, 'keep'),(344670, $q$题干强调的是微博、微信、博客产生海量数据，需要磁带库、磁盘阵列这类大规模存储设备，落点在于数据规模巨大；种类繁多、处理速度快、价值密度低都未由存储需求体现。故选 A。$q$, NULL, 'keep'),(344934, $q$QQ 电话、Skype 通话的语音数据多在两客户端间直接传输，服务器只负责登录与信令，属 P2P 应用而非典型 C/S；P2P 可广泛用于互联网，ATM 取款机与 VOD 确为 C/S，其可靠与安全性较弱。故选 A。$q$, NULL, 'keep'),(344979, NULL, NULL, 'manual'),(344989, $q$WWW 按客户/服务器模式工作，浏览器用 HTTP 与 URL 向服务器请求并下载网页，经解释后显示；浏览器功能不止下载浏览，还能提交表单上传信息、收发邮件、FTP 传输等，故无法向服务器上传信息错误。故选 C。$q$, NULL, 'keep'),(346063, NULL, NULL, 'manual'),(346216, $q$24 位真彩色每像素占 3 字节，图像数据量为 240×320×3＝230400 字节，除以 1024 约得 225KB；未压缩存储无需考虑压缩比，1800KB 与 MB 量级均不符。故选 A。$q$, NULL, 'keep'),(346217, $q$65536 色即每像素 16 位，一幅 2048×1024 的原始图像为 2048×1024×2B=4MB，1280 张共约 5120MB 即 5GB，实际只占 1GB，压缩比约 5:1。A 项的 2.5 倍是误按 8 位色深计算所致。故选 B。$q$, NULL, 'keep'),(346339, $q$超文本用链接把文档组织成非线性网状结构，网页基于这种结构，并且可以包含图形、图像、声音等，因此实际上属于超媒体。B 项错在网页之间的关系是非线性的；C 项错在相互链接的网页可以分布在不同的服务器上；D 项把网页说成也可以是纯文本，不符合实际。故选 A。$q$, NULL, 'keep'),(346370, $q$丰富格式文本会把字符属性、段落版式等格式信息随正文一起保存，Word、WPS 能插入图片、表格和超链接，并能保留排版信息，因此 A、C、D 都正确。HTML 用标记标签描述结构，PDF 采用页面描述语言，两者并不采用统一的格式控制符，所以 B 错误。故选 B。$q$, NULL, 'keep'),(346390, $q$VCD 采用 MPEG-1 对视频和音频进行压缩编码，视频码率约为 1.15Mbps，音频使用 MP2，这些数据按规定格式交错存放在光盘上，播放时需要先解码。MPEG-2 用于 DVD，MPEG-4 用于流媒体，MPEG-3 并未实际应用。故选 A。$q$, NULL, 'keep'),(346518, $q$计算机图形图像采用 RGB 加色模型，三原色是红、绿、蓝，三者按不同比例相加可以配出各种颜色。白色是红绿蓝等量相加的结果，属于混合色而非原色，所以不属于三原色。故选 B。$q$, NULL, 'keep'),(346524, $q$矢量图用一组绘图指令描述直线、矩形、圆、圆弧、曲线等图元的形状、位置、颜色等属性，缩放后不会失真。位图按像素阵列记录每个像素的颜色；灰度图像是只记录灰度值的位图；动图是多帧图像，三者都不是由指令集合来描述的。故选 A。$q$, NULL, 'keep'),(346529, $q$数字视频由一系列静止位图帧组成。根据人眼视觉暂留原理，只有相邻帧的切换间隔小于视觉暂留时间时，人眼才会把连续画面感知为动态，所以 B、C、D 都正确。A 说切换时间要大于视觉暂留时间，恰好说反了。故选 A。$q$, NULL, 'keep'),(346531, $q$数字声音编码通常分为三类：波形编码（如 PCM）、参数编码（如 LPC）、混合编码（如码激励线性预测）。量化是模数转换中把采样值离散化的一个步骤，不属于编码技术的分类。故选 C。$q$, NULL, 'keep'),(346534, $q$声音信号是时间和幅度都连续的模拟信号，数字音频经过采样、量化后，时间和幅度都变得离散，所以 A、B、D 正确。C 所描述的原封不动传递连续信号是模拟处理方式，而数字处理必须先采样量化，再以二进制编码传输。故选 C。$q$, NULL, 'keep'),(346535, $q$GIF 与 BMP 都是常见的位图图像格式，SWF 是 Flash 矢量动画图形格式；AVI 是音视频交错的多媒体容器格式，用于存放动态影像与声音，不属于图形图像文件格式。C 项 BPM 应为 BMP 之误。故选 B。$q$, NULL, 'keep')
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
  IF n <> 22 THEN RAISE EXCEPTION '第 4 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0c_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0c b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 3 THEN RAISE EXCEPTION '第 4 批人工数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0c_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
