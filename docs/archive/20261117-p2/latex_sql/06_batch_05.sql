-- LaTeX 第 5 批（25 道）
BEGIN;
CREATE TEMP TABLE latex_expected (id integer PRIMARY KEY, option_new text NOT NULL) ON COMMIT DROP;
INSERT INTO latex_expected (id, option_new) VALUES
(372011, $q${"A": "d^{*} h / 2", "B": "1 / 2 ^ { * } \\mathrm { d ^ { * } h }", "C": "\\mathrm{d^{*}h^{*}1/2}", "D": "d/2 物"}$q$),
(372164, $q${"A": "\\mathbf { a } ^ { \\wedge 3 }", "B": "\\mathbf { a } ^ { * * } 3", "C": "\\mathbf { p o w } ( \\mathbf { a } , 3 )", "D": "\\mathrm { p o w e r } ( \\mathrm { a } , \\mathrm { 3 } )"}$q$),
(372813, $q${"A": "60", "B": "35", "C": "45", "D": "25 解析: \\mathrm { R E S ^ { * } } 5 { + } 3 0 = 3 0 { - } 5 ^ { * } 5 { + } 3 0 = 3 0 { - } 2 5 { + } 3 0 { = } 3 5 。选 B。"}$q$),
(372847, $q${"A": "\\mathbf { f l o a t }   \\mathrm { ^ { * } p ; }   \\mathrm { i n t } \\mathrm { a ; }   \\mathrm { p { = } 8 a ; }", "B": "int p, a ; ^ { * } p { = } 8 a ;", "C": "int * _ { \\mathbf { p } , \\mathbf { a } ; } ^ { * } \\mathrm { p } = \\mathrm { g } a ;", "D": "int ^ { * } \\mathtt { p } , \\mathtt { a } ; \\mathtt { p } { = } \\mathtt { & } \\mathtt { a } ;"}$q$),
(372848, $q${"A": "int t , * \\mathrm { p t } { = } t ;", "B": "int ^ { * } \\mathrm { p t } { = } \\mathrm { g } _ { \\mathrm { t } } , \\mathrm { t } ;", "C": "int ^ { * } \\mathrm { p t } = \\mathrm { g t } ;", "D": "int t ^ { * } \\mathrm { p t } = 0 ;"}$q$),
(376194, $q${"A": "只能写入一次，可以反复读出的一次性写入光盘", "B": "可多次擦除型光盘", "C": "只能读出，不能写入的只读光盘", "D": "其驱动器单倍数为 $1350 ~KB / S$ 的高密度可读写光盘"}$q$),
(377325, $q${"A": "chmod $a + x$ ,g+wexer1", "B": "chmod765exer1", "C": "chmod o+x exer1", "D": "chmod g+w exer1"}$q$),
(377352, $q${"A": "ADSL 的含义是非对称数字用户线", "B": "ADSL 使用普通电话线作为传输介质，最高能够提供 8Mbps 的下载速率和 1Mbps 的上传速率", "C": "ADSL的传输距离可达 $5km$", "D": "ADSL 在上网时不能使用电话"}$q$),
(380969, $q${"A": "$R\\times S$", "B": "Ru S", "C": "R∩S", "D": "R-S"}$q$),
(381947, $q${"A": "$s n o=s 1 ~ A N D ~ s n o=s 2 $", "B": "$\\mathsf{sNO!=s1}\\;\\mathsf{OR}\\;\\mathsf{sNO!=s2}$", "C": "$sNO=s1OR~sNO=s2$", "D": "$\\mathsf{sNO!=s1} \\; \\mathsf{AND} \\; \\mathsf{sNO!=s2}$"}$q$),
(382802, $q${"A": "$10ms$", "B": "$5ms$", "C": "$15ms$", "D": "$20 ~ms$"}$q$),
(382803, $q${"A": "$300KB / s$", "B": "600KB/s", "C": "$900KB / s$", "D": "1.2MB/s"}$q$),
(382808, $q${"A": "32KB", "B": "7FFFB", "C": "1MB", "D": "$8000B$"}$q$),
(383695, $q${"A": "峰值速率 $20 Gb / s$", "B": "用户速率 $1Gb / s$", "C": "传输延迟 $100ms$", "D": "流量密度 $10Mb / s / m^2$"}$q$),
(383718, $q${"A": "$32kB / s$", "B": "128kb/s", "C": "256kb/s", "D": "$256kB / s$"}$q$),
(383779, $q${"A": "1440KB", "B": "11520KB", "C": "$480KB$", "D": "768000KB"}$q$),
(383925, $q${"A": "$1000b / s$", "B": "1000 字节/s", "C": "$1024 / s$", "D": "1024个字节/s"}$q$),
(383926, $q${"A": "$1\\mathrm{{Mb}}/S = {10}^{3}$ 比特/秒", "B": "$1Mb / S = 10^{6}$ 比特/秒", "C": "$1Gb / S = 10^{6}$ 比特/秒", "D": "$1\\mathrm{{Gb}}/S = {10}^{12}$ 比特/秒"}$q$),
(383957, $q${"A": "$1MB$", "B": "512KB", "C": "256KB", "D": "128KB"}$q$),
(383961, $q${"A": "$34H$", "B": "54H", "C": "64H", "D": "$24H$"}$q$),
(384081, $q${"A": "$R(A1 \\times A2 \\times A3 \\times A4)$", "B": "R(A1， (A3，A4))", "C": "R(A1、A2、 A3、A4)", "D": "R(A1， A3，A4)"}$q$),
(385334, $q${"A": "语音信号文定义的频率的最高值为 $4kHz$", "B": "语音信号文定义的频率的最高值为 $8kHz$", "C": "数字语音频率传输线路的带宽只有 8kHz", "D": "一般声卡的采样频率最高为每秒 $8 k$ 次"}$q$),
(386053, $q${"A": "\\mathbf { a } ^ { \\wedge 3 }", "B": "\\mathbf { a } ^ { * * } 3", "C": "\\mathbf { p o w } ( \\mathbf { a } , 3 )", "D": "\\mathrm { p o w e r } ( \\mathrm { a } , \\mathrm { 3 } )"}$q$),
(386131, $q${"A": "该文件所在的磁盘容量为 4KB", "B": "该文件所在磁盘分区的大小为 $4 ~KB$", "C": "该文件占用的内存空间大小为 4KB", "D": "该文件所在的磁盘分区在 “格式化” 时选择的分配单元大小为 4KB"}$q$),
(386221, $q${"A": "11 12 13", "B": "^ { \\mathrm { a } = 1 1 , \\mathrm { b } = 1 2 , \\mathrm { c } = 1 3 }", "C": "a = 11  b = 12  c = 13", "D": "11,12,13 答案:选 B。"}$q$)
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
  IF n <> 25 THEN RAISE EXCEPTION '第 5 批更新数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_latex b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN latex_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
