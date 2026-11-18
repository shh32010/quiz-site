-- P2 第 14 批（25 道；html=18 colon=7 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(350463, $q${"A": "最常用的西文字符集是 ASCII 码字符集", "B": "ASCII 码字符集包含 96 个可打印字符和 32 个控制字符", "C": "ASCII 码字符集的每个字符采用 8 个二进位进行编码表示，所以使用 1 个字节存储 1 个 ASCII 字符", "D": "ASCII 码值排列顺序如下:小写字母>大写字母>数字"}$q$, NULL, NULL),(350485, $q${"A": "数字技术是采用有限个状态 例如\"0\"和\"1\"、来表示、处理、存储和传输信息的", "B": "在逻辑代数中,1 与 1 进行逻辑加 V、和逻辑乘 ^、的结果相同", "C": "任何一个十进制数,均可以精确地转换成等值的二进制数", "D": "在 PC 机中,通常用原码表示正整数、用补码表示负整数"}$q$, NULL, NULL),(350515, $q${"A": "<IMG /&gt", "B": "<IMAGE/&gt", "C": "<PICTURE/&gt", "D": "<PIC/&gt"}$q$, NULL, NULL),(350732, $q${"A": "无法做到“顿悟”", "B": "无法实现从“量变\"到“质变”", "C": "仍旧标准化程序的学习", "D": "具有自我意识"}$q$, NULL, NULL),(350794, $q${"A": "$c = (c - A') \\% 26 + a';$", "B": "$c2=toover(c);$", "C": "$c = c - A + a;$", "D": "$c = ( A + c ) \\% 26 - a$"}$q$, NULL, NULL),(350857, NULL, $q$像大脑一样，能够接收信息，处理信息，并对其他部件子功能系统进行智能管理。$q$, NULL),(350869, NULL, $q$智能通信不是。电网、医疗、物流、农业、制造、金融与服务、交通、家居、安防、零售等。$q$, NULL),(350870, NULL, $q$相对于传统医院信息系统的有线传输，在物联网下会呈现以无线通信方式为主的网络链接，可以使用手机连接 WIFI、无线传感网络等。$q$, NULL),(350984, $q${"A": "<PrintScreen>", "B": "粘贴按钮", "C": "<Alt> + <PrintScreen>", "D": "复制按钮"}$q$, NULL, NULL),(351017, $q${"A": "空格<2<D<a", "B": "G<g<9<空格", "C": "a<z<F<8", "D": "0<空格<D<d"}$q$, NULL, NULL),(351029, $q${"A": "“:”（冒号）", "B": "“, ”（逗号）", "C": "“ = ”（等号）", "D": "“ ' ”（撇号）"}$q$, NULL, NULL),(351043, $q${"A": "x与x按位“与”运算", "B": "将 $\\times$ 按位\"取反\"运算", "C": "x 与 x 按位“或”运算", "D": "x 与 x 按位“异或”运算"}$q$, NULL, NULL),(351140, $q${"A": "商品号进行选择运算", "B": "名称、价格进行投影", "C": "名称等于\"李芸迪《监狱疯云》\"进行选择运算，再按名称和价格进行投影运算", "D": "商品号等于\"222002\"进行选择运算，再按名称、价格进行排序"}$q$, NULL, NULL),(351298, $q${"A": "<", "B": "+", "C": "&&", "D": "!="}$q$, NULL, NULL),(351301, $q${"A": "不能与其它数据库重名。", "B": "名称由任意字母、阿拉伯数字、下划线（）和“\\$”组成，但不能使用单独的数字。", "C": "不能使用 MySQL 关键字作为数据库名、表名。", "D": "在默认情况下，Windows 下数据库名、表名的大小写是一样的<br/>", "E": "而在 Linux 下数据库名、表名的大小写是有区别的。<br/>", "F": "库的名称尽量控制在 32 个字符以内，最长不超过 64 个字符。"}$q$, NULL, NULL),(351324, NULL, $q$三层结构类型的物联网:感知层、网络层、应用层。$q$, NULL),(351485, $q${"A": "空格符>b>B", "B": "空格符>B>b", "C": "b>B>空格符", "D": "B>b> 空格符"}$q$, NULL, NULL),(351623, NULL, $q$JPEG 格式不是由苹果公司开发的工业标准,JPEC 支持有损压缩和无损压缩,实际应用中有损压缩更多。JPEG 格式适用范围广,能处理各种连续色调的彩色或灰度图像;算法复杂度适中;既可用硬件实现,也可用软件实现;图像的压缩比可控制。JPEG 2000:采用了小波分析等先进算法,提供了更好的图像质量,更低的码率,更适合在 WWW 网上传输,它兼容 JPEG,压缩率更高。$q$, NULL),(351653, NULL, $q$网络面向不同的应用场景,大速率、低时延、海量连接、高可靠性等,将网络切割成满足不同需求的虚拟子网络。每个虚拟子网络的移动性、安全性、时延、可靠性,甚至计费方式等都不一样,相互之间逻辑独立,形成“网络切片”。$q$, NULL),(351656, NULL, $q$大数据技术，是指指伴随着大数据的采集、存储、分析和应用的相关技术，是一系列使用非传统的工具来对海量的结构化、半结构化和非结构化数据进行处理，从而获得分析和预测结果的一系列数据处理和分析技术。$q$, NULL),(351797, $q${"A": "DELETE FROM 定单表 WHERE 定单日期 < DATEADD(YY, -3, GETDATE())", "B": "DELETE FROM 定单表 WHERE 定单日期 < DATEADD(YY, 3, GETDATE())", "C": "DELETE FROM 定单表 WHERE 定单日期 <GETDATE() - 3", "D": "DELETE FROM 定单表 WHERE 定单日期 <GETDATE() + 3"}$q$, NULL, NULL),(352217, $q${"A": "移动台是移动的通信终端，它是收发无线信号的设备，如:手机、无绳电话等", "B": "移动台就是移动电话交换中心", "C": "移动台就是基站，它们相互分割又彼此有所交叠，形成\"蜂窝式移动通信\"", "D": "在移动通信系统中，移动台之间是直接进行通信的"}$q$, NULL, NULL),(352335, $q${"A": "虚拟化", "B": "分布式计算", "C": "分布式存储", "D": "物联网<br/>", "E": "单租户"}$q$, NULL, NULL),(352395, $q${"A": "【打开默默学播放器补全____】", "B": "00011001|01001010=01011011", "C": "00000011&00000110=00000010", "D": "取反~运算是二进制位1变0，0变1。"}$q$, NULL, NULL),(352472, $q${"A": "15", "B": ">15", "C": "<=15", "D": "10"}$q$, NULL, NULL)
;
UPDATE t_question q
SET option_json = coalesce(e.option_new, q.option_json),
    analysis = coalesce(e.analysis_new, q.analysis),
    stem = coalesce(e.stem_new, q.stem)
FROM p2_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.option_new IS NOT NULL AND q.option_json = e.option_new;
  IF n <> 18 THEN RAISE EXCEPTION '第 14 批 HTML 更新数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 7 THEN RAISE EXCEPTION '第 14 批解析去冒号数应为 7，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 14 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 14 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 14 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
