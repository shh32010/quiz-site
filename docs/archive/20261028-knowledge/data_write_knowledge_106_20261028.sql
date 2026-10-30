-- 知识点 106 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_106
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_106 as
select * from t_knowledge_point where id in (22398,22462,22574,22581,22610,22611,22618,22630,22637,22638,22641,22655,22682,22683,22691,22706,22719,22720,22733,22734,22735,22739,22766,22774,22777,22790,22797,22813,22815,22816,22817,22851,22852,22853,22858,22862,22866,22868,22895,22899,22907,22909,22938,22942,22971,22973,22982,22989,23058,23065,23067,23068,23078,23088,23099,23100,23113,23126,23131,23367,23414,23455,23463,23625,23943,24983,25031,25165,25170,25175,25637,25686,25855,25967,26099,26276,26277,26281,26286,26425,26426,26469,26501,26505,26515,26769,26825,27374,27397,27446,27447,27448,27449,27450,27451,27452,27453,27454,27455,27456,27457,27458,27459,27460,27461,27462,27463,27464,27465,27467,27492,27493,27494,27950,27951,28318,28319,28325,28431,28433,28435,28437,28521,28523,28537,28540,29160,29188,29220,29229,29230,29231,29232,29235,29236,29237,29238,29239,29251,29252,29254,29295,29296,29297,29298,29299,29300,29301,29302,29313,29315,29316,29317,29332,29333,29334,29363,29406,29415,29416,29422,29424,29448,29449,29450,29451,29476,29477,29478,29481,29490,29499,29502,29503,29505,29506,29508,29510,29969,29991,30121,30128,30146,30152,30191,32600);

update t_knowledge_point set title = $kp$静态网页与动态网页$kp$, content = $kp$Web 网页分为静态网页和动态网页两大类。

静态网页：内容固定不变的网页。
动态网页：内容不是预先确定的，而是在网页请求过程中根据当时实际的数据内容实时生成的页面。$kp$, section = '' where id = 22398;
update t_knowledge_point set title = $kp$Web 浏览器软件$kp$, content = $kp$浏览器是运行在客户计算机上的一种软件，是观察 Web 的窗口。$kp$, section = '' where id = 22462;
update t_knowledge_point set title = $kp$URL 的表示形式$kp$, content = $kp$URL 的表示形式：协议名://主机域名或 IP 地址[:端口号][/文件路径]/文件名，方括号表示其中的内容可以省略。

常用协议名有 http、https、ftp 等，telnet 是远程登录协议。ARP 用于把 IP 地址解析为 MAC 地址，是发现网络设备时使用的广播协议，不在 URL 中使用。$kp$, section = '' where id = 22574;
update t_knowledge_point set title = $kp$FTP 概念$kp$, content = $kp$FTP：把网络上一台计算机中的文件移动或拷贝到另一台计算机上，称为文件传输，简称 FTP。FTP 是因特网上广泛使用的传统应用之一。

FTP（文件传输协议）规定，需要进行文件传输的两台计算机应按照客户/服务器模式工作。

使用 FTP 传输文件时，可以一次传输一个文件（夹），也可以一次传输多个文件（夹）。传输可在两个方向进行：用户既可以从 FTP 服务器获得远程文件（下载），也可以把本地文件传给服务器（上传）。FTP 程序还允许用户对远程服务器中的文件进行各种操作，如文件列表、文件更名、建立文件、删除文件等。无论下载、上传还是其他操作，都受文件访问权限的控制。$kp$, section = '' where id = 22581;
update t_knowledge_point set title = $kp$电子邮箱及其地址$kp$, content = $kp$邮箱地址的格式为：邮箱名@邮箱所在的主机域名。

例如 yang@lib.nju.edu.cn 表示邮箱名是 yang，邮箱所在主机是 lib.nju.edu.cn。发送邮件的计算机根据地址中的第 2 部分确定邮件应送达的计算机，接收邮件的计算机根据第 1 部分选择邮箱并把邮件放进去。$kp$, section = '' where id = 22610;
update t_knowledge_point set title = $kp$电子邮箱地址的组成$kp$, content = $kp$邮箱名（用户名）@邮箱所在的邮件服务器域名。$kp$, section = '' where id = 22611;
update t_knowledge_point set title = $kp$网页与 HTML 语言$kp$, content = $kp$Web 服务器中向用户发布的文档通常称为网页（Web page），网站中的起始页称为主页（homepage）。

网页是采用 HTML（超文本标记语言）描述的超文本文档，文件后缀为 .html 或 .htm。$kp$, section = '' where id = 22618;
update t_knowledge_point set title = $kp$Web Service 与 SOA$kp$, content = $kp$Web Service（Web 服务）是目前实现 SOA 的主要技术，是平台独立、低耦合、自包含、基于可编程 Web 的应用程序，可使用开放的 XML 标准来描述、发布、发现、协调和配置，用于开发分布式的互操作应用程序。

SOAP 提供了标准的 RPC（远程过程调用）方法来调用 Web Service。$kp$, section = '' where id = 22630;
update t_knowledge_point set title = $kp$电子邮件的功能与特点$kp$, content = $kp$电子邮件是因特网中最重要的信息交流工具之一，电子邮箱具有存储和收发信息的功能。

电子邮件最大的特点是：人们可以在任何地方、任何时间收发信件，解决了时空的限制，大大提高了工作效率，为办公自动化、商业活动提供了很大便利。

相关判断：发送邮件必须在收信栏输入对方的信箱地址；电子信箱是邮件服务商在网络服务器上提供的存储空间，不是用户本机的空间；无论对方计算机是否开机，都可以向对方发送邮件；除给自己发信外，一般不需要输入自己的信箱地址。$kp$, section = '' where id = 22637;
update t_knowledge_point set title = $kp$服务器虚拟化与云服务模式$kp$, content = $kp$服务器虚拟化的特点：
一台物理服务器可以划分为多个独立服务器使用，运行多个操作系统和应用，计算资源可以被有效利用和控制；
各虚拟机相互隔离，数据不会在虚拟机之间泄露，应用只在各自的虚拟机中运行；
虚拟磁盘以文件形式存放，易于暂停、转移和拷贝；
虚拟化使应用与硬件独立，支持高可用性和动态资源调整，极大提高系统的运行能力。

IaaS（基础设施即服务）：用户通过互联网获得计算能力等基础设施服务，不需要实际的服务器资源。
PaaS（平台即服务）：把服务器平台作为一种服务提供，用户通过互联网直接使用开发平台，不需要在本地安装各类开发环境。
SaaS（软件即服务）：也称软件运营模式，用户通过互联网直接使用软件应用，不需要在本地安装。$kp$, section = '' where id = 22638;
update t_knowledge_point set title = $kp$URL 的定义与格式$kp$, content = $kp$统一资源定位器 URL 用于标识 Web 中每个信息资源的位置。

URL 的表示形式：协议名://主机域名或 IP 地址[:端口号][/文件路径]/文件名，方括号表示其中的内容可以省略。

常用协议名：http、https、ftp 等。$kp$, section = '' where id = 22641;
update t_knowledge_point set title = $kp$FTP 原理与客户端$kp$, content = $kp$需要进行远程文件传输的计算机必须安装并运行 FTP 客户程序。

启动 FTP 客户程序比较常见的一个途径是使用 IE 浏览器，在地址栏输入如下格式的 URL：ftp://[用户名:口令@]FTP 服务器域名[:端口号]。

通过 IE 浏览器启动 FTP 速度较慢，还会把密码暴露在浏览器中，不够安全。因此一般都安装并运行专门的 FTP 客户程序，如 LeapFTP、CuteFTP、WSFTP 等，它们都是专门用来连接 FTP 服务器的应用程序，提供图形化的用户界面。

因特网上有许多 FTP 服务器为用户提供文件共享服务（称为匿名 FTP 服务器），用 anonymous 作为用户名、以用户的电子邮件地址作为口令登录，通常只能查看和下载文件，不能修改和上传文件。$kp$, section = '' where id = 22655;
update t_knowledge_point set title = $kp$电子邮件的组成$kp$, content = $kp$邮件的头部（header）：包括发送方地址、接收方地址（允许多个）、抄送方地址（允许多个）、主题等。
邮件的正文（body）：信件的内容。
邮件的附件：可以包含一个或多个文件，文件类型可以任意。

现在多数邮件系统都使用 MIME 协议，它允许邮件正文具有丰富的排版格式，还可以在正文中包含图片、声音和超链接，使邮件的表达能力更强、内容更丰富。$kp$, section = '' where id = 22682;
update t_knowledge_point set title = $kp$统一资源定位器 URL$kp$, content = $kp$浏览器使用统一资源定位器（URL）定位网页。

URL 的表示形式为：http://主机域名或 IP 地址[:端口号]/文件路径/文件名。

http：表示客户端和服务器执行 HTTP 传输协议，把远程 Web 服务器上的网页传输给用户的浏览器。
主机域名：提供此服务的计算机的域名。
端口号：通常使用默认值，如 Web 服务器使用 80，一般不需要给出。
/文件路径/文件名：网页在 Web 服务器硬盘中的位置和文件名；如果不明确给出，则以 index.html 或 default.html 作为默认文件名，即该网站的主页。$kp$, section = '' where id = 22683;
update t_knowledge_point set title = $kp$远程文件传输 FTP$kp$, content = $kp$文件传输协议 FTP（File Transfer Protocol）用于实施文件传输服务。FTP 协议规定，需要进行文件传输的两台计算机应按照客户/服务器模式工作：主动要求文件传输的发起方是客户方，运行 FTP 客户程序；另一方为服务方，运行 FTP 服务器程序，两者协同完成文件传输任务。

匿名服务：为了允许任何用户访问文件，许多 FTP 服务器允许用户使用一个特殊的帐户，登录名为 anonymous，以最小权限访问 FTP 服务器上的文件，同时要求用户用电子邮件帐户名作为口令，以便发生问题时 FTP 服务器可以发邮件给用户。匿名方案提供了基本的共享文件服务。$kp$, section = '' where id = 22691;
update t_knowledge_point set title = $kp$Web 浏览器$kp$, content = $kp$WWW 是典型的客户/服务器工作模式。

浏览器的功能：把用户的信息请求传送给 Web 服务器，并向用户展现从 Web 服务器得到的网页。用户输入网页的 URL 后，浏览器使用 HTTP 协议与 URL 指定的 Web 服务器通信，请求服务器下传网页；Web 服务器接到请求后，从硬盘中找到或临时生成相应的网页，用 HTTP 协议回传给浏览器；浏览器解释该网页并把内容显示给用户。$kp$, section = '' where id = 22706;
update t_knowledge_point set title = $kp$电子邮件的传送原理$kp$, content = $kp$发送邮件：邮件传送程序必须与远程的邮件服务器建立 TCP 连接，并按照 SMTP（Simple Mail Transfer Protocol，简单邮件传输协议）传输邮件，若接收方邮箱在服务器上确实存在，才进行邮件的发送，以确保邮件不会丢失。

接收邮件：按照 POP3（Post Office Protocol v3）协议向邮件服务器提出请求，只要用户输入的身份信息（用户名和密码）正确，就可以访问自己的邮箱内容。$kp$, section = '' where id = 22719;
update t_knowledge_point set title = $kp$电子邮件的工作过程$kp$, content = $kp$电子邮件系统按 C/S 模式工作。

