-- P2 第 15 批（25 道；html=7 colon=18 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(352530, $q${"A": "<mp3>", "B": "<audio>", "C": "<sound>", "D": "<object>"}$q$, NULL, NULL),(352726, $q${"A": "物联网是独立于互联网而存在", "B": "物联网中的\"物\"在网络中无法共享被识别的编号", "C": "人-物相连、物-物相连是物联网的基本要求之一", "D": "RFID技术和传感器技术是物联网的基础性技术"}$q$, NULL, NULL),(352781, NULL, $q$移动互联网金融是传统金融行业与移动互联网相结合的新兴领域。包括但不限于、移动支付、线上金融理财、金融中介、金融评价、金融电子商务等模式、信用评级审核等。$q$, NULL),(352859, NULL, $q$人工智能（Artificial Intelligence），英文缩写为 AI。它的定义可以分为两部分，即"人工"、"智能"，它是研究、开发用于模拟、延伸和扩展人的智能的理论、方法、技术及应用系统的一门新的技术科学。$q$, NULL),(352928, $q${"A": "\"智能物体\"是对连接到物联网中的人与物的一种抽象", "B": "智能物体具有感知，通信与计算能力", "C": "要实现全球范围智能物体之间的互联与通信就必须解决智能物体标识问题", "D": "物联网中统一采用 IPv6 地址标识智能物体"}$q$, NULL, NULL),(352985, NULL, $q$读写器对接收的信号进行解调和译码然后送到后台软件系统处理。$q$, NULL),(353175, NULL, $q$网络层主要实现信息的传递、路由和控制，包括延伸网、接入网和核心网，网络层可以依托公众电信网和互联网，也可以依托行业专用通信网络。$q$, NULL),(353212, NULL, $q$使互联网 IT 更加简便、统一平台、服务化等。$q$, NULL),(353283, NULL, $q$SELECT 称为投影操作,而 WHERE 被称为选择操作。$q$, NULL),(353288, NULL, $q$博客:可以分享信息。还有微博、微信、电子刊物,在线百科(WIKI)问答式网络社区(ASK)、百度知道、论坛、知乎等。$q$, NULL),(353300, NULL, $q$云计算机的服务模式:

（1）IaaS:基础设施即服务（ Infrastructure as a server ）。

（2）PaaS:平台即服务（ Platform as a Server ）。
（3）SaaS:软件即服务（ Software as a Server ）。
（4）DaaS:数据即服务(Date as a Server).$q$, NULL),(353347, $q${"A": "从第 2 代移动通信开始, 所有的手机均可以上互联网, 因此均被称为智能手机", "B": "所谓\"双卡双待\"手机，是指手机同时可以安装两张 SIM 卡,且两张卡均可处于待机状态", "C": "全网通手机可以接入国内三大运营商的所有 4G、3C 和 2G 网络, 支持多种不同的网络制式", "D": "国内三大运营商采用的 4G 技术并不相同, 移动采用 TD-LTE, 电信和联通采用 LTE-FDD"}$q$, NULL, NULL),(353385, $q${"A": "iPhone手机使用由苹果公司开发的iOS操作系统，其系统内核是一种“类Unix'系统", "B": "Android是一个以Linux内核为基础的开放源代码的操作系统，早先由Android公司开发", "C": "我国内地销售的Android智能手机，一般都使用Android所附带的用户界面和应用程序(即GMS)", "D": "iOS和Android属于两种不同的操作系统，其平台上的应用程序也不相同,不能相互通用"}$q$, NULL, NULL),(353452, NULL, $q$②、爬虫软件可以分为两类:

l 云爬虫（不需要安装软件）

l 采集器（下载安装）$q$, NULL),(353634, NULL, $q$NoSQL 数据库是非关系型数据库，它主要是用来解决半结构化数据和非结构化数据的存储问题。（MongoDB、Redis、Hbase 等）$q$, NULL),(353711, NULL, $q$大数据技术主要包括数据采集与预处理、数据存储和管理、数据处理与分析、数据安全和隐私保护等几个层面的内容。$q$, NULL),(353731, $q${"A": "Dropbox>", "B": "阿里云对象存储", "C": "亚马逊 Web 服务 S3", "D": "IBM云存储"}$q$, NULL, NULL),(353762, $q${"A": "存储域", "B": "计算域", "C": "交换域", "D": "管理域<br/><br/>", "E": "核心域"}$q$, NULL, NULL),(353892, NULL, $q$分布式计算的特点包括:资源共享、计算均衡、合理利用资源等。$q$, NULL),(353909, NULL, $q$国内主流的云服务提供的云平台:阿里云、腾讯云、华为云、百度云等。$q$, NULL),(353920, NULL, $q$新一代信息技术和服务业态。首先大数据是新技术，其次服务于各行各业。$q$, NULL),(353923, NULL, $q$大数据（big data），是指无法在一定时间范围内用常规软件工具进行捕捉、管理和处理的数据集合，是需要新处理模式才能具有更强的决策力、洞察发现力和流程优化能力的海量、高增长率和多样化的信息资产。

大数据的含义层次包括:数据量大、构成复杂（结构化、非结构化、半结构化等）、变化很快（每秒数据产生量大、种类也多）、蕴含大价值（商业价值高、淘金等）。$q$, NULL),(353924, NULL, $q$需要快速基于产生数据给出实时分析结果，这里可以看出是处理速度。$q$, NULL),(353926, NULL, $q$邮件、音频、视频、位置信息、网络日志等这些属于信息或数据的种类，即体显了大数据的数据种类繁多。$q$, NULL),(354115, NULL, $q$分布式计算的特点包括:资源共享、计算均衡、合理利用资源等。$q$, NULL)
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
  IF n <> 7 THEN RAISE EXCEPTION '第 15 批 HTML 更新数应为 7，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 18 THEN RAISE EXCEPTION '第 15 批解析去冒号数应为 18，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 15 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 15 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 15 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
