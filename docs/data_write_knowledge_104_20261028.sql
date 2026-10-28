-- 知识点 104 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_104
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_104 as
select * from t_knowledge_point where id in (22562,22566,22568,22569,22570,22573,22575,22577,22607,22632,22640,22645,22647,22648,22650,22656,22703,22732,22736,22746,22747,22762,22763,22764,22781,22796,22823,22824,22825,22886,22887,22891,22892,22893,22894,22896,22898,22959,22972,22981,22987,23725,25261,25262,25266,25490,25956,25957,25959,26767,27073,27074,27075,27157,27158,27378,27379,27380,27381,27382,27383,27384,27386,27390,27391,27392,27393,27394,27395,27485,27486,27487,27488,27489,27490,27491,27714,27715,27716,27717,27718,27719,27720,27721,27722,27723,27989,27990,27991,28187,28188,28189,28190,28191,28192,28193,28194,28195,28196,28202,28234,28326,28327,28341,28377,28380,28403,28531,28532,28533,28534,28546,28578,28579,28580,28581,28582,29193,29210,29211,29212,29213,29214,29216,29217,29218,29219,29233,29283,29284,29288,29289,29290,29291,29321,29330,29331,29395,29402,29403,29404,29405,29408,29410,29437,29438,29439,29447,29473,29475,29495,29496,29596,30114,30115,30129,30188,30190,30257,30259,31992,32006,32570);

update t_knowledge_point set title = $kp$子网划分与可用主机地址$kp$, content = $kp$子网掩码 255.255.255.224 的最后一个字节为 11100000，前三位用于子网划分。10.110.12.29 与掩码相与得到 10.110.12.0，说明该地址属于 000 子网：网络地址为 10.110.12.0，主机号占 5 位，可分配 IP 数为 2^5-2=30 个，主机地址范围是 10.110.12.1～10.110.12.30。因此 10.110.12.31 是该子网的广播地址，10.110.12.32 属于 001 子网的网络地址，不能作为本子网的主机地址。$kp$, section = '' where id = 22562;
update t_knowledge_point set title = $kp$C类IP地址的结构与容量$kp$, content = $kp$C 类 IP 地址的前 24 位为网络地址，最后 8 位为主机地址，最高三位为 110，首字节取值范围为 192～223。用 C 类地址组建的网络称为 C 类网络，一个 C 类网络最多可容纳 2^8-2 即 254 台主机，共有 2^21-2 个 C 类网络。$kp$, section = '' where id = 22566;
update t_knowledge_point set title = $kp$C类地址的位结构$kp$, content = $kp$C 类地址的最高三位为 110，其后 21 位为网络地址，最后 8 位为主机地址。$kp$, section = '' where id = 22568;
update t_knowledge_point set title = $kp$IP地址的组成与类型号$kp$, content = $kp$IP 地址由类型号、网络号和主机号组成：最高 1～4 位为类型号，用于区分 A、B、C、D、E 五类地址；网络号指明计算机所属网络的编号；主机号指明计算机在该网络中的编号。$kp$, section = '' where id = 22569;
update t_knowledge_point set title = $kp$网络地址计算与DNS配置文件$kp$, content = $kp$将 IP 地址与子网掩码 255.255.240.0 相与，可得到网络地址，例如 192.168.224.0/20、192.168.208.0/20。Linux 中 DNS 配置文件为 /etc/resolv.conf；/etc/hosts 文件每行第一列是 IP 地址，第二列是主机名，第三列是别名。$kp$, section = '' where id = 22570;
update t_knowledge_point set title = $kp$域名结构与命名规则$kp$, content = $kp$域名 www.tsinghua.edu.cn 中，www 是主机名，tsinghua 是网络名，edu 是机构名，cn 是顶级域名。域名使用的字符可以是字母、数字和连字符，但必须以字母或数字开头并结尾，域名总长度不超过 255 个字符。把域名翻译成 IP 地址的系统称为 DNS，即域名系统。域名格式为：5 级域名.4 级域名.3 级域名.2 级域名.顶级域名；美国一般不使用国家代码作为顶级域名，其他国家（地区）一般采用国家（地区）代码作为顶级域名，如中国为 cn。$kp$, section = '' where id = 22573;
update t_knowledge_point set title = $kp$IP地址与子网掩码相与$kp$, content = $kp$将题目中的 IP 地址与子网掩码进行与运算，即可得到该子网的网络地址。$kp$, section = '' where id = 22575;
update t_knowledge_point set title = $kp$由IP与掩码求网络地址$kp$, content = $kp$192.168.5.121 与子网掩码 255.255.255.248 相与，结果为网络地址 192.168.5.120。$kp$, section = '' where id = 22577;
update t_knowledge_point set title = $kp$IPv4地址的表示与地址空间$kp$, content = $kp$IP 协议第 4 版（IPv4）规定，每个 IP 地址是一个 32 位二进制数，即 4 个字节，通常表示为 w.x.y.z 的形式，其中 w、x、y、z 分别为 0～255 的十进制整数，对应二进制表示中的一个字节。IPv4 只有大约 36 亿个地址，估计很快将被分配完毕；IPv6 已把 IP 地址长度扩展到 128 位。$kp$, section = '' where id = 22607;
update t_knowledge_point set title = $kp$网络地址与广播地址$kp$, content = $kp$IP 地址中主机号每一位都是 0 的称为网络地址；主机号每一位都是 1 的称为广播地址。$kp$, section = '' where id = 22632;
update t_knowledge_point set title = $kp$MAC地址与IP地址的关系$kp$, content = $kp$MAC 地址也称硬件地址或物理地址。一个网卡有一个全球唯一的固定 MAC 地址，但可对应多个 IP 地址。IP 地址与 MAC 地址之间并不存在固定的绑定关系。$kp$, section = '' where id = 22640;
update t_knowledge_point set title = $kp$掩码248对应的子网主机数$kp$, content = $kp$248 的二进制为 11111000，说明有 3 位用于主机号，可分配主机数为 2^3-2=8-2=6 个，即去掉网络地址和广播地址各一个。$kp$, section = '' where id = 22645;
update t_knowledge_point set title = $kp$用子网掩码判断是否同一子网$kp$, content = $kp$不同子网之间需要通过路由器相连，子网内的通信则无须经过路由器转发，因此比较各主机的网络地址即可。将子网掩码 255.255.192.0 与主机 129.23.144.16 进行与操作，得到该主机的网络地址 129.23.128.0。再将各选项 IP 分别与掩码相与：129.23.191.21 得 129.23.128.0，129.23.127.222 得 129.23.64.0，129.23.130.33 得 129.23.128.0，129.23.148.127 得 129.23.128.0。只有 129.23.127.222 的网络地址不是 129.23.128.0，因此它与 129.23.144.16 不在同一子网，需要通过路由器转发信息。$kp$, section = '' where id = 22647;
update t_knowledge_point set title = $kp$英文域名命名规则$kp$, content = $kp$注册英文域名时需遵循以下规则：只能使用英文字母（a～z，不区分大小写）、数字（0～9）以及连接符（-），不支持空格及 !、$、&、? 等字符；连接符不能连续出现、不能单独注册，也不能放在开头和结尾；域名长度不超过 63 个字符。$kp$, section = '' where id = 22648;
update t_knowledge_point set title = $kp$B类地址子网可分配主机数$kp$, content = $kp$172 为 B 类地址，默认子网掩码 255.255.0.0。本题中子网掩码为 255.255.255.192，IP 与掩码相与得到子网网络地址 172.28.33.128。192 的二进制为 11000000，使用了两位划分子网，网络段位数变为 24+2=26，主机段位数为 32-26=6，可分配 IP 数为 2^6-2=62 个。$kp$, section = '' where id = 22650;
update t_knowledge_point set title = $kp$IP地址的网络号与主机号$kp$, content = $kp$网络地址（net-id）用来指明主机所从属的物理网络的编号；主机地址（host-id）是主机在物理网络中的编号。$kp$, section = '' where id = 22656;
update t_knowledge_point set title = $kp$A类与B类IP地址的结构$kp$, content = $kp$A 类 IP 地址的最高位为 0，前 8 位为网络地址，在申请地址时由管理机构设定，后 24 位为主机地址。用 A 类地址组建的网络称为 A 类网络，一个 A 类网络最多可容纳 2^24-2（约 1600 万）台主机，最多可有 2^7-2=126 个 A 类网络。