发送邮件：按照 SMTP（简单邮件传输协议）传输邮件。
接收邮件：按照 POP3 协议向邮件服务器提出请求，访问邮箱内容。$kp$, section = '' where id = 22720;
update t_knowledge_point set title = $kp$互联网通信服务$kp$, content = $kp$互联网通信服务包括电子邮件、即时通信和文件传输。$kp$, section = '' where id = 22733;
update t_knowledge_point set title = $kp$Web 信息服务$kp$, content = $kp$Web 信息服务主要包括：WWW 的组成、Web 信息检索。$kp$, section = '' where id = 22734;
update t_knowledge_point set title = $kp$WWW 信息服务$kp$, content = $kp$WWW 信息服务包括 WWW 的组成和 Web 信息检索。$kp$, section = '' where id = 22735;
update t_knowledge_point set title = $kp$WWW 万维网$kp$, content = $kp$WWW（World Wide Web）有人译作万维网、环球网，或称 Web 网、3W 网，最初由欧洲核物理研究中心（CERN）提出，是因特网上最广泛使用的一种服务。

WWW 由被称为 Web 服务器的计算机和安装了 WWW 浏览器的计算机组成。Web 服务器中存放大量以超文本形式表示、需要公开发布或可共享的信息，这些超文本信息互相链接，形成全球范围互相引用的信息网络；安装了浏览器的用户可以查询和获取分布在世界各地的 Web 服务器上的信息资源。

（1）网页与 HTML 语言：Web 服务器中向用户发布的文档通常称为网页（Web page），一个单位或个人的主网页称为主页（homepage）。网页是采用 HTML（超文本标记语言）描述的超文本文件，后缀为 .html 或 .htm。

（2）HTML 文档包括头部（Head，包含文档的标题及其他说明信息）和正文（Body，包含文字与图片等具体内容）。浏览器收到 HTML 文档后进行解释，按照文档中的标记规定处理。

（3）统一资源定位器 URL（Uniform Resource Locator）用于指出网页的地址。$kp$, section = '' where id = 22739;
update t_knowledge_point set title = $kp$WWW 信息服务的组成$kp$, content = $kp$WWW（World Wide Web）即万维网，是因特网上最广泛使用的一种信息服务。

WWW 由遍布因特网中被称为 Web 服务器的计算机和安装了 Web 浏览器软件的客户计算机组成。Web 服务器中存放大量以超文本形式表示、需要公开发布或可共享的信息；这些超文本信息互相链接，形成全球范围互相引用的信息网络；安装了浏览器的用户可以查询和获取分布在世界各地的 Web 服务器上的信息资源。$kp$, section = '' where id = 22766;
update t_knowledge_point set title = $kp$物联网的概念$kp$, content = $kp$物联网不是一种物理上独立存在的完整网络，而是在现有应用或下一代公网、专网基础上形成的联网应用和通信能力。

物联网概念包括三个方面：
物：客观世界的物品，主要包括人、商品、地理环境等。
联：通过互联网、通信网、电视网以及传感网等实现网络互联。
网：与通信介质无关，有线无线均可；与通信拓扑结构无关，总线、星型均可；只要能达到数据传输的目的即可。$kp$, section = '' where id = 22774;
update t_knowledge_point set title = $kp$HTTP 协议$kp$, content = $kp$HTTP 协议主要用于传输 HTML 文档，定义了浏览器发送给服务器的请求格式及服务器返回给浏览器的应答格式。WWW 服务也是按客户/服务器模式工作的。$kp$, section = '' where id = 22777;
update t_knowledge_point set title = $kp$Web 浏览器的功能与文档类型$kp$, content = $kp$浏览器主要有两个功能：向用户提供友好的使用界面；把用户的信息查询请求传送给 Web 服务器。

浏览器工作过程：用户给出一个文档的 URL 后，浏览器开始与 URL 指定的计算机通信，请求服务器发送文档；Web 服务器接到请求后把相应的文档传送给浏览器，浏览器对 HTML 文档进行解释，并把内容显示给用户。

URL 中的服务类型常用的有：
ftp：执行 FTP 协议，使远程 FTP 服务器与用户的计算机进行远程文件传输操作；
mailto：执行 SMTP 协议，向远程计算机发送电子邮件；
telnet：执行 TELNET 协议，登录远程计算机；
news：执行 NNTP 协议，访问远程计算机提供的网络新闻服务。

Web 文档有 3 种基本形式：静态 Web 文档、动态 Web 文档、主动 Web 文档。$kp$, section = '' where id = 22790;
update t_knowledge_point set title = $kp$Web 1.0 与 Web 2.0 的区别$kp$, content = $kp$Web 2.0：以分享为特征的实时网络，用户在互联网上拥有自己的数据，并能在不同的网站上使用。

Web 1.0 与 Web 2.0 的区别：
页面风格：Web 1.0 结构复杂、页面繁冗；Web 2.0 页面简洁、风格流畅。
个性化程度：Web 1.0 垂直化、大众化；Web 2.0 个性化突出、自我品牌。
用户体验：Web 1.0 低参与度、被动接受；Web 2.0 高参与度、互动接受。
通讯程度：Web 1.0 信息闭塞、知识程度低；Web 2.0 信息灵通、知识程度高。
感性程度：Web 1.0 追求物质性价值；Web 2.0 追求精神性价值。
功能性：Web 1.0 实用、追求功能性利益；Web 2.0 体验、追求情感性利益。$kp$, section = '' where id = 22797;
update t_knowledge_point set title = $kp$FTP 服务的组成$kp$, content = $kp$FTP 服务采用客户/服务器工作模式。

FTP 客户机：运行 FTP 客户程序（如 CuteFTP、LeapFTP、FlashFXP、Windows 的 ftp.exe）的主机。
FTP 服务器：运行 FTP 服务器程序（如 Serv-U、ftpd、wu-ftp）的主机。

FTP 客户机与 FTP 服务器之间需要建立 2 个连接：
控制连接：传送客户发出的命令和服务器的应答消息；
数据连接：传送文件数据。$kp$, section = '' where id = 22813;
update t_knowledge_point set title = $kp$IE 浏览器的其他功能$kp$, content = $kp$使用 IE 浏览器除了查找、浏览和下载网页之外，还能完成几乎所有传统的互联网服务，如：
电子邮件：mailto: 执行 SMTP 协议，向远程计算机发送电子邮件；
远程登录：telnet:// 执行 TELNET 协议，登录远程计算机；
文件传输：ftp:// 执行 FTP 协议，使 FTP 服务器与用户的计算机进行远程文件传输操作；
网络新闻服务：news:// 执行 NNTP 协议，访问远程计算机提供的新闻。$kp$, section = '' where id = 22815;
update t_knowledge_point set title = $kp$Internet Explorer 图标$kp$, content = $kp$该图标称为网络浏览器，启动它可以连接到 Internet，查看网上信息。$kp$, section = '' where id = 22816;
update t_knowledge_point set title = $kp$Internet 通信服务$kp$, content = $kp$互联网提供下列不同形式的通信服务：电子邮件、微信；博客、微博；专题讨论；即时通信（Instant messaging）；IP 电话。

同步通信与异步通信的区别：同步（实时）通信要求通信双（多）方同时在线；异步（非实时）通信的通信双（多）方不必同时在线。

电子邮件与传统邮政服务的区别：使用电子文档代替纸质文档；使用网络传输代替人工投递。

电子邮件的特点：快捷；方便，可在任何地方接收和发送邮件；不受时区影响；可使用多媒体表示邮件内容；具有地址簿功能，群体通信方便；可提供免费服务（Hotmail、Gmail、Yahoo 等）；可使用计算机管理邮件（整理、编辑、归档）。$kp$, section = '' where id = 22817;
update t_knowledge_point set title = $kp$Web 应用的发展$kp$, content = $kp$从信息发布平台发展为各种互联网应用的平台（电子商务、电子政务、数字校园等）。$kp$, section = '' where id = 22851;
update t_knowledge_point set title = $kp$Web 技术的发展$kp$, content = $kp$静态网页（HTM/HTML）→ 动态网页（ASP/JSP/PHP/CGI/ASPX）；二层结构 → 三层结构。$kp$, section = '' where id = 22852;
update t_knowledge_point set title = $kp$WWW 概述$kp$, content = $kp$WWW（World Wide Web）有人译作万维网、环球网，或称 Web 网、3W 网，最初由欧洲核物理研究中心（CERN）提出，是因特网上最广泛使用的一种服务。

WWW 由 Web 服务器和安装了 WWW 浏览器的计算机组成。Web 服务器中存放大量以超文本形式表示、需要公开发布或可共享的信息；这些超文本信息互相链接，形成全球范围互相引用的信息网络；安装了浏览器的用户可以查询和获取分布在世界各地的 Web 服务器上的信息资源。$kp$, section = '' where id = 22853;
update t_knowledge_point set title = $kp$WWW 的 HTTP 协议与浏览器$kp$, content = $kp$Web 浏览器的重要特性：可以包含若干可选项，不仅能获取和浏览网页，还能完成其他传统的 Internet 服务，只要在 URL 中指出相应的服务类型即可。

服务类型指浏览器希望主机提供的服务，除 http（网页浏览）外，常用的还有：
ftp：执行 FTP 协议，使远程 FTP 服务器与用户的计算机进行远程文件传输操作；
mailto：执行 SMTP 协议，向远程计算机发送电子邮件；
telnet：执行 TELNET 协议，登录远程计算机；
news：执行 NNTP 协议，访问远程计算机提供的网络新闻服务。

每一种服务的 URL 格式并不完全相同。$kp$, section = '' where id = 22858;
update t_knowledge_point set title = $kp$Web 文档的类型：动态文档$kp$, content = $kp$动态 Web 文档需使用脚本语言（如 VBScript、JavaScript、Perl）以及 CGI、ASP、ActiveX 等编写程序，并使用 SQL 查询语言通过 ODBC、JDBC、ADO 等接口访问数据库。

浏览器访问动态文档需要的时间稍多，因为服务器需要额外的时间运行程序创建文档；服务器端一般需要功能更强的计算机和数据库系统作为支持。

动态文档的缺点：不能显示变化着的信息。与静态文档类似，动态文档在浏览器取得文档后内容不会再改变，因此文档会逐渐过时。$kp$, section = '' where id = 22862;
update t_knowledge_point set title = $kp$HTML 标记与网页描述$kp$, content = $kp$Web 服务器中向用户发布的文档通常称为网页（Web page），一个单位或者个人的主网页称为主页（homepage）。网页是采用 HTML 语言描述的超文本文件，文件后缀为 .html 或 .htm。

HTML（超文本标记语言）是 W3C 制定的一种标准的超文本描述语言，它使用形如 <xxx> 和 </xxx> 的一对标记，描述文本的标题、文本的分段及格式、表格类型、文本分区、背景颜色、文字的颜色与字体大小、页面边距、插图的位置与大小及图片名称，以及文本中定义的超链等。$kp$, section = '' where id = 22866;
update t_knowledge_point set title = $kp$超链与书签$kp$, content = $kp$如果超链的链宿就在文本内部的某个地方，那么该处必须标记有一个书签，然后用锚指向该书签。

例如：本书由南京大学出版社出版，该社为<A HREF="#list">教育部直属的大学出版社</A>之一。……<A NAME="list">教育部直属的大学出版社名单：</A>清华大学出版社、北京大学出版社、南京大学出版社……

