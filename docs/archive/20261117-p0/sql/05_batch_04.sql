-- P0-211 第 4 批（25 道：24 写入 + 1 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(344578, $q$URL 由协议、主机名与路径按顺序组成，C 项 http://smartfox.com/index.html 结构正确；A 未写协议，B 主机名拼错且路径出现双斜杠，D 文件名拼写有误。故选 C。$q$, NULL, NULL, 'keep'),(344663, $q$全息通信需实时传输大容量全景影像，带宽需求极高，对应增强移动宽带（eMBB）场景；海量大连接面向低速率海量终端，低时延高可靠面向实时控制。故选 A。$q$, NULL, NULL, 'keep'),(344838, $q$IPv4 地址用圆点分隔四段十进制数，C 项以逗号分隔，格式明显不合法；A 虽属 D 类组播地址，但书写形式仍是合法 IP 地址。故选 C。$q$, NULL, NULL, 'keep'),(344928, $q$网卡的基本功能包括数据转换、数据缓存与通信控制，负责在计算机与网络之间收发数据；数据压缩与解压缩由专门的软件或协议完成，不属于网卡的基本功能。故选 A。$q$, NULL, NULL, 'keep'),(345032, $q$网址域名中的 gov 取自 government，代表政府部门；com 表示商业机构，net 表示网络机构，edu 表示教育机构，答题时要注意区分这些后缀的含义。故选 D。$q$, NULL, NULL, 'keep'),(345676, $q$图像大小也称图像分辨率，彩色图像具有多个位平面，颜色模型可以有多种，这三项均正确；像素深度表示每个像素的二进制位数，决定颜色数目而非像素总数。故选 D。$q$, NULL, NULL, 'keep'),(345897, $q$BMP 图像在 Windows 环境中得到广泛支持，TIF 常用于扫描仪与桌面印刷系统，GIF 支持动画和渐进显示；JPG 与 GIF 各有适用场合，不能笼统说 JPG 更适合网页。故选 B、C、D。$q$, NULL, NULL, 'keep'),(346086, $q$搜索引擎检索网页、播放器解码 MP3、Word 中查找替换都要按确定步骤处理数据，属于算法应用；打开网页只是网络访问操作，不需要算法求解问题。故选 B。$q$, NULL, NULL, 'keep'),(346170, $q$图例用颜色、线型等符号说明各数据系列所代表的含义，是读图时理解数据的关键；坐标轴和刻度则标注数据的类别与数值大小。故选 C。$q$, NULL, NULL, 'keep'),(346224, $q$Flash 是基于矢量的交互式动画软件，文件后缀为 .swf，可借助脚本实现交互，也能通过透视与元件表现三维空间效果；说用户无法与播放内容交互是错误的。故选 D。$q$, NULL, NULL, 'keep'),(346342, $q$像素深度是每个像素占用的二进制位数，决定可表示的颜色数目；图像包含的像素最大数目由水平与垂直分辨率决定，故 D 说法错误，其余三项正确。故选 D。$q$, NULL, NULL, 'keep'),(346401, $q$32×32 点阵的一个汉字字形需要 32×32=1024 个二进制位，换算成字节即 1024÷8=128 字节，与颜色数量和屏幕分辨率无关。故选 C。$q$, NULL, NULL, 'keep'),(346417, $q$计算机图形既能绘制电路图、天气图、计算机动画等实用图像，也能构造现实世界并不存在的虚拟景物；“只能生成实际存在景物”说法错误。故选 D。$q$, NULL, NULL, 'keep'),(346429, $q$图像大小（分辨率）与像素深度含义不同：前者决定图像包含的像素数目，后者决定每个像素的颜色位数；彩色图像有多个位平面，颜色模型也可多种。故选 D。$q$, NULL, NULL, 'keep'),(346587, $q$CMYK 中 C 表示青（湛蓝）、M 表示洋红（品红）、Y 表示黄、K 表示黑，所以 M 即 Magenta，是喷墨打印常用的品红墨水。故选 B。$q$, NULL, NULL, 'keep'),(346656, NULL, NULL, NULL, 'manual'),(346782, $q$真彩色图像每个像素占 24 位即 3 个字节，2048×1024×3=6291456 字节，再除以 1024 两次即得 6MB。故选 B。$q$, NULL, NULL, 'keep'),(346786, $q$48 位彩色图像每个像素占 6 个字节，240×320×6=460800 字节，460800÷1024=450KB，注意先完成位到字节的换算。故选 B。$q$, NULL, NULL, 'keep'),(346901, $q$Flash 是基于矢量的交互式动画软件，文件后缀为 .swf，可借助脚本实现交互，也能通过透视与元件表现三维空间效果；说用户无法与播放内容交互是错误的。故选 D。$q$, NULL, NULL, 'keep'),(346912, $q$存储量=44.1kHz×16 位×2 声道×120 秒÷8=21168000 字节，约 21.168MB；10.584MB 是只计算一个声道的结果。故选 C。$q$, NULL, NULL, 'keep'),(346922, $q$灰度图像通常每个像素用 8 位表示 256 级灰度，即具有 8 个位平面；640×480=38400 是像素总数，不是位平面数。故选 A。$q$, NULL, NULL, 'keep'),(346995, $q$算法是按确定步骤处理数据、解决问题的方法：搜索引擎检索网页、播放器解码 MP3、Word 查找替换均属算法应用；打开网页只是网络访问，不需要算法求解。故选 B。$q$, NULL, NULL, 'keep'),(347090, $q$数字视频文件封装运动图像编码、声音编码等数据流，供播放器解码播放；播放器程序是独立的应用软件，一般不包含在视频文件中。故选 A。$q$, NULL, NULL, 'keep'),(349260, $q$十六进制 F4 等于 15×16+4=244，而 11110100B 也等于 244；3640Q、1111100B 与 173D 换算后均不等于 244。故选 A。$q$, NULL, NULL, 'keep'),(349308, $q$一个关系中不允许出现完全相同的元组，主键取值必须唯一，因此“可以全同”“必须全同”“可以主键相同其他属性不同”均错误，只有“不允许主键相同”正确。故选 A、B、D。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('uncertain', 'manual') AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 24 THEN RAISE EXCEPTION '第 4 批写入数应为 24，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 1 THEN RAISE EXCEPTION '第 4 批 uncertain/manual 数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 4 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
