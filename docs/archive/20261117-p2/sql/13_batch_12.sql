-- P2 第 12 批（25 道；html=13 colon=11 prefix=1）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(345222, $q${"A": "<mp3>", "B": "<audio>", "C": "<sound>", "D": "<object>"}$q$, NULL, NULL),(345682, NULL, NULL, $q$采用迅雷在线播放视频，本地机不仅从网上多点（计算机）下载视频，同时也向网上上传已下载到本地机的视频。$q$),(345745, NULL, $q$除了通过光驱来安装操作系统，还可以通过 U 盘来安装操作系统。$q$, NULL),(345879, $q${"A": "HTML5 新增加了结构性内容元素，比如 header、nav、section、article、foote", "B": "HTML5 新增了音频和视频标签", "C": "HTML5 新增了离线缓存机制", "D": "HTML5 简化了 DOCTYPE 的声明方法:<!DOCTYPE html>"}$q$, NULL, NULL),(345936, NULL, $q$条形码分为一维条形码、二维条形码。选项A错误。其他正确。$q$, NULL),(345986, NULL, $q$条形码分为一维条形码、二维条形码。选项A错误。其他正确。$q$, NULL),(346213, NULL, $q$平均访问时间=平均寻道时间+平均等待时间。平均访问时间是评价硬盘读写数据所用时间的最佳指标,主要取决于硬盘的旋转速度、寻道时间和传输速率。$q$, NULL),(346226, NULL, $q$| 名称 | 图像格式 | 压缩后的码率 | 主要应用 |
| --- | --- | --- | --- |
| MPEG-1 | 360×288 | 大约1.2Mb/s~1.5Mb/s | 适用于VCD、数码相机、数字摄像机等 |
| H.261 | 360×288或180×144 | Px64 kb/s (P=1、2时,只支持180×144格式,P≥6时,可支持360×288格式) | 应用于视频通信,如可视电话、会议电视等 |
| MPEG-2(MP@ML) | 720×576 | 5Mb/s~15Mb/s | 用途最广,如DVD、卫星电视直播、数字有线电视等 |
| MPEG-2高清格式 | 1440×11521920×1152 | 80Mb/s~100Mb/s | 高清晰度电视(HDTV)领域 |
| MPEG-4ASP | 分辨率较低的视频格式 | 与MPEG-1,MPEG-2相当,但最低可达到64kb/s | 在低分辨率低码率领域应用,如监控、IPTV、手机、MP4播放器等 |
| MPEG-4AVC | 多种不同的视频格式 | 采用多种新技术,编码效率比MPEG$q$, NULL),(346233, NULL, $q$控制与显示技术主要是扩展效应器官功能,增强人们的信息控制能力。$q$, NULL),(346255, $q${"A": "<aud> 和<vid>", "B": "'aurlio> 和<video>", "C": "<sound> 和<video>", "D": "<audio> 和<film>"}$q$, NULL, NULL),(346265, $q${"A": "从扫描仪输入的图片以\"图像\"类型插入到Word或PowerPoint文档中", "B": "使用 Word 或 PowerPoint 中绘图工具绘制而成的是图形", "C": "在 Word 和 PowerPoint 中，不能对图像的大小进行修改", "D": "在 Word 和 PowerPoint 中，图形可以编辑修改"}$q$, NULL, NULL),(346507, $q${"A": "允许插入在其他图形程序中创建的图片", "B": "为了将某种格式的图片插入到POWERPOINT中，必须安装相应的图形过滤器", "C": "选择插入菜单中的\"图片\"命令，再选择\"来自文件\"", "D": "在插入图片前，不能预览图片"}$q$, NULL, NULL),(346537, $q${"A": "<sound>", "B": "<audio>", "C": "<mp3>", "D": "<media>"}$q$, NULL, NULL),(346607, $q${"A": "<movie>", "B": "<media>", "C": "<video>", "D": "<mp4>"}$q$, NULL, NULL),(346620, $q${"A": "MID 是计算机和数字乐器使用的音乐描述语言", "B": "目前音乐合成器大多使用一种称为\"波表合成器\"的软件音源", "C": "使用音序器软件制作 MIDI 音乐时，普通的 ASCII 键盘可以用于输入和修改乐谱", "D": "与 IP3 音乐相比, MIDI 音乐的数据量较大, 且不易于编辑修改"}$q$, NULL, NULL),(346677, $q${"A": "数码相机保存的图片文件是经过数据压缩处理的", "B": "MP3 音乐中的\"MP3\"是指采用了 MPEG-3 的压缩编码格式", "C": "不同类型的图片文件通常可以使用某种工具软件进行格式转换", "D": "VCD、DVD 等视频信息是采用 MPEG 标准对运动图像及其伴音进行压缩编码的"}$q$, NULL, NULL),(346679, $q${"A": "cd @John", "B": "cd #John", "C": "cd &John", "D": "cd ~John"}$q$, NULL, NULL),(346735, NULL, $q$信息技术扩展信息器官功能:

①、扩展感觉器官（视、听、触等）的感测（获取）与识别技术。=>信息的获取与识别
②、扩展神经系统功能的通信技术。=>信息的通信与存储
③、扩展大脑功能（思维器管）的计算（处理）与存储技术。=>信息的计算与存储
④、扩展效应器官（（手、脚、口等））功能的控制与显示技术。=>信息的控制与显示$q$, NULL),(346743, $q${"A": "=SUM(“1”, 1, ”1900-1-2”, TRUE)", "B": "=IF(1>3,5,10)", "C": "=ÄVERAGE (10, 2)", "D": "=COUNT( A )*5"}$q$, NULL, NULL),(346869, $q${"A": "MID 是计算机和数字乐器使用的音乐描述语言", "B": "目前音乐合成器大多使用一种称为\"波表合成器\"的软件音源", "C": "使用音序器软件制作 MIDI 音乐时，普通的 ASCII 键盘可以用于输入和修改乐谱", "D": "与IP3音乐相比,MIDI音乐的数据量较大，且不易于编辑修改"}$q$, NULL, NULL),(346884, $q${"A": "<mp3>", "B": "<audio>", "C": "<sound>", "D": "<object>"}$q$, NULL, NULL),(347207, NULL, $q$计算机网络由资源子网和通信子网两部分组成。资源子网负责收集、存储和处理信息,为用户提供网络服务和资源共享功能。而通信子网负责连接网络上各种计算机,完成数据的传输、交换、加工和通信处理工作。$q$, NULL),(347214, NULL, $q$数据字典是数据库中所有对象及其关系的信息集合。数据字典最重要的作用是作为分析阶段的工具。数据字典是数据库的重要组成部分,它存放有数据库所用的有关信息,对用户来说是一组只读的表。

数据字典可能包含的信息，例如:数据库设计资料（数据类型、模式结构等）；储存的 SQL程序（查询、事务、过程等）；用户权限；用户统计；数据库的过程中的信息；数据库增长统计；数据库性能统计。$q$, NULL),(347215, NULL, $q$数据库管理系统(DBMS):它是一种操纵和管理数据库的大型软件,其任务是统一管理和控制整个数据库的建立、运用和维护,使用户能方便地定义数据和操纵数据,并保证数据的安全性、完整性,多用户对数据的并发使用及发生故障后的数据库恢复。用户可以通过 DBMS访问数据库中的数据,数据库管理员(DBA)也通过 DBMS 进行数据库的维护工作。对数据库的一切操作都是通过 DBMS 进行的。$q$, NULL),(347320, NULL, $q$磁带库、磁盘阵列这些属于存储设备，数据量大才会使用这些设备来存储。$q$, NULL)
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
  IF n <> 13 THEN RAISE EXCEPTION '第 12 批 HTML 更新数应为 13，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 11 THEN RAISE EXCEPTION '第 12 批解析去冒号数应为 11，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 1 THEN RAISE EXCEPTION '第 12 批前缀修复数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 12 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 12 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
