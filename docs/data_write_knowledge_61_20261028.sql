-- 知识点 61 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_61
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_61 as
select * from t_knowledge_point where id in (21857,22124,22125,22127,22153,25399,25400,25403,25404,25405,25406,25751,25759,25770,25896,25897,25898,25899,25979,26017,26165,26715,26716,26717,26718,26719,26720,26721,26722,26787,26788,26917,26918,26919,26923,26924,26925,26927,26928,26929,26930,26931,26932,26933,26934,26935,26936,26937,26938,26939,26940,26941,26942,26943,26944,26945,26949,26950,27067,27083,27084,27086,27087,27088,27089,27090,27091,27092,27093,27145,27223,27253,27584,27586,27611,27612,27613,27615,27616,27617,27618,27619,27620,27621,27622,27623,27624,27626,27627,27631,27639,27640,27641,27642,27659,27671,27672,27673,27674,27675,27676,27677,27678,27679,27680,27690,27691,27738,27739,27740,27741,27742,27743,27744,27745,27746,27747,28215,28228,28292,28293,28357,28358,28359,28367,28368,28369,28381,28382,28383,28384,28385,28415,28416,28419,28543,28545,28551,28628,28655,28663,28781,28793,28795,28796,28798,28799,28801,28803,28804,28880,28881,28884,28931,29133,29135,29137,29138,29455,29553,29587,29590,29667,29683,29684,29685,29686,29687,29688,29689,29690,29695,29696,29697,29698,29699,29700,29702,29734,29735,29736,29737,29738,29739,29740,29741,29742,29743,29744,29745,29748,29749,29750,29753,29754,29755,29771,29804,29805,29806,29807,29808,29809,29810,29811,29812,29841,29842,29843,29844,29845,29846,29847,29848,29858,29859,29860,29861,29875,29876,29889,29890,29899,29900,29901,29902,29903,29912,29915,29925,29931,29934,29935,29937,29951,29954,29955,29956,30110,30126,30134,30135,30136,30137,30138,30226,30228,32067,32237);

update t_knowledge_point set title = $kp$存储容量的含义与单位$kp$, content = $kp$存储容量指存储器所包含的存储单元总数。每个存储单元（通常为 1 个字节）都有一个地址，CPU 按地址访问存储器。常用单位有 MB、GB，1 MB = 2^20 字节，1 GB = 2^30 字节。$kp$, section = '' where id = 21857;
update t_knowledge_point set title = $kp$存储与传输单位换算$kp$, content = $kp$存储容量以字节 B 为单位时，K、M、G 之间的进率为 1024（2 的幂）；以比特 b 为单位表示传输速率时，k、M、G 之间的进率为 1000（10 的幂）。B 与 b 之间换算时 1 B = 8 b。

补充：一个汉字通常占 2 字节，英文标点、空格、数字各占 1 字节，中文标点、全角数字各占 2 字节。网速常用 bps，硬件带宽常用 B/s。$kp$, section = '' where id = 22124;
update t_knowledge_point set title = $kp$信息系统安全的基本目标$kp$, content = $kp$信息系统安全通常要求保证信息传输的保密性、数据交换的完整性、发送信息的不可否认性以及交易者身份的确定性。$kp$, section = '' where id = 22125;
update t_knowledge_point set title = $kp$SQL 数值类型的取整规则$kp$, content = $kp$在 SQL 中，向 INT 类型插入浮点数时会四舍五入取整；DECIMAL(M,D) 的 D 表示小数位数，D=0 时没有小数位，同样按四舍五入取整后存放。例如 1.55 存入 INT 列得到 2，存入 DECIMAL(5,0) 列也得到 2。$kp$, section = '' where id = 22127;
update t_knowledge_point set title = $kp$信息表示单位与换算$kp$, content = $kp$位（bit，b）是表示信息的最小单位；字节（Byte，B）是最常用的基本信息单位，1 B = 8 b。字长是计算机一次能处理的二进制位数，常与 CPU 字长相关。

1 KB = 1024 B = 2^10 B，1 MB = 1024 KB，1 GB = 1024 MB，1 TB = 1024 GB；1 kb = 1000 b，1 KB/s = 8 kb/s。$kp$, section = '' where id = 22153;
update t_knowledge_point set title = $kp$十进制小数转二进制$kp$, content = $kp$十进制小数转二进制采用乘 2 取整法：每次将小数部分乘以 2，取出整数部分（0 或 1），再用余下的小数部分继续乘 2，直到小数部分为 0 或达到所需精度；将取出的整数按先后顺序排列即为二进制小数。

例如 0.6875 × 2 依次得到 1、0、1、1，所以 0.6875 = 0.1011B。二进制转十进制时，整数和小数分别按位权求和。$kp$, section = '' where id = 25399;
update t_knowledge_point set title = $kp$进制转换与 BCD 码$kp$, content = $kp$常用 2 的幂：2^7 = 128，2^8 = 256，2^9 = 512，2^10 = 1024 = 1K。

常用二进制小数：0.1 = 0.5，0.01 = 0.25，0.11 = 0.75，0.001 = 0.125，0.011 = 0.375，0.101 = 0.625，0.111 = 0.875。

八进制与二进制：1 位八进制对应 3 位二进制，整数部分从低位向高位每 3 位一组，小数部分从高位向低位每 3 位一组，不足补 0。

十六进制与二进制：1 位十六进制对应 4 位二进制，分组规则同上。

BCD 码：用 4 位二进制表示 1 位十进制数 0～9，最常用的是 8421 码；还有 2421 码（有权）和余 3 码（无权）。8421 码与十进制数 0～9 对应 0000～1001。

有限十进制小数转其他进制时不一定能精确转换；二进制、八进制、十六进制之间可以精确互转。$kp$, section = '' where id = 25400;
update t_knowledge_point set title = $kp$补码中最大负数的求法$kp$, content = $kp$在 8 位补码中，用 4 个 1 和 4 个 0 组成最大负整数时，应让符号位为 1，其余高位尽量排 1、低位排 0，得到补码 11110000。再对其求补得到原码 10010000，真值为 -16，所以最大负整数是 -16。$kp$, section = '' where id = 25403;
update t_knowledge_point set title = $kp$补码中最大正整数与最小数$kp$, content = $kp$用 4 个 1 和 4 个 0 组成 8 位补码时：最大正整数应让符号位为 0，其余高位排 1、低位排 0，得 01111000，即 120；最小无符号数应让高位排 0、低位排 1，得 00001111，即 15；最小负整数应让符号位为 1，中间排 0、低位排 1，得 10000111，求补得原码 11111001，真值为 -121。$kp$, section = '' where id = 25404;
update t_knowledge_point set title = $kp$补码中最小正整数与取值范围$kp$, content = $kp$用 4 个 1 和 4 个 0 组成 8 位补码时，最小正整数应让符号位为 0，其余高位排 0、低位排 1，得 00001111，即 15。

n 位补码的表示范围是 -2^(n-1)～2^(n-1)-1，负数最小值的绝对值比正数最大值大 1。$kp$, section = '' where id = 25405;
update t_knowledge_point set title = $kp$IEEE 754 单精度浮点数$kp$, content = $kp$IEEE 754 单精度浮点数共 32 位：1 位数符 S、8 位阶码 E、23 位尾数。数符 0 表示正、1 表示负；阶码采用移码，E = e + 127；尾数隐含最高位 1，实际精度为 24 位。

例如 -0.5 = -1.0 × 2^-1，数符为 1，阶码 E = -1 + 127 = 126 = 01111110，尾数为全 0，所以其二进制表示为 1 01111110 00000000 00000000 00000000。$kp$, section = '' where id = 25406;
update t_knowledge_point set title = $kp$C 语言常量与书写风格$kp$, content = $kp$推荐性书写规则：及时书写和修改注释，注释简明扼要并放在恰当位置；同一层次的语句同列开始，下一层次语句缩进并合理使用花括号；意义相近的语句可写在同一行；同一语句的不同成分之间用空格隔开。复合语句可采用 K&R、Allman、Whitesmiths 或 GNU 缩进风格。

整型常量可用八进制（前导 0）、十进制、十六进制（前导 0x）表示，并可加 u、l、ul 等后缀；八进制每位只能为 0～7，十六进制每位为 0～9、A～F。

实型常量可用小数形式或指数形式表示，指数形式要求 E 前后都有数字且 E 后为整数；float 占 4 字节，double 占 8 字节。

字符常量用单引号括起，'0'、'A'、'a' 的 ASCII 码分别为 48、65、97；字符串常量用双引号括起；符号常量可用 #define、enum 或 const 定义。C 语言没有字符串变量，存放字符串使用字符数组。$kp$, section = '' where id = 25751;
update t_knowledge_point set title = $kp$字符串比较函数 strcmp$kp$, content = $kp$strcmp(s1, s2) 按字符的 ASCII 码值逐个比较两个字符串：相等返回 0，s1 大于 s2 返回大于 0 的值，s1 小于 s2 返回小于 0 的值。$kp$, section = '' where id = 25759;
update t_knowledge_point set title = $kp$去除重复记录 DISTINCT$kp$, content = $kp$使用 SELECT DISTINCT 可以去除查询结果中的重复记录。语法为 SELECT DISTINCT * FROM 表名 [[AS] 别名];，例如 SELECT DISTINCT * FROM t_student;。$kp$, section = '' where id = 25770;
update t_knowledge_point set title = $kp$二进制运算与八进制$kp$, content = $kp$二进制算术运算：加法逢 2 进 1，减法借 1 当 2。二进制逻辑运算按位进行：逻辑与全 1 为 1，逻辑或全 0 为 0，逻辑非取反，异或相同为 0、相异为 1；逻辑运算不产生进位，也不会溢出。

八进制每位可取 0～7，逢 8 进 1、借 1 当 8，尾部加 Q 表示。位权为 8 的整数次幂。例如 365.2Q = 3×8^2 + 6×8^1 + 5×8^0 + 2×8^-1 = 245.25。$kp$, section = '' where id = 25896;
update t_knowledge_point set title = $kp$十六进制$kp$, content = $kp$十六进制每位可取 0～9、A～F，逢 16 进 1、借 1 当 16，尾部加 H 表示。位权为 16 的整数次幂。例如 F5.4H = 15×16^1 + 5×16^0 + 4×16^-1 = 245.25。$kp$, section = '' where id = 25897;
update t_knowledge_point set title = $kp$十进制与二进制数的转换$kp$, content = $kp$十进制转二进制：整数部分除 2 逆序取余，小数部分乘 2 顺序取整。有些十进制小数无法精确化为有限二进制小数，只能取近似值，例如 0.63 ≈ 0.10101010…B。例如 29.6875 = 11101.1011B。$kp$, section = '' where id = 25898;
update t_knowledge_point set title = $kp$数值的原码与补码表示$kp$, content = $kp$带符号整数用最高位表示符号，0 表示正、1 表示负，其余位表示数值。原码的数值位是整数绝对值的二进制自然码；正数的原码、反码、补码相同，负数的补码等于其反码加 1。

n 位原码的表示范围是 -(2^(n-1)-1)～2^(n-1)-1；n 位补码的表示范围是 -2^(n-1)～2^(n-1)-1。位数相同时，补码比原码多表示一个最小负数；补码的补码就是原码。$kp$, section = '' where id = 25899;
update t_knowledge_point set title = $kp$汉字区位码与机内码$kp$, content = $kp$GB2312 字符集将汉字排列成 94 行×94 列的二维表，行号称区号、列号称位号，区号和位号各取 1～94，合称区位码。

换算关系：国标码 = 区位码 + 2020H，机内码 = 国标码 + 8080H = 区位码 + A0A0H。若题目给出十进制区位码，应先分别转换为十六进制再计算。

GB2312 只收录简体字，字数较少，缺少繁体字，不能满足人名、地名、古籍整理等需要。$kp$, section = '' where id = 25979;
update t_knowledge_point set title = $kp$简单知识与复杂知识$kp$, content = $kp$简单知识构成相对单一，容易理解和学习，例如单个声母、单个韵母；复杂知识构成较多、变化多、范围广，相对不易理解，例如由声母和韵母组合而成的汉字拼音。$kp$, section = '' where id = 26017;
update t_knowledge_point set title = $kp$二进制与常用进制转换$kp$, content = $kp$十进制小数转二进制用乘 2 取整法，例如 0.6875 = 0.1011B。二进制转十进制时整数和小数分别按位权求和，例如 11101.1011B = 29.6875。

