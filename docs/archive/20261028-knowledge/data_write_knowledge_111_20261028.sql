-- 知识点 111 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_111
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_111 as
select * from t_knowledge_point where id in (22215,22217,22769,22772,22773,22900,22913,22954,22974,25312,25313,25509,25976,26775,27475,27476,27477,27478,27479,27480,27481,27482,27483,27495,29224,29225,29226,29227,29244,29261,29262,29263,29305,29306,29400,29454,29480,31997,31998,31999,32000);

update t_knowledge_point set title = $kp$计算机病毒的表现和危害$kp$, content = $kp$计算机病毒的主要表现和危害：

- 破坏文件内容，造成磁盘上的数据破坏或丢失。
- 删除系统中一些重要的程序，使系统无法正常工作，甚至无法启动。
- 修改或破坏系统中的数据，造成不可弥补的损失。
- 盗用用户的账号、口令等机密信息。
- 在磁盘上产生许多“坏”扇区，减少磁盘可用空间。
- 占用计算机内存，造成计算机运行速度降低。
- 破坏主板BIOS芯片中存储的程序或数据。$kp$, section = '' where id = 22215;
update t_knowledge_point set title = $kp$计算机病毒防范$kp$, content = $kp$检测与消除计算机病毒最常用的方法是使用专门的杀毒软件。杀毒软件能自动检测及消除内存、主板BIOS和磁盘中的病毒。

杀毒软件的缺陷：尽管版本不断升级、功能不断扩大，但由于病毒程序与正常程序的形式相似性，以及杀毒软件的目标特指性，其开发与更新总是稍稍滞后于新病毒的出现，因此还会检测不出或无法消除某些病毒。而且，由于谁也无法预计今后病毒的发展及变化，很难开发出具有先知先觉功能、可以消除一切病毒的软硬件工具。$kp$, section = '' where id = 22217;
update t_knowledge_point set title = $kp$计算机病毒防范$kp$, content = $kp$计算机病毒是一些人蓄意编制的一种寄生性的、有破坏性的计算机程序。所有计算机病毒都是人为制造出来的，一旦扩散开来，制造者自己也无法控制。它不单是技术问题，而是一个严重的社会问题。

计算机病毒的特点：破坏性、隐蔽性、传染性和传播性、潜伏性。

检测与消除计算机病毒最常用的方法是使用专门的杀毒软件，它能自动检测及消除内存、主板BIOS和磁盘中的病毒。由于病毒程序与正常程序的形式相似性，以及杀毒软件的目标特指性，杀毒软件的开发与更新总是滞后于新病毒的出现，因此还会检测不出或无法消除某些病毒。

确保计算机不受病毒侵害，关键是做好预防工作。预防计算机病毒侵害的措施：

- 不使用来历不明的程序和数据。
- 不轻易打开来历不明的电子邮件。
- 确保系统的安装盘和重要的数据盘处于“写保护”状态。
- 在机器上安装杀毒软件（包括病毒防火墙软件），使启动程序运行、接收邮件和下载Web文档时自动检测与拦截病毒等。
- 经常性地、及时地做好系统及关键数据的备份工作。$kp$, section = '' where id = 22769;
update t_knowledge_point set title = $kp$防火墙$kp$, content = $kp$防火墙是一种维护网络安全的软件或硬件设备，位于它所保护的子网（内网）与其所连接的网络（外网）之间，能防止来自外网的攻击。$kp$, section = '' where id = 22772;
update t_knowledge_point set title = $kp$计算机病毒的定义与特点$kp$, content = $kp$计算机病毒是一些人蓄意编制的一种具有寄生性和自我复制能力的计算机程序，它能在计算机系统中生存，通过自我复制来传播，在一定条件下被激活，从而给计算机系统造成损害甚至严重破坏。

计算机病毒的特点：