浏览器接收到这段文档后，屏幕上的内容为：本书由南京大学出版社出版，该社为教育部直属的大学出版社之一，其中“教育部直属的大学出版社”是可点击的超链。$kp$, section = '' where id = 22868;
update t_knowledge_point set title = $kp$P2P 工作模式$kp$, content = $kp$P2P 是通过网络中计算机与计算机之间直接交换来相互共享计算机资源的一种应用模式。

以前 P2P 模式以局域网使用居多，近些年已在互联网上广泛使用，例如：
文件共享：BitTorrent（BT 下载）、eMule（电驴）、迅雷；
流媒体服务：Skype（网络 IP 电话）；
对等协同计算。

P2P 业务已占互联网业务流量的相当部分。$kp$, section = '' where id = 22895;
update t_knowledge_point set title = $kp$互联网金融$kp$, content = $kp$互联网金融是利用互联网技术进行金融业务运作，例如：
网上银行（网银）、手机银行；
第三方支付、移动支付：支付宝、快钱等；
P2P 模式的网络借贷；
众筹模式的网络投资平台（企业融资）；
手机理财 APP：余额宝等。

优点：成本低、效率高、覆盖广、发展快。
不足：管理弱、风险大。
技术保障：数字签名及其在网银中的应用。$kp$, section = '' where id = 22899;
update t_knowledge_point set title = $kp$WWW 的定义、功能与组成$kp$, content = $kp$WWW（World Wide Web）原先是 Internet 的一种信息服务，有人译作万维网、环球网，或称 Web 网、3W 网，由欧洲核物理研究中心（CERN）提出。WWW 是遍布全球的网站互相链接而成的信息网络（空间），用户可以方便地浏览、查找和下载其中的网页。

功能：最初的功能是信息服务——查找资料、交换文档、获取信息资源；扩展的功能是信息处理——电子商务、电子政务以及几乎各种网上应用。

组成：物理上由大量客户计算机和大量 Web 服务器组成。技术三要素是 HTML（超文本标记语言，用于描述网页）、URL（统一资源定位器，指出请求的服务和网页的地址）、HTTP（超文本传输协议，用于客户机与服务器之间通信），HTTPS 是安全的超文本传输协议。$kp$, section = '' where id = 22907;
update t_knowledge_point set title = $kp$文件传输 FTP$kp$, content = $kp$把网络上一台计算机中的文件移动或拷贝到另一台计算机上，称为远程文件传输，简称 FTP。

FTP 的作用：不同的操作系统（如 Windows 与 Unix/Linux）文件系统不同，文件命名规则和存取权限规定等均有区别；FTP 实际上是一种协议——文件传输协议，使用该协议进行文件传输就能解决不同计算机中文件系统不兼容的问题。

什么时候使用 FTP：用户要从自己的计算机向另一台计算机传输文件（使用浏览器无法上传文件）；两台计算机需要相互传输多个文件（使用浏览器只能一个一个文件下载）。$kp$, section = '' where id = 22909;
update t_knowledge_point set title = $kp$使用公开账号访问 FTP 服务器$kp$, content = $kp$许多 FTP 服务器需要预先注册并获得授权后才可以进行访问。互联网上还有许多 FTP 服务器包含大量可共享的文档、数据资源和软件（如共享软件和自由软件），它们允许使用公开账号进行访问：
公开账号：anonymous；
口令：用户的电子邮箱名。

寻找 FTP 网站的方法：通过 IE 浏览器，利用 FTP 搜索引擎在网上进行搜索；北大天网是有名的 FTP 搜索引擎之一。$kp$, section = '' where id = 22938;
update t_knowledge_point set title = $kp$浏览器窗口中的网页$kp$, content = $kp$在浏览器中打开网页时，窗口标题栏显示网页的标题，地址栏显示网页的地址（URL），页面中包括网页正文、网页中的图片和超链等，单击超链即可转到它所链接的网页。$kp$, section = '' where id = 22942;
update t_knowledge_point set title = $kp$动态 Web 的三层结构$kp$, content = $kp$第一层：客户端展现层，即 Web 浏览器。

第二层：Web 服务器层 + Web 应用服务器层。
Web 服务器：负责页面请求的受理、页面转发和页面下传；
Web 应用服务器：完成应用相关的各种处理，向第 3 层请求数据访问，生成用户所需的页面。

第三层：数据库系统，完成数据的存取和处理。$kp$, section = '' where id = 22971;
update t_knowledge_point set title = $kp$动态网页$kp$, content = $kp$网页内容是在网页请求时由服务器根据当时实际的数据内容临时生成的。

优点：适合于网页中包含动态数据的应用场合。

结构特点：动态数据一般都存放在 Web 服务器后台的数据库中，服务器端还必须访问数据库，并为客户机生成所需的网页；简单的两层 B/S 架构无法满足动态网页访问的要求。$kp$, section = '' where id = 22973;
update t_knowledge_point set title = $kp$因特网提供的服务$kp$, content = $kp$因特网由大量的计算机和信息资源组成，它为网络用户提供了非常丰富的功能（也称为服务）。

因特网提供的服务包括：电子邮件（E-mail）、文件传输（FTP）、远程登录、信息服务（WWW）、BBS 与专题讨论、在线交谈、游戏等。$kp$, section = '' where id = 22982;
update t_knowledge_point set title = $kp$在 WWW 上寻找信息$kp$, content = $kp$在 WWW 上寻找信息的途径：
网上冲浪（在网上漫游）；
从出版物中了解；
听他人介绍；
搜索（Search）：使用主题目录（subject directories）或搜索引擎（search engines）。$kp$, section = '' where id = 22989;
update t_knowledge_point set title = $kp$进行 FTP 的三种途径$kp$, content = $kp$使用 Windows 自带的 ftp.exe 程序：从开始菜单通过“附件”→“命令提示符”运行。

使用 IE 浏览器：在地址栏输入 ftp://[用户名:口令@]FTP 服务器域名。

安装并运行专门的 FTP 客户程序：例如 LeapFTP、CuteFTP、WSFTP 等，它们都是专门用来连接 FTP 服务器的应用程序，提供图形化的用户界面。$kp$, section = '' where id = 23058;
update t_knowledge_point set title = $kp$电子邮件$kp$, content = $kp$使用电子邮件的用户应安装一个电子邮件程序（例如 Outlook Express），该程序由两部分组成：
邮件的读写程序：负责撰写、编辑和阅读邮件；
邮件传送程序：负责发送邮件和从邮箱取出邮件。

发送邮件：邮件传送程序必须与远程的邮件服务器建立 TCP 连接，并按照 SMTP（简单邮件传输协议）传输邮件；若接收方邮箱在服务器上确实存在，才进行邮件的发送，以确保邮件不会丢失。

接收邮件：按照 POP3（Post Office Protocol v3）协议向邮件服务器提出请求，只要用户输入的身份信息（用户名和密码）正确，就可以访问自己的邮箱内容。

邮件服务器上运行的软件一方面执行 SMTP 协议，负责接收电子邮件并把它存入收件人的邮箱；另一方面执行 POP3 协议，鉴别邮件用户的身份，对收件人邮箱的存取进行控制。$kp$, section = '' where id = 23065;
update t_knowledge_point set title = $kp$电子邮箱的开通与地址$kp$, content = $kp$向某个电子邮件服务提供商申请开户，在开户的电子邮件服务器中获得一个属于自己的电子邮箱。

每个电子邮箱都有一个唯一的地址，地址由两部分组成，如 xyzwer@netra.nju.edu.cn：
邮箱名：用来确定邮件服务器中的邮箱；
邮箱所在邮件服务器的域名：用来确定接收/发送邮件的邮件服务器。

在客户计算机中安装并运行电子邮件客户端程序（如 Outlook Express、Foxmail 等），用户即可收、发、阅读或删除邮箱中的邮件。$kp$, section = '' where id = 23067;
update t_knowledge_point set title = $kp$电子邮件系统的工作过程$kp$, content = $kp$电子邮件系统按 C/S 模式工作。发送邮件一般采用 SMTP 协议，若收信人邮件地址不存在，则退回信件并通知发信人；接收邮件采用 POP3（或 IMAP4）协议，需验证用户身份之后才能读出邮件或下载。

发送方：发信人计算机上的邮件撰写程序写好邮件，由邮件发送程序通过 SMTP 协议把邮件送到发信人的邮件服务器，邮件进入发送队列后再通过 SMTP 协议传送到收信人的邮件服务器，存入收信人邮箱。

接收方：收信人计算机上的邮件阅读程序通过 POP3/IMAP4 协议，从收信人邮件服务器的邮箱中读取邮件。$kp$, section = '' where id = 23068;
update t_knowledge_point set title = $kp$URL 的组成与超级链接$kp$, content = $kp$URL 的表示形式为：http://主机域名[:端口号]/文件路径/文件名。

http：表示客户端和服务器执行 HTTP 传输协议，把远程 Web 服务器上的文件（网页）传输给用户的浏览器。
主机域名：提供此服务的计算机的域名。
端口号：通常使用默认值，如 Web 服务器使用 80，一般不需要给出。
/文件路径/文件名：网页在 Web 服务器中的位置和文件名；URL 中如果没有明确给出文件名，则以 index.html 或 default.html 为默认文件名。

超级链接：
超链的链源可以是文本中的任何一个字、词或句子，甚至可以是一幅图像；
超链的链宿可以是另一个 Web 服务器上的某个信息资源（用 URL 指出），也可以是文本内部标记有书签的某个地方；
HTML 文档中指出超链链源的机制称为锚（anchor）。如果超链的链宿就在文本内部的某个地方，该处必须标记一个书签，然后用锚指向该书签。$kp$, section = '' where id = 23078;
update t_knowledge_point set title = $kp$网站与网页$kp$, content = $kp$通过 Web 服务器发布的信息资源称为网页，服务器中相关网页组合在一起构成一个网站，网站由 Web 服务器管理。

网页可包含文本、图片、声音、动画等，多数网页是采用 HTML 语言描述的文档（HTML 文档），文件扩展名为 .html 或 .htm。网页是一种超文本文档，支持超链（hyperlink），网页通过超链相互链接，形成网状的信息空间。

网站中的起始网页称为主页（homepage），用户通过访问主页就可直接或间接地访问网站中的其他网页。每个网页都有一个唯一的地址——统一资源定位器 URL（Uniform Resource Locator）。$kp$, section = '' where id = 23088;
update t_knowledge_point set title = $kp$网页和 HTML 文档$kp$, content = $kp$存放在 Web 服务器中、可以被下载到客户浏览器上进行阅读的文档，可以统称为“网页”。

网页可以是各种类型的文档，如 HTML 文档、DOC 文档、PPT 文档、PDF 文档等，但主要是 HTML 文档。

HTML 文档是使用超文本置标语言（Hyper Text Markup Language，HTML）表示的超文本（超媒体）文件，文件后缀为 .html 或 .htm。

网页可使用专门的软件如 FrontPage、Dreamweaver 进行制作，也可以使用 Word、Excel、PowerPoint 等软件制作，或者由 .doc、.ppt 文档转换而成。$kp$, section = '' where id = 23099;
update t_knowledge_point set title = $kp$网页的地址 URL$kp$, content = $kp$统一资源定位器 URL（Uniform Resource Locator）用来标识 WWW 中每个信息资源（网页）的地址。

