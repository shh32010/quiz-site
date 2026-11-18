-- P2 第 11 批（25 道；html=16 colon=9 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(343361, $q${"A": "Windows 操作系统中的“网上邻居”是按对等模式工作的", "B": "在C/S模式中通常选用一些性能较高的计算机作为服务器", "C": "“BT”网络下载服务采用对等工作模式，“其特点是\"下载的请求越多、下载速度越快\"", "D": "两种工作模式均要求计算机网络的拓扑结构必须为总线型结构"}$q$, NULL, NULL),(343374, NULL, $q$中继器的功能是对信号进行整形放大后再传输的。$q$, NULL),(343386, NULL, $q$此题主要看主机 1 设备的 IP 地址和网关的 IP 地址。

主机与域名服务器和交换之间相连，可以知道，主机 1 与域名服务器需要在同一网段，即网络号相同，域名服务器网络号是 192.168.1;即主机 1 也设置为 192.168.1。再看主机号，需要与域名服务器不同，也不能和路由器配置相同，即可以设的 192.186.1.101 或其他。子网掩码因为是 C 类的，所以是 255.255.255.0；网关可以设置为与内网接口的路由器 IP,即

192.168.1.1;DNS 就是指的域名服务器，所以就是使用连接交换机的域名服务器 IP。$q$, NULL),(343407, NULL, $q$GB18030 与 GB2312、GBK 保持"向下兼容",还扩充了 UCS/Unicode 中的其他字符。GB18030（-2000） 标准中汉字数目增加到 27000 多个; GB 18030-2005 共收录汉字 70,244个。$q$, NULL),(343425, NULL, $q$W3C 是英文 World Wide Web Consortium 的缩写,中文意思是 W3C 理事会或万维网联盟。W3C 组织是对网络标准制定的一个非赢利组织,像 HTML、XHTML、CSS、XML 的标准就是由 W3C 来定制$q$, NULL),(343437, NULL, $q$在云计算环境下，资源不再是分散的硬件，而是让 CPU、内存、磁盘、I/O 等硬件变成可以动态管理的"资源池"。$q$, NULL),(343441, NULL, $q$虚拟化是私有云计算基础架构基石。而分布式是公有云计算基础架构基石。$q$, NULL),(343442, NULL, $q$分布式是公有云计算基础架构基石，虚拟化是私有云计算基础架构基石。$q$, NULL),(343447, NULL, $q$描述不够严谨，虽然人工智能从 1950 年代被提出来，在慢慢有自己的发展阶段和趋势。十分重要和之前并没有什么因果关系。$q$, NULL),(343455, $q${"A": "在对应网络“属性”中找到“Internet 协议版本 4(TCP/IPv4)”然后点击“属性”进行设置", "B": "在控制面板中找到“网络和共享中心”，然后点击“更改适配器设置”", "C": "在任务栏的网络图标上右击，选择\"属性\"进行设置", "D": "在设置里找到“网络和共享中心”，然后再点击“更改适配器设置”"}$q$, NULL, NULL),(343461, $q${"A": "在搜索框里输入“网络管理”，选择【打开“网络和 Internet”设置】", "B": "右击开始菜单选择“任务管理器”，选择【打开\"网络和 Internet\"设置】", "C": "在任务栏的网络图标上右击，选择【打开“网络和 Internet”设置】", "D": "右击开始菜单选择“设置”，再选择“更新和安全”，选择【打开“网络和 Internet”设置】"}$q$, NULL, NULL),(343462, $q${"A": "通过\"Windows 安全中心\"来关闭防火墙", "B": "通过“网络和 Internet”来关闭防火墙", "C": "通过“设备”来关闭防火墙", "D": "通过“帐户”来关闭防火墙"}$q$, NULL, NULL),(343636, $q${"A": "Windows XP 操作系统中的\"网上邻居\"是按对等模式工作的", "B": "在客户/服务器模式中通常选用一些性能较高的计算机作为服务器", "C": "因特网 “BT” 下载服务采用对等工作模式，其特点是 “下载的请求越多、下载速度越<br/><br/>快”", "D": "两种工作模式均要求计算机网络的拓扑结构必须为总线型结构"}$q$, NULL, NULL),(343698, NULL, $q$智能通信不是。电网、医疗、物流、农业、制造、金融与服务、交通、家居、安防、零售等。$q$, NULL),(343760, $q${"A": "都是先进后出", "B": "都是先进先出", "C": "只允许在端点处插入和删除元素", "D": "没有共同点<br/><br/>## 33 从宏观角度来看，移动互联网由移动终端和移动子网、（）、核心网络3部分组成。<br/><br/>(A)互联网<br/><br/>(B)路由器<br/><br/>(C)接入网络 (D)资源子网<br/><br/>移动互联网(Mobile Internet, 简称MI)是一种通过智能移动终端 ,采用移动无线通信方式获取业务和服务的新兴业务,包含终端、软件和应用三个层面。<br/><br/><br/>从宏观角度来看,移动互联网是由移动终端和移动子网、接入网络、核心网络3部分组成.<br/><br/><br/>## 34 以下不属于移动自组织网络特点的是（）。<br/><br/>(A)自组织性<br/><br/>(B)动态移动性<br/><br/>(C)单跳网络<br/><br/>(D)移动终端的局限性<br/><br/>## 35 以下不属于 5G 通信系统特点的是（）。<br/><br/>#### (A)时延短 (B)速度快<br/><br/>(C)频谱利用率高<br/><br/>(D)网络耗能高"}$q$, NULL, NULL),(343968, $q${"A": "上传本机已下载的视频数据", "B": "本地计算机感染病毒，上传本地计算机的敏感信息", "C": "上传本机已下载的\"病毒库\"", "D": "上传本机主板上BIOS ROM中的程序代码"}$q$, NULL, NULL),(343969, $q${"A": "方便用户操作", "B": "防止\"木马\"盗取用户输入的信息", "C": "提高软件的运行速度", "D": "为了查杀“木马”病毒"}$q$, NULL, NULL),(343983, $q${"A": "不用来收发电子邮件的电脑，不会感染\"木马\"病毒", "B": "\"木马\"运行时比较隐蔽，一般不会在任务栏上显示出来", "C": "\"木马\"运行时会占用系统的CPU和内存等资源", "D": "\"木马\"运行时可以截获键盘输入的口令、帐号等机密信息，发送给黑客"}$q$, NULL, NULL),(344120, $q${"A": "互联网+\"的本质是信息互联和信息能源的开发", "B": "“互联网+”是虚拟经济与实体经济的深度融合", "C": "“互联网+”是指互联网与实体经济的简单相加", "D": "\"互联网4\"是指依托移动互联网、云计算、大数据、物联网等信息网络技术的渗透和扩散"}$q$, NULL, NULL),(344190, $q${"A": "域名“www.tsinghua.edu.cn”中\"tinghua\"是网络名", "B": "域名使用的字符可以是字母、数字和连字符，但必须字母或数字开头并结尾,域名的长度不超过255个字符", "C": "DNS是将IP与MAC之间的解析", "D": "美国一般不使用国家代码作为第1级域名，而其他国家（地区）一般采用国家（地区）代码作为1级域名，比如中国是\"cn\""}$q$, NULL, NULL),(344237, $q${"A": "域名“www.tsinghua.edu.cn”中\"tinghua\"是网络名", "B": "域名使用的字符可以是字母、数字和连字符，但必须字母或数字开头并结尾, 域名的长度不超过 255 个字符", "C": "DNS是将IP与MAC之间的解析", "D": "美国一般不使用国家代码作为第 1 级域名，而其他国家（地区）一般采用国家（地区）代码作为 1 级域名，比如中国是\"cn\""}$q$, NULL, NULL),(344390, $q${"A": "Ethernet表示是以太网", "B": "dhcp 表示是静态获取 IP", "C": "IPV6INT=\"yes\"表示启用IPV6功能", "D": "ONBOOT=\"yes\"表示开启自动网络连接"}$q$, NULL, NULL),(344583, $q${"A": "域名“www.tsinghua.edu.cn”中\"tinghua\"是网络名", "B": "域名使用的字符可以是字母、数字和连字符，但必须字母或数字开头并结尾, 域名的长度不超过 255 个字符", "C": "DNS 是将 IP 与 MAC 之间的解析", "D": "美国一般不使用国家代码作为第1级域名，而其他国家（地区）一般采用国家（地区）代码作为1级域名，比如中国是\"cn\""}$q$, NULL, NULL),(344892, $q${"A": "路由表是 IP 包到达目的地所必须的", "B": "路由表用来表示目的地 IP 地址与输出端口的关系", "C": "路由表中存放的是路由信息,即\"到哪里去该从哪个出口走\"的信息", "D": "路由表内容是固定不变的,因此可通过硬件实现"}$q$, NULL, NULL),(344917, $q${"A": "\"用密码进行加密\"的文档,不知道口令就无法打开", "B": "文档一旦设置了加密密码,就无法取消", "C": "可以通过添加数字签名来确保文档的完整性", "D": "可以授子用户不同的访问权限"}$q$, NULL, NULL)
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
  IF n <> 16 THEN RAISE EXCEPTION '第 11 批 HTML 更新数应为 16，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 9 THEN RAISE EXCEPTION '第 11 批解析去冒号数应为 9，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 11 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 11 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 11 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