B 类 IP 地址的前 16 位为网络地址，后 16 位为主机地址，最高两位为 10，首字节取值在 128～191 之间。用 B 类地址组建的网络称为 B 类网络，一个 B 类网络最多可容纳 2^16-2 即 65534 台主机，最多可有 2^14-2 个 B 类网络。$kp$, section = '' where id = 22703;
update t_knowledge_point set title = $kp$RARP反向地址解析$kp$, content = $kp$RARP 是反向 ARP 协议：在已获知自己 MAC 地址的前提下广播请求包，以获得本机对应的 IP 地址。$kp$, section = '' where id = 22732;
update t_knowledge_point set title = $kp$ARP与RARP的功能$kp$, content = $kp$已知一个主机的 IP 地址，需要找出其对应的物理地址；或者已知物理地址，需要找出相应的 IP 地址。地址解析协议 ARP 和逆地址解析协议 RARP 就是解决这类问题的。RARP 在已获知自己 MAC 地址的前提下广播请求包，以获得本机对应的 IP 地址。$kp$, section = '' where id = 22736;
update t_knowledge_point set title = $kp$特殊的IP地址$kp$, content = $kp$回送地址：前 8 位为 01111111（十进制 127）的 IP 地址，用于网络软件测试和本机进程间通信。任何程序向回送地址发送数据，TCP/IP 协议软件立即将数据返回，不做任何网络传输，这使得 127.0.0.0 不能分配给网络，减少了 2^24 个可用地址。

子网地址：主机地址全为 0 的 IP 地址，代表当前所在的子网，例如网络 150.24.0.0 指整个子网，不会分配给网络中的任何一台主机。

广播地址：主机地址全为 1 的 IP 地址，向它发送信息就是向子网中的每个成员发送信息，例如在 A 类网络 16.0.0.0 中向 16.255.255.255 发送信息，网络中的每台计算机都将收到。如果需要在本网内广播但不知道子网地址，可以用 255.255.255.255 代替本网广播地址。

私有地址（内部专用）：10.0.0.0～10.255.255.255、172.16.0.0～172.31.255.255、192.168.0.0～192.168.255.255。$kp$, section = '' where id = 22746;
update t_knowledge_point set title = $kp$特殊IP地址的含义与用途$kp$, content = $kp$回送地址：前 8 位为 01111111（十进制 127）的 IP 地址，用于网络软件测试和本机进程间通信。任何程序向回送地址发送数据，TCP/IP 协议软件立即将数据返回，不做任何网络传输。

网络地址：主机地址每一位都为 0 的 IP 地址，用来表示整个物理网络，指的是物理网络本身而非哪一台具体的计算机，例如 150.24.0.0 不会被分配给网络中的任何一台主机。

广播地址：主机地址每一位都为 1 的 IP 地址，向它发送信息就是向子网中的每个成员发送信息，例如在 A 类网络 16.0.0.0 中向 16.255.255.255 发送信息，网络中的每台计算机都将收到。如果需要在本网内广播但不知道子网地址，可以用 255.255.255.255 代替本网广播地址。

私有地址（内部专用）：10.0.0.0～10.255.255.255、172.16.0.0～172.31.255.255、192.168.0.0～192.168.255.255。$kp$, section = '' where id = 22747;
update t_knowledge_point set title = $kp$主机名与域名系统$kp$, content = $kp$IP 地址用 4 个十进制数字表示，不便于人们记忆和使用，因此更合适的方法是用具有特定含义的符号来表示因特网中的每一台主机，符号名应与各自的 IP 地址对应。用户访问网络中的某个主机时，只需按名访问，无须关心它的 IP 地址。

为了避免主机名字重复，因特网将整个网络的名字空间划分为许多不同的域，每个域又划分为若干子域，入网主机的名字由一系列“域”及其“子域”组成，子域个数通常不超过 5 个，子域之间用“.”分隔，从左到右级别逐级升高，一般为：计算机名.网络名.机构名.最高域名。例如 lib.nju.edu.cn 表示中国（cn）教育科研网（edu）中南京大学校园网（nju）内的一台计算机。$kp$, section = '' where id = 22762;
update t_knowledge_point set title = $kp$IP地址的分配方法$kp$, content = $kp$用户的计算机接入因特网，必须获得 ISP 分配的 IP 地址。对于单位用户，ISP 通常分配一批地址，单位的网络中心再对网络中的每台主机指定子网号和主机号。对于家庭用户，ISP 采用动态分配的方法，用户上网时临时分配一个 IP 地址，下网后立即收回。$kp$, section = '' where id = 22763;
update t_knowledge_point set title = $kp$域名系统与域名服务器$kp$, content = $kp$IP 地址用 4 个十进制数字表示，不便于记忆和使用，因此用具有特定含义的符号（域名）来表示因特网中的每一台主机。因特网将名字空间划分为许多域，每个域又划分为若干子域，入网主机的名字由一系列“域”及其“子域”组成，子域个数不超过 5 个，子域之间用“.”分隔，从左到右级别逐级升高，一般为“计算机名.网络名.机构名.最高域名”。例如 lib.nju.edu.cn 表示中国（cn）教育科研网（edu）中南京大学校园网（nju）内的一台计算机（lib）。

域名使用的字符可以是字母、数字和连字符，但必须以字母或数字开头并结尾，整个域名总长不得超过 255 个字符。第 1 级域名（顶级域名）：除美国以外，其他国家一般采用国家代码，美国通常以机构或行业名作为顶级域名。

域名系统（DNS）是把域名翻译成 IP 地址的软件；域名服务器是运行域名系统的主机，其数据库中预先存放所辖网络中所有主机的域名与 IP 地址的对照表，用于实现主机名字和 IP 地址的转换。

一个 IP 地址必须唯一对应一台主机，一台主机通常只有一个 IP 地址；与一个 IP 地址对应的域名可以有多个，但与一个域名对应的 IP 地址只能有一个。主机从一个物理网络移到另一个网络时，IP 地址必须更换，但可以保留原来的域名。$kp$, section = '' where id = 22764;
update t_knowledge_point set title = $kp$五类IP地址的格式与规模$kp$, content = $kp$A 类地址类型号为 0，网络号 7 位、主机号 24 位，用于超大型网络，可容纳主机数不超过 16 777 214 台，只有不超过 126 个网络可获得 A 类地址。

B 类地址类型号为 10，网络号 14 位、主机号 16 位，用于规模适中的网络（不超过 65 534 台主机），首字节大于等于 128 但小于 192。

C 类地址类型号为 110，网络号 21 位、主机号 8 位，用于主机不超过 254 台的小型网络，首字节大于等于 192 但小于 224。

D 类类型号为 1110，为组播地址；E 类类型号为 11111，备用。

两个特殊的 IP 地址：主机号为全 0 的 IP 地址称为网络地址，用来表示整个网络；主机号为全 1 的 IP 地址称为直接广播地址，指向该网络中的所有主机。$kp$, section = '' where id = 22781;
update t_knowledge_point set title = $kp$域名解析使用UDP的原因$kp$, content = $kp$域名解析过程中收发查询报文和回答报文的任务由传输层协议完成，通常使用 UDP 协议，原因是其开销少、效率高；而 TCP 协议的开销太大。$kp$, section = '' where id = 22796;
update t_knowledge_point set title = $kp$IP地址的分配与特殊地址$kp$, content = $kp$入网需要申请并获得授权机构分配的 IP 地址。授权机构实际上只分配一个类型号和网络号，组网者再对子网内的每一台主机指定一个主机号，从而构成网络中每台计算机的 IP 地址。

从不分配给任何主机使用的特殊 IP 地址：网络地址，即主机地址每一位都为 0 的 IP 地址，用来表示整个物理网络本身，而不是连到该网络上的计算机；直接广播地址，即主机地址每一位都为 1 的 IP 地址，当一个包被发送到某个物理网络的直接广播地址时，这个包将送达该网络上的每一台主机。$kp$, section = '' where id = 22823;
update t_knowledge_point set title = $kp$IP地址的点分十进制表示$kp$, content = $kp$IP 地址是一个 32 位的地址码，书写和记忆很不方便。点分十进制表示用 4 个十进制数来表示一个 IP 地址，每个十进制数对应 IP 地址中的 8 位（1 个字节），相互之间用小数点隔开。例如 26.10.35.48 为 A 类地址，130.24.35.68 为 B 类地址，202.119.23.12 为 C 类地址。

A 类首字节 1～126，网络号取值 1～126，如 61.155.13.142；B 类首字节 128～191，网络号取值 128.0～191.255，如 128.11.3.31；C 类首字节 192～223，网络号取值 192.0.0～223.255.255，如 202.119.36.12。$kp$, section = '' where id = 22824;
update t_knowledge_point set title = $kp$IP地址类型判断依据$kp$, content = $kp$A 类地址首字节 1～126，最高位是 0；B 类 128～191，前两位是 10；C 类 192～223，前三位是 110；D 类 224～239，前四位是 1110；E 类 240～247，前五位是 11110。

