-- P2 第 10 批（25 道；html=8 colon=3 prefix=14）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(342600, NULL, NULL, $q$网上银行和电子商务等交易过程中，网络所传输的交易数据（如汇款金额、账号等）通常是经过加密处理的。$q$),(342601, NULL, NULL, $q$数字签名主要目的是鉴别消息来源的真伪，它不能发觉消息在传输过程中是否被篡改。$q$),(342602, NULL, NULL, $q$使用口令（密码）进行身份认证时，由于只有自己知道，他人无从得知，因此不会发生任何安全问题。$q$),(342603, NULL, NULL, $q$单纯采用令牌（如校园一卡通、公交卡等）进行身份认证，缺点是丢失令牌将导致他人能轻易进行假冒和欺骗。$q$),(342604, NULL, NULL, $q$计算机系统必须对信息资源的访问进行控制和管理，“访问控制”就是对系统内的每个文件或资源规定各个用户对它的操作权限，如：是否可读、是否可写、是否可修改等。$q$),(342605, NULL, NULL, $q$在网络信息安全的措施中，身份鉴别是访问控制的基础。$q$),(342606, NULL, NULL, $q$包过滤是运行在路由器上的软件，而且大多数商用路由器都具有包过滤的功能。$q$),(342607, NULL, NULL, $q$通过防火墙的设置，为单位提供了内部网络的安全边界，它能防止外界侵入单位内部的计算机。$q$),(342608, NULL, NULL, $q$在校园网中，可对网络进行设置，使校外某一IP地址不能直接访问校内网站。$q$),(342609, NULL, NULL, $q$计算机病毒一般是一段计算机程序，它会破坏计算机系统的工作，能象生物病毒那样复制、传染、潜伏和激发。$q$),(342610, NULL, NULL, $q$杀毒软件的病毒特征库汇集了已出现的所有病毒特征，因此可以查杀所有病毒，有效保护信息。$q$),(342611, NULL, NULL, $q$在一台已感染病毒的计算机上读取CD-ROM光盘中的数据，该光盘也有可能被感染病毒。$q$),(342612, NULL, NULL, $q$只要不上网，PC机就不会感染计算机病毒。$q$),(342793, NULL, $q$防火墙按照用户及管理员预先定义的规则,从而可以防止外界的攻击。$q$, NULL),(342811, NULL, NULL, $q$无线局域网采用协议主要是 802.11，俗称 Wi-Fi。$q$),(342940, NULL, $q$XML 主要用来存储数据，体现在用作配置文件，或者充当小型数据库，在网络中传输数据，但不具有数据分析功能。XML 特点:简单易读、数据交换方便（几乎是唯一公共语言），跨平台支持。

【第 2 题】答案:ABCD

解析:HTML5 新的表单控件，比如 calendar（日历）、date（日期）、time（时间）、email（邮件）、url（网址）、search（搜索）、color（颜色）、range（范围或滑动条）、progress（进度条）、meter（计量条）等。

【第 3 题】答案:ABCD

解析:iOS 的系统架构:触控界面层、媒体层、内核服务层、操作系统内核（Darwin）

【第 4 题】答案:ABCD

解析:Android 是谷歌的，大部分安卓手机都使用它。iOS 是 Apple 公司，用于 iPhone 和iPad 等，Windows phone 是微软公司，用于支持手机、智能设备等。 Harmony OS 是华为的，用于手机、智能设备等。

【第 5 题】答案:ABC

解析:媒体层:Core Graphics:2D 绘图；Open GL Es:OpenGL $q$, NULL),(342976, $q${"A": "<!DOCTYPE html>", "B": "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\">", "C": "<article>", "D": "Geolocation API"}$q$, NULL, NULL),(343039, $q${"A": "不必先建立连接就能向其他主机发送分组", "B": "分组在各结点存储转发时会造成一定的时延", "C": "采用分组传输数据会造成一部分多余的数据在网络上传输，从而造成额外开销", "D": "高效动态分配传输带宽，对通信链路是逐段占用<br/>", "E": "当同一个文件被划分成多个数据包在线路上传输时，每个包经过的路径不一定完全相同<br/>", "F": "每个包到达目的地先后次序可能发生变化"}$q$, NULL, NULL),(343047, $q${"A": "关闭SSID广播", "B": "使用\"MAC地址过滤\"来限制", "C": "对申请接入的设备进行身份认证", "D": "限制设备带宽使用"}$q$, NULL, NULL),(343067, $q${"A": "IP协议规定，全网所有主机通信时使用统一的IP地址", "B": "IP 协议第 4 版（IPv4）规定，每个 IP 地址使用 4 个字节来表示，通常采用“点分十进制形式”", "C": "IP 地址中如果主机位每一位都是\"0\"，称为广播地址，如果主机每一位都为\"1\"，称为网络地址", "D": "私网地址是组织机构内部使用的 IP 地址，它不能与持公网地址主机直接进行通信，通常需要 NAT 技术来转换"}$q$, NULL, NULL),(343156, NULL, $q$HTML 使用不同的标签来丰富显示格式$q$, NULL),(343223, $q${"A": "计算机病毒只传染给可执行文件", "B": "计算机病毒是后缀名为\"exe\"的文件", "C": "计算机病毒只会通过后缀名为\"exe\"的文件传播", "D": "所有的计算机病毒都是人为制造出来的"}$q$, NULL, NULL),(343261, $q${"A": "近年来盛行的“BT”下载服务采用的是对等工作模式", "B": "基于客户/服务器模式的网络会因客户机的请求过多、服务器负担过重而导致整体性能下降", "C": "Windows XP 操作系统中的\"网上邻居\"是按客户/服务器模式工作的", "D": "对等网络中的每台计算机既可以作为客户机也可以作为服务器"}$q$, NULL, NULL),(343301, $q${"A": "总线型拓扑结构最大的缺点就是一旦中心结点故障，整个网络瘫痪", "B": "在环型拓扑结构中，每个结点都有一个编号，信息按编号以\"接力\"的方式传输", "C": "星型结构是使用同一媒体或电缆将所有计算机连在一起，这种结构任一时刻只有一台计算机可以向其他机器发送信息", "D": "以上说法都不正确"}$q$, NULL, NULL),(343339, $q${"A": "Web service 通过使用基于'XML'标准的消息机制,增强互操作性。", "B": "Web service 通过使用任务列表为人机交互提供了一种接口。", "C": "Web service 基于 JAX_RPC 标准,并通过远程方法调用提供一种松耦合方法", "D": "Web service 通过使用 BPEL 应用程序定义的接口,实现服务的功能。"}$q$, NULL, NULL)
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
  IF n <> 8 THEN RAISE EXCEPTION '第 10 批 HTML 更新数应为 8，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 3 THEN RAISE EXCEPTION '第 10 批解析去冒号数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 14 THEN RAISE EXCEPTION '第 10 批前缀修复数应为 14，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 10 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 10 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
