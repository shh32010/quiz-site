-- P0-B 第 2 批（25 道：22 写入 + 3 人工）
BEGIN;
CREATE TEMP TABLE p0b_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  qtype smallint,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0b_expected (id, analysis, correct, qtype, action) VALUES
(358904, $q$判断 IP 地址类别的依据是第一段十进制数：A 类 1～126，B 类 128～191，C 类 192～223。本地址首段为 129，处于 128～191 之间，属于 B 类地址。故填 B。$q$, NULL, NULL, 'keep'),(359071, $q$ASCII 表中大写字母连续排列，A 为 65，则 B=66、C=67、D=68。因此十进制数 68 对应的字母是 D。故填 D。$q$, NULL, NULL, 'keep'),(359618, NULL, NULL, NULL, 'manual'),(359781, NULL, NULL, NULL, 'manual'),(360838, $q$IP 地址类别由第一段数值判断：192～223 为 C 类地址。220.3.18.1 的首段是 220，正好落在 192～223 区间，因此它是一个 C 类 IP 地址。故填 C。$q$, NULL, NULL, 'keep'),(363715, $q$IP 地址的分类只看第一个字节：A 类 1～126，B 类 128～191，C 类 192～223。该地址 202.13.112.14 的首段为 202，落在 192～223 之间，属 C 类地址。故填 C。$q$, NULL, NULL, 'keep'),(364009, $q$主频决定指令执行节奏，Cache 容量减少访存等待，寄存器减少访存次数，三者都能直接或间接提高每秒执行的指令数；扩充磁盘容量只增大外存空间，与运算速度无关。故选 A。$q$, NULL, NULL, 'keep'),(364096, $q$判断地址类别看首字节：A 类为 1～126，B 类为 128～191，C 类为 192～223。155 落在 128～191 区间，二进制以 10 开头，故为 B 类地址；若误记为 A 类，多是把上限错记成 127。故填 B。$q$, NULL, NULL, 'keep'),(364282, $q$首字节 129 落在 128～191 区间，二进制最高两位为 10，符合 B 类地址定义；A 类首字节为 1～126，C 类为 192～223。129 仅比 127 大 2，最易误判为 A 类，实际已进入 B 类。故填 B。$q$, NULL, NULL, 'keep'),(364291, $q$首字节 120 处于 1～126 区间，二进制最高位为 0，属于 A 类地址；B 类首字节为 128～191，C 类为 192～223。120 小于 127，尚未进入 B 类范围，由此可排除 B、C 两类。故填 A。$q$, NULL, NULL, 'keep'),(364414, $q$按首字节划分：A 类 1～126，B 类 128～191，C 类 192～223。129 刚超过 127，二进制前两位为 10，故该地址属于 B 类；它与 A 类边界只差 2，是本题的易错点。故填 B。$q$, NULL, NULL, 'keep'),(364424, $q$IP 地址类别由首字节决定，最高位为 0 即 A 类，首字节取 1～126。120.195.128.11 的首字节 120 小于 127，故属 A 类地址，不要误归入从 128 起算的 B 类。故填 A。$q$, NULL, NULL, 'keep'),(364466, NULL, NULL, NULL, 'manual'),(364873, $q$总线性能指标主要有带宽即数据传输率、总线宽度即位数、工作频率和负载能力等，它们共同决定单位时间传输的数据量；总线长度只是物理尺寸，不反映性能高低。故选 C。$q$, NULL, NULL, 'keep'),(364874, $q$Linux、UNIX 和 Windows Server 都有成熟的服务器版本，支持多用户、网络服务与长期稳定运行；Android 虽基于 Linux 内核，但面向手机等移动终端，不能用作服务器操作系统。故选 A。$q$, NULL, NULL, 'keep'),(364877, $q$云计算的特点包括超大规模、虚拟化、高可靠性、通用性、按需服务和低成本；私有化描述的是资源归属与部署方式，私有云只是部署形式之一，并非云计算本身的特点。故选 C。$q$, NULL, NULL, 'keep'),(364977, $q$八进制以 0 开头且只含 0~7，十六进制以 0x 开头。C 中 0010 为八进制，-0x11 与 0xf1 均为合法十六进制数；A 的 -10 是十进制，B 的 0abc、D 的 0a12 都含非八进制数字 a，不合法。故选 C。$q$, NULL, NULL, 'keep'),(364978, $q$D 中 +001 为十进制整型常量，0xabcd 为十六进制，2e2 与 50. 均为合法实型常量。干扰项：B 的 3.9e-2.5 指数部分必须是整数，A 的 8.9e、C 的 0a 也属非法写法。故选 D。$q$, NULL, NULL, 'keep'),(364979, $q$字符串常量必须用双引号括起，B、C、D 均为合法的双引号字符串；A 的 'abc' 用单引号括了多个字符，既不是字符常量也不是字符串常量。故选 A。$q$, NULL, NULL, 'keep'),(364987, $q$C 语言运算符优先级由高到低依次为算术运算符、关系运算符、逻辑运算符。选项里 + 属算术运算符，< 与 != 属关系运算符，&& 属逻辑运算符，故 + 优先级最高。故选 B。$q$, NULL, NULL, 'keep'),(364991, $q$C 中 A 为奇数时 A%2 得 1，!(1) 为假；A 为偶数时 A%2 得 0，!(0) 为真，结果与题目要求正好相反。A、B、D 均能满足奇数为真、偶数为假。故选 C。$q$, NULL, NULL, 'keep'),(364992, $q$&& 优先级高于 ||，该语句等价于 ++a||(++b&&++c)。++a 后 a 变 2 为真，|| 发生短路，后面的 ++b、++c 不再执行，b、c 仍为 1。故选 B。$q$, NULL, NULL, 'keep'),(364995, $q$x<y 即 2<-1 不成立，外层 if 的语句体整体被跳过；else 与内层 if(y<0) 配对，不属于外层 if，因此 z 未被修改，仍为 2，输出 2。故选 B。$q$, NULL, NULL, 'keep'),(364996, $q$条件运算符右结合，先判断 k<a，即 4<3 为假，转而求 c<b?c:a；c<b 即 1<2 为真，取 c 的值 1，故输出 1。故选 D。$q$, NULL, NULL, 'keep'),(364997, $q$第一个式子 w<x 即 1<2 为真，m 取 w 的值 1；此后 m 恒小于 y 与 z，后两步都取 m 自身，故 m 最终仍为 1。故选 A。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    question_type = coalesce(e.qtype, q.question_type),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0b_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer', 'change_type') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0b_expected e
WHERE q.id = e.id AND e.action = 'manual' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0b_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer', 'change_type')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.qtype IS NULL OR q.question_type = e.qtype);
  IF n <> 22 THEN RAISE EXCEPTION '第 2 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0b_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0b b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.question_type IS NOT DISTINCT FROM b.question_type;
  IF n <> 3 THEN RAISE EXCEPTION '第 2 批人工数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0b_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 2 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