- 破坏性：凡是软件能作用到的计算机资源（包括程序、数据甚至硬件），均可能受到病毒的破坏。
- 隐蔽性：大多数计算机病毒隐藏在正常的可执行程序或数据文件里，不容易被发现。
- 传染性和传播性：计算机病毒能从一个被感染的文件扩散到许多其他文件；特别是在网络环境下，可通过电子邮件、Web文档等迅速而广泛地传播，这是计算机病毒最可怕的一种特性。
- 潜伏性：计算机病毒可能长时间潜伏在合法的程序中，遇到一定条件（如到达指定时间）就开始传染，或者激活其破坏机制进行破坏活动，这称为病毒发作。$kp$, section = '' where id = 22773;
update t_knowledge_point set title = $kp$互联网防火墙$kp$, content = $kp$互联网防火墙是用于将互联网的子网（最小子网是1台计算机）与互联网的其余部分相隔离，以维护网络信息安全的一种软件或硬件设备。

防火墙的原理：对流经它的信息进行扫描，确保进入子网和流出子网的信息的合法性；过滤掉黑客的攻击，关闭不使用的端口，禁止特定端口流出信息等。防火墙通常部署在互联网与内部网之间，内部网一侧可再设置包过滤器。$kp$, section = '' where id = 22900;
update t_knowledge_point set title = $kp$计算机病毒及其特点$kp$, content = $kp$计算机病毒是有人蓄意编制的一种具有自我复制能力的、寄生性的、破坏性的计算机程序。它能在计算机中生存，通过自我复制进行传播，在一定条件下被激活，从而给计算机系统造成损害，甚至严重破坏系统中的软件、硬件和数据资源。

计算机病毒的特点：破坏性、隐蔽性、传染性和传播性、潜伏性。

木马病毒能偷偷记录用户的键盘操作，盗窃用户账号（如游戏账号、股票账号、网上银行账号）、密码和关键数据，甚至使“中马”的电脑被别有用心者所操控，安全和隐私完全失去保证。$kp$, section = '' where id = 22913;
update t_knowledge_point set title = $kp$入侵检测$kp$, content = $kp$入侵检测（Intrusion Detection）是主动保护系统免受攻击的一种网络安全技术。

原理：在网络若干关键点上监听和收集信息并对其进行分析，从中发现问题，及时进行报警、阻断和审计跟踪。

入侵检测是防火墙的有效补充：

- 可检测来自内部的攻击和越权访问，防火墙只能防外。
- 可以有效防范利用防火墙开放的服务进行的入侵。$kp$, section = '' where id = 22954;
update t_knowledge_point set title = $kp$包过滤与防火墙$kp$, content = $kp$包过滤器是运行在路由器中的一个软件，它能阻止IP包任意通过路由器。网络管理员应预先配置包过滤器，以控制哪些包可通过路由器，哪些包不可以。

包过滤器的任务：对每个IP包头部中的有关字段进行检查，按照网络管理员的配置控制IP包的通行与否。$kp$, section = '' where id = 22974;
update t_knowledge_point set title = $kp$计算机病毒的特点、危害与防范$kp$, content = $kp$- 特点：破坏性、隐蔽性、传染性和传播性、潜伏性。
- 主要危害与表现：
  - 可能破坏文件内容，造成磁盘数据丢失。
  - 在磁盘上产生许多坏的扇区，减少磁盘可用空间。
  - 删除系统的重要程序，使系统无法启动。
  - 修改和破坏系统的设置。
  - 盗用用户的账号和密码。
  - 破坏主板BIOS芯片。
