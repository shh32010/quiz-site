-- P2 第 8 批（25 道；html=0 colon=2 prefix=23）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(342427, NULL, $q$一个 IP 地址可对应多个域名，一个域名只能对应一个 IP 地址（可以绑定多个 IP,如[http://www.baidu.com](https://link.zhihu.com/?target=http%3A//www.baidu.com) 有两个 IP,但是同一时间该只能解析一个 IP）。更换物理网络之后，需要更改 IP,但是域名可以保留。$q$, NULL),(342437, NULL, $q$数据仓库中的数据是面向某一主题的数据的集合，这些数据从多个业务系统中抽取而来且包含历史数据，这样就避免不了有的数据是错误数据、有的数据相互之间有冲突，这些错误的或有冲突的数据显然是我们不想要的，称为“脏数据”。$q$, NULL),(342549, NULL, NULL, $q$10 吉比特以太网只工作在全双工方式，因此没有争用问题，也不使用 CSMA/CD 协

议

。$q$),(342550, NULL, NULL, $q$将大楼内的计算机使用双绞线、交换机连接在一起构成的网络属于局域网。$q$),(342551, NULL, NULL, $q$星形结构的网络采用的是广播式的传播方式。$q$),(342552, NULL, NULL, $q$无线局域网需使用无线网卡、无线接入点等设备，无线接入点英文简称为 WAP 或 AP。$q$),(342553, NULL, NULL, $q$无线局域网中的无线接入点（简称 WAP 或 AP），其作用相当于手机通信系统中的"基站

"。$q$),(342554, NULL, NULL, $q$接入无线局域网的每台计算机都需要有 1 块无线网卡，其数据传输速率目前已可达到

10Gb/s。$q$),(342555, NULL, NULL, $q$接入无线局域网的计算机与接入点（AP） 之间的距离一般在几米～几十米之间，距离 越大，信号越弱。$q$),(342556, NULL, NULL, $q$无线局域网采用协议主要是 802.11，通常也称 Wi-Fi。$q$),(342557, NULL, NULL, $q$为保证无线局域网的安全，验证和加密都是必要的。$q$),(342558, NULL, NULL, $q$计算机网络的最主要目的是实现资源共享。$q$),(342559, NULL, NULL, $q$计算机网络中所有设备必须遵循一定的通信协议才能高度协调地工作。$q$),(342560, NULL, NULL, $q$网络中的计算机只能作为服务器。$q$),(342561, NULL, NULL, $q$在计算机网络中，一台计算机要么充当服务器，要么充当客户机，不可同时身兼两职。$q$),(342562, NULL, NULL, $q$计算机网络最有吸引力的特性是资源共享，即多台计算机可以共享数据、打印机、传真机等多种资源，但不可以共享音乐资源。$q$),(342563, NULL, NULL, $q$BT文件下载时采用P2P模式工作，其特点是"参与下载的用户越多，下载的速度越快"。$q$),(342564, NULL, NULL, $q$从概念上讲，WWW网是按P2P模式工作的，只要上网的计算机安装微软的IE浏览器便可。$q$),(342565, NULL, NULL, $q$局域网就是将地理位置相对集中的计算机使用专线连接在一起的网络。$q$),(342566, NULL, NULL, $q$某些打印机自带网卡，可直接与网络相连。$q$),(342567, NULL, NULL, $q$网络上可以有两台计算机中网卡的MAC地址相同。$q$),(342568, NULL, NULL, $q$每块以太网卡都有一个全球唯一的MAC地址，MAC地址由6个字节组成，共48位。$q$),(342569, NULL, NULL, $q$局域网利用电信局提供的通信线路进行数据通信。$q$),(342570, NULL, NULL, $q$局域网的拓扑结构可以有总线型、星型、环型等多种。$q$),(342571, NULL, NULL, $q$连接在以太网交换机上的每一台计算机各自独享一定的带宽。$q$)
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
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批 HTML 更新数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 2 THEN RAISE EXCEPTION '第 8 批解析去冒号数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 23 THEN RAISE EXCEPTION '第 8 批前缀修复数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 8 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