常用二进制小数：0.1 = 0.5，0.01 = 0.25，0.11 = 0.75，0.001 = 0.125，0.011 = 0.375，0.101 = 0.625，0.111 = 0.875。

八进制与二进制按 1 位对 3 位转换，十六进制与二进制按 1 位对 4 位转换；整数部分从低位向高位分组，小数部分从高位向低位分组，不足位数补 0。$kp$, section = '' where id = 26165;
update t_knowledge_point set title = $kp$信息在计算机中的表示$kp$, content = $kp$数值数据在计算机中可用原码、反码、补码表示：原码最高位为符号位，其余位为数的绝对值；正数的反码与原码相同，负数的反码是原码除符号位外各位取反；正数的补码与原码相同，负数的补码是其反码加 1。

非数值数据包括字符、汉字、图像等：字符用二进制编码表示；汉字交换码用于不同系统之间交换汉字信息，我国长期以国标码作为统一汉字信息交换码；图像可看作像素点阵，对每个像素用若干二进制位编码。$kp$, section = '' where id = 26715;
update t_knowledge_point set title = $kp$信息表示单位与 BCD 编码$kp$, content = $kp$信息传递的基本单位是比特（bit），信息存储的基本单位是字节（byte），1 字节 = 8 比特。计算机内部使用二进制表示信息。BCD 是 Binary-Coded Decimal 的缩写，即用二进制编码表示十进制数字。$kp$, section = '' where id = 26716;
update t_knowledge_point set title = $kp$二进制编码与 BCD 表示$kp$, content = $kp$二进制编码只使用 0 和 1。BCD 码用 4 位二进制表示 1 位十进制数，十进制数字 0～9 分别对应 0000～1001。$kp$, section = '' where id = 26717;
update t_knowledge_point set title = $kp$BCD 编码与整数存储$kp$, content = $kp$十进制数 123 用 BCD 码表示为 0001 0010 0011，共 12 位，即 1.5 个字节。

若用 int 存储 123，通常占 4 个字节，内存中的值为 0x0000007B；若用字符串 "123" 存储，每个字符占 1 个字节，共 3 个字节，字符 '1'、'2'、'3' 的 ASCII 码分别为 0x31、0x32、0x33。$kp$, section = '' where id = 26718;
update t_knowledge_point set title = $kp$BCD 编码与字符编码的存储比较$kp$, content = $kp$BCD 码把 1 位十进制数压缩到 4 位二进制中，例如 123 的 BCD 码为 0001 0010 0011，只占 12 位；而字符串 "123" 需要 3 个字节，即 24 位。因此 BCD 码可减少十进制数字在内存中的占用量。$kp$, section = '' where id = 26719;
update t_knowledge_point set title = $kp$二进制与传输速率单位$kp$, content = $kp$二进制只有 0 和 1 两种状态，计算机中的信息最终都转化为二进制。传输速率的常用单位有：bps（每秒比特数）、Bps（每秒字节数）、pps（每秒数据包数），以及 Kbps、Mbps 等。$kp$, section = '' where id = 26720;
update t_knowledge_point set title = $kp$整数编码与实数编码$kp$, content = $kp$整数编码包括原码、反码和补码。原码用最高位表示符号，其余位表示真值的绝对值；正数的反码、补码与原码相同；负数的反码是原码符号位不变、数值位逐位取反，补码是反码最低位加 1。

机器数是将符号数字化的数，是数字在计算机中的二进制表示形式；真值是该数实际的数值。当要表示的数据超出所用编码的表示范围时，会产生溢出。

实数可用二进制编码表示，例如用 6 位编码表示 0～63 的整数。$kp$, section = '' where id = 26721;
update t_knowledge_point set title = $kp$逻辑运算与进制转换$kp$, content = $kp$逻辑与、逻辑或、逻辑非是基本逻辑运算；逻辑运算按位进行，逻辑位运算直接对二进制位操作。

二进制与八进制转换采用“三位并一位”或“一位拆三位”；二进制与十六进制转换采用“四位并一位”或“一位拆四位”。分组时以小数点为界，整数部分从右向左、小数部分从左向右，不足位数补 0。

原码、反码、补码之间可相互转换；补码加法可将减法统一为加法。n 位原码范围为 -(2^(n-1)-1)～2^(n-1)-1，n 位补码范围为 -2^(n-1)～2^(n-1)-1。$kp$, section = '' where id = 26722;
update t_knowledge_point set title = $kp$文本表示与字符编码$kp$, content = $kp$文本表示常用词袋模型和词向量等方法。字符编码是把字符集中的字符映射为指定集合中的对象（如比特模式、自然数序列、字节序列或电脉冲），以便文本在计算机中存储和传输。常见例子有摩斯电码和 ASCII：ASCII 用 7 位二进制对字母、数字和符号编号，通常再补 1 位凑成 1 个字节存储。$kp$, section = '' where id = 26787;
update t_knowledge_point set title = $kp$文本的保存与文件类型$kp$, content = $kp$文本文档通常保存为 .txt 后缀；选择“所有文件”时可以自由修改后缀名。文本文件类型包括 ASCII、MIME 的 text/plain、.txt 等。只含 ASCII 字符的文本文件可在 Unix、Macintosh、Windows、DOS 等系统间交换。.txt 文件包含的格式信息极少，通常指能被系统终端或简单文本编辑器接受的格式。$kp$, section = '' where id = 26788;
update t_knowledge_point set title = $kp$比特的定义$kp$, content = $kp$比特（bit）中文译为“二进位数字”或“位”，只有 0 和 1 两种取值，一般没有大小之分。比特是组成数字信息的最小单位，数值、文字、符号、图像、声音、命令等都可以用比特表示。$kp$, section = '' where id = 26917;
update t_knowledge_point set title = $kp$比特在计算机中的物理表示$kp$, content = $kp$计算机中比特可用不同物理状态表示：CPU 中用电平的高、低；RAM 中用电容的充电、放电；磁盘中用两种不同的磁化状态；光盘上用盘面的凹凸状态。$kp$, section = '' where id = 26918;
update t_knowledge_point set title = $kp$CPU 内部比特的表示$kp$, content = $kp$CPU 内部通常用高电平表示 1，低电平表示 0。$kp$, section = '' where id = 26919;
update t_knowledge_point set title = $kp$存储容量的计量单位$kp$, content = $kp$8 个比特 = 1 个字节（byte，记作 B）。内存容量常用二进制单位：1 KB = 2^10 B = 1024 B，1 MB = 2^20 B = 1024 KB，1 GB = 2^30 B = 1024 MB，1 TB = 2^40 B = 1024 GB。辅助存储器容量有时按十进制计算，例如 1 MB = 10^3 KB = 1000 KB。$kp$, section = '' where id = 26923;
update t_knowledge_point set title = $kp$不同进位制前缀的使用场合$kp$, content = $kp$内存、Cache、半导体存储器芯片的容量使用二进制前缀，例如 512 MB 内存条中的 1 M = 2^20，256 KB 的 Cache 中的 1 K = 2^10。文件和文件夹大小也使用二进制前缀。

频率、传输速率等使用十进制前缀，例如 1 GHz 中的 1 G = 10^9，100 Mbps 中的 1 M = 10^6。辅助存储器（硬盘、光盘、U 盘、存储卡等）厂商标注的容量使用十进制前缀，操作系统显示的容量使用二进制前缀。$kp$, section = '' where id = 26924;
update t_knowledge_point set title = $kp$二进制前缀与 IEC 符号$kp$, content = $kp$十进制前缀 k、M、G、T 分别表示 10^3、10^6、10^9、10^12；对应的二进制前缀为 Ki、Mi、Gi、Ti，分别表示 2^10、2^20、2^30、2^40。由于 2 的幂与 10 的幂并不相等，同一容量用两种前缀表示时数值会有差异。IEC 建议用 Ki、Mi、Gi 等符号表示二进制前缀，部分软件已采用，部分软件仍沿用 K、M、G 表示二进制值。$kp$, section = '' where id = 26925;
update t_knowledge_point set title = $kp$比特的传输速率$kp$, content = $kp$传输速率表示每秒钟可传输的二进位数目，基本单位是比特/秒（b/s，也称 bps）。1 kb/s = 10^3 b/s = 1000 b/s，1 Mb/s = 10^6 b/s = 1000 kb/s，1 Gb/s = 10^9 b/s = 1000 Mb/s，1 Tb/s = 10^12 b/s = 1000 Gb/s。$kp$, section = '' where id = 26927;
update t_knowledge_point set title = $kp$不同进位制数的表示$kp$, content = $kp$数是一种信息，有大小，可以进行四则运算。日常生活中使用十进制数，计算机内部使用二进制数，程序员还常用八进制和十六进制数。不同进位制数的表示方法和数值计算方法不同。$kp$, section = '' where id = 26928;
update t_knowledge_point set title = $kp$十进制数$kp$, content = $kp$十进制数每一位可使用 0～9 十个数字，低位与高位之间逢 10 进 1，各位权值是 10 的整数次幂，基数为 10。十进制数尾部可加 D 表示，或省略不写。$kp$, section = '' where id = 26929;
update t_knowledge_point set title = $kp$二进制数$kp$, content = $kp$二进制数每一位只使用 0 和 1 两个数字，即每位用 1 个比特表示；低位与高位之间逢 2 进 1，各位权值是 2 的整数次幂，基数为 2。二进制数尾部加 B 表示。$kp$, section = '' where id = 26930;
update t_knowledge_point set title = $kp$八进制数$kp$, content = $kp$八进制数每一位使用 0～7 八个数字，低位与高位之间逢 8 进 1，各位权值是 8 的整数次幂，基数为 8，尾部加 Q 表示。例如 365.2Q = 3×8^2 + 6×8^1 + 5×8^0 + 2×8^-1 = 245.25。$kp$, section = '' where id = 26931;
update t_knowledge_point set title = $kp$十六进制数$kp$, content = $kp$十六进制数每一位使用 0～9、A～F 十六个数字和符号，逢 16 进 1，基数为 16，各位权值是 16 的整数次幂，尾部加 H 表示。例如 F5.4H = 15×16^1 + 5×16^0 + 4×16^-1 = 245.25。$kp$, section = '' where id = 26932;
update t_knowledge_point set title = $kp$不同进位制数的比较$kp$, content = $kp$| 十进制 | 二进制 | 八进制 | 十六进制 |
| --- | --- | --- | --- |
| 0 | 0000 | 0 | 0 |
| 1 | 0001 | 1 | 1 |
| 2 | 0010 | 2 | 2 |
| 3 | 0011 | 3 | 3 |
| 4 | 0100 | 4 | 4 |
| 5 | 0101 | 5 | 5 |
| 6 | 0110 | 6 | 6 |
| 7 | 0111 | 7 | 7 |
| 8 | 1000 | 10 | 8 |
| 9 | 1001 | 11 | 9 |
| 10 | 1010 | 12 | A |
| 11 | 1011 | 13 | B |
| 12 | 1100 | 14 | C |
| 13 | 1101 | 15 | D |
| 14 | 1110 | 16 | E |
| 15 | 1111 | 17 | F |$kp$, section = '' where id = 26933;
update t_knowledge_point set title = $kp$不同进制数的相互转换$kp$, content = $kp$不同进制数之间可以相互转换。掌握二进制与十进制的转换后，二进制与八进制、十六进制的转换可以利用 1 位对 3 位、1 位对 4 位的关系完成。$kp$, section = '' where id = 26934;
update t_knowledge_point set title = $kp$十进制数转二进制数$kp$, content = $kp$十进制转二进制时整数和小数分别转换：整数部分除以 2 逆序取余，小数部分乘以 2 顺序取整。例如 29.6875 = 11101.1011B。$kp$, section = '' where id = 26935;
update t_knowledge_point set title = $kp$二进制数转十进制数$kp$, content = $kp$二进制数转十进制时，每一位乘以相应的权值后累加。例如 11101.1011B = 1×2^4 + 1×2^3 + 1×2^2 + 0×2^1 + 1×2^0 + 1×2^-1 + 0×2^-2 + 1×2^-3 + 1×2^-4 = 29.6875。