A 类 IP 地址的最高位为 0，前 8 位为网络地址，在申请地址时由管理机构设定，后 24 位为主机地址，一个 A 类网络最多可容纳 2^24-2（约 1678 万）台主机，可有 2^7-2=126 个网络获得 A 类地址。B 类 IP 地址前 16 位为网络地址、后 16 位为主机地址，最高两位为 10，首字节取值在 128～191 之间，一个 B 类网络最多可容纳 2^16-2 即 65534 台主机，可有 2^14-2=16382 个网络获得 B 类地址。$kp$, section = '' where id = 22825;
update t_knowledge_point set title = $kp$域名解析的查找过程$kp$, content = $kp$域名为 netra.nju.edu.cn 的主机若要访问英国名为 paradisc.ulcc.uk 的主机，需要经过以下步骤取得对方 IP 地址：首先通过 nju 子域的域名服务器查找，得知目的主机不在南京大学校园网内，于是通过指针找到管理 edu 子域的域名服务器；该服务器存放我国所有高校的子域名字，查知目的主机不在 CERNET 范围内，再用同样方法找到管理最高域名 cn 的域名服务器；cn 域名服务器存有其他国家级域名的服务器地址，由此找到 uk 域名服务器，再从 uk 域名服务器找到 ulcc 子域的域名服务器，查得 paradisc.ulcc.uk 的 IP 地址是 128.86.8.56。查找完成后，找到的 IP 地址反向逐级送回发出查询请求的主机，两台主机即可通信。$kp$, section = '' where id = 22886;
update t_knowledge_point set title = $kp$主机号位数与可分配地址数$kp$, content = $kp$主机段位数为 32-28=4 位，IP 总数为 2^4=16 个，可分配的只有 16-2=14 个，因为要去除主机段全 0 和全 1 的两个地址。$kp$, section = '' where id = 22887;
update t_knowledge_point set title = $kp$互联网中IP地址的作用与特点$kp$, content = $kp$互联网上的每台计算机使用 IP 地址作为其标识。IP 地址具有惟一性：网络上每台计算机都有一个与众不同的 IP 地址；具有简明性：所有地址的长度都是 32 个二进位。IP 地址的格式包含网络号和主机号两个部分。$kp$, section = '' where id = 22891;
update t_knowledge_point set title = $kp$主机的IP地址与域名$kp$, content = $kp$互联网采用 TCP/IP 协议，由大量网络和计算机互连而成，网络中的每一台主机都有一个 IP 地址。IP 地址用 4 个十进制数字表示，不便记忆和使用，因此互联网采用域名作为 IP 地址的文字表示，易用易记。例如南京大学 WWW 服务器的 IP 地址是 202.119.32.7，对应的域名是 www.nju.edu.cn，其中 www 为主机名、nju 为网络名、edu 为机构名、cn 为国家/地区名。用户可以按 IP 地址访问主机，也可按域名访问主机；一个 IP 地址可对应多个域名，一个域名只能对应一个 IP 地址。$kp$, section = '' where id = 22892;
update t_knowledge_point set title = $kp$域名命名规则与顶级域名$kp$, content = $kp$域名只许使用字母、数字和连字符，以字母或数字开头并结尾，总长度不超过 255 个字符。顶级域名规定：国际顶级域名 int（国际组织）；国家顶级域名如 cn（中国）、uk（英国）；通用顶级域名如 com（营利性组织）、net（网络服务机构），以及美国专用的 org、edu、gov、mil 等。我国对二级域名的规定：机构类别域名包括 ac 科研机构、com 企业、net 网络服务机构、org 非营利性组织、edu 教育机构、gov 政府部门；行政区域域名如 bj 北京、sh 上海、js 江苏。$kp$, section = '' where id = 22893;
update t_knowledge_point set title = $kp$域名的层次结构$kp$, content = $kp$域名的格式为：5 级域名.4 级域名.3 级域名.2 级域名.顶级域名。例如中国南京大学校园网 www 服务器的域名为 www.nju.edu.cn，依次为主机名、网络名、机构名、国家名；美国哈佛大学校园网 www 服务器的域名为 www.harvard.edu，依次为主机名、网络名、机构名。$kp$, section = '' where id = 22894;
update t_knowledge_point set title = $kp$互联网服务提供商ISP$kp$, content = $kp$无论是单位的计算机网络还是个人的一台计算机，要接入互联网都必须通过互联网服务提供商（ISP）。ISP 拥有自己的通信线路，并拥有从互联网管理机构申请得到的许多 IP 地址。用户计算机接入互联网必须获得 ISP 分配的 IP 地址：对于单位用户，ISP 通常分配一批地址（如一个或若干个 C 类网络号），单位的网络中心再为每台主机指定子网号和主机号，使每台计算机都有固定的 IP 地址；对于个人用户，ISP 一般不分配固定 IP 地址，而采用动态分配方法，上网时由 DHCP 服务器临时分配一个 IP 地址，下网时立即收回给其他用户使用。$kp$, section = '' where id = 22896;
update t_knowledge_point set title = $kp$互联网的域名空间$kp$, content = $kp$为避免域名重复，互联网的域名空间划分为许多不同的域，每个域又分为若干子域，从而构成树状的域名空间。顶级域名包括 mil、edu、gov、com、net、org、int 等通用顶级域名和 cn、uk 等国家顶级域名；例如 com 下有 cctv，cn 下有 nju、seu、tsinghua、pku 等子域，各子域下还可以有 www、bbs 等主机名。$kp$, section = '' where id = 22898;
update t_knowledge_point set title = $kp$子网掩码的作用与默认值$kp$, content = $kp$子网掩码是一个 32 位的代码，其中与 IP 地址中网络号、子网号对应位置处的二进位是 1，与主机号对应位置处的二进位是 0。三类 IP 地址的默认子网掩码：A 类 255.0.0.0，B 类 255.255.0.0，C 类 255.255.255.0。子网掩码的用途是从 IP 地址中分离出网络号和子网号，方法是与 IP 地址进行逻辑乘。例如 202.119.36.12（C 类）与 255.255.255.0 逻辑乘，得到网络号 202.119.36.0（前 24 位）；212.16.2.120 与 255.255.255.240 逻辑乘，得到网络号 11010100 00010000 00000010 01110000（前 28 位）。$kp$, section = '' where id = 22959;
update t_knowledge_point set title = $kp$动态主机配置协议DHCP$kp$, content = $kp$路由器运行 DHCP 服务器软件，监听局域网中的客户机有无 DHCP 请求。当设置为“自动获取 IP 地址”的客户机开机时，路由器会收到 DHCP 请求，为客户机分配配置参数，包括 IP 地址、子网掩码、默认网关、DNS 服务器等。三种 IP 地址分配方式：自动分配，如 TP-LINK 无线路由器一般从 192.168.1.100 开始分配，直至 192.168.1.254，客户机分配到地址后固定使用；手工分配，用户自行选择 192.168.1.2～192.168.1.99 中的 IP 地址；动态分配，DHCP 服务器分配的地址租约到期后，客户机释放该地址，供其他客户机使用。$kp$, section = '' where id = 22972;
update t_knowledge_point set title = $kp$因特网主机名字的命名树$kp$, content = $kp$因特网的名字空间是一棵命名树：根下为 mil、edu、gov、com、net、org、int 等顶级域名和 cn、uk 等国家顶级域名，各顶级域名下再划分 ac、net、nju、seu、tsinghua、pku 等子域。主机域名是因特网中主机的符号名，域名使用的字符可以是字母、数字和连字符，但必须以字母或数字开头并结尾，整个域名总长不得超过 255 个字符。第 1 级域名：除美国以外，其他国家一般采用国家代码作为第 1 级域名，美国通常以机构或行业名作为第 1 级域名。一台主机通常只能有一个 IP 地址，但可以有多个域名；主机从一个物理网络移到另一个网络时，IP 地址必须更换，但可以保留原来的域名。域名系统（DNS）是把域名翻译成 IP 地址的软件，域名服务器是运行域名系统的主机。$kp$, section = '' where id = 22981;
update t_knowledge_point set title = $kp$域名系统与域名服务器的作用$kp$, content = $kp$域名系统（DNS）是将主机域名翻译为主机 IP 地址的软件，它是一个分布式数据库系统。域名服务器是运行域名系统软件的一台服务器，每个互联网服务提供商或校园网都有一个域名服务器，用于实现入网主机域名与 IP 地址的转换。为实现域名的查找，需要在本地网域名服务器与上级网的域名服务器之间建立链接。$kp$, section = '' where id = 22987;
update t_knowledge_point set title = $kp$五类IP地址的首字节范围$kp$, content = $kp$A 类地址首字节 1～126，最高位是 0；B 类 128～191，前 2 位是 10；C 类 192～223，前三位是 110；D 类 224～239，前四位是 1110；E 类 240～247，前五位是 11110。$kp$, section = '' where id = 23725;
update t_knowledge_point set title = $kp$IP协议与IP地址的特点$kp$, content = $kp$IP 协议规定全网计算机必须使用统一的、唯一的地址即 IP 地址作为标识。IP 地址采用两级结构，由网络号和主机号组成；用 4 个十进制数表示（如 202.120.4.231），不方便记忆。同一台计算机接入不同的网络时，IP 地址不同。每个网段中有 2 个 IP 地址不能分配给主机使用：主机号全 0 为网络地址，表示整个网络；主机号全 1（最后一位为 255）为直接广播地址；127 开头的地址为回送地址。

