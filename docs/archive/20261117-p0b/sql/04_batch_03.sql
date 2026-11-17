-- P0-B 第 3 批（17 道：16 写入 + 1 人工）
BEGIN;
CREATE TEMP TABLE p0b_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  qtype smallint,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0b_expected (id, analysis, correct, qtype, action) VALUES
(365059, $q$x=3 为奇数，(x%2) 为真，输出 **3 且不换行；x=4 为偶数，输出 ##4 并换行；x=5 再输出 **5。最终结果是 **3##4 换行 **5，A 项误以为每轮都换行。故选 D。$q$, NULL, NULL, 'keep'),(365190, $q$5G 频率高、波长短，穿透和绕射能力较弱，单站覆盖范围小，因此基站数量比 4G 更多，D 项错误；Gbps 级速率、毫秒级时延、超大容量分别对应 A、B、C，均正确。故选 D。$q$, NULL, NULL, 'keep'),(365851, $q$共享文件夹权限中，读取只允许用户打开和查看共享资源，不能修改和删除；若要增删改需授予更改权限，完全控制还可再改权限。故填 读取。$q$, '读取', NULL, 'change_answer'),(366628, $q$getchar() 先读入键盘输入的一个字符 A，putchar() 紧接着把它原样输出到屏幕。输出的是字符 A 本身，并非它的 ASCII 码 65。故填 A。$q$, NULL, NULL, 'keep'),(366699, $q$SuZhouUniversity 共 16 个字符，加显式写出的 \0 已占 17 个字节，编译器还会自动在末尾补一个 \0，因此数组共占 17+1=18 个字节。故填 18 字节。$q$, '18字节', NULL, 'change_answer'),(368649, $q$IPv4 中首字节 192～223 为 C 类地址，204 正落在该区间，故为 C 类；其默认掩码是 255.255.255.0，题中 224 只是在默认掩码基础上又划分了子网。故填 C。$q$, NULL, NULL, 'keep'),(373708, $q$UNION 是集合运算符，把多个查询结果集纵向合并并去掉重复行，要求各结果集列数相同、对应列类型兼容。A 错在完全一样，C 说成筛选关键词，D 说任何过于绝对。故选 B。$q$, NULL, 1, 'change_type'),(373720, $q$MySQL 标识符未加反引号时只能由字母、数字、下划线和美元符号组成，且不能以数字开头。A 含斜杠、B 含点号、D 含与号，均不合法；只有 db1_student 符合规则。故选 C。$q$, NULL, 1, 'change_type'),(373727, $q$CREATE TABLE 的语法是 create table 表名(字段名 字段类型,…)，关键字为 table 而非 tables，括号内先写字段名再写类型。B、C 用 tables 错误，D 把字段类型写在字段名之前，顺序颠倒。故选 A。$q$, NULL, 1, 'change_type'),(373776, $q$CREATE 语句用于建表，标准语法为 create table 表名(字段名 字段类型,…)，括号内字段名在前、类型在后。B、C 的 create tables 拼写错误，D 把类型写在字段名前，均不合语法。故选 A。$q$, NULL, 1, 'change_type'),(375097, NULL, NULL, NULL, 'manual'),(377432, $q$A 类地址首字节范围为 1～126，最高位为 0。120 落在该区间内，因此 120.195.128.11 属于 A 类地址；B 类为 128～191、C 类为 192～223，均不符。故填 A。$q$, NULL, NULL, 'keep'),(380477, $q$i 为奇数时先输出 * 再输出 #；i 为偶数时执行 continue 直接进入下一轮，不输出任何字符。故 i=1、3 输出 *#，i=2、4 无输出，结果为 *#*#。易错在误认为偶数也输出 *。故填 C。$q$, NULL, NULL, 'keep'),(388620, $q$IP 地址分类看首字节高位：A 类最高位为 0，B 类前两位为 10，C 类前三位为 110，D 类前四位为 1110。最高 3 位是 110，符合 C 类特征，首字节范围为 192～223。故填 C。$q$, NULL, NULL, 'keep'),(388899, $q$FTP 支持一次传输多个文件，B 说每次只可传输一个文件错误；IE 浏览器可通过 ftp:// 访问 FTP 服务器并启动传输，A 说无法启动也错误；C、D 叙述正确。故选 A、B。$q$, 'A,B', NULL, 'change_answer'),(388913, $q$C 类地址首字节范围为 192～223，最高三位为 110。202 正在此区间内，故 202.195.10.10 属于 C 类地址；A 类为 1～126，B 类为 128～191，D 类为 224～239。故填 C。$q$, NULL, NULL, 'keep'),(389981, $q$Windows 的桌面是系统盘 C 盘用户目录下的一部分，在桌面新建文档即存入该目录，占用 C 盘空间，与 D、E 盘无关。故填 C。$q$, NULL, NULL, 'keep')
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
  IF n <> 16 THEN RAISE EXCEPTION '第 3 批写入数应为 16，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0b_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0b b ON b.id = q.id
   WHERE e.action = 'manual'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.question_type IS NOT DISTINCT FROM b.question_type;
  IF n <> 1 THEN RAISE EXCEPTION '第 3 批人工数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0b_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
