-- 判断题第 8 批（18 道：18 keep + 0 change + 0 unresolved）
BEGIN;
CREATE TEMP TABLE judge_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO judge_expected (id, analysis, correct, stem, action) VALUES
(389747, $q$USB 是通用串行总线接口，采用串行方式传输数据，虽可连接多个设备（通过集线器或菊花链），但“并行接口”的说法错误。$q$, NULL, NULL, 'keep'),(389748, $q$多核 CPU 是指在同一块芯片上集成多个处理器核心，各核心可并行工作以提高处理能力。$q$, NULL, NULL, 'keep'),(389827, $q$2016 年 6 月神威·太湖之光已取代天河二号位居全球超级计算机榜首，到 2016 年 12 月排名第一的应是神威·太湖之光，而非天河二号。$q$, NULL, NULL, 'keep'),(389829, $q$对 U 盘进行格式化会重建文件系统，原有文件分配表和目录信息被清除，用户存储在该盘上的数据将丢失。$q$, NULL, NULL, 'keep'),(389830, $q$有穷性是对算法的要求，算法必须在执行有穷步后终止；而程序不一定具有有穷性，例如操作系统、服务器程序可以长期运行甚至死循环。$q$, NULL, NULL, 'keep'),(389832, $q$Internet 确为全球最大的开放式互联网，由众多网络互联而成，并统一采用 TCP/IP 协议族进行通信。$q$, NULL, NULL, 'keep'),(389907, $q$系统总线按传输信息的类型可划分为数据总线、地址总线和控制总线三类。$q$, NULL, NULL, 'keep'),(389912, $q$IPv6 地址长度为 128 位二进制数，远大于 IPv4 的 32 位。$q$, NULL, NULL, 'keep'),(389986, $q$虚拟主播能模仿真人主播的语音与表情动作，核心依赖语音合成、图像与动作生成等人工智能技术。$q$, NULL, NULL, 'keep'),(389989, $q$程序由指令序列构成，CPU 逐条取指令、译码并执行，从而完成整个程序的运行。$q$, NULL, NULL, 'keep'),(389994, $q$说法把两种传输层协议的特性弄反了：TCP 提供面向连接的可靠服务，UDP 提供无连接的尽力而为服务。$q$, NULL, NULL, 'keep'),(389995, $q$寻址层次被颠倒：数据链路层使用 MAC 地址寻址，网络层使用 IP 地址寻址。$q$, NULL, NULL, 'keep'),(390066, $q$补码再求一次补码会还原出原码，这一性质对正数和负数都成立。$q$, NULL, NULL, 'keep'),(390072, $q$网络传输介质分有线与无线两类，双绞线、同轴电缆、光纤属有线介质，短波、微波、红外线属无线介质。$q$, NULL, NULL, 'keep'),(390074, $q$像素深度决定每个像素能表示的颜色数（2 的深度次方），决定像素总数目的是图像的分辨率。$q$, NULL, NULL, 'keep'),(390152, $q$数字签名确实可用于保证不可否认性，但它并非把手写签名电子化后附在文档中，而是基于哈希运算和非对称加密生成的一段认证数据，用于验证发送者身份和报文完整性，因此该说法错误。$q$, NULL, NULL, 'keep'),(390373, $q$Linux 中普通用户的默认主目录位于 /home 下（root 用户为 /root），/usr 用于存放系统程序和共享资源，不是用户主目录，故说法错误。题干末尾多出的符号属于文本残留，不影响判断。$q$, NULL, NULL, 'keep'),(390612, $q$CentOS 中 DNS 服务器地址配置在 /etc/resolv.conf 文件中，/etc/sysconfig/network-scripts/ifcfg-eth0 是网卡的配置文件（可含 IP、网关等）。将其当作查看 DNS 配置的文件路径是错误的。$q$, NULL, NULL, 'keep')
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
  IF n <> 18 THEN RAISE EXCEPTION '第 8 批写入数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批保留数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN judge_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_judge b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN judge_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