私有 IP 地址只用于局域网，不属于互联网：A 类 10.0.0.0～10.255.255.255，B 类 172.16.0.0～172.31.255.255，C 类 192.168.0.0～192.168.255.255。$kp$, section = '' where id = 25261;
update t_knowledge_point set title = $kp$IP地址分类与网络号计算$kp$, content = $kp$A 类地址类型号为 0，网络号 7 位、主机号 24 位，首字节 1～126，只有 126 个网络可获得 A 类地址，每个网络可容纳 16 777 214 台主机，适合大型网络，默认子网掩码 255.0.0.0。B 类类型号 10，网络号 14 位、主机号 16 位，首字节 128～191，可容纳 65 534 台主机，适合中型网络，默认子网掩码 255.255.0.0。C 类类型号 110，网络号 21 位、主机号 8 位，首字节 192～223，可容纳 254 台主机，适合小型网络，默认子网掩码 255.255.255.0。D 类首字节 224～239、类型号 1110，E 类首字节 240～247、类型号 11110，均作特殊地址使用。

网络号由主机 IP 地址与子网掩码作逻辑乘得到；主机号由子网掩码取反后与 IP 地址作逻辑乘得到。例如 212.36.2.120 与 255.255.255.0 相与，得网络号 212.36.2.0。$kp$, section = '' where id = 25262;
update t_knowledge_point set title = $kp$域名与域名系统$kp$, content = $kp$因特网中每台主机都有 IP 地址，用 4 个十进制数字表示不便于记忆，因此用域名作为 IP 地址的文字表示来定位主机。用户既可使用 IP 地址访问主机，也可按域名访问主机；一个 IP 地址可对应多个域名，一个域名只能对应一个 IP 地址；一台主机可以有多个 IP 地址和多个域名，域名一般不变，IP 地址可以更换；上网的每台计算机都有 IP 地址，但不一定有域名。

域名格式为：主机名（计算机名）.网络名.机构名.最高域名，例如 www.seu.edu.cn 为四级域名，依次为主机名、网络名、机构名、国家名。

域名命名规则：使用的字符可以是字母、数字和连字符，必须以字母或数字开头并结尾，整个域名总长不超过 255 个字符，域名不区分大小写。美国不使用国家代码作第 1 级域名，其他国家一般采用国家代码（如 cn、uk）作为第 1 级域名。域名系统采用树状结构命名域名；域名中的“点”与点分十进制 IP 地址中的“点”不是一一对应关系。

域名系统（DNS）是把域名翻译成 IP 地址的软件；域名服务器是运行域名系统软件的一台服务器，每个 ISP 或校园网都有一个域名服务器，用于实现入网主机域名与 IP 地址的转换。$kp$, section = '' where id = 25266;
update t_knowledge_point set title = $kp$域名与DNS$kp$, content = $kp$互联网的域名作为 IP 地址的文字表示，便于记忆和使用。可以按 IP 地址访问主机，也可以按域名访问主机。一个 IP 地址可对应多个域名，一个域名只能对应一个 IP 地址（同一时间一个域名只解析到一个 IP 地址）。域名格式为：5 级域名.4 级域名.3 级域名.2 级域名.顶级域名。

域名命名规则：一个完整的域名长度不超过 255 个字符，以字母或数字开头并结尾，可以出现字母、数字和连字符。顶级域名包括国际顶级域名 int（国际组织）、国家顶级域名（cn 中国、uk 英国、us 美国）和通用顶级域名（com 营利性组织、net 网络服务机构、org 非营利性组织、gov 政府、mil 军事）。我国二级域名规定：机构类别域名有 ac 科研机构、com 企业、net 网络服务机构、org 非营利性组织、edu 教育机构、gov 政府部门，行政区域域名如 bj 北京、sh 上海、js 江苏。

常见域名类型：com 商业机构、edu 教育科研机构、gov 政府机构、net 网络服务机构、org 非盈利性专业组织、mil 军事机构、firm 公司企业、store 销售类公司企业、web 从事 Web 活动的机构、arts 艺术类机构、rec 娱乐类机构、info 信息服务部门、nom 个人性质、int 具有国际性质的特殊组织。

域名系统（DNS）是将主机域名翻译为主机 IP 地址的软件，是一个分布式数据库系统；域名服务器上存放 Internet 主机的域名与 IP 地址的对应表，是进行域名和与之对应的 IP 地址转换的服务器。域名一般格式为：计算机名.网络名.机构名.最高域名。例如 www.nju.edu.cn 中，www 是 Web 服务器（计算机名称），nju 是南京大学校园网（网络名），edu 是教育科研网（机构名），cn 是中国（最高域名）。

中文域名命名规则：至少包含 1 个汉字，其余部分可包含英文字母（a～z，不区分大小写）、数字（0～9）以及连接符；简繁体只需注册一个；开头和结尾不能有连接符、加号、@、&、空格等非法字符；域名不能是纯英文或数字；连接符不能连续出现、不能单独注册，也不能放在开头和结尾；域名长度转换成 Punycode 后不超过 63 个字符；部分域名不支持中文前缀。

英文域名命名规则：只能使用英文字母（a～z，不区分大小写）、数字（0～9）以及连接符，不支持空格及 !、$、&、? 等字符；连接符不能连续出现、不能单独注册，也不能放在开头和结尾；域名长度不超过 63 个字符。$kp$, section = '' where id = 25490;
update t_knowledge_point set title = $kp$IP地址的基本概念$kp$, content = $kp$互联网中通信根据计算机的 IP 地址，局域网（以太网）中通过计算机的 MAC 地址。IP 地址格式包含网络号和主机号两个部分。$kp$, section = '' where id = 25956;
update t_knowledge_point set title = $kp$IP地址的分类与IPv4长度$kp$, content = $kp$根据 IP 地址的表示位数，分为 IPv4 和 IPv6；根据获取方式，分为静态 IP（固定）和动态获取 IP（DHCP）。IPv4 地址有 32 位，4 个字节，理论上最多可以分配 2^32 个地址。$kp$, section = '' where id = 25957;
update t_knowledge_point set title = $kp$IP五类地址与特殊地址$kp$, content = $kp$五类地址：A 类类型号 0，首字节 1～126，网络数 2^7-2=126，最大主机数 2^24-2（约 1600 万），用于大型网络；B 类类型号 10，首字节 128～191，网络数 2^14，最大主机数 2^16-2=65534，用于中型网络；C 类类型号 110，首字节 192～223，网络数 2^21，最大主机数 2^8-2=254，用于小型网络；D 类类型号 1110，为组播地址；E 类类型号 1111，备用。

A 类网的网络号全为 0 表示 Internet；网络号全为 1 表示回送地址（环回测试）127.0.0.0。A、B、C 三类 IP 地址中，主机地址全为 0 表示所在子网的网络号，主机地址全为 1 表示广播地址。$kp$, section = '' where id = 25959;
update t_knowledge_point set title = $kp$IPv4与IPv6地址格式及分类$kp$, content = $kp$IPv4 是互联网协议的第四版，也是第一个被广泛使用、构成现今互联网技术基础协议的版本。IPv4 地址形如 A.B.C.D，为 32 位，用“.”分成四段，用十进制表示。IPv6 地址形如 XXXX:XXXX，为 128 位，用“:”分成 8 段，每个 X 是一个十六进制数（16=2^4），地址空间相对 IPv4 有了极大扩充。

IPv4 把 IP 地址分为五类：A 类最高位为 0，网络地址 7 位、主机地址 24 位，范围 0.0.0.0～127.255.255.255，其中 0 段和 127 段不可用；B 类最高两位为 10，网络地址 14 位、主机地址 16 位，范围 128.0.0.0～191.255.255.255；C 类最高三位为 110，网络地址 21 位、主机地址 8 位，范围 192.0.0.0～223.255.255.255；D 类最高四位为 1110，为多目的广播地址（28 位），范围 224.0.0.0～239.255.255.255；E 类最高五位为 11110，保留用于实验和将来使用，范围 240.0.0.0～247.255.255.255。