- 处于写保护状态下的软盘、U盘不会感染任何病毒。
- 常见的病毒：CIH、震荡波、冲击波、尼姆达等。
- 杀毒软件防范：开发与更新滞后于新病毒的出现，无法百分之百保证安全；缺陷是占用系统资源；需要不断更新。$kp$, section = '' where id = 25312;
update t_knowledge_point set title = $kp$防火墙的特点与局限$kp$, content = $kp$- 防火墙是一种软件或硬件设备，可以过滤数据。
- 检查数据包的地址，确保进入和流出子网的信息是合法的。
- 入侵检测是主动保护系统的安全技术。
- 防火墙是被动的，不能防止木马程序，也不能防范从网络内部发起的攻击。
- 因特网先经过防火墙，再连接路由器，再连接其他网络。$kp$, section = '' where id = 25313;
update t_knowledge_point set title = $kp$计算机病毒与凯撒密码$kp$, content = $kp$（1）计算机病毒是一种人为编制的具有寄生性和破坏性的程序，通过自身的复制来扩大病毒感染范围和破坏力度。
（2）计算机病毒的特点：破坏性、隐匿性、攻击性、潜伏性、寄生性。
（3）杀毒软件总是滞后于新病毒的出现。
（4）计算机病毒既可以破坏硬件也可以破坏软件。
（5）木马病毒是一种后门程序（即远程监控程序）。
（6）U盘、软盘处于写保护状态下可以有效预防计算机病毒。
（7）计算机病毒可以通过邮件、光盘、磁盘、U盘、文件、网络等传播。

凯撒密码（置换密码、对称加密）：英文字母表为 a~z，明文是加密前的字符，密文是加密后的字符。加密时，当 K=n，将明文的每个字符向后（字母表右边）偏移 n 位，即得密文；解密时，将密文的每个字符向前（字母表左边）偏移 n 位，即得明文。$kp$, section = '' where id = 25509;
update t_knowledge_point set title = $kp$计算机病毒$kp$, content = $kp$（1）计算机病毒是一种人为编制的具有寄生性和破坏性的程序，通过自身的复制来扩大病毒感染范围和破坏力度。
（2）计算机病毒的特点：破坏性、隐蔽性、传染性、潜伏性、寄生性。
（3）杀毒软件总是滞后于新病毒的出现。
（4）计算机病毒既可以破坏硬件也可以破坏软件。
（5）木马病毒是一种后门程序（即远程监控程序），通过互联网窃取用户的数据。
（6）U盘、软盘处于写保护状态下可以有效预防计算机病毒。
（7）计算机病毒可以通过邮件、光盘、磁盘、U盘、文件、网络等传播。$kp$, section = '' where id = 25976;
update t_knowledge_point set title = $kp$入侵检测、防火墙与计算机病毒$kp$, content = $kp$1）入侵检测（Intrusion Detection）是对入侵行为的检测。它通过收集和分析网络行为、安全日志、审计数据、其他网络上可以获得的信息以及计算机系统中若干关键点的信息，检查网络或系统中是否存在违反安全策略的行为和被攻击的迹象。入侵检测作为一种积极主动的安全防护技术，提供了对内部攻击、外部攻击和误操作的实时保护，在网络系统受到危害之前拦截和响应入侵。

2）防火墙（Firewall）又称防护墙、火墙，由吉尔·舍伍德于1993年发明并引入国际互联网，是一种网络安全系统。

