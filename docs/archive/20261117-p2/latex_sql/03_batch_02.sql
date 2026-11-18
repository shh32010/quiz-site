-- LaTeX 第 2 批（25 道）
BEGIN;
CREATE TEMP TABLE latex_expected (id integer PRIMARY KEY, option_new text NOT NULL) ON COMMIT DROP;
INSERT INTO latex_expected (id, option_new) VALUES
(346015, $q${"A": "$6 ~KB$", "B": "6MB", "C": "$256 ~KB$", "D": "768KB"}$q$),
(346021, $q${"A": "$32 kB / s$", "B": "$128 ~kb / s$", "C": "256kb/s", "D": "$256 kB / s$"}$q$),
(346141, $q${"A": "采样频率 $16kHz$ ，8位量化精度", "B": "采样频率 22kHz，16 位量化精度", "C": "采样频率 44.1kHz, 8 位量化精度", "D": "采样频率44.1kHz，16位量化精度"}$q$),
(346200, $q${"A": "话音信号定义的频率范围最高值小于 $4kHz$", "B": "话音信号定义的频率范围最高值小于8kHz", "C": "数字话音传输线路的带宽只有8kHz", "D": "一般声卡的采样处理能力只能达到每秒 8kHz"}$q$),
(346585, $q${"A": "语音信号文定义的频率的最高值为 $4kHz$", "B": "语音信号文定义的频率的最高值为 $8kHz$", "C": "数字语音频率传输线路的带宽只有 8kHz", "D": "一般声卡的采样频率最高为每秒 $8 k$ 次"}$q$),
(346702, $q${"A": "X+Y", "B": "$X\\cdot Y + \\overline{X}\\cdot \\overline{Y}$", "C": "$\\overline{X} +\\overline{Y}$", "D": "$\\overline{X} \\cdot Y + X \\cdot \\overline{Y}$"}$q$),
(346721, $q${"A": "$0.5MB$", "B": "$2 ~MB$", "C": "1MB", "D": "16MB"}$q$),
(346726, $q${"A": "$32kB / s$", "B": "$128kb / s$", "C": "$256kb / s$", "D": "$256kB / s$"}$q$),
(346781, $q${"A": "$88.2 ~kb / s$", "B": "176.4 kb/s", "C": "705.6 kb/s", "D": "1411.2 kb/s"}$q$),
(346798, $q${"A": "$0.5MB$", "B": "2MB", "C": "1MB", "D": "16MB"}$q$),
(346929, $q${"A": "语音信号定义的频率最高值为 $4 kHz$", "B": "语音信号定义的频率最高值为 $8 kHz$", "C": "数字语音转输线路的带宽只有 $8 kHz$", "D": "一般声卡的采样频率最高为每秒 $8 k$ 次"}$q$),
(346970, $q${"A": "语音信号定义的频率最高值为 $4kHz$", "B": "语音信号定义的频率最高值为 $8kHz$", "C": "数字语音转输线路的带宽只有 $8kHz$", "D": "一般声卡的采样频率最高为每秒 $8k$ 次"}$q$),
(346980, $q${"A": "$960kB$", "B": "$480kB$", "C": "$120kB$", "D": "$60kB$"}$q$),
(347005, $q${"A": "$6 MHz$", "B": "$12MHz$", "C": "18MHz", "D": "20MHz"}$q$),
(347077, $q${"A": "$64Kb / s$", "B": "32kb/s", "C": "96Mb/s", "D": "128kb/s"}$q$),
(347089, $q${"A": "22.05KHz", "B": "16KHz", "C": "8KHz", "D": "$4KHz$"}$q$),
(347093, $q${"A": "音频信号数字化过程中，量化精度越高则声音的保真度越好，目前通常是 64 位", "B": "全频带音频的频率范围为 $20 ~Hz \\sim 20 kHz$, 话音 (或语音) 的频率范围为 $300 \\sim 3400 ~Hz$", "C": "数字音频获取设备包括麦克风（话筒）和声卡，前者的作用是将声波转换为电信号", "D": "为了不产生失真，音频信号数字化时取样频率不应低于音频信号最高频率的两倍"}$q$),
(347098, $q${"A": "$4kHz$", "B": "8kHz", "C": "$20kHz$", "D": "44. 1kHz"}$q$),
(347099, $q${"A": "4kHz", "B": "$8kHz$", "C": "20kHz", "D": "44. 1kHz"}$q$),
(347128, $q${"A": "$4kHz$", "B": "$8kHz$", "C": "$20kHz$", "D": "44. 1kHz"}$q$),
(349377, $q${"A": "$1 Mb / S = 10^{3}$ 比特/秒", "B": "$1Mb / S = 10^{6}$ 比特/秒", "C": "$1Gb / S = 10^{6}$ 比特/秒", "D": "$1Gb / S = 10^{12}$ 比特/秒"}$q$),
(349378, $q${"A": "R-1", "B": "R", "C": "R+1", "D": "$2 R$"}$q$),
(349416, $q${"A": "34H", "B": "54H", "C": "$64 H$", "D": "$24 H$"}$q$),
(349428, $q${"A": "用“复制”命令把选定的对象送到剪贴板", "B": "用“剪切”命令把选定的对象送到剪贴板", "C": "用 $CTRL + V$ 把选定的对象送到剪贴板", "D": "Alt+PrintScreen 把当前窗口送到剪贴板"}$q$),
(349497, $q${"A": "制作用于幻灯机的 $35mm$ 的幻灯片或投影片", "B": "制作数据库文件", "C": "制作用于计算机的电子幻灯片", "D": "播放制作完成的幻灯片"}$q$)
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
  IF n <> 25 THEN RAISE EXCEPTION '第 2 批更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_latex b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