IPv6 是互联网协议的第六版，是 IETF（互联网工程任务组）设计的用于替代现行 IPv4 的下一代协议。$kp$, section = '' where id = 26767;
update t_knowledge_point set title = $kp$A、B、C三类网络的划分$kp$, content = $kp$A 类类型号 0 开头，首字节 1～126，网络数 2^7-2=126，最大主机数 2^24-2（约 1600 万），用于大型网络；B 类 10 开头，首字节 128～191，网络数 2^14，最大主机数 2^16-2=65534，用于中型网络；C 类 110 开头，首字节 192～223，网络数 2^21，最大主机数 2^8-2=254，用于小型网络。$kp$, section = '' where id = 27073;
update t_knowledge_point set title = $kp$A类网络号全0表示因特网$kp$, content = $kp$A 类网的网络号全为 0 表示因特网自身。$kp$, section = '' where id = 27074;
update t_knowledge_point set title = $kp$A类网络号全1为回送地址$kp$, content = $kp$A 类网的网络号全为 1 表示回送地址（环回测试）127.0.0.0，前八位为 01111111。$kp$, section = '' where id = 27075;
update t_knowledge_point set title = $kp$IP地址一般指IPv4$kp$, content = $kp$IP 地址有 IPv4 和 IPv6 两种，直接说 IP 地址一般指的是 IPv4。$kp$, section = '' where id = 27157;
update t_knowledge_point set title = $kp$IPv4与IPv6的地址长度$kp$, content = $kp$IPv4 地址有 32 位，4 个字节；IPv6 地址有 128 位，16 个字节。$kp$, section = '' where id = 27158;
update t_knowledge_point set title = $kp$IPv6支持地址自动配置$kp$, content = $kp$IPv6 支持地址的自动配置。$kp$, section = '' where id = 27378;
update t_knowledge_point set title = $kp$IP地址的分类与三类网络参数$kp$, content = $kp$局域网中传播信息根据的是计算机的 MAC 地址。IP 地址分为静态（固定，单位内使用）和动态（家庭上网，由 DHCP 服务器分配）。IP 地址 = 网络类型号 + 网络号 + 主机号。A、B、C 三类网络的参数如下：A 类 0 开头，首字节 1～126，网络数 2^7-2=126，最大主机数约 1600 万，大型网络；B 类 10 开头，首字节 128～191，网络数 2^14，最大主机数 65534，中型网络；C 类 110 开头，首字节 192～223，网络数 2^21，最大主机数 254，小型网络。$kp$, section = '' where id = 27379;
update t_knowledge_point set title = $kp$A类网络号全0的含义$kp$, content = $kp$A 类网的网络号全为 0 表示因特网自身。$kp$, section = '' where id = 27380;
update t_knowledge_point set title = $kp$回送地址127.0.0.0$kp$, content = $kp$A 类网的网络号全为 1 表示回送地址（环回测试）127.0.0.0，前 8 位为 01111111。$kp$, section = '' where id = 27381;
update t_knowledge_point set title = $kp$子网掩码与IP地址逻辑乘$kp$, content = $kp$子网掩码和 IP 地址进行逻辑乘，可以得到网络号。$kp$, section = '' where id = 27382;
update t_knowledge_point set title = $kp$默认子网掩码与私有地址$kp$, content = $kp$三类 IP 地址的默认子网掩码：A 类 255.0.0.0，B 类 255.255.0.0，C 类 255.255.255.0。