URL 由 3 部分组成，表示形式为：协议名称://主机域名或 IP 地址[:端口号]/文件路径/文件名。

例：某课程网站主页的 URL 为 http://graphics.nju.edu.cn/coursebin/index.php。
http 表示向 Web 服务器请求把某个网页传输给用户的浏览器；
主机域名指提供此服务的计算机的域名，端口号通常是默认的（如 Web 服务器为 80），一般不需给出；
/文件路径/文件名指网页在 Web 服务器硬盘中的路径和文件名，缺省时以 index.html 或 default.html 作为默认文件名。

http 即超文本传输协议（Hyper Text Transport Protocol）。$kp$, section = '' where id = 23100;
update t_knowledge_point set title = $kp$访问动态网页的工作过程$kp$, content = $kp$以访问淘宝网（http://www.taobao.com/）为例：
① 浏览器（客户机）请求网页；
② 请求经 LAN 或 WAN 发送到 Web 服务器；
③ Web 服务器把动态页面请求转发给 Web 应用服务器；
④ Web 应用服务器连接数据库驱动程序（ODBC）；
⑤ 执行查询操作；
⑥ 数据库把查询结果返回给数据库驱动程序；
⑦ 驱动程序把结果返回给 Web 应用服务器；
⑧ Web 应用服务器生成动态数据并插入页面，返回给 Web 服务器；
⑨ Web 服务器返回页面；
⑩ 浏览器接收网页，解释并显示网页内容。$kp$, section = '' where id = 23113;
update t_knowledge_point set title = $kp$远程文件传输的过程$kp$, content = $kp$FTP 协议规定了一组命令，用户使用这些命令可以指定远程的计算机，并请求文件传输。

客户方启动运行 FTP 程序后，用户首先使用 open 命令（并给出一个远程计算机的域名）与远程的 FTP 服务器建立一个 TCP 连接（称为控制连接）。

接着，FTP 服务器要求用户提供登录名和口令，登录名对应于 FTP 服务器上的一个合法的帐户，经服务器验证后，用户才能获得授权，然后就可以进行文件传输。

只要需要，控制连接将一直保持到用户使用 close 命令结束访问 FTP 服务器为止。$kp$, section = '' where id = 23126;
update t_knowledge_point set title = $kp$远程登录$kp$, content = $kp$远程登录的作用：使用其他计算机强大的处理能力；登录到别的主机中运行该机器所安装的软件。

远程登录使用的协议是 Telnet。

用户使用因特网的远程登录服务时，启动两个程序进行工作：Telnet 客户程序和 Telnet 服务器程序。$kp$, section = '' where id = 23131;
update t_knowledge_point set title = $kp$BT 下载的工作原理$kp$, content = $kp$BT（BitTorrent）下载采用 P2P 模式：文件被分成若干数据块，下载者在从其他用户处获取数据块的同时，也把自己已下载的数据块提供给其他用户，因此参与下载的用户越多，下载速度越快。$kp$, section = '' where id = 23367;
update t_knowledge_point set title = $kp$按主题目录寻找信息$kp$, content = $kp$主题目录把网页（网站）按主题分类排列，用户通过一层一层地点击超链来查找有关信息。

例如门户网站的目录先给出一级分类（娱乐休闲、生活服务、电脑网络、文化教育、实用查询等），每个一级分类下再分二级分类（如娱乐休闲下的音乐、游戏、小说、电影等），逐级点击即可进入相应主题的网页。$kp$, section = '' where id = 23414;
update t_knowledge_point set title = $kp$网页下载和处理的过程$kp$, content = $kp$网页下载的过程：先下载和显示网页的文字部分，再下载网页中的图片和声音部分，以及其他的脚本程序（script）等；下载的网页各部分均存放在浏览器的缓冲存储器之中，以便再次访问该网页时使用。

网页中的声音和视频部分可以有 2 种下载方式：普通方式（等待全部下载完毕之后再进行播放）、流媒体方式（Streaming media，边下载边播放）。

网页中包含的某些非 HTML 成分，浏览器本身无法直接播放，必须调用本机已安装的 Word、Acrobat、PowerPoint 等程序进行展示，或者下载特定的 plug-in（插入式应用程序，如 Shockwave、Real Audio 等）进行展示或播放。$kp$, section = '' where id = 23455;
update t_knowledge_point set title = $kp$邮件内容可包含多媒体信息$kp$, content = $kp$电子邮件正文内容采用 MIME 协议，因而邮件中可以包含中西文字、图片、声音等多媒体信息。$kp$, section = '' where id = 23463;
update t_knowledge_point set title = $kp$电子邮件的组成与 MIME 协议$kp$, content = $kp$邮件的头部（header）：包括发送方地址、接收方地址（允许多个）、抄送方地址（允许多个）、主题等。
邮件的正文（body）：信件的内容。
邮件的附件：可以包含一组文件，文件类型可以任意。

MIME（Multi-purpose Internet Mail Extension）：为了让用户能使用任意的编码书写邮件正文，现在的邮件系统都使用 MIME 规程，它在邮件头部和正文中都增加一些说明信息，说明邮件正文使用的数据类型和编码，邮件接收方根据这些说明来解释正文的内容。MIME 还允许发送方将正文的信息分成几个部分，每个部分可以指定不同的编码方法，这样用户就可以在同一封信的正文中既发送普通文本又附加图像。$kp$, section = '' where id = 23625;
update t_knowledge_point set title = $kp$北斗卫星导航定位系统$kp$, content = $kp$全球四大卫星定位系统：美国的 GPS、俄罗斯的格洛纳斯、欧洲的伽利略、中国的北斗系统（BDS）。

北斗卫星导航系统已发射 23 颗卫星（2016.6），已向亚太大部分地区提供高精度、高可靠的定位、导航、授时服务，并具有与导航相结合的短信功能。

第 3 代北斗卫星导航系统（北斗三号）计划在 2020 年建成，形成全球覆盖能力。

两种服务方式：
开放服务：免费提供定位、测速、授时服务，定位精度 10 米，测速精度 0.2 米/秒，授时精度 50 ns；
授权服务：向授权用户提供更安全与更高精度的定位、测速、授时、通信服务以及系统完好性信息。$kp$, section = '' where id = 23943;
update t_knowledge_point set title = $kp$静态网页$kp$, content = $kp$内容固定不变，任何时候访问该网页所得到的内容都一样。

优点：简单、响应速度快。
不足：不适合于网页中包含动态数据（如外汇行情、股票价格、天气情况等）的应用场合。$kp$, section = '' where id = 24983;
update t_knowledge_point set title = $kp$网页中的超链$kp$, content = $kp$超链提供了将网页相互链接起来、并从一个网页方便地访问其他网页的手段。

超链是一种有向链，包括链源（引用处）和链宿（被引用对象）：
链源（也称为锚或锚点）可以是网页中的文字或图片；
链宿可以是同一个或另一个网站中的网页（用 URL 指出），也可以是本网页内的某段文字或某个图片（用书签指出）。

当鼠标指针指向网页中的链源时，指针会由箭头改变为手指状，单击左键，浏览器将立即转去访问该超链所链接的网页。$kp$, section = '' where id = 25031;
update t_knowledge_point set title = $kp$识别超链链源的方法$kp$, content = $kp$网页上的超链链源通常可以从外观上识别：文字具有不同的颜色并带有下划线；当鼠标指针指向链源时，指针由箭头变为手指状。$kp$, section = '' where id = 25165;
update t_knowledge_point set title = $kp$远程登录 Telnet$kp$, content = $kp$远程登录（Telnet）：用户把自己的机器暂时作为一台终端，通过因特网挂接到远程的大型或巨型机上，然后作为它的用户使用大型或巨型机的硬件和软件资源，因特网提供的这种服务称为远程登录。需要登录的计算机用户应该预先申请合法的帐户。

利用 Windows 的 Telnet 客户程序进行远程登录，一般是在 DOS 模式下进行的。$kp$, section = '' where id = 25170;
update t_knowledge_point set title = $kp$远程登录服务$kp$, content = $kp$远程登录（Telnet）：用户把自己的机器暂时作为一台终端，通过因特网挂接到远程的大型或巨型机上，然后作为它的用户使用大型或巨型机的硬件和软件资源，因特网提供的这种服务称为远程登录。需要登录的计算机用户应该预先申请合法的帐户。$kp$, section = '' where id = 25175;
update t_knowledge_point set title = $kp$HTML5 新元素与控件$kp$, content = $kp$HTML5 的新特性包括语义标签、增强型表单、视频和音频、Canvas 绘图、SVG 画图、地理定位、拖放 API、Web Worker、Web Storage、WebSocket 等。

（1）canvas 元素：使用 JavaScript 在网页中绘制图形。
（2）video（视频）和 audio（音频）元素：用于媒介回放。
（3）本地离线存储：sessionStorage、localStorage、cookie 都是在浏览器端存储的数据。sessionStorage 引入了“浏览器窗口”的概念，在同源的同窗口（或 tab）中始终存在，只要该浏览器窗口没有关闭，即使刷新页面或进入同源的另一页面，数据仍然存在，关闭窗口后数据失效；localStorage 则可长期保存。
（4）新的语义内容标签：article（独立内容）、footer（底部区域）、header（头部区域）、nav（导航）、section（章节）等。
（5）新的表单控件：date（日期）、time（时间）、email（邮件）、url（网址）、search（搜索）、color（颜色）、range（范围或滑动条）、progress（进度条）、meter（计量条）、tel（电话）等。$kp$, section = '' where id = 25637;
update t_knowledge_point set title = $kp$网络爬虫的分类$kp$, content = $kp$按照使用场景，网络爬虫可以分为两类：
通用爬虫：搜索引擎爬虫（如百度）；
聚焦爬虫：获取想要的数据。

按照系统结构和实现技术，网络爬虫大致可分为 4 类：
通用网络爬虫：又称全网网络爬虫，采集时由部分种子 URL 扩展到整个网络的全部页面，主要应用于搜索引擎数据的采集。这类爬虫采集范围比较广、采集量巨大，对采集速度和存储空间有较高要求，通常需要深度遍历网站的资源。例如 Apache 的子项目 Nutch 就是一个高效的通用网络爬虫框架，使用分布式的方式采集数据。
聚焦网络爬虫：又称主题网络爬虫，选择性地采集那些与预先定义好的主题相关的页面。相比通用网络爬虫，聚焦网络爬虫采集的资源少，主要用于满足特定人群对特定领域信息的需求，需要设计过滤策略，过滤与所定主题无关的页面。
增量网络爬虫：对已下载网页采取增量式更新，只采集新产生的或者已经发生变化的网页，避免重复采集数据，可以减少时间和空间上的耗费。针对小规模特定网站的数据采集，可构建一个基于时间戳判断是否更新的数据库，通过判断时间戳的先后决定是否继续采集，同时更新数据库中的时间戳信息。
深度网络爬虫：即 Deep Web 爬虫，针对大部分内容不能通过静态链接获取、只有用户提交表单信息才能获取的 Web 页面。

爬虫软件可以分为两类：云爬虫（不需要安装软件）、采集器（需要下载安装）。