十进制小数转二进制时可能出现无穷小数，只能取近似值，例如 0.63 ≈ 0.10101010…B。$kp$, section = '' where id = 26936;
update t_knowledge_point set title = $kp$常用 2 的幂与二进制小数$kp$, content = $kp$常用 2 的幂：2^0 = 1，2^1 = 2，2^2 = 4，2^3 = 8，2^4 = 16，2^5 = 32，2^6 = 64，2^7 = 128，2^8 = 256，2^9 = 512，2^10 = 1024。

常用二进制小数：0.1 = 0.5，0.01 = 0.25，0.11 = 0.75，0.001 = 0.125，0.011 = 0.375，0.101 = 0.625，0.111 = 0.875。

n 位二进制无符号整数可表示 2^n 个数，最大值为 2^n-1；例如 8 位可表示 0～255，16 位可表示 0～65535。$kp$, section = '' where id = 26937;
update t_knowledge_point set title = $kp$八进制与二进制数的转换$kp$, content = $kp$1 位八进制数对应 3 位二进制数。八进制转二进制时，把每个八进制数字写成等值的 3 位二进制数，保持高低位次序不变，例如 2467.32Q = 010 100 110 111.011 010B。

二进制转八进制时，整数部分从低位向高位每 3 位一组，小数部分从高位向低位每 3 位一组，不足 3 位补 0，例如 1 101 001 110.110 01B = 001 101 001 110.110 010B = 1516.62Q。$kp$, section = '' where id = 26938;
update t_knowledge_point set title = $kp$十六进制数与二进制数的互换$kp$, content = $kp$1 位十六进制数对应 4 位二进制数。十六进制转二进制时，把每位写成等值的 4 位二进制数，例如 35A2.CFH = 0011 0101 1010 0010.1100 1111B。

二进制转十六进制时，以小数点为界，整数部分从低位向高位、小数部分从高位向低位每 4 位一组，不足补 0，例如 11 0100 1110.1100 11B = 0011 0100 1110.1100 1100B = 34E.CCH。$kp$, section = '' where id = 26939;
update t_knowledge_point set title = $kp$二进制数的算术运算$kp$, content = $kp$1 位二进制加法规则：0+0=0，0+1=1，1+0=1，1+1=0 并向高位进 1。1 位二进制减法规则：0-0=0，1-0=1，1-1=0，0-1=1 并向高位借 1。

多位二进制数加减法由低位到高位逐位进行，低位向高位进位或借位。例如 0101B + 0100B = 1001B，1001B - 0100B = 0101B。$kp$, section = '' where id = 26940;
update t_knowledge_point set title = $kp$无符号整数的表示$kp$, content = $kp$无符号整数采用自然码表示，取值范围由位数决定：8 位可表示 0～255（2^8-1），16 位可表示 0～65535（2^16-1），n 位可表示 0～2^n-1。无符号整数可用于表示 ASCII 字符、灰度图像像素、内存地址、IPv4 地址、MAC 地址等。$kp$, section = '' where id = 26941;
update t_knowledge_point set title = $kp$带符号整数的表示$kp$, content = $kp$带符号整数用最高位表示符号，0 表示正号、1 表示负号，其余位表示数值部分。数值部分可用原码或补码表示：原码的数值位是整数绝对值的二进制自然码；补码中正整数的数值位为绝对值的自然码，负整数的数值位使用补码表示。例如 +43 的 8 位原码为 00101011，-43 的 8 位原码为 10101011。$kp$, section = '' where id = 26942;
update t_knowledge_point set title = $kp$原码的优缺点$kp$, content = $kp$原码的优点是表示方法与日常十进制一致，简单直观；缺点是加法与减法运算规则不统一，增加硬件成本，而且整数 0 有 00000000 和 10000000 两种表示形式，使用不便。$kp$, section = '' where id = 26943;
update t_knowledge_point set title = $kp$二进制实数的浮点表示$kp$, content = $kp$二进制实数也可用浮点形式表示。例如 +1001.011B = +0.1001011B × 2^100（二进制阶码 100 表示十进制 4）；-0.0010101B = -0.10101B × 2^-10（二进制阶码 -10 表示十进制 -2）。

任一二进制实数 N 可表示为 N = ±S × 2^P，其中 S 为尾数，P 为阶码。32 位单精度浮点数由 1 位符号位、8 位阶码和 23 位尾数组成。$kp$, section = '' where id = 26944;
update t_knowledge_point set title = $kp$文字符号与 ASCII 字符集$kp$, content = $kp$书面文字由一系列字符构成，计算机中常用字符的集合称为字符集，包括西文字符集和中文（汉字）字符集。

最常用的西文字符集是 ASCII（美国信息交换标准代码），包含 96 个可打印字符和 32 个控制字符，每个字符用 7 位二进制编码，计算机中用 1 个字节存储 1 个 ASCII 字符。$kp$, section = '' where id = 26945;
update t_knowledge_point set title = $kp$三种基本逻辑运算$kp$, content = $kp$逻辑加（或运算）F = A ∨ B：0∨0=0，0∨1=1，1∨0=1，1∨1=1。

逻辑乘（与运算）F = A ∧ B：0∧0=0，0∧1=0，1∧0=0，1∧1=1。

取反（非运算）F = NOT A：NOT 0 = 1，NOT 1 = 0。逻辑运算可用开关电路或门电路实现。$kp$, section = '' where id = 26949;
update t_knowledge_point set title = $kp$二进制运算的分类$kp$, content = $kp$二进制数的运算分为两类：逻辑运算（∨、∧、NOT）按位进行，不考虑进位；算术运算（+、-、×、÷）从低位到高位逐位进行，需要考虑低位的进位或借位。

逻辑运算可用与门、或门、非门等门电路实现；算术运算可以表达为逻辑运算，因此也可用门电路实现。$kp$, section = '' where id = 26950;
update t_knowledge_point set title = $kp$补码统一加减法运算$kp$, content = $kp$使用补码可以把加法和减法运算统一起来，从而简化 CPU 运算的复杂度。$kp$, section = '' where id = 27067;
update t_knowledge_point set title = $kp$比特是信息的最小单位$kp$, content = $kp$比特（bit）是组成信息的最小单位。$kp$, section = '' where id = 27083;
update t_knowledge_point set title = $kp$比特的两种状态$kp$, content = $kp$比特用“0”和“1”表示两种状态；比特没有大小、颜色和重量。$kp$, section = '' where id = 27084;
update t_knowledge_point set title = $kp$十进制小数的二进制近似$kp$, content = $kp$十进制小数有可能无法精确地化为二进制小数，只能取近似值。$kp$, section = '' where id = 27086;
update t_knowledge_point set title = $kp$八进制与二进制三位替换法$kp$, content = $kp$八进制与二进制互相转换采用三位替换法：1 位八进制数对应 3 位二进制数。

| 八进制 | 二进制 | 八进制 | 二进制 |
| --- | --- | --- | --- |
| 0 | 000 | 4 | 100 |
| 1 | 001 | 5 | 101 |
| 2 | 010 | 6 | 110 |
| 3 | 011 | 7 | 111 |$kp$, section = '' where id = 27087;
update t_knowledge_point set title = $kp$十六进制与二进制四位替换法$kp$, content = $kp$十六进制与二进制互相转换采用四位替换法：1 位十六进制数对应 4 位二进制数。

| 十六进制 | 二进制 | 十六进制 | 二进制 |
| --- | --- | --- | --- |
| 0 | 0000 | 8 | 1000 |
| 1 | 0001 | 9 | 1001 |
| 2 | 0010 | A | 1010 |
| 3 | 0011 | B | 1011 |
| 4 | 0100 | C | 1100 |
| 5 | 0101 | D | 1101 |
| 6 | 0110 | E | 1110 |
| 7 | 0111 | F | 1111 |

进制转换常见题型：判断某数是否符合 N 进制要求（可用数字为 0～N-1）；直接进行进制转换（乘 R 求和、除 R 取余）；比较不同进制数的大小（可先转为二进制）；根据条件推算进制。$kp$, section = '' where id = 27088;
update t_knowledge_point set title = $kp$逻辑运算不产生进位$kp$, content = $kp$多位数的逻辑运算按位进行，不会产生进位，也不会出现溢出。$kp$, section = '' where id = 27089;
update t_knowledge_point set title = $kp$8 位补码的表示范围$kp$, content = $kp$8 位二进制补码的表示范围是 -128～+127。$kp$, section = '' where id = 27090;
update t_knowledge_point set title = $kp$补码负数最小值的绝对值$kp$, content = $kp$在二进制补码的表示范围中，负数部分最小值的绝对值比正数部分最大值的绝对值大 1。$kp$, section = '' where id = 27091;
update t_knowledge_point set title = $kp$补码计算题型与口诀$kp$, content = $kp$补码排列口诀：补码补码，要大排大，要小排小。

已知十进制数求补码：正数化为二进制，符号位置 0，按要求凑足位数；负数化为二进制，符号位置 1，符号位不变，其余各位取反加 1。

已知补码求十进制数：先对补码再求一次补码得到原码，再转换为十进制数。

用给定的若干个 0、1 组成最大数、最小数：最大正数让符号位为 0，后续高位排 1、低位排 0；最小负数让符号位为 1，后续高位排 0、低位排 1；所得为补码，通常还需转成原码再求十进制值。

求 n 位补码的取值范围：-2^(n-1)～2^(n-1)-1。$kp$, section = '' where id = 27092;
update t_knowledge_point set title = $kp$汉字机内码与字符个数判断$kp$, content = $kp$GB2312 汉字的机内码从 A0A0H 起，连续两个字节都大于 A0H 时，可能表示一个汉字。

推算 ASCII 码时，可根据已知字符的码值推算，例如 A = 65D，则 B = 66D。由区位码计算国标码或机内码：国标码 = 区位码 + 2020H，机内码 = 国标码 + 8080H = 区位码 + A0A0H。

判断一段机内码中汉字和 ASCII 字符的个数：GB2312 编码中连续两个大于 A0H 的字节为一个汉字内码，其余为 ASCII 字符；GBK 编码首字节范围更大，判断时不能只看两个字节都大于 A0H。$kp$, section = '' where id = 27093;
update t_knowledge_point set title = $kp$存储容量单位换算$kp$, content = $kp$计算机中存储容量的基本单位是字节（B）。1 KB = 1024 B，1 MB = 1024 KB，1 GB = 1024 MB，1 TB = 1024 GB。$kp$, section = '' where id = 27145;
update t_knowledge_point set title = $kp$数据的逻辑结构$kp$, content = $kp$常见的逻辑结构有四种：集合结构，数据元素同属于一个集合；线性表结构，数据元素按先后次序连接；树形结构，数据元素之间存在一对多的关系；网状结构，数据元素之间存在多对多的复杂连接。

数据的存储结构是逻辑结构在计算机存储器中的实现。$kp$, section = '' where id = 27223;
update t_knowledge_point set title = $kp$查询男学生姓名$kp$, content = $kp$查询所有男学生姓名：SELECT SNAME FROM S WHERE SEX = '男';$kp$, section = '' where id = 27253;
update t_knowledge_point set title = $kp$数字编码$kp$, content = $kp$数字编码是用一串数字来表示汉字，例如电报码、区位码。$kp$, section = '' where id = 27584;
update t_knowledge_point set title = $kp$字形编码$kp$, content = $kp$字形编码是根据汉字的字形进行编码，例如五笔字型。$kp$, section = '' where id = 27586;
update t_knowledge_point set title = $kp$比特是信息的最小单位$kp$, content = $kp$比特（bit）是组成信息的最小单位。$kp$, section = '' where id = 27611;
update t_knowledge_point set title = $kp$1 比特表示一个二进制位$kp$, content = $kp$1 bit 表示 1 个二进制数，取值为 0 或 1。$kp$, section = '' where id = 27612;
update t_knowledge_point set title = $kp$比特的两种状态$kp$, content = $kp$“0”和“1”表示两种状态；比特没有大小、颜色和重量。$kp$, section = '' where id = 27613;
update t_knowledge_point set title = $kp$8 位原码的表示范围$kp$, content = $kp$8 位二进制原码的表示范围是 -127～+127。$kp$, section = '' where id = 27615;
update t_knowledge_point set title = $kp$16 位原码的表示范围$kp$, content = $kp$16 位二进制原码的表示范围是 -32767～+32767。$kp$, section = '' where id = 27616;
update t_knowledge_point set title = $kp$8 位补码的表示范围$kp$, content = $kp$8 位二进制补码的表示范围是 -128～+127。$kp$, section = '' where id = 27617;
update t_knowledge_point set title = $kp$16 位补码的表示范围$kp$, content = $kp$16 位二进制补码的表示范围是 -32768～+32767。$kp$, section = '' where id = 27618;
update t_knowledge_point set title = $kp$原码范围的正负对称$kp$, content = $kp$二进制原码的表示范围中，正数部分最大值和负数部分最小值的绝对值相等。$kp$, section = '' where id = 27619;
update t_knowledge_point set title = $kp$补码负数最小值的绝对值$kp$, content = $kp$二进制补码的表示范围中，补码负数部分最小值的绝对值比正数部分的最大值绝对值大 1。$kp$, section = '' where id = 27620;
update t_knowledge_point set title = $kp$已知十进制数求补码$kp$, content = $kp$若为正数：化为二进制，符号位置 0，根据题意一般凑足 8 位。
若为负数：化为二进制，符号位置 1，根据题意一般凑足 8 位；符号位不变，其余各位取反加 1。$kp$, section = '' where id = 27621;
update t_knowledge_point set title = $kp$已知补码求十进制数$kp$, content = $kp$先求补码的补码，得到原码；再根据原码转换成相应的十进制数。$kp$, section = '' where id = 27622;
update t_knowledge_point set title = $kp$用给定 0、1 组成最大数和最小数$kp$, content = $kp$利用给出的若干个 0、1 组成最大数、最小数时，可按口诀“补码补码，要大排大，要小排小”。