私有 IP 地址只用于局域网，不用于互联网：10.0.0.0～10.255.255.255，172.16.0.0～172.31.255.255，192.168.0.0～192.168.255.255。$kp$, section = '' where id = 27383;
update t_knowledge_point set title = $kp$NAT网络地址转换的作用$kp$, content = $kp$NAT（网络地址转换）用于多台主机共用一个公用 IP 地址访问互联网的场合，是目前有效解决 IP 地址紧张的一种方法。$kp$, section = '' where id = 27384;
update t_knowledge_point set title = $kp$DHCP动态主机配置协议$kp$, content = $kp$DHCP：动态主机配置协议，用于为网络中的客户机自动分配 IP 地址等配置参数。$kp$, section = '' where id = 27386;
update t_knowledge_point set title = $kp$域名总长度不超过255字符$kp$, content = $kp$域名的总长度不超过 255 个字符。$kp$, section = '' where id = 27390;
update t_knowledge_point set title = $kp$域名中www的含义与子域数量$kp$, content = $kp$域名中的 www 表示主机名；域名由若干子域组成，子域个数通常不超过 5 个。$kp$, section = '' where id = 27391;
update t_knowledge_point set title = $kp$服务器才需要域名$kp$, content = $kp$普通用户的主机通常不需要域名，只有提供网站等服务的服务器才使用域名。$kp$, section = '' where id = 27392;
update t_knowledge_point set title = $kp$按IP地址或域名访问主机$kp$, content = $kp$用户可以按 IP 地址访问主机，也可按域名访问主机。$kp$, section = '' where id = 27393;
update t_knowledge_point set title = $kp$一台主机通常只有一个IP地址$kp$, content = $kp$一台主机通常只有一个 IP 地址，但可以有多个域名。$kp$, section = '' where id = 27394;
update t_knowledge_point set title = $kp$IP地址与域名不是一一对应$kp$, content = $kp$一个 IP 地址可以对应多个域名，但一个域名只能对应一个 IP 地址，两者不是一一对应关系。$kp$, section = '' where id = 27395;
update t_knowledge_point set title = $kp$IP地址的组成$kp$, content = $kp$IP 地址 = 网络类型号 + 网络号 + 主机号。$kp$, section = '' where id = 27485;
update t_knowledge_point set title = $kp$A、B、C三类IP地址参数表$kp$, content = $kp$A 类以 0 开头，首字节 1～126，网络数 2^7-2=126，最大主机数 2^24-2（约 1600 万），大型网络；B 类以 10 开头，首字节 128～191，网络数 2^14，最大主机数 2^16-2=65534，中型网络；C 类以 110 开头，首字节 192～223，网络数 2^21，最大主机数 2^8-2=254，小型网络。$kp$, section = '' where id = 27486;
update t_knowledge_point set title = $kp$A类IP地址网络号全0的含义$kp$, content = $kp$A 类 IP 地址：若网络号全 0，表示因特网自身。$kp$, section = '' where id = 27487;
update t_knowledge_point set title = $kp$A类IP地址的回送地址$kp$, content = $kp$A 类 IP 地址：若网络号全 1，表示回送地址（环回测试）127.0.0.0，前 8 位为 01111111。$kp$, section = '' where id = 27488;
update t_knowledge_point set title = $kp$判断IP地址所属类别$kp$, content = $kp$根据已知 IP 地址判断其属于 A 类、B 类还是 C 类：根据 IP 地址首字节的取值判定所属网络类型。$kp$, section = '' where id = 27489;
update t_knowledge_point set title = $kp$计算三类网络的网络数与主机数$kp$, content = $kp$计算 A、B、C 三类网络的网络数、主机数：按各类地址的网络号位数与主机号位数分别计算。$kp$, section = '' where id = 27490;
update t_knowledge_point set title = $kp$判断IP地址所属网络的主机数$kp$, content = $kp$根据已知 IP 地址判断该 IP 地址所属网络的主机数：先判断给出的 IP 地址属于哪一类，再计算主机数。$kp$, section = '' where id = 27491;
update t_knowledge_point set title = $kp$IPv4地址为32位$kp$, content = $kp$IPv4 地址有 32 位，4 个字节。$kp$, section = '' where id = 27714;
update t_knowledge_point set title = $kp$IPv6地址为128位$kp$, content = $kp$IPv6 地址有 128 位，16 个字节。$kp$, section = '' where id = 27715;
update t_knowledge_point set title = $kp$IPv6的主要特点$kp$, content = $kp$IPv6 具有更大的地址空间、更好的头部格式、更小的路由表和更高的安全性。$kp$, section = '' where id = 27716;
update t_knowledge_point set title = $kp$IPv6支持协议扩充$kp$, content = $kp$IPv6 允许对协议进行扩充。$kp$, section = '' where id = 27717;
update t_knowledge_point set title = $kp$IPv6支持自动配置$kp$, content = $kp$IPv6 加入了对地址自动配置的支持。$kp$, section = '' where id = 27718;
update t_knowledge_point set title = $kp$A类私有地址范围$kp$, content = $kp$A 类私有地址范围：10.0.0.0～10.255.255.255。$kp$, section = '' where id = 27719;
update t_knowledge_point set title = $kp$B类私有地址范围$kp$, content = $kp$B 类私有地址范围：172.16.0.0～172.31.255.255。$kp$, section = '' where id = 27720;
update t_knowledge_point set title = $kp$C类私有地址范围$kp$, content = $kp$C 类私有地址范围：192.168.0.0～192.168.255.255。$kp$, section = '' where id = 27721;
update t_knowledge_point set title = $kp$使用IPv6解决地址紧张$kp$, content = $kp$解决 IPv4 地址紧张的方法之一是使用 128 位的 IPv6。$kp$, section = '' where id = 27722;
update t_knowledge_point set title = $kp$域名字符的使用规则$kp$, content = $kp$域名使用的字符只能是字母、数字和连字符，但必须以字母或数字开头并结尾。$kp$, section = '' where id = 27723;
update t_knowledge_point set title = $kp$IP地址一般指IPv4格式$kp$, content = $kp$IP 地址有 IPv4 和 IPv6 两种格式，直接说 IP 地址一般指的是 IPv4 格式的 IP 地址。$kp$, section = '' where id = 27989;
update t_knowledge_point set title = $kp$IPv4与IPv6地址长度对比$kp$, content = $kp$IPv4 地址有 32 位，4 个字节；IPv6 地址有 128 位，16 字节。$kp$, section = '' where id = 27990;
update t_knowledge_point set title = $kp$判断IP地址是否合法$kp$, content = $kp$判断 IP 地址的合法性：IP 地址分为四段，每段的取值范围在 0～255 之间。$kp$, section = '' where id = 27991;
update t_knowledge_point set title = $kp$IPv6的优点$kp$, content = $kp$IPv6 具有更大的地址空间、更好的头部格式、更小的路由表和更高的安全性。$kp$, section = '' where id = 28187;
update t_knowledge_point set title = $kp$IPv6允许协议扩充$kp$, content = $kp$IPv6 允许对协议进行扩充。$kp$, section = '' where id = 28188;
update t_knowledge_point set title = $kp$局域网与因特网传播信息的依据$kp$, content = $kp$局域网传播信息根据计算机的 MAC 地址，因特网传播信息根据计算机的 IP 地址。$kp$, section = '' where id = 28189;
update t_knowledge_point set title = $kp$静态IP与动态IP$kp$, content = $kp$IP 地址分为静态（固定，单位内使用）和动态（家庭上网，由 DHCP 服务器分配）两类。$kp$, section = '' where id = 28190;
update t_knowledge_point set title = $kp$IP地址的组成与三类网络$kp$, content = $kp$IP 地址 = 网络类型号 + 网络号 + 主机号。A 类 0 开头，首字节 1～126，网络数 126，最大主机数约 1600 万，大型网络；B 类 10 开头，首字节 128～191，网络数 2^14，最大主机数 65534，中型网络；C 类 110 开头，首字节 192～223，网络数 2^21，最大主机数 254，小型网络。$kp$, section = '' where id = 28191;
update t_knowledge_point set title = $kp$A类网络号全0即因特网标识$kp$, content = $kp$A 类网的网络号全为 0 表示因特网自身。$kp$, section = '' where id = 28192;
update t_knowledge_point set title = $kp$A类网络号全1即回送地址$kp$, content = $kp$A 类网的网络号全为 1 表示回送地址（环回测试）127.0.0.0，前八位为 01111111。$kp$, section = '' where id = 28193;
update t_knowledge_point set title = $kp$子网掩码中1与0的含义$kp$, content = $kp$子网掩码是一个 32 位的代码，其中 1 对应网络号，0 对应主机号。$kp$, section = '' where id = 28194;
update t_knowledge_point set title = $kp$私有IP地址范围$kp$, content = $kp$私有 IP 地址只用于局域网，不用于互联网：10.0.0.0～10.255.255.255，172.16.0.0～172.31.255.255，192.168.0.0～192.168.255.255。$kp$, section = '' where id = 28195;
update t_knowledge_point set title = $kp$NAT解决IP地址紧张$kp$, content = $kp$NAT（网络地址转换）用于多台主机共用一个公用 IP 地址访问互联网的场合，是目前有效解决 IP 地址紧张的一种方法。$kp$, section = '' where id = 28196;
update t_knowledge_point set title = $kp$路由器端口IP与所连网络一致$kp$, content = $kp$当路由器某端口连接一个物理网络时，该端口的 IP 地址其网络号必须与所连接物理网络的网络号相同。$kp$, section = '' where id = 28202;
update t_knowledge_point set title = $kp$三类IP地址的默认子网掩码$kp$, content = $kp$三类 IP 地址的默认子网掩码：A 类 255.0.0.0，B 类 255.255.0.0，C 类 255.255.255.0。$kp$, section = '' where id = 28234;
update t_knowledge_point set title = $kp$特殊IP地址的四种情形$kp$, content = $kp$特殊 IP 地址：① A 类网的网络号全 0 表示因特网，前八位为 00000000；② A 类网的网络号全 1 表示测试地址 127.0.0.0，前八位为 01111111；③ A、B、C 三类 IP 地址中主机地址全为 0 表示主机所在子网；④ A、B、C 三类 IP 地址中主机地址全为 1 表示广播地址。$kp$, section = '' where id = 28326;
update t_knowledge_point set title = $kp$域名长度不超过255字符$kp$, content = $kp$域名长度不得超过 255 个字符。$kp$, section = '' where id = 28327;
update t_knowledge_point set title = $kp$A、B、C三类网络的结构$kp$, content = $kp$A 类 0 开头，网络号 7 位、主机号 24 位，首字节 1～126，网络数 126，最大主机数约 1600 万；B 类 10 开头，网络号 14 位、主机号 16 位，首字节 128～191，网络数 2^14，最大主机数 65534；C 类 110 开头，网络号 21 位、主机号 8 位，首字节 192～223，网络数 2^21，最大主机数 254。$kp$, section = '' where id = 28341;
update t_knowledge_point set title = $kp$判断IP地址合法性$kp$, content = $kp$判断 IP 地址是否合法：地址由四段十进制数组成，各段之间用小数点分隔，每段取值在 0～255 之间。$kp$, section = '' where id = 28377;
update t_knowledge_point set title = $kp$三类IP地址对应的子网掩码$kp$, content = $kp$A 类地址默认子网掩码 255.0.0.0，B 类 255.255.0.0，C 类 255.255.255.0。$kp$, section = '' where id = 28380;
update t_knowledge_point set title = $kp$主机IP地址与域名的对应关系$kp$, content = $kp$一台主机通常只有一个 IP 地址，但可以有多个域名；一个域名只能对应一个 IP 地址，而一个 IP 地址可以对应多个域名。$kp$, section = '' where id = 28403;
update t_knowledge_point set title = $kp$IP数据报中的地址与转发$kp$, content = $kp$IP 数据报头部包含该数据报发送方和接收方的 IP 地址，路由器根据接收方（目的）IP 地址进行转发。网络中的每台计算机都安装有网卡。$kp$, section = '' where id = 28531;
update t_knowledge_point set title = $kp$IP地址是逻辑地址$kp$, content = $kp$IP 地址是逻辑地址，可以更改。以太网中主机间通信通过 MAC 地址进行识别。$kp$, section = '' where id = 28532;
update t_knowledge_point set title = $kp$主机号全0和全1地址不可分配$kp$, content = $kp$主机号全 0 和全 1 的 IP 地址虽然合法，但不能分配给主机使用。一个 IP 地址可以对应多个域名。$kp$, section = '' where id = 28533;
update t_knowledge_point set title = $kp$一个IP地址可对应多个域名$kp$, content = $kp$一个 IP 地址可以对应多个域名，但一个域名只能对应一个 IP 地址。$kp$, section = '' where id = 28534;
update t_knowledge_point set title = $kp$IP地址的表示与唯一性$kp$, content = $kp$IP 地址是 32 位二进制数，采用点分十进制表示，每段取值范围在 0～255 之间。在 Internet 中，每台入网的计算机必须有一个惟一的标识，该标识就是 IP 地址。$kp$, section = '' where id = 28546;
update t_knowledge_point set title = $kp$IPv4地址的位数与字节数$kp$, content = $kp$IPv4 地址有 32 位，4 个字节。$kp$, section = '' where id = 28578;
update t_knowledge_point set title = $kp$IPv6地址的位数与字节数$kp$, content = $kp$IPv6 地址有 128 位，16 字节。$kp$, section = '' where id = 28579;
update t_knowledge_point set title = $kp$IPv6的地址自动配置$kp$, content = $kp$IPv6 加入了对地址自动配置的支持。$kp$, section = '' where id = 28580;
update t_knowledge_point set title = $kp$解决IPv4地址紧张的方法$kp$, content = $kp$解决 IPv4 地址紧张的方法包括使用 128 位的 IPv6、采用网络地址转换（NAT）等。$kp$, section = '' where id = 28581;
update t_knowledge_point set title = $kp$使用IPv6缓解地址紧张$kp$, content = $kp$使用 128 位的 IPv6 可以缓解 IPv4 地址紧张的问题。$kp$, section = '' where id = 28582;
update t_knowledge_point set title = $kp$NAT网络地址转换$kp$, content = $kp$NAT（网络地址转换）用于多台主机共用一个公用 IP 地址访问互联网的场合，是目前有效解决 IP 地址紧张的一种方法。$kp$, section = '' where id = 29193;
update t_knowledge_point set title = $kp$IP地址的唯一性$kp$, content = $kp$TCP/IP 网络中，为了实现计算机相互通信，必须为每一台主机分配一个唯一的地址（IP 地址）。唯一性指一个 IP 地址不会同时分配给多台计算机使用；IP 数据报头部包含该数据报发送方和接收方的 IP 地址。总之，IP 地址是 IP 网络中的计算机地址。$kp$, section = '' where id = 29210;
update t_knowledge_point set title = $kp$IP地址的组成与分配机构$kp$, content = $kp$IP 地址由三部分组成：地址类型号；网络号（net-id），即主机所从属的物理网络的编号；主机号（host-id），即主机在物理网络中的编号。注意：授权机构（互联网络信息中心）只是分配类型号和网络号。$kp$, section = '' where id = 29211;
update t_knowledge_point set title = $kp$A、B、C类地址的适用规模$kp$, content = $kp$A 类地址用于拥有大量主机的超大型网络，IP 地址数量最大；B 类地址用于主机规模适中的网络；C 类地址用于主机规模较小的网络，最多只能连接 254 台主机。$kp$, section = '' where id = 29212;
update t_knowledge_point set title = $kp$用代理服务器缓解地址不足$kp$, content = $kp$IP 地址不足时，安装代理服务器动态分配 IP 地址，可使多台计算机在需要时都能接入因特网。$kp$, section = '' where id = 29213;
update t_knowledge_point set title = $kp$MAC地址与IP地址的比较$kp$, content = $kp$MAC 地址与 IP 地址之间并没有必然的联系。MAC 地址适用于局域网，工作在数据链路层，是物理地址（类似身份证号）；IP 地址适用于因特网，工作在网络层，是逻辑地址（类似邮编）。ARP（地址解析协议）用于把 IP 地址转换为主机的 MAC 地址。$kp$, section = '' where id = 29214;
update t_knowledge_point set title = $kp$IP地址与域名的关系$kp$, content = $kp$按 IP 地址和域名都可访问主机；一个 IP 地址可对应多个域名，一个域名只能对应一个 IP 地址；主机从一个物理网络移到另一个网络时，其 IP 地址必须更换，但可以保留原来的域名。$kp$, section = '' where id = 29216;
update t_knowledge_point set title = $kp$域名的层次化结构$kp$, content = $kp$域名采用层次化结构：每个域又划分为若干子域，子域又分成许多子域，所有入网主机的名字由一系列“域”及其“子域”组成，子域个数通常不超过 5 个，子域之间用“.”分隔，从左到右级别逐级升高（如 edu 教育、cn 中国）。域名使用的字符可以是字母、数字和连字符，但必须以字母或数字开头并结尾，整个域名总长不得超过 255 个字符。$kp$, section = '' where id = 29217;
update t_knowledge_point set title = $kp$域名系统DNS的定义$kp$, content = $kp$域名系统 DNS（Domain Name System）是把域名翻译成 IP 地址的软件。$kp$, section = '' where id = 29218;
update t_knowledge_point set title = $kp$域名服务器的作用$kp$, content = $kp$域名服务器（Domain Name Server）存放所在网络中全部主机的域名和 IP 地址的对照表，用于实现域名与 IP 地址的转换。$kp$, section = '' where id = 29219;
update t_knowledge_point set title = $kp$子网主机数与网络数的计算$kp$, content = $kp$可连接的主机数为 2^8-2=254 台。例：192.168.1.5/26，主机位数为 32-26=6，主机数为 2^6-2=62 台。例：IP 地址 192.168.1.5、子网掩码 255.255.255.224，224 的二进制为 11100000，网络位数 24+3=27，主机位数 32-27=5，主机数为 2^5-2=30 台。例：子网掩码 255.0.0.0 为 A 类掩码，网络位数 8 位、主机位数 24 位，全世界可有 2^7-2=126 个 A 类网络；B 类为 16 位网络号加 16 位主机号，C 类为 24 位网络号加 8 位主机号。类型号：A 为 0，B 为 10，C 为 110。$kp$, section = '' where id = 29233;
update t_knowledge_point set title = $kp$IPv4地址的组成$kp$, content = $kp$采用 IPv4 协议的 IP 地址使用 32 个二进制位、4 个十进制数来表示；IP 地址 = 类型号 + 网络号 + 主机号。$kp$, section = '' where id = 29283;
update t_knowledge_point set title = $kp$每个网段不可分配的地址$kp$, content = $kp$IP 地址的每个网段内均有 2 个地址从不分配使用：主机号全为 0 的网络地址和主机号全为 1 的直接广播地址。$kp$, section = '' where id = 29284;
update t_knowledge_point set title = $kp$域名的级别与层次$kp$, content = $kp$Internet 使用域名来定位每一台主机，域名最多分为 5 个级别，从左到右级别逐渐升高。$kp$, section = '' where id = 29288;
update t_knowledge_point set title = $kp$常见的顶级域名$kp$, content = $kp$常见的顶级域名有：cn（中国）、uk（英国）、de（德国）、jp（日本）、fr（法国）、kr（韩国）、ru（俄罗斯）、au（澳大利亚），以及 com（商业机构）、net（网络组织）、org（非盈利组织）、gov（政府）、edu（教育）、mil（军事）、int（国际组织）、ac（科研机构）、biz（商业公司）等。$kp$, section = '' where id = 29289;
update t_knowledge_point set title = $kp$主机IP地址与域名的关系$kp$, content = $kp$1 台主机通常只有一个 IP 地址，但可以有多个域名；域名一般不变，IP 地址可以更换。$kp$, section = '' where id = 29290;
update t_knowledge_point set title = $kp$上网主机的IP地址可能变化$kp$, content = $kp$正在连接上网的主机在一段时间内，并不一定只使用一个 IP 地址，有可能要不断变更 IP 地址。$kp$, section = '' where id = 29291;
update t_knowledge_point set title = $kp$特殊IP地址与私有地址$kp$, content = $kp$回送地址为 127.0.0.0（前 8 位为 01111111）。主机号全为 0 表示一个子网（网络地址）；主机号全为 1 表示广播地址。

