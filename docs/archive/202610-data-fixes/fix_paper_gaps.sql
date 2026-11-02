-- 修复 5 道可从原始资料确定性恢复的真题（2026-10-20）
-- 依据：md题库和知识点 原始 md（2008 卷 / 2024 实操 / 2024 理论 / 小白书等）
-- 处理：题面/选项/答案按原文修正 → 复活 → 恢复卷面挂接 → 重算卷总分与题数

BEGIN;

-- 388739（2007·理论 判断）：视图不存储数据，原书答案为「错误」
UPDATE t_question SET
  stem = '视图是数据库系统中提供的一种以用户模式观察数据库中数据的重要机制，可以由基本表或其他视图导出。它同基本表一样，同样作为一个实际存储数据的表。（ ）',
  correct = 'B',
  analysis = '视图是从基本表或其他视图导出的虚表，数据库中只存储视图的定义，不存储视图对应的数据，因此视图不是一个实际存储数据的表。'
WHERE id = 388739;

-- 388808（2008·理论 填空）：2^32 字节 = 4GB = 4096MB
UPDATE t_question SET
  stem = '计算机中地址线数目决定了 CPU 可直接访问存储空间的大小。若某计算机地址线数目为 32，则其能访问的存储空间大小为 ____MB。',
  correct = '4096',
  analysis = '地址线 n 根时寻址空间为 2^n 字节。2^32 B = 4 GB = 4096 MB。'
WHERE id = 388808;

-- 390250（2022·实操 判断）：原题为「TCP/IPv4 属性不能设置 IPv6」，故为错
UPDATE t_question SET
  stem = '在 Windows 10 的以太网设置中，可以通过打开“TCP/IPv4 属性”，设置 IPv6 地址等。',
  correct = 'B',
  analysis = '“TCP/IPv4 属性”只能配置 IPv4 相关参数；IPv6 地址需在“TCP/IPv6 属性”中设置，故该说法错误。'
WHERE id = 390250;

-- 390255（2022·实操 填空）：原式为 (x+y)/(a^2+4b)
UPDATE t_question SET
  stem = '数学表达式 (x+y)/(a^2+4b) 对应的 C 语言表达式为 ____。',
  correct = '(x+y)/(a*a+4*b)',
  analysis = 'C 语言中乘方需写成连乘：a^2 写作 a*a，a^2+4b 写作 a*a+4*b；分子分母均需加括号保证运算顺序。'
WHERE id = 390255;

-- 390526（2024·理论 单选）：原题选项为 HT/TCP/IP/FTP，答案 TCP
UPDATE t_question SET
  option_json = '{"A":"HT","B":"TCP","C":"IP","D":"FTP"}',
  stem = 'TCP/IP 协议中，属于传输层通信协议的是',
  correct = 'B',
  analysis = 'TCP 是传输层协议；IP 属于网络层，FTP 属于应用层，HT 不是标准协议名。'
WHERE id = 390526;

-- 复活并恢复卷面挂接
UPDATE t_question SET deleted = false, review_status = 'ok', has_image = coalesce(has_image, false)
 WHERE id IN (388739, 388808, 390250, 390255, 390526);

UPDATE exam_paper_question SET is_active = true
 WHERE question_id IN (388739, 388808, 390250, 390255, 390526);

-- 重算受影响试卷的题数与总分
UPDATE t_exam_paper p SET
  question_count = s.cnt,
  score = s.total
FROM (
  SELECT e.paper_id, count(*) AS cnt, coalesce(sum(q.score), 0) AS total
    FROM exam_paper_question e JOIN t_question q ON q.id = e.question_id
   WHERE e.is_active AND NOT q.deleted
     AND e.paper_id IN (260, 261, 277, 282)
   GROUP BY e.paper_id
) s
WHERE p.id = s.paper_id;

COMMIT;