大数（最大正数）：0 排首位，后续高位排 1、低位排 0，得到补码；通常还要根据补码求原码，再计算十进制值。

小数（最小负数）：1 排首位，后续高位排 0、低位排 1，得到补码；通常还要根据补码求原码，再计算十进制值。$kp$, section = '' where id = 27623;
update t_knowledge_point set title = $kp$ASCII 码的基本关系$kp$, content = $kp$ASCII 码中，A = 65，a = 97，'0' = 48，a - A = 32D = 20H。$kp$, section = '' where id = 27624;
update t_knowledge_point set title = $kp$推算 ASCII 码的值$kp$, content = $kp$根据已知字符的 ASCII 码推算其他字符的码值。例如已知 A = 65D，可推算出 B = 66D；同一字母的小写码值比大写码值大 32。$kp$, section = '' where id = 27626;
update t_knowledge_point set title = $kp$由机内码判断字符个数$kp$, content = $kp$如果汉字采用 GB2312 编码，连续两个大于 A0H 的字节为一个汉字内码，其余字节为 ASCII 字符。GBK 编码的首字节范围更大，判断时不能简单套用“两个字节都大于 A0H”的规则。$kp$, section = '' where id = 27627;
update t_knowledge_point set title = $kp$固定电话语音编码$kp$, content = $kp$固定电话中常使用 PCM 编码和 ADPCM 编码对语音信号进行数字化。$kp$, section = '' where id = 27631;
update t_knowledge_point set title = $kp$十进制转二进制规则$kp$, content = $kp$十进制转换为二进制：整数部分除 2 取余，小数部分乘 2 取整。$kp$, section = '' where id = 27639;
update t_knowledge_point set title = $kp$十进制小数的二进制近似$kp$, content = $kp$十进制小数有可能无法精确地化为二进制小数，只能取近似值。$kp$, section = '' where id = 27640;
update t_knowledge_point set title = $kp$八进制与二进制三位替换法$kp$, content = $kp$八进制和二进制互相转换采用三位替换法：1 位八进制数对应 3 位二进制数。

| 八进制 | 二进制 | 八进制 | 二进制 |
| --- | --- | --- | --- |
| 0 | 000 | 4 | 100 |
| 1 | 001 | 5 | 101 |
| 2 | 010 | 6 | 110 |
| 3 | 011 | 7 | 111 |$kp$, section = '' where id = 27641;
update t_knowledge_point set title = $kp$十六进制与二进制四位替换法$kp$, content = $kp$十六进制和二进制互相转换采用四位替换法：1 位十六进制数对应 4 位二进制数。

| 十六进制 | 二进制 | 十六进制 | 二进制 |
| --- | --- | --- | --- |
| 0 | 0000 | 8 | 1000 |
| 1 | 0001 | 9 | 1001 |
| 2 | 0010 | A | 1010 |
| 3 | 0011 | B | 1011 |
| 4 | 0100 | C | 1100 |
| 5 | 0101 | D | 1101 |
| 6 | 0110 | E | 1110 |
| 7 | 0111 | F | 1111 |

进制转换常见题型：判断某数是否符合 N 进制要求（可用数字为 0～N-1）；直接进行进制转换（乘 R 求和、除 R 取余）；比较不同进制数的大小（可先转为二进制）；根据条件推算进制。$kp$, section = '' where id = 27642;
update t_knowledge_point set title = $kp$程序和数据均用二进制表示$kp$, content = $kp$在计算机中，程序和数据都是采用二进制代码表示的。$kp$, section = '' where id = 27659;
update t_knowledge_point set title = $kp$ASCII 码的名称$kp$, content = $kp$美国信息交换标准码简称 ASCII 码。$kp$, section = '' where id = 27671;
update t_knowledge_point set title = $kp$ASCII 编码与存储$kp$, content = $kp$ASCII 码采用 7 个二进制位进行编码，最高位置 0，凑足 8 位；计算机中用 1 个字节存储 1 个 ASCII 字符。$kp$, section = '' where id = 27672;
update t_knowledge_point set title = $kp$标准 ASCII 字符集组成$kp$, content = $kp$标准 ASCII 字符集包含 96 个可打印字符和 32 个控制字符。$kp$, section = '' where id = 27673;
update t_knowledge_point set title = $kp$ASCII 码值排序与汉字内码$kp$, content = $kp$ASCII 码值由小到大的顺序一般为：空格、数字、大写字母、小写字母。

GB2312 汉字在计算机中用两个字节表示，每个字节的最高位都是 1，以便与 ASCII 字符相区别。$kp$, section = '' where id = 27674;
update t_knowledge_point set title = $kp$GBK 的汉字数量$kp$, content = $kp$GBK 收录 20902 个汉字，并兼容 GB2312。$kp$, section = '' where id = 27675;
update t_knowledge_point set title = $kp$GBK 兼容 GB2312$kp$, content = $kp$GBK 兼容 GB2312，并扩充了包括繁体字在内的大量汉字。$kp$, section = '' where id = 27676;
update t_knowledge_point set title = $kp$GBK 的双字节编码$kp$, content = $kp$GBK 汉字在计算机中各占两个字节，每个汉字的第一个字节的最高位必须为 1，第二个字节的最高位可以是 1，也可以是 0。$kp$, section = '' where id = 27677;
update t_knowledge_point set title = $kp$GB18030 多字节编码$kp$, content = $kp$GB18030 收录 2.7 万多个汉字，采用多字节编码，兼容 GBK、GB2312，并支持繁体字。$kp$, section = '' where id = 27678;
update t_knowledge_point set title = $kp$Unicode 编码集$kp$, content = $kp$Unicode 编码集不是我国开发的编码标准，与我国的 GB2312、GBK、GB18030 等编码不兼容，使用时需要通过转换表进行转换。$kp$, section = '' where id = 27679;
update t_knowledge_point set title = $kp$Big5 码$kp$, content = $kp$Big5 码是港澳台地区使用的标准汉字字符集，只包含繁体字。$kp$, section = '' where id = 27680;
update t_knowledge_point set title = $kp$二进制减法与逻辑运算$kp$, content = $kp$二进制减法运算借 1 当 2。二进制逻辑运算有两个值：真用 1 表示，假用 0 表示。$kp$, section = '' where id = 27690;
update t_knowledge_point set title = $kp$逻辑运算按位进行$kp$, content = $kp$逻辑运算为按位运算，不会产生进位，也就是不会溢出。$kp$, section = '' where id = 27691;
update t_knowledge_point set title = $kp$存储容量单位换算$kp$, content = $kp$计算机中存储容量的基本单位是字节（B）。1 KB = 1024 B，1 MB = 1024 KB，1 GB = 1024 MB，1 TB = 1024 GB。$kp$, section = '' where id = 27738;
update t_knowledge_point set title = $kp$数据传输速率换算$kp$, content = $kp$常用的换算关系：1 KB/s = 8 kb/s。$kp$, section = '' where id = 27739;
update t_knowledge_point set title = $kp$16 位无符号数的表示范围$kp$, content = $kp$16 位无符号数的表示范围是 0～65535。$kp$, section = '' where id = 27740;
update t_knowledge_point set title = $kp$正数三码相同$kp$, content = $kp$正数的原码、反码、补码相同。$kp$, section = '' where id = 27741;
update t_knowledge_point set title = $kp$正数补码等于原码$kp$, content = $kp$符号位为 0 表示正数，其数值位与真值相等，即正数的补码等于其原码。$kp$, section = '' where id = 27742;
update t_knowledge_point set title = $kp$负数由原码求补码$kp$, content = $kp$符号位为 1 表示负数，由原码求补码的规则为：符号位不变，各位取反后加 1。$kp$, section = '' where id = 27743;
update t_knowledge_point set title = $kp$补码的补码是原码$kp$, content = $kp$补码的补码就是原码。$kp$, section = '' where id = 27744;
update t_knowledge_point set title = $kp$补码范围比原码多一个$kp$, content = $kp$位数相同的情况下，补码的表示范围比原码多一个。$kp$, section = '' where id = 27745;
update t_knowledge_point set title = $kp$N 位补码的取值范围$kp$, content = $kp$求 N 位补码的取值范围时，可利用“补码负数部分最小数的绝对值比正数部分最大值的绝对值大 1”的规律，范围为 -2^(N-1)～2^(N-1)-1。$kp$, section = '' where id = 27746;
update t_knowledge_point set title = $kp$点阵汉字的存储空间$kp$, content = $kp$N×N 点阵的一个汉字，其字形码占 N×N/8 字节。$kp$, section = '' where id = 27747;
update t_knowledge_point set title = $kp$程序和数据用二进制表示$kp$, content = $kp$在计算机中，程序和数据都是采用二进制代码表示的。$kp$, section = '' where id = 28215;
update t_knowledge_point set title = $kp$MAC 地址$kp$, content = $kp$网卡的 MAC 地址是标识主机的硬件地址，由 48 位二进制组成，通常用十六进制数表示。$kp$, section = '' where id = 28228;
update t_knowledge_point set title = $kp$投影运算$kp$, content = $kp$投影是从一个关系中选择若干属性组成新关系。$kp$, section = '' where id = 28292;
update t_knowledge_point set title = $kp$选择运算$kp$, content = $kp$选择是从一个关系中找出满足条件的元组。$kp$, section = '' where id = 28293;
update t_knowledge_point set title = $kp$二进制转十进制$kp$, content = $kp$二进制转十进制采用乘权求和：每一位数字乘以 2 的相应次幂，再累加。$kp$, section = '' where id = 28357;
update t_knowledge_point set title = $kp$十进制转八进制$kp$, content = $kp$十进制整数转八进制用除 8 取余，余数逆序排列；小数部分用乘 8 取整。$kp$, section = '' where id = 28358;
update t_knowledge_point set title = $kp$ASCII 字符的存储$kp$, content = $kp$标准 ASCII 码采用 7 位二进制编码，但每个字符在计算机中占 1 个字节，因此存储 8 个 ASCII 字符需要 8 个字节。$kp$, section = '' where id = 28359;
update t_knowledge_point set title = $kp$任意进制转十进制与十进制转八进制$kp$, content = $kp$任意进制转十进制都可采用乘权求和的方法。

