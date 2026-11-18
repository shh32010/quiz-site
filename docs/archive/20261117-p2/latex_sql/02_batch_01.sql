-- LaTeX 第 1 批（25 道）
BEGIN;
CREATE TEMP TABLE latex_expected (id integer PRIMARY KEY, option_new text NOT NULL) ON COMMIT DROP;
INSERT INTO latex_expected (id, option_new) VALUES
(335752, $q${"A": "$10ms$", "B": "5ms", "C": "15ms", "D": "20ms"}$q$),
(335753, $q${"A": "$300KB / s$", "B": "$600 ~KB / s$", "C": "$900KB / s$", "D": "1. $2 MB / s$"}$q$),
(335754, $q${"A": "2000KB/", "B": "$4000KB / s$", "C": "$6000 ~KB / s$", "D": "8000 KB/s"}$q$),
(335757, $q${"A": "$32 ~KB$", "B": "7FFFB", "C": "1MB", "D": "8000B"}$q$),
(335766, $q${"A": "可支持音视频信号的输出功能，可替代 hdmi 接口", "B": "支持 usb3.1 版本", "C": "最高传输速度为 $10Gb / s$", "D": "不再区分方向，正反均可插入"}$q$),
(335831, $q${"A": "$16MB / s$", "B": "133 MB /s", "C": "266 MB/s", "D": "2128 MB /s"}$q$),
(336127, $q${"A": "目前市场上 PC 硬盘容量大多为 10GB～20GB", "B": "平均等待时间是指数据所在扇区旋转到磁头下的平均时间，目前大约为 $3\\mu s\\sim 6\\mu s$", "C": "平均寻道时间是指移动磁头到数据所在磁道(柱面)所需的平均时间，目前大约是几个毫秒", "D": "硬盘上的高速缓冲存储器 Cache 能提高硬盘的数据传输性能，目前容量一般为 64MB. 存储材质属于"}$q$),
(336275, $q${"A": "SELECT sno，sname FROM student WHERE sname='_t%'；", "B": "SELECT sno，sname FROM student WHERE sname LIKE '_t%'；", "C": "SELECT sno，sname FROM student WHERE $sname= \\% t_{-}$", "D": "SELECT sno，sname FROM student WHERE sname LIKE '%t_'；"}$q$),
(336924, $q${"A": "$16MB / s$", "B": "133MB/s", "C": "266MB/s", "D": "2128MB/s"}$q$),
(336952, $q${"A": "1GB", "B": "2GB", "C": "$4GB$", "D": "8GB"}$q$),
(336954, $q${"A": "$300KB / s$", "B": "$600KB / s$", "C": "900KB/s", "D": "1.2MB/s"}$q$),
(336955, $q${"A": "2000KB/", "B": "$4000KB / s$", "C": "6000KB/s", "D": "$8000KB / s$"}$q$),
(337000, $q${"A": "$0.1 ~ms$", "B": "6ms", "C": "$18ms$", "D": "$120ms$"}$q$),
(337434, $q${"A": "$3ms$", "B": "6ms", "C": "$50ms$", "D": "$100ms$"}$q$),
(337502, $q${"A": "定点正整数 $X$ 与定点正整数 $Y$ 相加", "B": "定点负整数 X 与定点负整数 Y 相加", "C": "定点负整数 $X$ 与定点负整数 $Y$ 相减", "D": "定点负整数 X 与定点正整数 Y 相减"}$q$),
(340068, $q${"A": "T=R∩S", "B": "T=R∪S", "C": "$T = R\\times S$", "D": "T=R/S"}$q$),
(340092, $q${"A": "1EB=1024TB", "B": "$1EB = 2^{26}PB$", "C": "$1EB = 2^{30}MB$", "D": "$1EB = 2^{30}GB$"}$q$),
(340632, $q${"A": "$2^{k} - 1$", "B": "$2^{k - 1} - 1$", "C": "$2^{k - 1}$", "D": "$2^{k}$"}$q$),
(340923, $q${"A": "执行算法程序所需要的存储空间 0 (n)", "B": "算法程序的长度", "C": "算法执行过程中所需要的基本运算次数 $T\\left( n\\right)$", "D": "算法程序中的指令条数"}$q$),
(344805, $q${"A": "蓝牙是一种短距离无线通信技术", "B": "通信距离仅 $10cm$ 左右", "C": "最高传输速率可达 24Mb/s", "D": "采用802.15协议"}$q$),
(344837, $q${"A": "USB 3.1 速度比 USB 3.0 速度更快", "B": "USB 3.0 最大传输速率为 $3.2Gb / s$", "C": "Sata 3.0 最大传输速率为 $600MB / s$", "D": "蓝牙（无线）最大传输速率为 $1Mb / s$"}$q$),
(344923, $q${"A": "它的传输速率可达 $10^{\\sim}100Mb/s$ ，传输距离可达几十千米甚至更远", "B": "它既可以用于传输模拟信号，也可以用于传输数字信号", "C": "与同轴电缆相比，双绞线易受外部电磁波的干扰，线路本身也产生噪声，误码率较高", "D": "双绞线大多用作局域网通信介质"}$q$),
(344926, $q${"A": "蓝牙（无线）最大传输速率为 24Mb/s", "B": "USB 3.0 最大传输速率为 3.2Gb/s", "C": "Sata 3.0 最大传输速率为 $600MB / s$", "D": "USB 3.1 最大传输速率为 400MB/s"}$q$),
(345903, $q${"A": "只能编辑小于 $64K$ 的文本文件", "B": "只能编辑不带格式的文档", "C": "编辑的文件不能存为 Word 文档", "D": "编辑的文件中可以插入图片和声音文件"}$q$),
(345942, $q${"A": "语音频率范围是300至 $4300Hz$", "B": "全频带声音频率范围是 20Hz 至 20kHz", "C": "音频是模拟信号", "D": "音频信号经过数字化后可以使用计算机进行处理"}$q$)
;
UPDATE t_question q
SET option_json = e.option_new
FROM latex_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
   WHERE q.option_json = e.option_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 1 批更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_latex b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 1 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