常用工具：神箭手云爬虫、八爪鱼、集搜客 GooSeeker、WebMagic、DenseSpider。$kp$, section = '' where id = 25686;
update t_knowledge_point set title = $kp$常用国内镜像站点$kp$, content = $kp$清华大学镜像站：https://mirror.tuna.tsinghua.edu.cn/
阿里云镜像站：https://developer.aliyun.com/mirror/
网易云镜像站：http://mirrors.163.com/
华中科技大学镜像站：http://mirror.hust.edu.cn/
北京交通大学镜像站：https://mirror.bjtu.edu.cn/
中国科学技术大学镜像站：https://mirrors.ustc.edu.cn/
搜狐镜像站：http://mirrors.sohu.com/$kp$, section = '' where id = 25855;
update t_knowledge_point set title = $kp$Web 浏览器与 HTTP 协议$kp$, content = $kp$HTTP 协议即超文本传输协议，主要用于在浏览器和服务器之间传输 HTML 文档。
HTTPS 协议是安全的 HTTP 协议。
浏览器无法浏览网页中的某些成分时，可以通过安装插件来扩展浏览器的功能。$kp$, section = '' where id = 25967;
update t_knowledge_point set title = $kp$Web 服务的描述要素$kp$, content = $kp$Web 服务的相关要素：
Binding：特定端口类型的具体协议和数据格式规范。
Port：定义为绑定和网络地址组合的单个端点。
Service：相关端口的集合，包括其关联的接口、操作、消息等。

描述一个 Web 服务时，需要说明它执行的操作、使用的消息、使用的数据类型和使用的通信协议。$kp$, section = '' where id = 26099;
update t_knowledge_point set title = $kp$电子商务机会的均等性$kp$, content = $kp$网络商务的应用对大、中、小企业既是机遇又是挑战，带来的机会是均等的。互联网代表了一个开放性的大市场，它使得那些小型企业无需庞大的商业体系、无需昂贵的广告费用、无需众多的营销人员，而只需要通过互联网上的网页，就可以使一个企业打开市场，而且是国际市场。在这个市场上，可以接触到世界范围内的广大客户，使中小型企业可以从原来主要由大企业占有或几乎垄断的市场中获得更多的利润。

电子商务的均等性对于中小型企业来说尤其有利。在互联网上，任何一家新成立的公司都可能与 IBM 这样的大公司有同样多的机会，因为在交易过程中用户比较的不是企业规模和办公环境，而是企业产品的价格与性能以及企业的服务质量。$kp$, section = '' where id = 26276;
update t_knowledge_point set title = $kp$电子商务模式$kp$, content = $kp$电子商务模式通常包含商务的体系结构、价值创造、商业策略等方面，是企业运作电子商务创造价值的具体表现形式。其中，商务体系结构反映商务的固有特性，显示出商务运作的基本框架；价值创造是商务模式的本质和核心，不同的商务模式创造和体现的价值不同；商业策略反映电子商务的外延特征。

电子商务可以从交易对象（商品）、交易主体（买卖方）、交易环境（市场）、交易过程（竞争）、交易方式（线上线下）、价值实现模式以及运营平台与渠道等多个角度构建不同的分类框架。基于交易主体和交易方式，主要分为 B2B、B2C、C2C 等模式。

① B2B（Business to Business）：企业与企业之间的电子商务。B2B 是电子商务应用最多和最受企业重视的形式，企业可以使用 Internet 或其他网络对每笔交易寻找最佳合作伙伴，完成从订购到结算的全部交易行为，其代表是阿里巴巴。B2B 电子商务以企业为主体，在企业之间进行，是电子商务的主流，可为企业带来更低的价格、更高的生产率、更低的劳动成本以及更多的商业机会；它针对企业内部以及企业与上下游厂商之间的资讯整合，在互联网上进行企业与企业间的交易，可简化企业内部资讯流通的成本，使交易流程更快速，减少成本耗损。

② B2C（Business to Customer）：企业与消费者之间的电子商务。这是消费者利用因特网直接参与经济活动的形式，类同于商业电子化的零售商务。B2C 就是企业通过网络销售产品或服务给个人消费者，如网络购物、证券公司网络下单作业、一般网站的资料查询作业等。B2C 通常有四种经营模式：虚拟社群、交易聚合、广告网络、线上与线下结合的模式（O2O）。

③ C2C（Consumer to Consumer）：消费者与消费者之间的电子商务。C2C 商务平台通过为买卖双方提供一个在线交易平台，使卖方可以主动提供商品上网拍卖，而买方可以自行选择商品进行竞价，其代表是 eBay、淘宝。C2C 是消费者之间的互动交易行为，例如在竞标网站或拍卖网站中共同在线上出价而由价高者得标，或由消费者自行在网络新闻论坛或 BBS 上张贴布告出售二手货品甚至新品、古董、名人物品等。

此外，B2G、O2O 等新兴的电子商务模式也不断涌现，并得到了很好的应用。$kp$, section = '' where id = 26277;
update t_knowledge_point set title = $kp$G2C 电子政务$kp$, content = $kp$G2C（government-to-customer）指政府与公众之间的电子政务，是政府通过电子网络系统为公民提供各种服务，如办事程序、证件管理、公共部门服务等。

政府与公众之间的电子政务主要包括：教育培训服务、公众福利服务、电子就业服务、公众电子税务、心理健康咨询、电子医疗服务、电子证件服务等。$kp$, section = '' where id = 26281;
update t_knowledge_point set title = $kp$远程教育$kp$, content = $kp$远程教育在教育部已出台的一些文件中又称现代远程教育、网络教育，是成人教育学历中的一种。它指使用电视及互联网等传播媒体的教学模式，突破了时空的界线，有别于传统的在校住宿的教学模式。使用这种教学模式的学生通常是业余进修者，由于不需要到特定地点上课，可以随时随地上课，也可以透过电视广播、互联网、辅导专线、面授（函授）等多种不同管道互助学习。它是现代信息技术应用于教育后产生的新概念，即运用网络技术与环境开展的教育，招生对象不受年龄和先前学历限制。

在我国，网络教育应用已经成为信息技术在教育应用上发展的重要方面之一，《面向 21 世纪教育振兴行动计划》中所提出的实施“现代远程教育工程”正是当今世界在网络教育应用方面发展的主流和趋势。网络教育应用领域的发展趋势和热点主要有远距离教学、网上学校、校园网、计算机支持的合作学习（CSCL）等。

从严格意义上讲，网络远距离教学是指通过互联网或局域网实现全球范围或区域范围的课程传送和教学，其显著特点是必须具有双向性、实时性和交互性，传统的远程教学方式（如电视和广播等）不具备这些特点。

网上学校与网络远距离教学是完全不同的两个概念。真正的网上学校应该将一所学校所具有的全部功能都搬上网络，而不是仅有几门网上课程和部分远程教学资源。作为一所真正的网上学校，学生除了可以在网上直接了解该校的全部信息（包括学校的历史、办学宗旨和特色、师资情况、课程设置）之外，更主要的是能在网上实现学习的全过程，包括入学报名和注册、付费、学习和实践、查阅资料、考试、获得学分和学位等。

校园网是一种基于局域网技术构建起来的网络系统，它将分布在一所学校内的所有计算机和相关设备连至校内的网络中心，实现共享学校的各类教学资源、进行学校的有效管理。校园网与网上学校在概念上完全不同：校园网主要功能的应用重点是在校内，而网上学校的功能则主要是面向校外。

计算机支持的合作学习（CSCL）是指基于网络来进行群体或小组形式的学习，强调通过网络来支持学生之间的交互活动，学生可以突破地域和时间上的限制，进行同伴互教、讨论交流、课外兴趣活动等合作性学习，这不仅能有效提高网络的使用效率、提升学生的学习效果，而且有助于培养学生的合作精神。$kp$, section = '' where id = 26286;
update t_knowledge_point set title = $kp$终端和网络的局限性$kp$, content = $kp$移动互联网业务在便携的同时，也受到了来自终端能力和网络能力的限制。在终端方面，受到终端大小、处理能力、存储能力、电池容量等的限制；在网络方面，受到无线网络覆盖情况、传输环境、技术、无线流量计费等因素的限制。$kp$, section = '' where id = 26425;
update t_knowledge_point set title = $kp$业务与终端、网络的强关联性$kp$, content = $kp$由于移动互联网业务受到自身网络及终端能力的限制，因此其业务内容和形式也需要适合特定的网络技术规格和终端类型。$kp$, section = '' where id = 26426;
update t_knowledge_point set title = $kp$云计算中的“云”$kp$, content = $kp$“云”描述的是商业模式的改变：客户（个人或企业）从购买产品向购买服务转变，即客户看不到也不需要购买实体的服务器、存储、软件等，也不需要关心服务来自哪里，而是通过网络直接使用自己需要的服务和应用，这种模式被形象地称为“云”。

“云”是一些可以自我维护和管理的虚拟计算资源，通常为一些大型服务器集群，包括计算服务器、存储服务器、宽带资源等。云计算将所有的计算资源集中起来，并由软件实现自动管理，无须人为参与，这使得应用提供者无须为烦琐的细节而烦恼，能够专注于自己的业务，有利于创新和降低成本。$kp$, section = '' where id = 26469;
update t_knowledge_point set title = $kp$AWS 亚马逊云服务$kp$, content = $kp$亚马逊网络服务（Amazon Web Services，AWS）云于 2006 年推出，现在 AWS 的基础设施功能已经相当丰富，能满足构建超大互联网应用的大多数需求，还可提供开发工具、文档、社区和支持。

Amazon 的云计算产品总称为 Amazon Web Service（亚马逊网络服务），主要由四部分组成：S3（Simple Storage Service，简单的存储服务）、EC2（Elastic Compute Cloud，可伸缩计算云）、SQS（Simple Queuing Service，简单信息队列服务）以及 SimpleDB。$kp$, section = '' where id = 26501;
update t_knowledge_point set title = $kp$应用架构类服务$kp$, content = $kp$CloudFront：CDN 服务，支持静态文件和流媒体，全球共有 20 个节点。
SNS：基于 topic 的消息订阅与推送服务，支持 HTTP/E-mail。
SES：发邮件服务。
Elastic Load Balancing：将请求负载均衡到 EC2 实例。
VPC：虚拟私有云，网络、子网、IP、路由表等可配置。
Route 53：DNS 服务。$kp$, section = '' where id = 26505;
update t_knowledge_point set title = $kp$对象存储服务$kp$, content = $kp$华为对象存储服务（Object Storage Services）是一个基于对象的云存储服务，为客户提供海量、安全、高可靠、低成本的数据存储能力。客户可以通过 REST 接口或者基于 Web 浏览器的云管理平台界面对数据进行管理和使用，同时提供多种语言（Java、PHP、C、Python）的 SDK 来简化编程。