十进制数 215.25 转八进制：整数部分 215 除 8 取余，得到 327Q；小数部分 0.25 乘 8 取整，得到 0.2Q，所以 215.25 = 327.2Q。$kp$, section = '' where id = 28367;
update t_knowledge_point set title = $kp$GB2312 汉字的表示$kp$, content = $kp$GB2312 汉字在计算机中用两个字节表示，每个字节的最高位均为 1。区位码、国标码与机内码的换算关系为：区位码 + 2020H = 国标码，国标码 + 8080H = 机内码。$kp$, section = '' where id = 28368;
update t_knowledge_point set title = $kp$GBK 编码特点$kp$, content = $kp$GBK 包含繁体字，与 GB2312 保持向下兼容；GBK 使用双字节表示，第 1 字节的最高位必须为 1。$kp$, section = '' where id = 28369;
update t_knowledge_point set title = $kp$常用字符的 ASCII 码值$kp$, content = $kp$'0' 的 ASCII 码值为 48，'A' 的 ASCII 码值为 65，'a' 的 ASCII 码值为 97。$kp$, section = '' where id = 28381;
update t_knowledge_point set title = $kp$十进制转二、八、十六进制$kp$, content = $kp$十进制转换成二进制、八进制、十六进制：将十进制数除以基数（2、8 或 16），得到的商继续除以基数，直到商为 0，然后将各次相除所得的余数从后往前排列。$kp$, section = '' where id = 28382;
update t_knowledge_point set title = $kp$二、八、十六进制转十进制$kp$, content = $kp$二进制、八进制、十六进制转换成十进制：将各进制数的每一位从高位到低位乘以基数（2、8 或 16）的 n-1 次幂，n 为该位所在的位数，然后累加。$kp$, section = '' where id = 28383;
update t_knowledge_point set title = $kp$二进制与八进制之间的转换$kp$, content = $kp$二进制与八进制之间的转换：每个八进制数字转换成 3 位二进制数字。$kp$, section = '' where id = 28384;
update t_knowledge_point set title = $kp$二进制与十六进制之间的转换$kp$, content = $kp$二进制与十六进制之间的转换：每个十六进制数字转换成 4 位二进制数字。$kp$, section = '' where id = 28385;
update t_knowledge_point set title = $kp$ASCII 码的基本关系$kp$, content = $kp$ASCII 码中，A = 65，a = 97，'0' = 48，a - A = 32D = 20H。$kp$, section = '' where id = 28415;
update t_knowledge_point set title = $kp$十六进制与二进制四位替换法$kp$, content = $kp$十六进制和二进制互相转换采用四位替换法：1 位十六进制数对应 4 位二进制数。

| 十六进制 | 二进制 | 十六进制 | 二进制 |
| --- | --- | --- | --- |
| 0 | 0000 | 8 | 1000 |
| 1 | 0001 | 9 | 1001 |
| 2 | 0010 | A | 1010 |
| 3 | 0011 | B | 1011 |
| 4 | 0100 | C | 1100 |
| 5 | 0101 | D | 1101 |
| 6 | 0110 | E | 1110 |
| 7 | 0111 | F | 1111 |

进制转换常见题型：判断某数是否符合 N 进制要求（可用数字为 0～N-1）；直接进行进制转换（乘 R 求和、除 R 取余）；比较不同进制数的大小（可先转为二进制）；根据条件推算进制。$kp$, section = '' where id = 28416;
update t_knowledge_point set title = $kp$逻辑值的表示$kp$, content = $kp$逻辑值有两个：False = 0，True = 1。$kp$, section = '' where id = 28419;
update t_knowledge_point set title = $kp$计算机只处理二进制信息$kp$, content = $kp$计算机只能存储和处理二进制信息。$kp$, section = '' where id = 28543;
update t_knowledge_point set title = $kp$MAC 地址$kp$, content = $kp$MAC 地址是 48 位的二进制数，一般用十六进制表示。$kp$, section = '' where id = 28545;
update t_knowledge_point set title = $kp$补码加法的结果与反码表示$kp$, content = $kp$两个用 8 位二进制表示的补码分别为 11000111 和 00110011，相加得到 11111010，即十进制数 -6。其原码为 10000110，反码为 11111001。$kp$, section = '' where id = 28551;
update t_knowledge_point set title = $kp$浮点数表示与计算机分代$kp$, content = $kp$同一个数的浮点数表示形式并不唯一。

计算机按主机所使用的元器件分为四代：第一代使用电子管和磁鼓，第二代使用晶体管和磁芯，第三代使用 SSI、MSI 半导体存储器，第四代使用 LSI、VLSI 半导体存储器。1946 年，世界上第一台电子数字计算机 ENIAC 诞生。计算机应用模式经历了集中计算、分散计算、网络计算等发展阶段。$kp$, section = '' where id = 28628;
update t_knowledge_point set title = $kp$文本阅读器与字型库$kp$, content = $kp$文本经编辑处理后传送到显示器或打印机输出。常用文本阅读器（浏览器）有 Word、Acrobat Reader、IE 等；字型库提供显示和打印所需的字形。$kp$, section = '' where id = 28655;
update t_knowledge_point set title = $kp$内存容量单位换算$kp$, content = $kp$内存容量按 1024 进位：1 KB = 1024 B = 2^10 B，1 MB = 1024 KB = 2^20 B，1 GB = 1024 MB = 2^30 B，1 TB = 1024 GB，1 PB = 1024 TB。$kp$, section = '' where id = 28663;
update t_knowledge_point set title = $kp$关系代数基本运算$kp$, content = $kp$并：两个表中的记录合并，如果记录相同则只取其中一条。交：取两个表的相同记录。差：A-B 与 B-A，只保留非交叉记录。投影：只改变要显示的列。选择：通过条件限制要显示的记录。广义笛卡尔积：两个表的属性个数相加，记录个数相乘。连接：属性个数相加，记录按连接条件组合。$kp$, section = '' where id = 28781;
update t_knowledge_point set title = $kp$查询全表记录$kp$, content = $kp$查询全表记录的语法为 SELECT * FROM 表名 [AS 别名];，例如：

SELECT * FROM t_student;
SELECT * FROM t_student AS S;$kp$, section = '' where id = 28793;
update t_knowledge_point set title = $kp$查询满足条件的记录$kp$, content = $kp$查询满足条件的记录使用 WHERE 子句，语法为 SELECT * FROM 表名 [[AS] 别名] WHERE 条件表达式;，例如：

SELECT * FROM t_student AS S WHERE S.ID = 'SZ1000001';
SELECT * FROM t_student WHERE ID = 'SZ1000001';$kp$, section = '' where id = 28795;
update t_knowledge_point set title = $kp$去除重复记录$kp$, content = $kp$使用 DISTINCT 去除查询结果中的重复记录，语法为 SELECT DISTINCT * FROM 表名;，例如 SELECT DISTINCT * FROM t_student;。$kp$, section = '' where id = 28796;
update t_knowledge_point set title = $kp$UNION 语法$kp$, content = $kp$UNION 对两个结果集进行并集操作，不包括重复行，同时按默认规则排序；UNION ALL 对两个结果集进行并集操作，包括重复行。基本形式为：

SELECT ... FROM ... WHERE ...
UNION [ALL]
SELECT ... FROM ... WHERE ...$kp$, section = '' where id = 28798;
update t_knowledge_point set title = $kp$UNION 查询实例$kp$, content = $kp$使用 UNION 查询选修了“经济学”或“Python”的学生学号：

SELECT sNo FROM tb_score A, tb_course B WHERE A.cNo = B.cNo AND cName = '经济学'
UNION
SELECT sNo FROM tb_score A, tb_course B WHERE A.cNo = B.cNo AND cName = 'Python';

若要求不去重，将 UNION 改为 UNION ALL。$kp$, section = '' where id = 28799;
update t_knowledge_point set title = $kp$EXISTS 子查询$kp$, content = $kp$SELECT * FROM A WHERE EXISTS (SELECT * FROM B WHERE A.ID = B.ID);

该查询返回 A 中在 B 里存在相同 ID 的记录。$kp$, section = '' where id = 28801;
update t_knowledge_point set title = $kp$NOT EXISTS 子查询$kp$, content = $kp$SELECT * FROM A WHERE NOT EXISTS (SELECT * FROM B WHERE A.ID = B.ID);

该查询返回 A 中在 B 里不存在相同 ID 的记录。$kp$, section = '' where id = 28803;
update t_knowledge_point set title = $kp$自然语言全文检索$kp$, content = $kp$SELECT * FROM articles WHERE MATCH(title, body) AGAINST('精神');

该语句在 title 和 body 列中检索包含指定词的记录。$kp$, section = '' where id = 28804;
update t_knowledge_point set title = $kp$投影运算$kp$, content = $kp$投影是从一个关系中选择若干属性组成新关系。$kp$, section = '' where id = 28880;
update t_knowledge_point set title = $kp$选择运算$kp$, content = $kp$选择是从一个关系中找出满足条件的元组。$kp$, section = '' where id = 28881;
update t_knowledge_point set title = $kp$整数与浮点数的表示$kp$, content = $kp$整数（定点数）分为无符号整数和带符号整数；带符号整数的最高位为符号位，0 表示正数、1 表示负数。编码方法有原码、反码、补码：正数三码相同；负数的反码为原码除符号位外逐位取反，补码为反码加 1。

n 位无符号整数范围为 0～2^n-1；n 位原码范围为 -(2^(n-1)-1)～2^(n-1)-1；n 位补码范围为 -2^(n-1)～2^(n-1)-1。

浮点数由尾数和指数（阶码）组成，尾数决定精度，阶码决定范围；同一个数的浮点数表示形式不唯一。相同长度下，浮点数表示范围大但精度差，定点数范围小但精度好。$kp$, section = '' where id = 28884;
update t_knowledge_point set title = $kp$内存容量单位换算$kp$, content = $kp$内存容量按 1024 进位：1 KB = 1024 B = 2^10 B，1 MB = 1024 KB = 2^20 B，1 GB = 1024 MB = 2^30 B，1 TB = 1024 GB，1 PB = 1024 TB。$kp$, section = '' where id = 28931;
update t_knowledge_point set title = $kp$字节与比特$kp$, content = $kp$每个西文字符通常用 8 个比特表示，8 个比特称为 1 个字节（Byte），即 1 Byte = 8 bit。大写字母 B 表示字节，小写字母 b 表示比特。$kp$, section = '' where id = 29133;
update t_knowledge_point set title = $kp$算术运算的溢出与真值表$kp$, content = $kp$算术运算结果可能产生溢出。

1 位二进制加法：0+0=0（进位 0），0+1=1（进位 0），1+0=1（进位 0），1+1=0（进位 1）。

1 位二进制减法：0-0=0（借位 0），0-1=1（借位 1），1-0=1（借位 0），1-1=0（借位 0）。$kp$, section = '' where id = 29135;
update t_knowledge_point set title = $kp$千比特每秒$kp$, content = $kp$“千比特/秒”（kb/s）：1 kb/s = 10^3 比特/秒 = 1000 b/s。$kp$, section = '' where id = 29137;
update t_knowledge_point set title = $kp$兆比特每秒$kp$, content = $kp$“兆比特/秒”（Mb/s）：1 Mb/s = 10^6 比特/秒 = 1000 kb/s。$kp$, section = '' where id = 29138;
update t_knowledge_point set title = $kp$计算机病毒传播与数字媒体$kp$, content = $kp$计算机病毒常通过电子邮件附件、下载受病毒感染的程序等途径传播。数字媒体包括文本、图像、声音等，其中西文字符常用 ASCII 码编码。$kp$, section = '' where id = 29455;
update t_knowledge_point set title = $kp$GBK 字符集$kp$, content = $kp$1995 年颁布的 GBK 含有 21003 个汉字和 883 个图形符号，兼容 GB2312，并收录了大量繁体字。$kp$, section = '' where id = 29553;
update t_knowledge_point set title = $kp$DECIMAL 定点数类型$kp$, content = $kp$DECIMAL(M,D) 是压缩的“严格”定点数。M 是数字的总位数（精度），D 是小数点后的位数（标度），小数点和负号不计入 M。D 为 0 时没有小数部分；M 最大为 65，D 最大为 30；省略 D 时默认为 0，省略 M 时默认为 10。UNSIGNED 表示不允许负值。

