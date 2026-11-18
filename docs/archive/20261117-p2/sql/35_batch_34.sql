-- P2 第 34 批（25 道；html=18 colon=5 prefix=2）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(383532, NULL, $q$(1)ADSL 的数据传输速率是根据线路的情况自动调整的,它以尽力而为的方式进行数据传输。

(2)像 ISDN 一样,ADSL 可以与普通电话共存于一条电话线上,可同时接听、拨打电话并进行数据传输,两者互不影响。ADSL 利用普通电话线作为传输介质,通过一种自适应的数字信号调制解调技术,能在电话线上得到 3 个可以同时工作的信息通道。$q$, NULL),(383621, NULL, $q$成像芯片:CCD（电荷耦合器）或 CMOS（互补金属氧化物半导体）；像素越高，图像清晰度越高。$q$, NULL),(383756, NULL, $q$JPEG 格式不是由苹果公司开发的工业标准,JPEC 支持有损压缩和无损压缩,实际应用中有损压缩更多。JPEG 格式适用范围广,能处理各种连续色调的彩色或灰度图像;算法复杂度适中;既可用硬件实现,也可用软件实现;图像的压缩比可控制。JPEG 2000:采用了小波分析等先进算法,提供了更好的图像质量,更低的码率,更适合在 WWW 网上传输,它兼容 JPEG,压缩率更高。$q$, NULL),(383837, NULL, $q$控制与显示技术主要是扩展效应器官功能,增强人们的信息控制能力。$q$, NULL),(384059, $q${"A": "SELECT XM, SA FROM STUD FOR SA<20", "B": "SELECT XM, SA FROM STUD WHERE SA<20", "C": "SELECT XM, SA ON STUD FOR SA<20", "D": "SELECT XM, SA ON STUD WHERE SA<20"}$q$, NULL, NULL),(384120, $q${"A": "负数的补码其符号位是\"1\"", "B": "负数的补码是该数绝对值的原码最末位加1", "C": "负数的补码是该数绝对值的反码最末位加1", "D": "正数的补码与该数的原码形式相同"}$q$, NULL, NULL),(384128, $q${"A": "运算规则简单", "B": "数据采用比特表示,可进行多种方式\"数据压缩\"", "C": "易于物理实现", "D": "\"0\"、\"1\"表示的比特串便于人们阅读"}$q$, NULL, NULL),(384132, $q${"A": "IC卡是\"集成电路卡\"的简称", "B": "IC卡又称为Chip Card或Smart Card", "C": "IC卡不仅可以存储数据,还可以通过加密逻辑对数据进行加密", "D": "非接触式IC卡依靠自带电池供电"}$q$, NULL, NULL),(385187, NULL, $q$q! 强制退出不保存。$q$, NULL),(385230, $q${"A": "' 10/20", "B": "= “10/20”", "C": "“10/20”", "D": "$= 10 / 20$"}$q$, NULL, NULL),(385257, $q${"A": "ls -d .txt", "B": "find \".txt\"", "C": "find -name \"*.txt\"", "D": "ls *.txt"}$q$, NULL, NULL),(385283, $q${"A": "SELECT email FROM student WHERE email !=NULL", "B": "SELECT email FROM student WHERE email <> NULL", "C": "SELECT email FROM student WHERE email NOT IS NULL", "D": "SELECT email FROM student WHERE email IS NOT NULL"}$q$, NULL, NULL),(385298, $q${"A": "WHERE hometown = '南京';", "B": "WHERE hometown NOT '南京';", "C": "WHERE hometown IS NOT '南京';", "D": "WHERE hometown <> '南京'"}$q$, NULL, NULL),(385345, $q${"A": "select name,sal(元) from emp;", "C": "select name,sal 元 from emp;", "B": "select name,concat(sal,'元') from emp;", "D": "select name,concat('sal';'元') from emp;"}$q$, NULL, NULL),(385406, $q${"A": "ALTER TABLE my_table MODIFY COLUMN 'column_name' INT;", "B": "ALTER TABLE my_table MODIFY COLUMN column_name INT;", "C": "ALTER TABLE my_table CHANGE COLUMN column_name column_name INT;", "D": "ALTER TABLE my_table CHANGE COLUMN 'column_name' 'column_name' INT;"}$q$, NULL, NULL),(385418, $q${"A": "ALTER TABLE my_table ADD COLUMN new_column VARCHAR(100) NOT NULL;", "B": "ALTER TABLE my_table ADD COLUMN 'new_column' VARCHAR(100) NOT NULL;", "C": "ALTER TABLE my_table ADD 'new_column' VARCHAR(100) NOT NULL;", "D": "ALTER TABLE my_table ADD COLUMN \"new_column\" VARCHAR(100) NOT NULL;"}$q$, NULL, NULL),(385427, $q${"A": "通过\"Windows 安全中心\"来关闭防火墙", "B": "通过“网络和 Internet”来关闭防火墙", "C": "通过“设备”来关闭防火墙", "D": "通过“帐户”来关闭防火墙"}$q$, NULL, NULL),(385433, $q${"A": "&&", "B": "川", "C": "CONCAT()", "D": "+"}$q$, NULL, NULL),(385442, $q${"A": "AGE<=18 OR AGE>=24", "B": "AGE<=18 OR AGE>24", "C": "AGE<18 OR AGE>=24", "D": "AGE<18 OR AGE>24"}$q$, NULL, NULL),(385563, $q${"A": "Is -d .txt", "B": "find \".txt\"", "C": "find -name \"*.txt\"", "D": "ls *.txt"}$q$, NULL, NULL),(385603, $q${"A": "WHERE hometown =!'南京';", "B": "WHERE hometown NOT '南京';", "C": "WHERE hometown IS NOT '南京';", "D": "WHERE hometown <> '南京'"}$q$, NULL, NULL),(385637, $q${"A": "设置\"允许远程协助连接这台计算机", "B": "设置\"不允许远程连接到计算机\"", "C": "设置\"允许远程连接到此计算机\"", "D": "设置\"不允许远程协助连接这台计算机\""}$q$, NULL, NULL),(385638, $q${"A": "SELECT 学号,COUNT(*) FROM 成绩 WHERE 分数 > 90 GROUP BY 学号 HAVING COUNT(*) > 3;", "B": "SELECT 学号,COUNT(学号) FROM 成绩 WHERE 分数 > 90 AND COUNT(学号) > 3;", "C": "SELECT 学号,COUNT(*) FROM 成绩 GROUP BY 学号 HAVING COUNT(*) > 3 AND 分数 > 90;", "D": "SELECT 学号,OUNT(*) FROM 成绩 WHERE 分数 > 90 AND COUNT(*) > 3 GROUP BY 学号;"}$q$, NULL, NULL),(386150, NULL, NULL, $q$MySQL 数据库管理系统只能在 Windows 操作系统下运行。$q$),(386151, NULL, NULL, $q$对于字符串型数据，空字符串”就是NULL，对于数值型数据0就是NULL。$q$)
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
  IF n <> 18 THEN RAISE EXCEPTION '第 34 批 HTML 更新数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 5 THEN RAISE EXCEPTION '第 34 批解析去冒号数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 34 批前缀修复数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 34 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 34 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