华为对象存储服务可以为多种应用构建大规模的数据存储服务，如互联网海量内容（视频、图片、照片、图书、音像、杂志等）、网盘、数字媒体、备份、归档、大数据等。$kp$, section = '' where id = 26515;
update t_knowledge_point set title = $kp$互联网提供的服务$kp$, content = $kp$Internet 上提供了以下服务：
WWW 信息浏览服务；
电子邮件 E-mail 服务；
远程登录 Telnet 服务；
文件传输 FTP 服务。$kp$, section = '' where id = 26769;
update t_knowledge_point set title = $kp$电子商务$kp$, content = $kp$电子商务（Electronic Commerce）是指利用计算机技术、网络技术和远程通信技术，实现整个商务（买卖）过程中的电子化、数字化和网络化。$kp$, section = '' where id = 26825;
update t_knowledge_point set title = $kp$应用层协议$kp$, content = $kp$应用层协议包括 SMTP、POP3、HTTP、FTP 等。$kp$, section = '' where id = 27374;
update t_knowledge_point set title = $kp$超文本$kp$, content = $kp$超文本可以对文本进行跳转、导航、返回的操作，实现文本更为方便的访问，采用网状结构组织信息。WWW 网页就是典型的超文本结构。$kp$, section = '' where id = 27397;
update t_knowledge_point set title = $kp$电子邮件地址格式$kp$, content = $kp$E-mail 地址格式：邮箱名@邮箱所在的邮件服务器域名。例如 abc@sina.com 表示邮箱的名字是 abc，邮箱所在邮件服务器的域名是 sina.com。$kp$, section = '' where id = 27446;
update t_knowledge_point set title = $kp$电子邮件的工作模式$kp$, content = $kp$电子邮件的工作模式：C/S 模式。$kp$, section = '' where id = 27447;
update t_knowledge_point set title = $kp$电子邮件客户端$kp$, content = $kp$E-mail 客户端：Outlook、Foxmail 等。客户端由两部分组成：邮件的读写和管理程序（用于书写、编辑、阅读邮件）、邮件的收发程序（用于发送、接收邮件）。$kp$, section = '' where id = 27448;
update t_knowledge_point set title = $kp$电子邮件系统采用的协议$kp$, content = $kp$电子邮件系统采用的协议：发送采用 SMTP 协议；接收采用 POP3、IMAP4 协议。$kp$, section = '' where id = 27449;
update t_knowledge_point set title = $kp$Webmail$kp$, content = $kp$Webmail：使用网页浏览器收发电子邮件。$kp$, section = '' where id = 27450;
update t_knowledge_point set title = $kp$文件传输服务$kp$, content = $kp$文件传输服务：把网络上计算机中的文件移动或者拷贝到另外一台计算机上。$kp$, section = '' where id = 27451;
update t_knowledge_point set title = $kp$文件传输与 FTP 协议$kp$, content = $kp$文件传输服务把网络上一台计算机中的文件传送到另一台计算机上，使用的协议是文件传输协议 FTP。$kp$, section = '' where id = 27452;
update t_knowledge_point set title = $kp$FTP 服务的工作模式$kp$, content = $kp$FTP 服务采用客户/服务器（C/S）模式。$kp$, section = '' where id = 27453;
update t_knowledge_point set title = $kp$FTP 的工作模式$kp$, content = $kp$FTP 采用客户/服务器模式，一次可以传输一个或多个文件（文件夹）。$kp$, section = '' where id = 27454;
update t_knowledge_point set title = $kp$FTP 的传输能力$kp$, content = $kp$FTP 一次可以传输一个或多个文件。$kp$, section = '' where id = 27455;
update t_knowledge_point set title = $kp$FTP 的文件操作$kp$, content = $kp$FTP 允许用户上传、下载，允许用户对 FTP 服务器中的文件进行各种操作：文件列表、文件更名、建立文件、删除文件。这些操作都受到文件访问权限的限制。$kp$, section = '' where id = 27456;
update t_knowledge_point set title = $kp$IE 浏览器支持 FTP$kp$, content = $kp$IE 浏览器支持 FTP 服务。$kp$, section = '' where id = 27457;
update t_knowledge_point set title = $kp$常用 FTP 客户程序$kp$, content = $kp$常用的 FTP 客户程序是图形界面的，如 LeapFTP、CuteFTP、WSFTP 等。$kp$, section = '' where id = 27458;
update t_knowledge_point set title = $kp$匿名 FTP 服务器$kp$, content = $kp$匿名 FTP 服务器的登录名为 anonymous，密码为用户的电子邮箱地址。$kp$, section = '' where id = 27459;
update t_knowledge_point set title = $kp$Telnet 的工作模式$kp$, content = $kp$Telnet 的工作模式：客户机/服务器（C/S）模式。$kp$, section = '' where id = 27460;
update t_knowledge_point set title = $kp$远程登录与 WWW 的组成$kp$, content = $kp$远程登录协议是 Telnet。

WWW = Web 服务器 + Web 客户机（安装了 Web 浏览器）。$kp$, section = '' where id = 27461;
update t_knowledge_point set title = $kp$网页$kp$, content = $kp$网页是 Web 服务器向用户发布的文档。$kp$, section = '' where id = 27462;
update t_knowledge_point set title = $kp$网页与 HTML$kp$, content = $kp$多数网页是用 HTML（超文本标记语言）描述的超文本。$kp$, section = '' where id = 27463;
update t_knowledge_point set title = $kp$URL 中的默认文件名$kp$, content = $kp$URL 中如果未明确指出文件路径和文件名，则以 index.html 或 default.html 为默认文件名，即网站的主页。注意 URL 的表示中，协议名称后应跟“://”。$kp$, section = '' where id = 27464;
update t_knowledge_point set title = $kp$HTTP 协议（超文本传输协议）$kp$, content = $kp$HTTP 协议即超文本传输协议，主要用于在浏览器和服务器之间传输 HTML 文档。$kp$, section = '' where id = 27465;
update t_knowledge_point set title = $kp$B/S 模式与动态网页$kp$, content = $kp$访问动态生成的网页使用 B/S 模式。B/S 指的是：客户层—Web 服务器层—数据库服务器层。$kp$, section = '' where id = 27467;
update t_knowledge_point set title = $kp$默认网页文件名$kp$, content = $kp$统一资源定位器 URL 标识 Web 中每个网页，网页的默认文件名是 index.htm 或 default.htm。$kp$, section = '' where id = 27492;
update t_knowledge_point set title = $kp$HTML 与 URL 中的协议名$kp$, content = $kp$HTML 是超文本标记语言。URL 中的协议名除了 HTTP 协议外，还可以使用 FTP、Telnet 等。$kp$, section = '' where id = 27493;
update t_knowledge_point set title = $kp$HTML 文档的组成$kp$, content = $kp$HTML 是超文本标记语言，URL 中的协议名除了 HTTP，还可以使用 FTP、Telnet 等。

HTML 文档由两部分组成：头部（包含该文档的标题和其他说明信息）和正文（包含该信息资源的具体内容，如文字与图片）。$kp$, section = '' where id = 27494;
update t_knowledge_point set title = $kp$主页$kp$, content = $kp$起始页面称为主页或首页，是网站的默认文档。$kp$, section = '' where id = 27950;
update t_knowledge_point set title = $kp$静态网页的特点$kp$, content = $kp$静态网页的内容不会变化，简单可靠，但缺乏灵活性。访问静态网页使用 C/S 模式。$kp$, section = '' where id = 27951;
update t_knowledge_point set title = $kp$HTML 与静态网页$kp$, content = $kp$HTML 即超文本标记语言，用于描述静态网页，其文件扩展名为 .html 或 .htm。$kp$, section = '' where id = 28318;
update t_knowledge_point set title = $kp$HTML 文档结构与 WWW 三要素$kp$, content = $kp$HTML 文档由两部分组成：头部和正文。

WWW 的三要素是 HTML、URL、HTTP。$kp$, section = '' where id = 28319;
update t_knowledge_point set title = $kp$常见的应用层协议$kp$, content = $kp$应用层协议包括 SMTP、HTTP、FTP 等。$kp$, section = '' where id = 28325;
update t_knowledge_point set title = $kp$IaaS 基础设施即服务$kp$, content = $kp$IaaS 是指将计算、存储、网络以及搭建应用环境所需的一些基础环境当作服务提供给用户，使得用户能够按需获取 IT 基础设施。$kp$, section = '' where id = 28431;
update t_knowledge_point set title = $kp$网络爬虫$kp$, content = $kp$网络爬虫从互联网上采集数据。$kp$, section = '' where id = 28433;
update t_knowledge_point set title = $kp$网络爬虫工具的分类$kp$, content = $kp$网络爬虫工具基本可以分为 3 类。$kp$, section = '' where id = 28435;
update t_knowledge_point set title = $kp$Java 网络爬虫工具$kp$, content = $kp$Java 网络爬虫工具，如 Crawler4j、WebMagic、WebCollector。$kp$, section = '' where id = 28437;
update t_knowledge_point set title = $kp$典型 C/S 模式的服务$kp$, content = $kp$任何计算机都可以做服务器，一般会选择性能高的计算机做服务器。

WWW、FTP、电子邮件、Telnet 都是典型的 C/S 模式。$kp$, section = '' where id = 28521;
update t_knowledge_point set title = $kp$声音的带宽$kp$, content = $kp$声音的带宽表示信号的频率范围，也可以说成是频率差。$kp$, section = '' where id = 28523;
update t_knowledge_point set title = $kp$应用层协议（含 Telnet）$kp$, content = $kp$应用层协议包括 SMTP、HTTP、FTP、Telnet 等。$kp$, section = '' where id = 28537;
update t_knowledge_point set title = $kp$邮件收发协议$kp$, content = $kp$发邮件使用 SMTP 协议，收邮件使用 POP3 协议。$kp$, section = '' where id = 28540;
update t_knowledge_point set title = $kp$数字地球与远程教育$kp$, content = $kp$数字地球：在全球范围内建立一个以空间位置为主线、将信息组织起来的复杂系统。

远程教育：利用计算机及计算机网络进行教学，使得学生和教师可以异地完成教学活动的教学模式。$kp$, section = '' where id = 29160;
update t_knowledge_point set title = $kp$Web 2.0$kp$, content = $kp$Web 2.0：以分享为特征的实时网络，用户在互联网上拥有自己的数据，并能在不同的网站上使用。$kp$, section = '' where id = 29188;
update t_knowledge_point set title = $kp$远程登录的特点$kp$, content = $kp$远程登录 Telnet：
协议：Telnet；
功能：利用因特网上高性能的计算机运行大型复杂程序等；
能通过 IE 浏览器启动；
采用客户/服务器模式；
需要使用用户名和口令。$kp$, section = '' where id = 29220;
update t_knowledge_point set title = $kp$超文本的组织方式$kp$, content = $kp$超文本采用网状结构组织信息，可以通过导航、跳转、回溯等操作，实现对文本内容更为方便的访问。典型代表是 Windows 中的“帮助”文件（*.hlp 文件）。$kp$, section = '' where id = 29229;
update t_knowledge_point set title = $kp$电子商务的分类$kp$, content = $kp$按交易的双方分：企业内部、企业与客户之间（B-C，如网上购物）、企业之间（B-B）、企业与政府之间（B-G）。
按交易商品性质分：有形商品、无形商品和服务。
按使用网络类型分：基于电子数据交换 EDI 的电子商务、基于 Internet 的电子商务、基于 Intranet/Extranet（企业内部网/企业外部网）的电子商务。

