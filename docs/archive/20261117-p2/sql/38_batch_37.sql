-- P2 第 37 批（25 道；html=0 colon=25 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(389219, NULL, $q$FTP 可以通过 IE 浏览器（其他浏览器）使用这个功能。FTP 允许用户一次上传或下载一个或多个文件。即选项 AB 有误。$q$, NULL),(389230, NULL, $q$程序=算法+数据结构（是由科学家尼克劳斯-沃思提出），算法是指解题方案的准确而完整的描述,是一系列解决问题的清晰指令,算法代表着用系统的方法描述解决问题的策略

机制。$q$, NULL),(389231, NULL, $q$操作系统的功能:处理器管理、存储管理、文件管理、设备管理等。$q$, NULL),(389257, NULL, $q$分辨率用来表示组成该图像的行列数目，亦即图像所包含的像素数目。像素深度，即像素的所有颜色分量的二进位数目之和。$q$, NULL),(389258, NULL, $q$射频识别(RFID)是一种无线通信技术,可以通过无线电讯号识别特定目标并读写相关数据,而无须识别系统与特定目标之间建立机械或者光学接触。$q$, NULL),(389268, NULL, $q$集成电路在 20 世纪 50 年代出现,以半导体单晶片作为材料。现代集成电路使用的半导体材料通常是硅(Si),也可以是化合物半导体如砷化镓(GaAs)等。$q$, NULL),(389278, NULL, $q$硬盘中的数据记录在连续的同心圆磁道上。$q$, NULL),(389281, NULL, $q$用户自身与硬件之间是无法进行交流沟通的,如果没有操作系统作为平台支持,用户也无法让计算机硬件完成任何功能操作。比如,让打印机打印出一份文件资料,或者让扫描仪扫描一幅图片等。$q$, NULL),(389286, NULL, $q$GB2312-80 字符集汉字机内码双字节,最高位是 1;西文字符机内码单字节,最高位是 0。GBK 汉字内码双字节编码,【第 1 字节的最高位必为 1,【第 2 字节的最高位不一定是 1;看清题目中使用的编码类型。一个汉字占两个字节,一个西文字符占一个字节,一个十六进制数占4 位二进制,则一个汉字占 4 个十六进制数。本题主要看是 GB2312 还是 GBK,之后观察其【第一位的情况,即可判断。$q$, NULL),(389287, NULL, $q$选项 D 正确,是将数据包分成很多个组,之后进行依次传输。在局域网是数据帧,在广域网就变成数据包。$q$, NULL),(389289, NULL, $q$GB18030 在 GB2312 和 GBK 的基础上扩充,增加了 4 字节编码,能完全映射 UCS/ Unicode 中的字符集。GB18030-2000 标准中汉字数目的增加到 27000 多个。$q$, NULL),(389296, NULL, $q$信息技术扩展信息器官功能:

①、扩展感觉器官（视、听、触等）的感测（获取）与识别技术。=>信息的获取与识别
②、扩展神经系统功能的通信技术。=>信息的通信与存储
③、扩展大脑功能（思维器管）的计算（处理）与存储技术。=>信息的计算与存储
④、扩展效应器官（（手、脚、口等））功能的控制与显示技术。=>信息的控制与显示$q$, NULL),(389316, NULL, $q$Zigbee 网络结构分为 4 层，从下到上分别为:物理层、MAC 层、网络层、应用层；$q$, NULL),(389320, NULL, $q$声卡以数字信号处理器(DSP)为核心,是一种专用的微处理器。可以实现音频信号的数字化、解码、MIDI 声音合成及音频编辑操作。但声卡中无法实现声音文件的存储,故选择ABD。其中需要同学们区分波形声音的获取与声音重建的不同。$q$, NULL),(389330, NULL, $q$程序=算法+数据结构（是由科学家尼克劳斯-沃思提出），算法是指解题方案的准确而完整的描述,是一系列解决问题的清晰指令,算法代表着用系统的方法描述解决问题的策略

机制。$q$, NULL),(389331, NULL, $q$操作系统的功能:处理器管理、存储管理、文件管理、设备管理等。$q$, NULL),(389333, NULL, $q$传输层∶TCP 协议（传输控制协议，面向连接、可靠）、 UDP 协议（用户数据报协议，无连接、不可靠、尽力而为、音频视频传输）。$q$, NULL),(389334, NULL, $q$数字视频的获取设备:数码相机的成像器件也是 CMOS 或 CCD，是通过光学镜头和CCD 或 CMOS 采集动态图像，转换成数字信号。$q$, NULL),(389353, NULL, $q$算法就是计算机解题的过程,数据结构+算法=程序。$q$, NULL),(389366, NULL, $q$同轴电缆（电流/电压传输）:基带同轴电缆（50Ω）（以前在以太网中使用）、宽带同轴电缆（75Ω）（有线电视网使用）$q$, NULL),(389380, NULL, $q$（1）自顶向下∶程序设计时，应先考虑总体，后考虑细节;先考虑全局目标，后考虑局部目标。

（2）逐步求精∶对复杂问题，应设计一些子目标作为过渡，逐步细化。
（3）模块化∶一个复杂问题，肯定是由若干稍简单的问题构成。模块化是把程序要解决的

总目标分解为子目标，再进一步分解为具体的小目标，把每一个小目标称为一个模块。$q$, NULL),(389382, NULL, $q$描述算法的可以是流程图、自然语言、伪代码，也可以是程序设计语言。$q$, NULL),(389383, NULL, $q$实时操作系统:对计算机完成任务有严格的时间约束,对外部事件能快速做出响应,具有很高的可靠性和安全性。实时操作系统的代表有:军事指挥和武器控制系统、电力网调度和工业控制系统、银行证券交易信息处理系统等。$q$, NULL),(389387, NULL, $q$计算机从共享式以太网转入交换式以太网无须更换网卡,与网卡设备无关。从共享式网络转到交换式网络只是网络中的连接设备发生的变化,网络适配设备是不需要更换的。$q$, NULL),(389396, NULL, $q$MIDI 格式在音质方面较差,无法合成各种不同的声音(例如语音)。而解说是语音，所以 MIDI 无法合成。$q$, NULL)
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
  IF n <> 0 THEN RAISE EXCEPTION '第 37 批 HTML 更新数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 37 批解析去冒号数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 37 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 37 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 37 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
