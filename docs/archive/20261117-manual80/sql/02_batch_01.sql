-- 人工题 80 道第 1 批：8 道 keep + 72 道保留 uncertain
BEGIN;
CREATE TEMP TABLE manual80_expected (
  id integer PRIMARY KEY,
  analysis text NOT NULL
) ON COMMIT DROP;
INSERT INTO manual80_expected (id, analysis) VALUES
(336203, $q$GB18030中常用汉字每个占2字节，100字内容共200字节；但硬盘按扇区或簇分配存储空间，不足一个分配单元也要占满512字节，A、B、C均未超过内容本身长度，只有D符合磁盘分配规则。$q$),
(337053, $q$小写b表示比特，通信速率中k按1000计，1kb/s即每秒1000比特，故选A；B、D把比特误当成字节，C既缺少单位又误用1024。$q$),
(350143, $q$第二代机器人是20世纪60年代出现的具有感知功能的机器人，代表是美国斯坦福国际研究所研制的Shakey，它具备视觉和触觉。A项乔治·德沃尔对应第一代示教再现机器人Unimate，阿尔贡研究所与IBM也不是第二代的出处。$q$),
(354758, $q$机器智能的核心技术覆盖数据全流程：数据搜集、数据存储、数据表示、数据挖掘和使用，四项均属核心内容。其余选项都漏掉了其中至少一项，故选 D。$q$),
(364972, $q$RFID 系统由电子标签、阅读器、天线和应用软件（中间件）构成，标签、阅读器、软件都属于其组成部分；“服务”属于应用层面的概念，不是 RFID 技术本身的组成。$q$),
(378429, $q$Excel 2007 及以后版本一个工作表最多有 16384 列（A 到 XFD）；256 是 Excel 2003 的列数，16 和“无限”都不符合现行 Excel 的规格，故选 D。$q$),
(379513, $q$s[i++]%10 依次为 'A'、'B'、'C' 的 ASCII 码末位，即 65%10=5、66%10=6、67%10=7；i 增至 3 时 s[3] 为 '\0'，循环结束，输出 567。A、B 是把字符码当整体输出的错误结果，D 是按字符输出。$q$),
(390079, $q$+64 的原码、反码、补码均为 01000000；-64 的原码是 11000000，其数值位取反加一后仍得 11000000，即补码相同，而反码为 10111111。所给编码同时符合原码和补码，无法唯一确定，选 D。$q$)
;
UPDATE t_question q
SET analysis = e.analysis,
    qc_grade = 'good',
    answer_check = 'match'
FROM manual80_expected e
WHERE q.id = e.id AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN manual80_expected e ON e.id = q.id
   WHERE q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match';
  IF n <> 8 THEN RAISE EXCEPTION '写入数应为 8，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN t_question_backup_20261117_manual80 b ON b.id = q.id
   WHERE q.id NOT IN (SELECT id FROM manual80_expected)
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 72 THEN RAISE EXCEPTION '保留 uncertain 数应为 72，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN t_question_backup_20261117_manual80 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '本批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN manual80_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '本批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status = 'ok' AND qc_grade = 'error';
  IF n <> 495 THEN RAISE EXCEPTION 'ok/error 应为 495，实际 %', n; END IF;
END $$;
COMMIT;