插入数据时，如果小数位超过 D，则四舍五入到 D 位。DECIMAL 以字符串形式存放，计算精确、不存在舍入误差，占用 M+2 个字节，适合货币、科学数据等对精度要求较高的场合。$kp$, section = '' where id = 29587;
update t_knowledge_point set title = $kp$异或运算规则$kp$, content = $kp$二进制异或运算的规则是：对应位相同为 0，相异为 1。若用密钥 0011 对明文进行异或，可得到密文；再用同一密钥异或一次即可还原明文。$kp$, section = '' where id = 29590;
update t_knowledge_point set title = $kp$数据传输速率$kp$, content = $kp$数据传输速率指单位时间（每秒）内传输二进制信息的位数，是描述数据传输系统的重要技术指标。基本单位是位/秒，记作 b/s 或 bps；常用单位有 Kb/s、Mb/s、Gb/s。$kp$, section = '' where id = 29667;
update t_knowledge_point set title = $kp$千比特每秒$kp$, content = $kp$“千比特/秒”（kb/s）：1 kb/s = 10^3 比特/秒 = 1000 b/s。$kp$, section = '' where id = 29683;
update t_knowledge_point set title = $kp$兆比特每秒$kp$, content = $kp$“兆比特/秒”（Mb/s）：1 Mb/s = 10^6 比特/秒 = 1000 kb/s。$kp$, section = '' where id = 29684;
update t_knowledge_point set title = $kp$吉比特每秒$kp$, content = $kp$“吉比特/秒”（Gb/s）：1 Gb/s = 10^9 比特/秒 = 1000 Mb/s。$kp$, section = '' where id = 29685;
update t_knowledge_point set title = $kp$进制之间的转换关系$kp$, content = $kp$二进制与八进制按 1 位对 3 位转换，二进制与十六进制按 1 位对 4 位转换；其他进制转十进制采用乘权累加。$kp$, section = '' where id = 29686;
update t_knowledge_point set title = $kp$整数类型$kp$, content = $kp$整数（定点数）分为无符号整数和带符号整数。8 位无符号整数的取值范围是 0～255；带符号整数的最高位为符号位，0 表示正数、1 表示负数。$kp$, section = '' where id = 29687;
update t_knowledge_point set title = $kp$整数编码方法$kp$, content = $kp$整数（定点数）的编码方法有原码、补码、反码。正数的补码、原码、反码相同；负数的原码除符号位外逐位取反得到反码，反码加 1 得到补码。

n 位原码中 0 有 +0（000…00）和 -0（100…00）两种表示；n 位补码中 100…00 表示 -2^(n-1)，000…00 表示 0。$kp$, section = '' where id = 29688;
update t_knowledge_point set title = $kp$不同编码下 n 位数的表示范围$kp$, content = $kp$| 编码 | 最小值 | 最大值 |
| --- | --- | --- |
| n 位无符号整数 | 0 | 2^n-1 |
| n 位原码 | -(2^(n-1)-1) | 2^(n-1)-1 |
| n 位补码 | -2^(n-1) | 2^(n-1)-1 |$kp$, section = '' where id = 29689;
update t_knowledge_point set title = $kp$BCD 码$kp$, content = $kp$BCD 码（二—十进制码）中的 8421 码用 4 位二进制表示 1 位十进制数字。$kp$, section = '' where id = 29690;
update t_knowledge_point set title = $kp$ASCII 字符集的组成$kp$, content = $kp$ASCII 字符集共有 128 个字符，包含 96 个可打印字符（字母、数字、标点符号等）和 32 个控制字符。基本 ASCII 与扩展 ASCII 都用 1 个字节存放，区别是基本 ASCII 的最高位为 0，扩展 ASCII 的最高位为 1。

常见字符的 ASCII 码值由小到大为：回车符 13、空格 32、数字 0～9 为 48～57、大写字母 A～Z 为 65～90、小写字母 a～z 为 97～122。$kp$, section = '' where id = 29695;
update t_knowledge_point set title = $kp$GB2312 的颁布$kp$, content = $kp$1981 年我国颁布了第一个汉字编码国家标准 GB2312—80，共收录 6763 个汉字。$kp$, section = '' where id = 29696;
update t_knowledge_point set title = $kp$GB2312 的组成$kp$, content = $kp$GB2312 字符集由三部分组成：第一部分是字母、数字和各种符号；第二部分是一级常用汉字 3755 个，按汉语拼音排列；第三部分是二级常用汉字 3008 个，按偏旁部首排列。$kp$, section = '' where id = 29697;
update t_knowledge_point set title = $kp$GB2312 的区位码与机内码$kp$, content = $kp$GB2312 国标字符集构成 94 行×94 列的二维平面，行号为区号、列号为位号，区号和位号各用 1 个字节表示。

国标交换码 = 区位码 + 32D（20H）；机内码在国标交换码基础上使两个字节的最高位都等于 1，即分别加 128D（80H）。所以区位码 + 2020H = 国标码，国标码 + 8080H = 机内码，区位码 + A0A0H = 机内码。$kp$, section = '' where id = 29698;
update t_knowledge_point set title = $kp$GB18030 的产生原因$kp$, content = $kp$GB18030 的产生原因：保护我国已有的大量信息资源，既能与 UCS/Unicode 编码标准接轨，又能向下兼容 GB2312 和 GBK 汉字编码标准。

UCS/Unicode 被 Windows、UNIX、Linux 等操作系统和许多新软件标准使用。$kp$, section = '' where id = 29699;
update t_knowledge_point set title = $kp$常用汉字编码标准的比较$kp$, content = $kp$| 标准 | 出现时间 | 汉字数 | 支持繁体 | 编码方式 | 兼容性 |
| --- | --- | --- | --- | --- | --- |
| GB2312 | 1981 年 | 6763 个 | 否 | 双字节 | — |
| GBK | 1995 年 | 21003 个 | 是 | 双字节 | 向下兼容 GB2312 |
| UCS/Unicode | — | 2 万多个 | 是 | 不等长 1、2、3 字节 | 与 GB 系列不兼容 |
| GB18030 | 2000 年 | 27484 个 | 是 | 不等长 1、2、4 字节 | 向下兼容 GB2312、GBK，与 Unicode 接轨 |

BIG5 是台湾地区的字符编码，不支持简体中文，与 GB2312 等大陆标准不兼容。$kp$, section = '' where id = 29700;
update t_knowledge_point set title = $kp$简单文本$kp$, content = $kp$简单文本又称纯文本、ASCII 文本，文件后缀为 .txt。它由一连串表达正文内容的字符编码组成，几乎不包含其他格式信息和结构信息；没有字体、字号变化，不能插入图片、表格、超链接。$kp$, section = '' where id = 29702;
update t_knowledge_point set title = $kp$BCD 码的用途$kp$, content = $kp$BCD 码是一种数字编码形式，用 4 位二进制表示 1 位十进制数，适合需要按十进制精确处理的场合。$kp$, section = '' where id = 29734;
update t_knowledge_point set title = $kp$BCD 码的定义$kp$, content = $kp$BCD 码用 4 位二进制数表示 1 位十进制数中的 0～9 这 10 个数码。$kp$, section = '' where id = 29735;
update t_knowledge_point set title = $kp$BCD 码的加法修正$kp$, content = $kp$BCD 码加法：2+4 = 0010+0100 = 0110，和小于等于 9 时可直接作为结果。

6+8 = 0110+1000 = 1110，结果大于 9，需要加 6 修正：1110+0110 = 0001 0100，即 BCD 码 14。$kp$, section = '' where id = 29736;
update t_knowledge_point set title = $kp$补码的表示范围$kp$, content = $kp$8 位补码的表示范围是 -128～+127，n 位补码的表示范围是 -2^(n-1)～2^(n-1)-1。与原码相比，补码的最小值还可以再小一个。$kp$, section = '' where id = 29737;
update t_knowledge_point set title = $kp$负数补码转原码的方法$kp$, content = $kp$负数的最高位为符号位 1。由补码求原码的传统方法是符号位不变，其余各位取反加 1；也可用技巧：从右往左找到第一个 1，该 1 及其右边的 0 不变，左边各位取反。

例如补码 10101100 转原码为 11010100，十进制为 -84。$kp$, section = '' where id = 29738;
update t_knowledge_point set title = $kp$补码的加减运算$kp$, content = $kp$补码加法：x补 + y补 = (x+y)补；补码减法：x补 - y补 = x补 + (-y)补 = (x-y)补。符号位参加运算，最高位的进位按模舍去。

例如 11110010 + 11010111 = 11001001，对应 -55。带符号数 a = 01001110，b = 01001111，a-b = 01001110 + 10110001 = 11111111，即 -1。$kp$, section = '' where id = 29739;
update t_knowledge_point set title = $kp$IEEE 754 浮点数的表示$kp$, content = $kp$IEEE 754 单精度浮点数的基本格式为：1 位符号位 + 8 位移码（阶码 + 127）+ 23 位尾数。

例如 178.125 = 10110010.001B = 1.0110010001B × 2^7，符号位为 0，阶码为 7+127=134=10000110，尾数为 0110010001000…，最终十六进制表示为 43322000H。$kp$, section = '' where id = 29740;
update t_knowledge_point set title = $kp$字符集的组成$kp$, content = $kp$字符集包括西文字符（ASCII 码）和中文字符（GB2312、GBK、GB18030 等）。$kp$, section = '' where id = 29741;
update t_knowledge_point set title = $kp$ASCII 码推算的易错点$kp$, content = $kp$已知“H”的 ASCII 码是 48H，则“J”是 4AH，不是 50H；“J”为 4AH，“j”为 6AH；“Z”为 5AH，“z”为 7AH。$kp$, section = '' where id = 29742;
update t_knowledge_point set title = $kp$由编码判断中西文字符个数$kp$, content = $kp$已知一串机内码，例如 5A 47 C2 FD 6D B3 C7 63 D6 D0。按 GB2312 编码判断：连续两个大于 A0H 的字节为一个汉字，其余为 ASCII 字符。

该串中 5A、47、6D、63 是 ASCII 字符，C2 FD、B3 C7、D6 D0 是 3 个汉字，共 4 个西文字符、3 个汉字。$kp$, section = '' where id = 29743;
update t_knowledge_point set title = $kp$汉字编码形式与点阵存储$kp$, content = $kp$汉字的编码形式包括输入码、机内码和字形码（用于显示）。点阵字形码的存储空间为：24×24 点阵占 24×24/8 = 72 B；16×16 点阵占 32 B；32×32 点阵占 128 B。$kp$, section = '' where id = 29744;
update t_knowledge_point set title = $kp$信息表示的最小单位$kp$, content = $kp$最小单位是 b（bit，比特），用 0 或 1 表示，没有大小；1 B = 8 b。$kp$, section = '' where id = 29745;
update t_knowledge_point set title = $kp$数制与数位$kp$, content = $kp$二进制后缀为 B，数码 0、1，基数 2；八进制后缀为 Q，数码 0～7，基数 8；十进制后缀为 D 或省略，数码 0～9，基数 10；十六进制后缀为 H，数码 0～9、A～F，基数 16。

数位以小数点为界，向左从 0 开始编号，向右从 -1 开始编号。$kp$, section = '' where id = 29748;
update t_knowledge_point set title = $kp$进制转换方法$kp$, content = $kp$其他进制转十进制按位权展开；十进制转其他进制时，整数部分连除取余、逆序排列，小数部分连乘取整、顺序排列。十进制转其他进制可能出现近似值，例如 0.63 转二进制不能完全相等。

二进制转八进制 1 位对 3 位，转十六进制 1 位对 4 位。例如 010 101 010 101.010 100B = 2525.24Q。$kp$, section = '' where id = 29749;
update t_knowledge_point set title = $kp$基本逻辑运算$kp$, content = $kp$基本逻辑运算按位独立进行，不考虑进位与借位，不会溢出。逻辑加又称或（or、∨），逻辑乘又称与（and、∧），取反又称非（not）。此外还有异或（相同为 0、不同为 1）和同或（不同为 0、相同为 1）。

逻辑运算通过开关电路或门电路实现，算术运算也可以通过门电路实现。$kp$, section = '' where id = 29750;
update t_knowledge_point set title = $kp$常用字符的 ASCII 码$kp$, content = $kp$| 字符 | 十六进制 | 十进制 |
| --- | --- | --- |
| 空格 | 20H | 32 |
| 0 | 30H | 48 |
| A | 41H | 65 |
| a | 61H | 97 |

例如字母 L 的二进制表示为 0100 1100B；二进制 0110 1110 对应的 ASCII 字符是 'n'。$kp$, section = '' where id = 29753;
update t_knowledge_point set title = $kp$GB2312、GBK 与 GB18030$kp$, content = $kp$GB2312-80 只收简体字，共 6763 个汉字和 682 个图形符号，用 2 字节存储，每个字节最高位为 1；94 行（区号）×94 列（位号），每个汉字有区位号。换算：区位码 + 2020H = 国标码，国标码 + 8080H = 机内码，区位码 + A0A0H = 机内码。GB2312 汉字的机内码首字节大于 B0H。