3）计算机病毒（Computer Virus）是编制者在计算机程序中插入的破坏计算机功能或者数据的代码，能影响计算机使用，能自我复制的一组计算机指令或者程序代码。计算机病毒具有传播性、隐蔽性、感染性等特点，其生命周期为：开发期→传染期→潜伏期→发作期→发现期→消化期→消亡期。$kp$, section = '' where id = 26775;
update t_knowledge_point set title = $kp$防火墙的作用与局限$kp$, content = $kp$防火墙位于内网和外网之间，用于防止外部网络对内部网络的攻击。所有进出内网和外网的数据都要经过防火墙。防火墙不能防范从网络内部发起的攻击。$kp$, section = '' where id = 27475;
update t_knowledge_point set title = $kp$入侵检测的工作方式$kp$, content = $kp$入侵检测是在网络上的关键节点上监听与收集信息，并对其进行分析，从中发现是否有违反安全策略的行为，并在发现时及时报警。$kp$, section = '' where id = 27476;
update t_knowledge_point set title = $kp$入侵检测对防火墙的补充$kp$, content = $kp$入侵检测技术主动保护系统不受攻击，是对防火墙技术的有效补充。$kp$, section = '' where id = 27477;
update t_knowledge_point set title = $kp$入侵检测的常用检测方法$kp$, content = $kp$入侵检测的常用检测方法有：特征检测、异常检测、状态检测、协议分析。$kp$, section = '' where id = 27478;
update t_knowledge_point set title = $kp$计算机病毒的定义$kp$, content = $kp$计算机病毒是一种人为编制的具有寄生性和破坏性的程序。$kp$, section = '' where id = 27479;
update t_knowledge_point set title = $kp$计算机病毒的破坏性$kp$, content = $kp$计算机病毒的特点之一是破坏性。$kp$, section = '' where id = 27480;
update t_knowledge_point set title = $kp$计算机病毒的特点$kp$, content = $kp$计算机病毒的特点：破坏性、隐蔽性、传染性和传播性、潜伏性。杀毒软件总是滞后于新病毒的出现。$kp$, section = '' where id = 27481;
update t_knowledge_point set title = $kp$木马病毒$kp$, content = $kp$木马病毒是一种反向病毒。$kp$, section = '' where id = 27482;
update t_knowledge_point set title = $kp$木马病毒$kp$, content = $kp$木马病毒是一种后门程序（即远程监控程序），通过互联网窃取用户的数据。$kp$, section = '' where id = 27483;
update t_knowledge_point set title = $kp$木马病毒$kp$, content = $kp$木马病毒是一种后门程序（即远程监控程序），通过互联网窃取用户的数据。$kp$, section = '' where id = 27495;
update t_knowledge_point set title = $kp$防火墙的定义$kp$, content = $kp$定义：将因特网的子网（包括单机）与因特网的其余部分相隔离，以维护网络与信息安全的一种软件、硬件设备。$kp$, section = '' where id = 29224;
update t_knowledge_point set title = $kp$防火墙的功能$kp$, content = $kp$功能：对流入流出防火墙的所有网络通信进行扫描检查（例如使校外的IP地址不能直接访问校内的网站）。$kp$, section = '' where id = 29225;
update t_knowledge_point set title = $kp$防火墙的局限性$kp$, content = $kp$局限性：

1）防火墙防外不防内。
2）防火墙难于管理和配置，容易造成安全漏洞。$kp$, section = '' where id = 29226;
update t_knowledge_point set title = $kp$计算机病毒防范措施$kp$, content = $kp$计算机病毒防范：

1）安装杀毒软件（检测与消除计算机病毒最常用的方法）。
2）闪存盘写保护。$kp$, section = '' where id = 29227;
update t_knowledge_point set title = $kp$入侵检测（对内）$kp$, content = $kp$入侵检测（对内）：通过若干个监听点对网络进行监听，发现问题、阻断、审计跟踪。$kp$, section = '' where id = 29244;
update t_knowledge_point set title = $kp$包过滤防火墙的过滤依据$kp$, content = $kp$如何防：

- 针对IP包头部中的IP地址进行过滤（如只允许特定IP地址的计算机通过）。
- 针对IP包中包含的端口号进行过滤（只允许特定端口号的IP包通过）。$kp$, section = '' where id = 29261;
update t_knowledge_point set title = $kp$入侵检测的作用与原理$kp$, content = $kp$入侵检测主动保护系统免受攻击，可及时发现来自外部或内部的各种攻击企图。