私有地址：A 类 10.0.0.0～10.255.255.255，B 类 172.16.0.0～172.31.255.255，C 类 192.168.0.0～192.168.255.255。$kp$, section = '' where id = 29321;
update t_knowledge_point set title = $kp$网络地址、广播地址与私有地址举例$kp$, content = $kp$127.0.0.1 为回送地址。主机号全为 0 的地址表示一个网络或一个子网，例如 A 类 61.0.0.0、B 类 161.1.0.0、C 类 221.6.4.0。主机号全为 1 的地址表示广播地址，例如 A 类 61.255.255.255、B 类 161.1.255.255、C 类 221.6.4.255。私有地址不能直接连接到 Internet，必须通过代理，主要用于局域网：A 类 10.0.0.0～10.255.255.255，B 类 172.16.0.0～172.31.255.255，C 类 192.168.0.0～192.168.255.255。$kp$, section = '' where id = 29330;
update t_knowledge_point set title = $kp$DNS与域名空间结构$kp$, content = $kp$域名解析系统 DNS 负责在域名与 IP 地址之间进行转换。域名空间为树状结构：根域下是一级域名，如 com（商业）、net（网络服务商）、int（国际组织）、gov（政府）、edu（教育）、org（非营利组织）、mil（军方）、cn（中国）等。一个 IP 地址可以对应多个域名，但每个域名只能解析为一个 IP 地址；服务器从一个网络移动到另一个网络时 IP 地址必须改变，但域名不变；每台主机可以设置多个 IP 地址，但一般只设置一个。$kp$, section = '' where id = 29331;
update t_knowledge_point set title = $kp$IP地址与DNS的配置入口$kp$, content = $kp$在 Windows 中配置 IP 地址和 DNS 服务器：从控制面板或“设置”打开“网络和 Internet”设置，进入相应连接的属性，选择“Internet 协议版本 4 (TCP/IPv4)”，即可设置 IP 地址、子网掩码、默认网关和 DNS 服务器地址。$kp$, section = '' where id = 29395;
update t_knowledge_point set title = $kp$Linux网卡配置文件ifcfg$kp$, content = $kp$Linux 网卡配置文件位于 /etc/sysconfig/network-scripts/ 目录，通常为 ifcfg-ens33。文件中 TYPE 表示网络类型（Ethernet），BOOTPROTO 表示引导协议（dhcp 自动获取、static 静态、none 不指定），NAME 为网卡名称，UUID 为唯一标识号，DEVICE 为设备名称，ONBOOT 表示是否开机自启（yes 启用）。配置静态 IP 时还需设置 IPADDR、NETMASK、GATEWAY、DNS1、DNS2。注意：选项名必须大写，小写虽不报错但不生效，参数值可以小写。$kp$, section = '' where id = 29402;
update t_knowledge_point set title = $kp$VMware中查看DHCP地址范围$kp$, content = $kp$在 VMware 虚拟网络编辑器的 DHCP 设置中可查看地址分配范围：子网 IP 为 192.168.177.0，子网掩码 255.255.255.0，DHCP 分配的本地 IP 地址范围为 192.168.177.128～192.168.177.254。$kp$, section = '' where id = 29403;
update t_knowledge_point set title = $kp$NAT网关与静态IP配置$kp$, content = $kp$VMware 的 NAT 设置中，子网掩码为 255.255.255.0，网关 IP 为 192.168.177.2。配置静态 IP 时，将网卡配置文件中的 BOOTPROTO 改为 static，并添加 IPADDR=192.168.177.129、NETMASK=255.255.255.0、GATEWAY=192.168.177.2 以及 DNS1、DNS2 等参数。$kp$, section = '' where id = 29404;
update t_knowledge_point set title = $kp$将IP获取方式改为静态$kp$, content = $kp$将 IP 获取方式修改为静态（static），并将 IP 地址、子网掩码、网关等信息写入或修改网卡配置文件。$kp$, section = '' where id = 29405;
update t_knowledge_point set title = $kp$DNS客户机配置文件$kp$, content = $kp$DNS 客户机配置文件为 /etc/resolv.conf，用于设置 DNS 服务器的 IP 地址及 DNS 域名，还包含主机的域名搜索顺序，由域名解析器（resolver，一个根据主机名解析 IP 地址的库）使用。文件格式很简单，每行以一个关键字开头，后接一个或多个由空格隔开的参数，可以设置多个 DNS 服务器。/etc/resolv.conf 配置的是本地 DNS 服务器，本机访问某个域名时，就向其中配置的 DNS 服务器发起解析请求。$kp$, section = '' where id = 29408;
update t_knowledge_point set title = $kp$主机名应具有描述性$kp$, content = $kp$主机名应该是描述性的，以便在网络上识别计算机的用途、位置、地理区域等。$kp$, section = '' where id = 29410;
update t_knowledge_point set title = $kp$三类网络的参数与位结构$kp$, content = $kp$A 类 0 开头，网络号 7 位、主机号 24 位，首字节 1～126，网络数 126，最大主机数约 1600 万；B 类 10 开头，网络号 14 位、主机号 16 位，首字节 128～191，网络数 2^14，最大主机数 65534；C 类 110 开头，网络号 21 位、主机号 8 位，首字节 192～223，网络数 2^21，最大主机数 254。$kp$, section = '' where id = 29437;
update t_knowledge_point set title = $kp$子网掩码的定义与作用$kp$, content = $kp$子网掩码是一个 32 位的代码，IP 地址中网络号对应位置处的二进位是 1，与主机号对应位置处的二进位是 0；将子网掩码与 IP 地址进行逻辑乘就能得到网络号。$kp$, section = '' where id = 29438;
update t_knowledge_point set title = $kp$用子网掩码判断是否同子网$kp$, content = $kp$子网掩码用来表示两个 IP 地址是否同属一个子网，从而判断是否需要路由器转发。$kp$, section = '' where id = 29439;
update t_knowledge_point set title = $kp$主机移动时IP地址须更换$kp$, content = $kp$主机从一个物理网络移动到另一个网络时，IP 地址必须更换，但可以保留原来的域名。$kp$, section = '' where id = 29447;
update t_knowledge_point set title = $kp$IP地址的特点与特殊地址$kp$, content = $kp$IP 地址有 32 位，4 个字节，具有唯一性和简明性，由类型号、网络号、主机号组成。如果 IP 地址主机号部分每一位均为 0，则该地址指主机所在的物理网络本身。局域网传播信息根据计算机的 MAC 地址，因特网传播信息根据计算机的 IP 地址。A 类以 0 开头（网络地址 8 位、主机地址 24 位），首字节 1～126，可容纳约 1600 万台主机；B 类以 10 开头（网络地址 16 位、主机地址 16 位），首字节 128～191，可容纳 65534 台主机；C 类以 110 开头（网络地址 24 位、主机地址 8 位），首字节 192～223，可容纳 254 台主机。IP 地址不够时通常设置一个代理服务器。