GBK-95 兼有简体和繁体，共 21003 个汉字和 883 个图形符号，用 2 字节存储，第一字节最高位为 1。

GB18030 兼有简体、繁体和生僻字，增加蒙文、藏文等，共 27000 多个字符，有单字节、双字节和四字节编码，与 Unicode 不兼容但可转换，向下兼容 GB2312、GBK。

港澳台地区使用 Big5（大五码），只有繁体字，与大陆字符集不兼容。$kp$, section = '' where id = 29754;
update t_knowledge_point set title = $kp$Unicode 与字符输入$kp$, content = $kp$UCS/Unicode 是世界文字的编码，共 11 万多个字符，其中汉字 7 万多个；采用不同字符集时，相同文字可能有不同的编码。

汉字输入方式包括：数字编码（如电报码、区位码），字音编码（如全拼、智能拼音），字形编码（如五笔），形音编码；这些统称外码。手写板、语音输入、OCR 光学字符识别等属于自动或半自动输入。

文本编辑通常先设置字符格式，再设置段落格式，最后设置页面格式；具有所见即所得、撤销与恢复、格式刷、多种视图、宏操作等功能。$kp$, section = '' where id = 29755;
update t_knowledge_point set title = $kp$信息处理与逻辑运算、门电路$kp$, content = $kp$计算机中任何信息都使用二进制表示；对二进制信息的处理都可归结为逻辑运算，因为所有算术运算都可以用逻辑运算完成：乘法可用加法完成，除法可用减法完成，减法可用加法完成，加法可用逻辑运算完成。

逻辑运算由门电路实现，所以门电路可以实现对各种信息的处理。$kp$, section = '' where id = 29771;
update t_knowledge_point set title = $kp$比特的存储与触发器$kp$, content = $kp$比特的存储使用一种称为“触发器”的双稳态电路完成，1 个触发器可以存储 1 个比特。$kp$, section = '' where id = 29804;
update t_knowledge_point set title = $kp$其他进制转十进制$kp$, content = $kp$其他各种进制数向十进制数转化的方法是：各个数位上的数乘上各个数位上的权值，然后再进行累加。$kp$, section = '' where id = 29805;
update t_knowledge_point set title = $kp$标准 ASCII 字符集$kp$, content = $kp$标准 ASCII 字符集使用 7 个二进位进行编码，实际存储仍用 8 位，最高位补 0；共有 128 个字符，包括 96 个可打印字符和 32 个控制字符。$kp$, section = '' where id = 29806;
update t_knowledge_point set title = $kp$大小写字母的 ASCII 码差$kp$, content = $kp$同一个字母的小写字母 ASCII 码值减去大写字母 ASCII 码值的结果是固定的，为 32D。$kp$, section = '' where id = 29807;
update t_knowledge_point set title = $kp$GB2312 字符集的组成$kp$, content = $kp$1981 年颁布的 GB2312 字符集由 3 部分组成：第一部分是各种图形符号 682 个；第二部分为一级常用汉字 3755 个，按汉语拼音排列；第三部分为二级常用汉字 3008 个，按偏旁部首排列。$kp$, section = '' where id = 29808;
update t_knowledge_point set title = $kp$Big5 编码$kp$, content = $kp$我国台湾、香港、澳门地区使用的是 Big5 汉字编码标准，与 GB2312 和 GBK 不兼容。$kp$, section = '' where id = 29809;
update t_knowledge_point set title = $kp$UCS/Unicode 的定义$kp$, content = $kp$UCS/Unicode 是 ISO 制定的将全世界现代书面文字所使用的所有字符和符号集中统一编码的标准。$kp$, section = '' where id = 29810;
update t_knowledge_point set title = $kp$汉字输入编码的分类$kp$, content = $kp$汉字输入编码方法分为 4 类：数字编码（如电报码、区位码）；字音编码（如智能 ABC、微软拼音）；字形编码（如五笔字型、表形码）；形音编码。$kp$, section = '' where id = 29811;
update t_knowledge_point set title = $kp$GB18030 的编码方式$kp$, content = $kp$GB18030 采用不等长的编码方法：“单字节编码”表示 ASCII 字符，与 ASCII 码兼容；“双字节编码”表示汉字，与 GBK、GB2312 保持兼容；还有约 158 万个“四字节编码”。$kp$, section = '' where id = 29812;
update t_knowledge_point set title = $kp$十进制整数转其他进制$kp$, content = $kp$十进制整数转其他进制：十进制数除以基数，每除一次取出余数，直到商为 0，余数倒读。$kp$, section = '' where id = 29841;
update t_knowledge_point set title = $kp$十进制小数转其他进制$kp$, content = $kp$十进制小数转其他进制：小数乘以基数，每乘一次取整，直到没有小数，整数正读。$kp$, section = '' where id = 29842;
update t_knowledge_point set title = $kp$其他进制转十进制$kp$, content = $kp$其他进制转十进制：数码乘以基数的相应次幂，再相加。例如十进制 613.12 = 6×10^2 + 1×10^1 + 3×10^0 + 1×10^-1 + 2×10^-2。

位数从个位开始记为 0，向左依次为 1、2…，小数点后依次为 -1、-2…。十进制整数转二进制时，可将数拆成 2 的整数次幂之和，有对应幂的位为 1，否则为 0。$kp$, section = '' where id = 29843;
update t_knowledge_point set title = $kp$西文字符 ASCII 码$kp$, content = $kp$'0' 的 ASCII 码为 48，空格为 32，'A' 为 65，'a' 为 97，回车符为 13。数字、大写字母、小写字母的码值分别连续；大小写字母之间相差 32（20H）。$kp$, section = '' where id = 29844;
update t_knowledge_point set title = $kp$汉字编码与文本类型$kp$, content = $kp$汉字输入方式有数字编码（区位码）、字音编码（全拼、智能）、字形编码（五笔）、形音编码。无论采用哪种输入方式，存储时都使用机内码，一个汉字占两个字节，同一汉字的内码相同。

GB2312-80 只存简体汉字，区位码两个字节的最高位均为 0；国标码 = 区位码 + 2020H，两个字节最高位仍为 0；机内码 = 国标码 + 8080H = 区位码 + A0A0H，两个字节最高位均为 1。

GBK 为双字节编码，第一字节最高位为 1，第二字节最高位不一定为 1，收录繁体字；GB18030 有单字节、双字节和四字节编码；UCS/Unicode 采用多种编码形式，UTF-32 为四字节编码；CJK、Big5 也是汉字编码标准。

汉字字形码点阵存储空间 = 水平分辨率 × 垂直分辨率 / 8 B。文本类型：简单文本 .txt，丰富格式文本 .doc、.rtf，超文本 .html、.htm。$kp$, section = '' where id = 29845;
update t_knowledge_point set title = $kp$十进制转其他进制（整数）$kp$, content = $kp$十进制整数转其他进制：十进制数除以基数，每除一次取余数，直至商为 0，余数倒读。$kp$, section = '' where id = 29846;
update t_knowledge_point set title = $kp$十进制转其他进制（小数）$kp$, content = $kp$十进制小数转其他进制：十进制小数乘以基数，每乘一次取整数，直到没有小数，整数正读。$kp$, section = '' where id = 29847;
update t_knowledge_point set title = $kp$乘权求和法$kp$, content = $kp$其他进制转十进制采用乘权求和法：数码乘以基数的相应次幂，再相加。

常用 2 的幂：2^0=1，2^1=2，2^2=4，2^3=8，2^4=16，2^5=32，2^6=64，2^7=128，2^8=256，2^9=512，2^10=1024。

十进制转二进制可将数拆分为 2 的整数次幂之和，有对应幂的位为 1，否则为 0。$kp$, section = '' where id = 29848;
update t_knowledge_point set title = $kp$位与字节$kp$, content = $kp$计算机中保存数据采用二进制形式，由 0 或 1 构成的二进制位称为位（bit），8 个位构成 1 个字节（Byte），1 Byte = 8 bit。$kp$, section = '' where id = 29858;
update t_knowledge_point set title = $kp$进制转换的乘除规律$kp$, content = $kp$二进制、八进制、十六进制转化为十进制采用乘权求和；十进制转化为二进制、八进制、十六进制采用除基取余（整数部分）和乘基取整（小数部分）。$kp$, section = '' where id = 29859;
update t_knowledge_point set title = $kp$C 语言书写风格与常量$kp$, content = $kp$推荐性书写规则：及时书写和修改注释，注释简明扼要并放在恰当位置；同一层次的语句同列开始，下一层次语句缩进并合理使用花括号；意义相近的语句可写在同一行；同一语句的不同成分之间用空格隔开。复合语句可采用 K&R、Allman、Whitesmiths 或 GNU 缩进风格。

整型常量可用八进制（前导 0）、十进制、十六进制（前导 0x）表示，并可加 u、l、ul 等后缀；八进制每位只能为 0～7，十六进制每位为 0～9、A～F。实型常量可用小数形式或指数形式表示，指数形式要求 E 前后都有数字且 E 后为整数。

字符常量用单引号括起，'0'、'A'、'a' 的 ASCII 码分别为 48、65、97；字符串常量用双引号括起；符号常量可用 #define、enum 或 const 定义。$kp$, section = '' where id = 29860;
update t_knowledge_point set title = $kp$字符分类函数$kp$, content = $kp$常用字符分类函数（参数为字符）：
- isalnum：是否为数字或字母；
- isalpha：是否为字母；
- iscntrl：是否为控制字符；
- isdigit：是否为十进制数字；
- isgraph：是否为可图形表示字符；
- isprint：是否为可打印字符；
- ispunct：是否为标点符号；
- isspace：是否为空白字符（空格、制表、换行、回车、换页等）；
- isxdigit：是否为十六进制数字。$kp$, section = '' where id = 29861;
update t_knowledge_point set title = $kp$UTF-8 下汉字排序$kp$, content = $kp$当字符集为 UTF-8 时，汉字排序并不按汉语拼音或英文字母顺序进行。需要先将要排序的字段转换为 GBK 或 GB2312 编码，再排序。

例如按汉语拼音降序：SELECT * FROM tb_students ORDER BY CONVERT(name USING gbk) DESC;$kp$, section = '' where id = 29875;
update t_knowledge_point set title = $kp$MIN 函数与字符、日期比较$kp$, content = $kp$MIN 是常用聚合函数，返回某属性（字段）的最小值。属性类型可以是字符型、日期时间型或数值型。

字符型数据按首字母 A～Z 的顺序比较，越往后值越大；汉字按其全拼拼音排列，若字符相同则比较下一个字符。日期时间类型按时间早晚比较，越早值越小。$kp$, section = '' where id = 29876;
update t_knowledge_point set title = $kp$ASCII 编码与存储$kp$, content = $kp$ASCII 码采用七位编码，最高位置 0，在计算机中用 1 个字节来存放。$kp$, section = '' where id = 29889;
update t_knowledge_point set title = $kp$Unicode 与汉字编码的关系$kp$, content = $kp$Unicode 编码不是我国制定的汉字编码标准。同一个汉字在不同字符集中的编码并不相同，例如在 GB2312、GBK 和 Unicode 中的编码可能不同。$kp$, section = '' where id = 29890;
update t_knowledge_point set title = $kp$ASCII 编码$kp$, content = $kp$ASCII 码采用 7 个二进位进行编码，最高位置 0。计算机中使用 1 个字节存储 1 个 ASCII 字符。$kp$, section = '' where id = 29899;
update t_knowledge_point set title = $kp$GB2312 字符集与编码$kp$, content = $kp$GB2312 收录 6763 个常用汉字，其中一级汉字 3755 个（按汉语拼音排序），二级汉字 3008 个（按偏旁部首排序），另有 682 个图形符号。

