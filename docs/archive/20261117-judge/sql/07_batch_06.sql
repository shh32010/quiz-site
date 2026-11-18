-- 判断题第 6 批（25 道：21 keep + 0 change + 4 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(376750, $q$rw-r-xr-- 对应的八进制权限是 654，u=rw,g=rx,o=r 与 chmod 654 两种写法等价，均可实现该权限设置。$q$, NULL, NULL, 'keep'),(379151, $q$ESC 键通常用于取消当前操作或关闭对话框，关闭应用程序窗口一般使用 Alt+F4 或窗口右上角的关闭按钮。$q$, NULL, NULL, 'keep'),(379870, NULL, NULL, NULL, 'unresolved'),(381095, $q$Secondary NameNode 不是 NameNode 的热备节点，它只定期合并 fsimage 与 edits 生成检查点，NameNode 故障时无法接管其工作。$q$, NULL, NULL, 'keep'),(381175, $q$非对称加密中公钥用于加密以保证信息的保密性（安全性），私钥用于签名以保证真实性和不可否认性，题干把两者的作用说反了。$q$, NULL, NULL, 'keep'),(381987, $q$SELECT 10*10 属于无表的表达式查询，数据库会直接计算该表达式，运行结果为 100。$q$, NULL, NULL, 'keep'),(382003, $q$COUNT(1) 与 COUNT(*) 都只统计行数、不读取具体列值，查询优化器对二者生成的执行计划相同，执行效率一致。$q$, NULL, NULL, 'keep'),(382046, $q$题干虽有 OCR 错字，但可辨认出“每个字段都要建立索引”这一说法；索引应按查询需要建立，不可能也不应该给每个字段都建索引，且唯一索引的主要作用是保证字段值唯一，故说法错误。$q$, NULL, NULL, 'keep'),(383620, $q$分组交换采用存储转发，逐段动态选择链路，不需要在通信双方之间预先建立固定的物理链路；预先建立固定物理链路的是电路交换。$q$, NULL, NULL, 'keep'),(385947, NULL, NULL, NULL, 'unresolved'),(388560, NULL, NULL, NULL, 'unresolved'),(388565, $q$Word 表格可通过公式（如 =SUM(LEFT)）进行横向求和，也能按列排序，但不具备数据库意义上的数据索引功能。$q$, NULL, NULL, 'keep'),(388843, NULL, NULL, NULL, 'unresolved'),(388926, $q$信息技术的定义是扩展人的信息器官功能、协助人们进行信息处理，而不是取代人的信息器官、完全代替人类。$q$, NULL, NULL, 'keep'),(388934, $q$病毒特征库只能收录已知病毒的特征，无法囊括所有病毒，对新出现的未知病毒难以查杀，不能保证有效保护信息。$q$, NULL, NULL, 'keep'),(389026, $q$计算机内部的数据运算采用二进制，八进制和十六进制只是便于书写和阅读的表示形式，并不是内部运算所采用的方式。$q$, NULL, NULL, 'keep'),(389027, $q$载波是高频振荡的正弦波，其频率远高于所传输的信号，用来承载信息。$q$, NULL, NULL, 'keep'),(389034, $q$域名与IP地址并非严格一对一：一个IP地址可对应多个域名，一个域名也可对应多个IP地址，因此“一个域名只能对应一个IP地址”不成立。主机迁移后更换IP、保留域名的说法虽正确，但整句仍为错。$q$, NULL, NULL, 'keep'),(389126, $q$利用信源信号去调整载波的某个参数，这个过程称为调制；从已调信号中还原出原始信息才叫解调。$q$, NULL, NULL, 'keep'),(389135, $q$以太网带宽通常说成10Mb/s或100Mb/s，单位是兆比特每秒；题中MB/s表示兆字节每秒，与带宽的常用单位不符。$q$, NULL, NULL, 'keep'),(389144, $q$Excel允许用户自定义序列，任何一组有固定顺序的文本都可以添加为自定义序列，职称名称也可如此定义，便于快速填充。$q$, NULL, NULL, 'keep'),(389161, $q$Word能打开并识别记事本生成的纯文本文件；记事本以纯文本方式读取Word的二进制文档，只能看到乱码，无法正确还原内容。$q$, NULL, NULL, 'keep'),(389249, $q$CPU运算速度不仅取决于主频，还受字长、缓存容量、指令流水线、体系结构等因素影响，主频高一倍并不等于运算速度快一倍。$q$, NULL, NULL, 'keep'),(389253, $q$MAC地址固化在网络适配器上，是局域网中区分各台计算机、完成帧的寻址与通信的基础。$q$, NULL, NULL, 'keep'),(389256, $q$我国采用的PAL制式彩色电视使用YUV颜色模型，将亮度Y与色度U、V分离，便于远距离传输并与黑白电视兼容。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM judge_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM judge_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 21 THEN RAISE EXCEPTION '第 6 批写入数应为 21，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 4 THEN RAISE EXCEPTION '第 6 批保留数应为 4，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 6 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