特殊的 IP 地址：回送地址为 127.0.0.0，前八位为 01111111；子网地址的主机地址部分为全 0；广播地址的主机地址部分为全 1。$kp$, section = '' where id = 29473;
update t_knowledge_point set title = $kp$主机域名与二级域名的含义$kp$, content = $kp$主机从一个物理网络移动到另一个网络时，IP 地址必须更换，但可以保留原来的域名。一个 IP 地址可以对应多个域名，但一个域名只能对应一个 IP 地址。二级域名中，ac 为科研机构，com 为企业，net 为网络服务机构，org 为非营利性组织，edu 为教育机构，gov 为政府部门，mil 为军事机构。美国的域名中没有国家名。域名长度不得超过 255 个字符。$kp$, section = '' where id = 29475;
update t_knowledge_point set title = $kp$入网计算机的唯一标识$kp$, content = $kp$互联网是一个庞大的计算机网络，每一台入网的计算机必须有一个唯一的标识，以便互相通信，该标识就是 IP 地址。$kp$, section = '' where id = 29495;
update t_knowledge_point set title = $kp$C类地址的特征与容量$kp$, content = $kp$C 类地址用于主机数量不超过 254 台的小型网络，其 IP 地址的特征是二进制表示的最高 3 位为 110。$kp$, section = '' where id = 29496;
update t_knowledge_point set title = $kp$IP地址用于区分计算机$kp$, content = $kp$互联网中，每台计算机都必须有一个 IP 地址，以便相互区别，实现计算机之间的通信。$kp$, section = '' where id = 29596;
update t_knowledge_point set title = $kp$按首字节判断地址类别$kp$, content = $kp$按首字节分类：1～126 为 A 类，128～191 为 B 类，192～223 为 C 类。$kp$, section = '' where id = 30114;
update t_knowledge_point set title = $kp$IP地址的四段十进制写法$kp$, content = $kp$IP 地址由四段十进制数组成，各段之间用小数点分隔，写作 A.B.C.D 的形式，例如 128.11.3.31、202.119.36.12。$kp$, section = '' where id = 30115;
update t_knowledge_point set title = $kp$IPv6解决的问题$kp$, content = $kp$IPv6 不仅扩展了 IPv4 的地址空间，还缓解了 IPv4 面临的安全问题、服务质量（QoS）问题和移动计算问题。$kp$, section = '' where id = 30129;
update t_knowledge_point set title = $kp$主机号全0与全1地址的用途$kp$, content = $kp$主机号全 0 和全 1 的 IP 地址虽然合法，但不能分配给主机使用：全 0 为网络地址，表示所在子网；全 1 为广播地址。$kp$, section = '' where id = 30188;
update t_knowledge_point set title = $kp$IPv4与IPv6的位数和字节数$kp$, content = $kp$IPv4 地址有 32 位，4 个字节（每段 0～255）；IPv6 地址有 128 位，16 字节。$kp$, section = '' where id = 30190;
update t_knowledge_point set title = $kp$C类私有地址与默认掩码$kp$, content = $kp$C 类私有地址范围为 192.168.0.0～192.168.255.255。三类 IP 地址的默认子网掩码：A 类 255.0.0.0，B 类 255.255.0.0，C 类 255.255.255.0。$kp$, section = '' where id = 30257;
update t_knowledge_point set title = $kp$远程登录中的FQDN与IP地址$kp$, content = $kp$远程登录的格式为：远程主机上的用户名@远程主机的 IP 地址或 FQDN。FQDN（全限定域名）是同时带有主机名和域名的名称，例如 bigserver.mycompany.com。例如以 root 身份登录 IP 地址为 192.168.0.19 的 Linux 系统，可执行 ssh root@192.168.0.19；首次连接需确认主机密钥，输入 yes 后输入用户口令，登录成功后出现 Shell 提示符。$kp$, section = '' where id = 30259;
update t_knowledge_point set title = $kp$Windows中IPv4与IPv6的配置$kp$, content = $kp$在 Windows 中配置 IP 地址：打开网络设置，单击左侧“以太网”或“WLAN”，再单击右侧“更改适配器选项”，打开对应连接的属性，在列表中选择“Internet 协议版本 4 (TCP/IPv4)”或“Internet 协议版本 6 (TCP/IPv6)”，即可设置为自动获取地址，或手动填写 IP 地址、子网掩码、默认网关和首选/备用 DNS 服务器地址。$kp$, section = '' where id = 31992;
update t_knowledge_point set title = $kp$用ping检查IP地址是否冲突$kp$, content = $kp$输入 ping 本机 IP 地址，可验证本机的 IP 地址是否与网络上其他计算机的地址冲突；如不正常，应更换本机 IP 地址。$kp$, section = '' where id = 32006;
update t_knowledge_point set title = $kp$根据前缀长度求子网掩码$kp$, content = $kp$IP 地址块 10.15.15.136/12 的前缀长度为 12 位，即前 12 位为 1，子网掩码为 255.240.0.0。$kp$, section = '' where id = 32570;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22562,22566,22568,22569,22570,22573,22575,22577,22607,22632,22640,22645,22647,22648,22650,22656,22703,22732,22736,22746,22747,22762,22763,22764,22781,22796,22823,22824,22825,22886,22887,22891,22892,22893,22894,22896,22898,22959,22972,22981,22987,23725,25261,25262,25266,25490,25956,25957,25959,26767,27073,27074,27075,27157,27158,27378,27379,27380,27381,27382,27383,27384,27386,27390,27391,27392,27393,27394,27395,27485,27486,27487,27488,27489,27490,27491,27714,27715,27716,27717,27718,27719,27720,27721,27722,27723,27989,27990,27991,28187,28188,28189,28190,28191,28192,28193,28194,28195,28196,28202,28234,28326,28327,28341,28377,28380,28403,28531,28532,28533,28534,28546,28578,28579,28580,28581,28582,29193,29210,29211,29212,29213,29214,29216,29217,29218,29219,29233,29283,29284,29288,29289,29290,29291,29321,29330,29331,29395,29402,29403,29404,29405,29408,29410,29437,29438,29439,29447,29473,29475,29495,29496,29596,30114,30115,30129,30188,30190,30257,30259,31992,32006,32570) and not deleted) <> 163 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