GB2312 编码有区位码、国标码、机内码三种表现形式；区位码行号为区号、列号为位号，共 94 行、94 列；汉字在计算机内部以机内码存放，GB2312 汉字的机内码占两个字节，最高位均为 1。换算：区位码 + 2020H = 国标码，国标码 + 8080H = 机内码。$kp$, section = '' where id = 29900;
update t_knowledge_point set title = $kp$GBK 编码$kp$, content = $kp$GBK 包含繁体字，与 GB2312 保持向下兼容；GBK 使用双字节表示，第 1 字节最高位必须为 1。$kp$, section = '' where id = 29901;
update t_knowledge_point set title = $kp$GB18030 的四字节编码$kp$, content = $kp$GB18030 扩充到 4 个字节编码，向下兼容 GBK 和 GB2312。因此“汉字都是两个字节编码”的说法是错误的。$kp$, section = '' where id = 29902;
update t_knowledge_point set title = $kp$Unicode 与文本的分类$kp$, content = $kp$UCS/Unicode 不是我国的编码标准，与我国的 GB2312、GBK、GB18030 不兼容。

文本按是否具有排版格式分为简单文本和丰富格式文本；按内容的组织方式分为线性文本和超文本。$kp$, section = '' where id = 29903;
update t_knowledge_point set title = $kp$吉比特每秒$kp$, content = $kp$“吉比特/秒”（Gb/s）：1 Gb/s = 10^9 比特/秒 = 1000 Mb/s。$kp$, section = '' where id = 29912;
update t_knowledge_point set title = $kp$ASCII 与 GB2312 编码$kp$, content = $kp$基本 ASCII 与扩展 ASCII 都用 1 个字节（8 b）存放，区别是基本 ASCII 的最高位为 0，扩展 ASCII 的最高位为 1。常见字符的 ASCII 码值由小到大为：回车符 13、空格 32、数字 0～9 为 48～57、大写字母 A～Z 为 65～90、小写字母 a～z 为 97～122。

GB2312 字符集由三部分组成：字母、数字和各种符号；一级常用汉字 3755 个，按汉语拼音排列；二级常用汉字 3008 个，按偏旁部首排列。GB2312 将字符集分为 94 行（区号）、94 列（位号），区位码加 20H 得国标交换码，再加 80H 得机内码。$kp$, section = '' where id = 29915;
update t_knowledge_point set title = $kp$计算题备考提示$kp$, content = $kp$计算机考试中计算题题量有所增加，但计算方法保持不变，考生应保证计算准确。进制转换曾出现小数转换题，需要加强训练，避免丢分。$kp$, section = '' where id = 29925;
update t_knowledge_point set title = $kp$信息表示单位与地址$kp$, content = $kp$计算机中单位换算的最小单位是 b（bit，比特）。内存储器中的每个存储单元都被赋予一个唯一的序号，称为地址；存储单元的基本单位是字节（B）。一个英文字母占 1 字节，一个中文汉字占 2 字节。表示比特需要使用具有两个稳定状态的物理器件。比特既可以表示数值或文字，也可以表示图像或声音。字长是指计算机一次能处理的二进制位数。

1 B = 8 bit；1 KB = 1024 B = 2^10 B；1 MB = 1024 KB = 2^20 B；1 GB = 1024 MB = 2^30 B；1 TB = 1024 GB = 2^40 B。$kp$, section = '' where id = 29931;
update t_knowledge_point set title = $kp$西文字符 ASCII 码$kp$, content = $kp$ASCII 码由 7 个二进制位进行编码，最高位为 0，包含 96 个可打印字符和 32 个控制字符，共 128 个字符。

数字、字母的 ASCII 码是连续的，对应大小写字母相差 32（十进制），即 20H。例如假设 A 的码值为 60，则 a 为 92；若 A 为 60H，则 a 为 80H。ASCII 码值由小到大排序为：空格＜数字（最小为 0）＜大写字母＜小写字母（最大为 z）。$kp$, section = '' where id = 29934;
update t_knowledge_point set title = $kp$汉字编码要点$kp$, content = $kp$我国第一个汉字编码国家标准 GB2312-1980 不支持繁体字；一级常用汉字按汉语拼音排列，二级常用汉字按偏旁部首排列。

机内码是汉字的存储编码，区位码是汉字的输入、查询编码；汉字机内码最高位为 1。国标码 = 区位码 + 2020H，机内码 = 国标码 + 8080H = 区位码 + A0A0H。连续两个大于 A0H 的字节才可能是一个汉字。

1995 年发布 GBK，在 GB2312-1980 的基础上增加了一万多个繁体字。UCS/Unicode 是国际标准，支持繁体字，不是我国标准，与 GB2312、GBK、GB18030 不兼容。我国目前使用的汉字编码是 GB18030。Big5 是台湾地区的繁体字符集，不支持简体。支持繁体字的有 Big5、GBK、GB18030。

同一字符集下存储（机内码）相同，输出（字形）不同。$kp$, section = '' where id = 29935;
update t_knowledge_point set title = $kp$点阵汉字存储计算$kp$, content = $kp$1 KB 能存 512 个汉字的机内码，约存 14 个 24×24 点阵汉字。计算方法：汉字个数 = 1024 ÷（点阵行数 × 点阵列数 ÷ 8）。$kp$, section = '' where id = 29937;
update t_knowledge_point set title = $kp$西文、汉字与媒体的比特数$kp$, content = $kp$每个西文字符通常用 8 个比特表示，每个汉字至少需要使用 16 个比特才能表示，图像和声音需要更多的比特表示。$kp$, section = '' where id = 29951;
update t_knowledge_point set title = $kp$不同汉字编码标准的代码异同$kp$, content = $kp$采用 GB2312、GBK 和 GB18030 三种汉字编码标准时，一些常用汉字（如“三”“毛”）在计算机中的二进制代码相同；采用 Unicode 编码时则不相同。$kp$, section = '' where id = 29954;
update t_knowledge_point set title = $kp$Unicode 与 GB 系列编码的兼容性$kp$, content = $kp$Unicode 中的汉字编码与 GB2312、GBK、GB18030 标准并不相同，编码值不兼容，需要通过转换表进行转换。$kp$, section = '' where id = 29955;
update t_knowledge_point set title = $kp$汉字与 ASCII 的区分$kp$, content = $kp$为了处理汉字方便，汉字与 ASCII 字符必须互相区别。所以在计算机内，以最高位均为 1 的 2 个字节表示一个 GB2312 汉字。$kp$, section = '' where id = 29956;
update t_knowledge_point set title = $kp$逻辑运算分类$kp$, content = $kp$逻辑乘（与、and、∧、·）：全 1 为 1，否则为 0。

逻辑加（或、or、∨、+）：有 1 为 1，全 0 为 0。

取反（非、not）：1 变 0，0 变 1。$kp$, section = '' where id = 30110;
update t_knowledge_point set title = $kp$逻辑运算的门电路实现$kp$, content = $kp$逻辑加 F = A ∨ B，逻辑乘 F = A · B，取反 F = NOT A，分别由或门、与门、非门实现。$kp$, section = '' where id = 30126;
update t_knowledge_point set title = $kp$三种基本逻辑运算$kp$, content = $kp$逻辑代数中最基本的逻辑运算有三种：逻辑加（或运算）、逻辑乘（与运算）和取反运算。$kp$, section = '' where id = 30134;
update t_knowledge_point set title = $kp$由原码求补码口诀$kp$, content = $kp$负数的“由原码求补码”口诀是：最高位的符号位 1 保持不变；其余各位取反，再在末位加 1。$kp$, section = '' where id = 30135;
update t_knowledge_point set title = $kp$由补码求原码口诀$kp$, content = $kp$负数的“由补码求原码”口诀是：最高位的符号位 1 保持不变；末位先减去 1，然后再取反。$kp$, section = '' where id = 30136;
update t_knowledge_point set title = $kp$实数的阶码与尾数$kp$, content = $kp$任意一个实数在计算机内部使用“指数”（即“阶码”，是一个整数）和“尾数”（是一个纯小数）来表示。$kp$, section = '' where id = 30137;
update t_knowledge_point set title = $kp$阶码与尾数位数的影响$kp$, content = $kp$阶码位数越多，数的范围越大；尾数位数越多，数的精度越高。相同长度的浮点数和定点数，浮点数表示的数值范围比定点数大得多。$kp$, section = '' where id = 30138;
update t_knowledge_point set title = $kp$字符常量与转义字符$kp$, content = $kp$字符常量用单引号括起。'1' 是字符，占 1 个字节；"1" 是字符串，占 2 个字节（含结束符）。'0' 的 ASCII 码为 48，'a' 为 97，'A' 为 65。'65' 和 "1" 不是单个字符常量的正确形式。大写字母与小写字母的 ASCII 码相差 32，'A'+32='a'。

转义字符分为一般转义字符、八进制转义字符和十六进制转义字符。一般转义字符如 \0、\n、\'、\"、\\；八进制转义字符如 '\141'，前导 0 可不写；十六进制转义字符如 '\x6d'，x 为小写，前导 0 不写。

字符型与整型关系密切：char a = 65; 用 %c 输出 A，用 %d 输出 65。$kp$, section = '' where id = 30226;
update t_knowledge_point set title = $kp$位运算统计二进制中 1 和 0 的个数$kp$, content = $kp$按位或运算规则：有 1 为 1，全 0 为 0。

常用技巧：i = i & (i-1) 可消除 i 的二进制中最右边的 1，循环执行可统计 1 的个数；i = i | (i+1) 可将最右边的 0 变为 1，循环执行可统计 0 的个数。例如 2022 的 32 位二进制中有 8 个 1、24 个 0。$kp$, section = '' where id = 30228;
update t_knowledge_point set title = $kp$字符范围判断与移位替换$kp$, content = $kp$对字符 c 判断其是否在字母范围内：若 c 在 A～Z 或 a～z 中，且不在 W～Z 或 w～z 中，则将其 ASCII 码加 4，得到其后第 4 个字母；若在 W～Z 或 w～z 中，则减 26，转换为 A～D 或 a～d。这样可保证结果仍在字母范围内。$kp$, section = '' where id = 32067;
update t_knowledge_point set title = $kp$字符型数据与转义字符$kp$, content = $kp$字符常量是用单引号括起来的一个字符；字符变量存放的是该字符的 ASCII 码，因此字符型与整型可以相互赋值，并可用 %c 或 %d 输出。

常用转义字符：\n 换行、\t 横向跳格、\r 回车、\b 退格、\f 换页、\\ 反斜杠、\' 单引号；\ddd 表示 1～3 位八进制 ASCII 码，\xhh 表示 1～2 位十六进制 ASCII 码，如 '\101' 和 '\x41' 都表示 'A'。字符串常量用双引号括起，末尾隐含一个结束标志。$kp$, section = '' where id = 32237;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (21857,22124,22125,22127,22153,25399,25400,25403,25404,25405,25406,25751,25759,25770,25896,25897,25898,25899,25979,26017,26165,26715,26716,26717,26718,26719,26720,26721,26722,26787,26788,26917,26918,26919,26923,26924,26925,26927,26928,26929,26930,26931,26932,26933,26934,26935,26936,26937,26938,26939,26940,26941,26942,26943,26944,26945,26949,26950,27067,27083,27084,27086,27087,27088,27089,27090,27091,27092,27093,27145,27223,27253,27584,27586,27611,27612,27613,27615,27616,27617,27618,27619,27620,27621,27622,27623,27624,27626,27627,27631,27639,27640,27641,27642,27659,27671,27672,27673,27674,27675,27676,27677,27678,27679,27680,27690,27691,27738,27739,27740,27741,27742,27743,27744,27745,27746,27747,28215,28228,28292,28293,28357,28358,28359,28367,28368,28369,28381,28382,28383,28384,28385,28415,28416,28419,28543,28545,28551,28628,28655,28663,28781,28793,28795,28796,28798,28799,28801,28803,28804,28880,28881,28884,28931,29133,29135,29137,29138,29455,29553,29587,29590,29667,29683,29684,29685,29686,29687,29688,29689,29690,29695,29696,29697,29698,29699,29700,29702,29734,29735,29736,29737,29738,29739,29740,29741,29742,29743,29744,29745,29748,29749,29750,29753,29754,29755,29771,29804,29805,29806,29807,29808,29809,29810,29811,29812,29841,29842,29843,29844,29845,29846,29847,29848,29858,29859,29860,29861,29875,29876,29889,29890,29899,29900,29901,29902,29903,29912,29915,29925,29931,29934,29935,29937,29951,29954,29955,29956,30110,30126,30134,30135,30136,30137,30138,30226,30228,32067,32237) and not deleted) <> 249 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