企业内部网：单位或企业内部采用 TCP/IP 技术，集 LAN、WAN 和数据服务为一体的一种网络。$kp$, section = '' where id = 29230;
update t_knowledge_point set title = $kp$电子政务的定义$kp$, content = $kp$电子政务：政府机构运用现代网络通讯与计算机技术，将政府管理和服务职能通过精简、优化、整合、重组后在互联网络上实现的一种方式。$kp$, section = '' where id = 29231;
update t_knowledge_point set title = $kp$数字地球、远程教育与远程医疗$kp$, content = $kp$数字地球：在全球范围内建立一个以空间位置为主线、将信息组织起来的复杂系统。
远程教育：利用计算机及计算机网络进行教学，使得学生和教师可以异地完成教学活动的教学模式。
其他应用还包括远程医疗、数字图书馆。$kp$, section = '' where id = 29232;
update t_knowledge_point set title = $kp$电子邮件的客户端$kp$, content = $kp$发送和接收电子邮件需要安装客户端程序（早期使用 Outlook、Foxmail，现在使用浏览器）。$kp$, section = '' where id = 29235;
update t_knowledge_point set title = $kp$电子邮件的工作过程与协议$kp$, content = $kp$电子邮件的工作过程：采用 C/S 工作模式；发送端采用 SMTP 协议；接收端采用 POP3 或 IMAP4 协议。$kp$, section = '' where id = 29236;
update t_knowledge_point set title = $kp$FTP 的工作过程$kp$, content = $kp$FTP 的工作过程：采用 C/S 模式；早期需安装客户端程序，现在可直接在浏览器中实现。

访问方法：在浏览器地址栏输入 ftp://[用户名:密码@]IP 地址或域名/路径/文件名。$kp$, section = '' where id = 29237;
update t_knowledge_point set title = $kp$WWW 的组成$kp$, content = $kp$物理组成：大量客户机 + 大量的服务器。

逻辑组成：
URL（统一资源定位器）：指向资源所在的位置；
HTML（超文本标记语言）：用来描述网页；
HTTP（超文本传输协议）：用于用户与服务器之间通信；
HTTPS：安全的超文本传输协议。$kp$, section = '' where id = 29238;
update t_knowledge_point set title = $kp$WWW 的组成与网页结构$kp$, content = $kp$网站：多数网页组合在一起。
网页：可以包含各种媒体，大多数为 .htm 或 .html（其他的有 ASP、PHP、PPT 等）。
URL：每个网页都有一个地址。
HTML 网页包括头部（Head）和身体（Body）。
超链：要出现新网页（新资源位置），用 URL 指出；指向本网页中的某个位置，用书签指出。$kp$, section = '' where id = 29239;
update t_knowledge_point set title = $kp$电子政务$kp$, content = $kp$电子政务：政府机构运用现代网络通信与计算机技术，将政府管理和服务职能通过精简、优化、整合、重组后在互联网络实现的一种方式。$kp$, section = '' where id = 29251;
update t_knowledge_point set title = $kp$远程教育的实现模式$kp$, content = $kp$远程教育指利用计算机及计算机网络进行教学，使得学生和教师可以异地完成教学活动的一种教学模式，包括远程课程学习、远程考试、远程讨论。

远程教育的研究和应用模式主要包括基于 Web 的软件实现方式和基于视频会议系统的实现方式。$kp$, section = '' where id = 29252;
update t_knowledge_point set title = $kp$B/S 模式下的数据库访问结构$kp$, content = $kp$B/S 模式下的数据库访问采用三层模式：

第一层，客户层（或浏览器层）：安装有浏览器的机器，完成表现层的作用。

第二层，业务逻辑层（或 Web 服务器层）：包含 Web 服务器和应用服务器。Web 服务器完成与浏览器之间网页数据的“收发工作”，以及本地静态数据（静态网页、静态图片等）的查询；应用服务器（一种系统软件）中运行用户编写的应用程序，完成动态数据的生成（通过 SQL 访问数据库），再由 Web 服务器将结果返回给浏览器。

第三层，数据库服务器层：接收第二层中的应用程序发送的 SQL，访问数据库并把结果返回给第二层。

第二层与第三层之间的标准接口是 ODBC、JDBC，第二层的应用程序正是通过 ODBC 或者 JDBC 来访问一个或多个不同的数据库服务器。$kp$, section = '' where id = 29254;
update t_knowledge_point set title = $kp$因特网服务的类型$kp$, content = $kp$因特网提供的服务有：E-mail（电子邮件）、FTP（远程文件传输）、Telnet（远程登录）、WWW（网页浏览，C/S 工作模式）、BBS（电子公告牌）、视频会议、网络游戏等。$kp$, section = '' where id = 29295;
update t_knowledge_point set title = $kp$电子邮件的特点与组成$kp$, content = $kp$电子邮件不像 QQ、MSN 那样即时传接，它的数据并不是即时传送的。

电子邮件由 3 个部分组成：头部、正文、附件。$kp$, section = '' where id = 29296;
update t_knowledge_point set title = $kp$常见的电子邮件收发协议$kp$, content = $kp$常见的电子邮件收发协议有：POP3（接收协议）、IMAP（接收协议）、SMTP（发送协议）。$kp$, section = '' where id = 29297;
update t_knowledge_point set title = $kp$常见的 Web 浏览器$kp$, content = $kp$常见的 Web 浏览器软件有：IE（Internet Explorer）、Firefox、Netscape 等。$kp$, section = '' where id = 29298;
update t_knowledge_point set title = $kp$常见的 FTP 客户端程序$kp$, content = $kp$常见的 FTP 客户端程序有 LeapFTP、CuteFTP、WSFTP 等；Serv-U 是常用的 FTP 服务器程序。$kp$, section = '' where id = 29299;
update t_knowledge_point set title = $kp$URL 的一般形式$kp$, content = $kp$URL 的一般形式：服务类型://主机域名或 IP 地址[:端口号]/文件路径/文件名。$kp$, section = '' where id = 29300;
update t_knowledge_point set title = $kp$URL 的服务类型$kp$, content = $kp$URL 的服务类型主要有：http、ftp、mailto、telnet、news 等。$kp$, section = '' where id = 29301;
update t_knowledge_point set title = $kp$常用网络端口号$kp$, content = $kp$常用网络端口号：21（FTP）、23（Telnet）、25（SMTP）、80（HTTP）、110（POP3）。$kp$, section = '' where id = 29302;
update t_knowledge_point set title = $kp$B/S 结构$kp$, content = $kp$B/S 结构即浏览器/服务器结构，它由 Web 浏览器、Web 服务器、数据库服务器 3 个层次组成。$kp$, section = '' where id = 29313;
update t_knowledge_point set title = $kp$按网络类型划分的电子商务$kp$, content = $kp$按照使用的网络类型不同，电子商务分为：基于 EDI（电子数据交换）的电子商务；基于 Internet（因特网）的电子商务；基于 Intranet/Extranet（企业内部网/企业外部网）的电子商务。$kp$, section = '' where id = 29315;
update t_knowledge_point set title = $kp$电子政务（E-Government）$kp$, content = $kp$电子政务（E-Government）是政府机构运用现代网络通信与计算机技术，将政府管理和服务职能通过精简、优化、整合、重组后在互联网络实现的一种方式。$kp$, section = '' where id = 29316;
update t_knowledge_point set title = $kp$远程教育的内容$kp$, content = $kp$远程教育就是利用计算机及计算机网络进行教学，使得学生和教师可以异地完成教学活动的一种教学模式。典型远程教育的内容主要包括：课程学习、远程考试和远程讨论等。$kp$, section = '' where id = 29317;
update t_knowledge_point set title = $kp$电子邮件的工作原理$kp$, content = $kp$电子邮件地址：帐户名@域名。

工作原理：发件方使用 SMTP 协议将邮件发送到发送端的服务器上，由发送端服务器将邮件传输到接收端服务器；接收方只有在登录邮箱后才可以从接收端服务器上下载邮件（POP3）。$kp$, section = '' where id = 29332;
update t_knowledge_point set title = $kp$FTP 文件传输服务$kp$, content = $kp$FTP 文件传输服务：服务器端可以给客户机提供下载、上传及修改服务器端文件的权限。

其中有一个特殊的登录用户，即 anonymous 匿名用户。$kp$, section = '' where id = 29333;
update t_knowledge_point set title = $kp$WWW 万维网服务与 URL 组成$kp$, content = $kp$WWW 是万维网服务。URL 即统一资源定位器，http:// 中的 http 是超文本传输协议。

以 http://www.sohu.com:80/sports/index.html 为例：
www.sohu.com 是主机域名（完全格式域名）；
80 是端口号；
sports 表示文件夹（路径）；
index.html 表示一个文件。$kp$, section = '' where id = 29334;
update t_knowledge_point set title = $kp$家庭网$kp$, content = $kp$家庭网在网络时代是指在网上分享亲情的平台，给每个家庭一个网上之家，让所有家人都可以轻松交流，分享家庭幸福与快乐。它可以连接家里的台式电脑、笔记本电脑、移动设备以及其他智能设备。$kp$, section = '' where id = 29363;
update t_knowledge_point set title = $kp$用 ping 命令测试网络连通性$kp$, content = $kp$在命令行中使用 ping 命令测试与网关的连通性。

网络正常时（ping 192.168.177.2）：5 个数据包全部收到，丢包率 0%，往返时间约 0.28～0.52 ms。

与某些网络不通时（ping 192.168.2.1）：发出 12 个数据包，收到 0 个，丢包率 100%。$kp$, section = '' where id = 29406;
update t_knowledge_point set title = $kp$清华大学镜像站$kp$, content = $kp$清华大学镜像站：https://mirror.tuna.tsinghua.edu.cn/$kp$, section = '' where id = 29415;
update t_knowledge_point set title = $kp$阿里云镜像站$kp$, content = $kp$阿里云镜像站：https://developer.aliyun.com/mirror/$kp$, section = '' where id = 29416;
update t_knowledge_point set title = $kp$应用层协议概览$kp$, content = $kp$应用层协议包括 SMTP、POP3、HTTP、FTP、Telnet 等。$kp$, section = '' where id = 29422;
update t_knowledge_point set title = $kp$URL 的书写规则$kp$, content = $kp$URL 的形式：协议名://域名或者 IP 地址[:端口号]/路径/文件名，注意斜杠的方向。

协议名不只有 http，也可以是 ftp、telnet 等。$kp$, section = '' where id = 29424;
update t_knowledge_point set title = $kp$电子邮件的协议$kp$, content = $kp$电子邮件：发送使用 SMTP，接收使用 POP3。

MIME 协议使邮件能够支持多媒体。
IMAP 协议用于电子邮件客户端收取邮件。$kp$, section = '' where id = 29448;
update t_knowledge_point set title = $kp$FTP 的访问与权限$kp$, content = $kp$FTP 即文件传输协议，需要用户名和密码，也可以匿名访问。

FTP 程序允许用户上传和下载，但需要具有相应的权限。$kp$, section = '' where id = 29449;
update t_knowledge_point set title = $kp$网页的两种形式$kp$, content = $kp$网页有 2 种形式：
① 静态网页：内容不会变化；
② 动态网页：内容会变化。

B/S 三层结构为客户层—Web 服务器层—数据库服务器层。动态网页常见的后缀名有 .asp 等。$kp$, section = '' where id = 29450;
update t_knowledge_point set title = $kp$HTML 与网页$kp$, content = $kp$HTML 即超文本标记语言，多数网页是用 HTML 制作的，扩展名是 .htm 或 .html。$kp$, section = '' where id = 29451;
update t_knowledge_point set title = $kp$常见网络协议与服务$kp$, content = $kp$邮箱协议：发送使用 SMTP，接收使用 POP3。

FTP：远程传输协议，一般需要用户名和密码，也可以匿名访问。
Telnet：远程登录。
DNS：域名系统，完成域名到 IP 地址之间的转换。
DBMS：数据库管理系统。
DHCP：动态主机配置协议。$kp$, section = '' where id = 29476;
update t_knowledge_point set title = $kp$WWW、HTML 与 URL$kp$, content = $kp$WWW 即万维网，一个单位或者个人的主网页称为主页。

