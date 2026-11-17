-- P0-211 第 9 批（11 道：10 写入 + 1 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(380156, $q$显式插入 22500 之后，自增计数器会被抬高到 22500 之后；再插入 0 时，0 被视为未指定自增值，于是系统分配下一个值 22501 给“张良”。故选 B。$q$, NULL, NULL, 'keep'),(380592, $q$b/a 就是 5/7，两个 int 相除执行的是整数除法，商取整为 0，再把 0 赋给 b 并输出，因此结果为 0。故选 D。$q$, NULL, NULL, 'keep'),(380654, $q$010 以 0 开头，是八进制数，等于十进制 8；i++ 是后缀自增，先输出 8 再加 1；j-- 同样是后缀自减，先输出 10，因此输出的结果是 8,10。故选 C。$q$, NULL, NULL, 'keep'),(380819, $q$联合体所有成员共用同一段存储空间，其大小等于占用字节最多的那个成员，int y[4] 占 16 字节，大于 long x[2] 和 char z[8] 所占的字节数，故 sizeof 为 16。故选 B。$q$, NULL, NULL, 'keep'),(381056, $q$公有云依靠虚拟化技术把物理服务器、存储等资源池化，再按需划分给多个租户使用，因此虚拟化是公有云基础架构的基石。故选 A。$q$, NULL, NULL, 'keep'),(381154, $q$人工智能的价值最终要落到实际应用中，没有应用场景，算法和数据都无法产生效益，因此应用是人工智能发展的硬道理。故选 B。$q$, NULL, NULL, 'keep'),(382508, $q$列清单顺序为 sex、sname、age，与值 M、zhihu、default 一一对应，age 取默认值 20，插入后为 zhihu、M、20；C 把姓名与性别的值弄反了。故选 A。$q$, NULL, NULL, 'keep'),(383755, $q$彩色打印机用青、品红、黄、黑四种油墨减色混色来呈色，采用 CMYK 颜色模型；RGB 用于显示器等发光设备，HSB、YUV 也不用于打印。故选 A。$q$, NULL, NULL, 'keep'),(388485, $q$数字字符的 ASCII 码小于大写字母，同为大写字母时按字母顺序排列，Y 排在 X 之后，其码值 89 是四项中最大的。故选 D。$q$, NULL, NULL, 'keep'),(390079, NULL, NULL, NULL, 'uncertain'),(390292, $q$声卡既能处理波形声音也能处理 MIDI，因此 A 错；把声波转换为电信号是话筒的功能，所以 B、C 错；随着集成电路的发展，声卡大多已集成在主板上，因此 D 正确。故选 D。$q$, NULL, NULL, 'keep')
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
  IF n <> 10 THEN RAISE EXCEPTION '第 9 批写入数应为 10，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 1 THEN RAISE EXCEPTION '第 9 批 uncertain/manual 数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 9 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