原理：在网络上的关键节点上监听与收集信息，并对其进行分析，从中发现是否有违反安全策略的行为，并及时报警。常用检测方法有：特征检测、异常检测、状态检测、协议分析。$kp$, section = '' where id = 29262;
update t_knowledge_point set title = $kp$计算机病毒的定义与特点$kp$, content = $kp$计算机病毒是人为编制的具有寄生性和自我复制能力的程序。特点：破坏性、隐蔽性、传染性、传播性、潜伏性。处于“写保护”状态的数据盘（U盘）可以防止病毒感染。$kp$, section = '' where id = 29263;
update t_knowledge_point set title = $kp$防火墙的作用$kp$, content = $kp$防火墙是一种软件或硬件设备，能够过滤数据，安装在内外网连接处，可以对内部网络或单台计算机起到很好的保护作用。$kp$, section = '' where id = 29305;
update t_knowledge_point set title = $kp$常见的计算机病毒$kp$, content = $kp$常见的计算机病毒有：CIH、震荡波、冲击波、蠕虫、木马、灰鸽子、熊猫烧香、尼姆达、宏病毒等。$kp$, section = '' where id = 29306;
update t_knowledge_point set title = $kp$防火墙高级设置（入站规则）$kp$, content = $kp$在“高级安全 Windows Defender 防火墙”中新建入站规则，向导依次设置：

- 规则类型：选择要创建的规则类型。
- 操作：指定当连接符合规则中指定的条件和匹配时要执行的操作。
- 配置文件：指定规则应用的配置文件。
- 名称：指定此规则的名称和描述。$kp$, section = '' where id = 29400;
update t_knowledge_point set title = $kp$入侵检测对防火墙的补充$kp$, content = $kp$入侵检测技术是防火墙技术的有效补充，它能及时发现来自外部和内部的各种攻击企图、攻击行为和任何未经授权的访问活动，保证系统资源的机密性、完整性和可用性。$kp$, section = '' where id = 29454;
update t_knowledge_point set title = $kp$计算机病毒的定义与特点$kp$, content = $kp$计算机病毒是寄生的、具有破坏性的程序。主要特点：破坏性、隐蔽性、潜伏性。对软盘写保护可确保含有程序和数据的存储介质在使用过程中不感染病毒。$kp$, section = '' where id = 29480;
update t_knowledge_point set title = $kp$Web服务器置于防火墙之内$kp$, content = $kp$Web服务器部署在内部网一侧、位于防火墙之内，Internet上的访问请求须先经路由器上的IP包过滤才能到达Web服务器，Web服务器受防火墙保护。$kp$, section = '' where id = 31997;
update t_knowledge_point set title = $kp$Web服务器置于防火墙之外$kp$, content = $kp$Web服务器置于防火墙之外，直接连接Internet；内部网经路由器上的IP包过滤与Internet相连，Web服务器本身不受防火墙保护。$kp$, section = '' where id = 31998;
update t_knowledge_point set title = $kp$Web服务器与防火墙合一$kp$, content = $kp$Web服务器与防火墙置于同一台主机上，内部网通过这台兼作防火墙的主机连接Internet。$kp$, section = '' where id = 31999;
update t_knowledge_point set title = $kp$Windows防火墙设置界面$kp$, content = $kp$“防火墙和网络保护”页面显示域网络、专用网络、公用网络（使用中）三种配置文件的防火墙均已打开，并提供“允许应用通过防火墙”“网络和Internet疑难解答程序”“防火墙通知设置”“高级设置”“将防火墙还原为默认设置”等入口。

“高级安全 Windows Defender 防火墙”用于管理本地计算机的入站规则、出站规则、连接安全规则和监视：三种配置文件均默认打开防火墙，阻止与规则不匹配的入站连接，允许与规则不匹配的出站连接；连接安全规则用于指定使用IPSec对计算机之间的连接进行身份验证和保护的规则。

当程序被防火墙阻止时，可在“允许应用通过防火墙”窗口中点击“更改设置”解除阻止。$kp$, section = '' where id = 32000;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22215,22217,22769,22772,22773,22900,22913,22954,22974,25312,25313,25509,25976,26775,27475,27476,27477,27478,27479,27480,27481,27482,27483,27495,29224,29225,29226,29227,29244,29261,29262,29263,29305,29306,29400,29454,29480,31997,31998,31999,32000) and not deleted) <> 41 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