HTML 即超文本标记语言，HTML 文档包括头部、正文（或主体）两个部分。

统一资源定位器 URL 的表示形式：http://主机域名[:端口号]/文件路径/文件名。$kp$, section = '' where id = 29477;
update t_knowledge_point set title = $kp$Web 文档的三种形式$kp$, content = $kp$静态文档：内容不会变化。
动态文档：内容总是变化，每次都要创建新文档。
主动文档（活动文档）：不完全由服务器产生，一个活动文档包括一个计算和显示的程序。$kp$, section = '' where id = 29478;
update t_knowledge_point set title = $kp$电子商务的分类与相关概念$kp$, content = $kp$按交易双方分：企业与客户之间（B-C）、企业之间（B-B）、企业与政府之间（B-G）。
按网络类型分：基于电子数据交换（EDI）、基于 Internet、基于 Intranet/Extranet（内联网）。
电子政务：与政府有关的信息化应用。
地理信息系统（GIS）。
数字地球：在全球范围内建立以空间位置为主线的信息系统。
远程教育：课程学习、远程考试、远程讨论。
数字图书馆：D-lib。$kp$, section = '' where id = 29481;
update t_knowledge_point set title = $kp$迅雷的 P2P 下载$kp$, content = $kp$迅雷文件下载时系统采用 P2P 模式工作，其特点是“参与下载的用户越多，下载的速度越快”。$kp$, section = '' where id = 29490;
update t_knowledge_point set title = $kp$超文本的阅读方式$kp$, content = $kp$超文本是对传统文本的扩展，除了传统的顺序阅读方式外，还可以通过导航、跳转、回溯等操作，实现对文本内容更为方便的访问。$kp$, section = '' where id = 29499;
update t_knowledge_point set title = $kp$移动互联网的终端与网络限制$kp$, content = $kp$移动互联网业务在便携的同时，也受到了来自网络能力和终端能力的限制：在网络能力方面，受到无线网络传输环境、技术能力等因素的限制；在终端能力方面，受到终端大小、处理能力、电池容量等的限制。$kp$, section = '' where id = 29502;
update t_knowledge_point set title = $kp$移动互联网业务与终端的关联$kp$, content = $kp$由于移动互联网业务受到了网络及终端能力的限制，因此其业务内容和形式也需要适合特定的网络技术规格和终端类型。$kp$, section = '' where id = 29503;
update t_knowledge_point set title = $kp$Web 2.0 与 Web 1.0 的关系$kp$, content = $kp$Web 2.0 网站与 Web 1.0 没有绝对的界限。Web 2.0 技术可以成为 Web 1.0 网站的工具；一些在 Web 2.0 概念之前诞生的网站本身也具有 Web 2.0 特性，例如 B2B 电子商务网站的免费信息发布，以及网络社区类网站的内容也来源于用户。$kp$, section = '' where id = 29505;
update t_knowledge_point set title = $kp$Web 2.0 的核心$kp$, content = $kp$Web 2.0 的核心不是技术而在于指导思想。Web 2.0 有一些典型的技术，但技术是为了达到某种目的所采取的手段，技术本身不是 Web 2.0 网站的核心，重要的在于典型的 Web 2.0 技术体现了具有 Web 2.0 特征的应用模式。因此，与其说 Web 2.0 是互联网技术的创新，不如说是互联网应用指导思想的革命。$kp$, section = '' where id = 29506;
update t_knowledge_point set title = $kp$Web 2.0 与 HTML5 新特性$kp$, content = $kp$Web 2.0 体现交互，可读可写，体现出的方面是各种微博、相册，用户参与性更强。Web 2.0 技术主要包括：博客（BLOG）、RSS、百科全书（Wiki）、网摘、社会网络（SNS）、P2P、即时信息（IM）等。

HTML5 新特性：
① 语义特性：HTML5 赋予网页更好的意义和结构，增加了带有语义的新内容标签，使搜索引擎爬取网站信息更高效。HTML4 中的内容标签级别相同，无法区分各部分内容；HTML5 中的内容标签互相独立、级别不同，搜索引擎以及统计软件等可快速识别各部分内容。
② 本地存储特性：基于 HTML5 开发的网页 APP 启动时间更短、联网速度更快，得益于 HTML5 APP Cache 以及本地存储功能。HTML5 提供了网页存储的 API，方便 Web 应用的离线使用，新的 API 相对于 cookie 具有高安全性、高效率、更大空间等优点。HTML5 引入了应用程序缓存，使 Web 应用可以在没有因特网连接时访问，带来三个优势：离线浏览、速度更快、减少服务器负载（浏览器只从服务器下载更新过或更改过的资源）。
③ 设备访问特性：HTML5 提供了数据与应用接入的开放接口，使外部应用可以直接与浏览器内部的数据相连，例如视频影音可直接与麦克风及摄像头相连。$kp$, section = '' where id = 29508;
update t_knowledge_point set title = $kp$Ajax、Android 与 iOS 系统架构$kp$, content = $kp$新的 Ajax（XMLHttpRequest 2）：XMLHttpRequest 是一个浏览器接口，使 JavaScript 可以进行 HTTP(S) 通信，也就是 Ajax。

Android 系统是一种基于 Linux 的操作系统，通常分为 5 层，从上到下依次是应用层、应用框架层、系统运行库层、硬件抽象层和 Linux 内核层。

应用层：系统内置的应用以及非系统的应用程序，负责向用户提供服务并与用户交互，如电子邮件、短信、日历以及支付宝、微信等。

应用框架层（Java API 框架层）：开发者可通过 Java 语言编写的 API 使用 Android OS 的整个功能集，主要包括视图系统、活动管理器、资源管理器、通知管理器、内容提供程序、窗口管理器等组件和服务。

系统运行库层：包括原生 C/C++ 库以及 Android Runtime。原生 C/C++ 库提供 Android 系统的服务和组件，例如可通过 Android 框架的 Java OpenGL API 访问 OpenGL ES，以支持在应用中绘制和操作 2D、3D 图形；使用 Android NDK 可以直接从原生代码访问某些原生平台库。Android Runtime 分为核心库和 ART（Android 5.0 以后 Dalvik 虚拟机被 ART 代替），核心库提供了 Java 语言核心库的大多数功能。Dalvik 虚拟机专门为移动设备定制，允许在有限的内存中运行多个虚拟机实例，每个实例作为一个 Linux 进程运行；ART 在安装应用时进行一次预编译，把字节码编译为机器码并存储在本地，应用每次运行时不用再编译，效率更高，还优化了垃圾回收并提供了更好的调试支持。

硬件抽象层（HAL）：提供标准界面，向更高级别的 Java API 框架显示设备硬件功能。HAL 包含多个库模块，每个模块为特定类型的硬件组件实现一个界面，例如相机或蓝牙模块；当框架 API 要求访问设备硬件时，Android 系统为该硬件组件加载库模块。硬件抽象层隐藏了特定平台的硬件接口细节，为操作系统提供虚拟硬件平台，使其具有硬件平台无关性，可在多种平台上移植。

Linux 内核层：Android 平台的基础是 Linux 内核，Android Runtime（ART）依靠 Linux 内核执行线程和低层内存管理等底层功能，并使用 Linux 内核的主要安全功能，设备制造商可为内核开发硬件驱动程序。

iOS 基于 UNIX 系统，系统架构分为四层，由上到下依次为可触摸层（Cocoa Touch）、媒体层（Media）、核心服务层（Core Services）、核心操作系统层（Core OS）。$kp$, section = '' where id = 29510;
update t_knowledge_point set title = $kp$广泛的网络访问$kp$, content = $kp$广泛的网络访问：通过各种网络渠道，以统一标准的机制（如浏览器、相同的 API 等）获取服务。$kp$, section = '' where id = 29969;
update t_knowledge_point set title = $kp$Web 2.0 的交互性$kp$, content = $kp$Web 2.0 更加注重交互性。不仅用户在发布内容过程中实现与网络服务器之间的交互，而且也实现了同一网站不同用户之间的交互，以及不同网站之间信息的交互。$kp$, section = '' where id = 29991;
update t_knowledge_point set title = $kp$邮件的格式$kp$, content = $kp$头部：支持一发多发（抄送）、接收邮箱地址。
附件：文件类型任意。
正文：采用 MIME，支持多种不同的字符集。$kp$, section = '' where id = 30121;
update t_knowledge_point set title = $kp$电子商务及其分类$kp$, content = $kp$电子商务即整个贸易活动实现电子化。

按照交易双方分类：① 企业内部的电子商务；② 企业与客户之间的电子商务（B-C）；③ 企业之间的电子商务（B-B）；④ 企业与政府之间的电子商务（B-G）。

按照交易商品性质分类：① 有形商品的电子订货和付款；② 无形商品和服务。$kp$, section = '' where id = 30128;
update t_knowledge_point set title = $kp$常见的网页文件扩展名$kp$, content = $kp$常见的网页文件扩展名有：htm、html、shtml、asp、php、cgi、jsp、aspx 等。$kp$, section = '' where id = 30146;
update t_knowledge_point set title = $kp$按商品性质划分的电子商务$kp$, content = $kp$按照交易商品性质分类，电子商务分为：一是有形商品的电子订货和付款；二是无形商品和服务。$kp$, section = '' where id = 30152;
update t_knowledge_point set title = $kp$主页与默认文档$kp$, content = $kp$一个单位或者个人的主网页称为主页，其默认文件名是 index.htm 或 default.htm。$kp$, section = '' where id = 30191;
update t_knowledge_point set title = $kp$一台服务器上建立多个 Web 站点的方法$kp$, content = $kp$有三种方式：
① 不同的站点使用不同的 IP 地址；
② 不同的站点使用相同的 IP 地址、不同的 TCP 端口；
③ 不同的站点使用相同的 IP 地址和 TCP 端口，使用不同的主机头。$kp$, section = '' where id = 32600;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22398,22462,22574,22581,22610,22611,22618,22630,22637,22638,22641,22655,22682,22683,22691,22706,22719,22720,22733,22734,22735,22739,22766,22774,22777,22790,22797,22813,22815,22816,22817,22851,22852,22853,22858,22862,22866,22868,22895,22899,22907,22909,22938,22942,22971,22973,22982,22989,23058,23065,23067,23068,23078,23088,23099,23100,23113,23126,23131,23367,23414,23455,23463,23625,23943,24983,25031,25165,25170,25175,25637,25686,25855,25967,26099,26276,26277,26281,26286,26425,26426,26469,26501,26505,26515,26769,26825,27374,27397,27446,27447,27448,27449,27450,27451,27452,27453,27454,27455,27456,27457,27458,27459,27460,27461,27462,27463,27464,27465,27467,27492,27493,27494,27950,27951,28318,28319,28325,28431,28433,28435,28437,28521,28523,28537,28540,29160,29188,29220,29229,29230,29231,29232,29235,29236,29237,29238,29239,29251,29252,29254,29295,29296,29297,29298,29299,29300,29301,29302,29313,29315,29316,29317,29332,29333,29334,29363,29406,29415,29416,29422,29424,29448,29449,29450,29451,29476,29477,29478,29481,29490,29499,29502,29503,29505,29506,29508,29510,29969,29991,30121,30128,30146,30152,30191,32600) and not deleted) <> 186 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
