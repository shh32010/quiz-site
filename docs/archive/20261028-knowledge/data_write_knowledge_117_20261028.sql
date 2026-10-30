-- 知识点 117 节内容清洗（2026-10-28，AI 辅助 + 人工校验）
-- 目的：修正标题/段落/OCR/LaTeX；保留全部知识点 ID。
-- 备份表：t_knowledge_point_backup_20261028_117
-- 回滚：按 id 从备份表恢复 title/content/section。
begin;
create table if not exists t_knowledge_point_backup_20261028_117 as
select * from t_knowledge_point where id in (22800,23216,23253,23507,23512,23559,23560,23585,23654,23761,23766,23767,23769,23785,23786,23787,23832,23833,23834,23838,23847,23850,23962,23972,23973,23979,23980,23984,24043,24047,24066,24070,24120,24121,24579,25142,25163,25269,25270,27077,27078,27512,27625,27724,27730,27748,29521,29600,30116,30147,30150,32031,32033,32051);

update t_knowledge_point set title = $kp$7位ASCII码的字符编码规则$kp$, content = $kp$7位ASCII码对大小写英文字母、标点符号及控制符等共128个字符规定了编码，其中小写字母的ASCII码值大于大写字母。

一个英文字符的ASCII码就是它的内码；而在汉字系统中，ASCII码与汉字内码不是同一个值。$kp$, section = '' where id = 22800;
update t_knowledge_point set title = $kp$编码2000个字符所需的二进制位数$kp$, content = $kp$2^11 = 2048 > 2000，2^10 = 1024 < 2000，故表示2000个不同字符至少需要11个二进位。$kp$, section = '' where id = 23216;
update t_knowledge_point set title = $kp$GB2312汉字编码表的结构$kp$, content = $kp$GB2312字符集按94个区、每区94个位排列：1～9区为字母、数字和各种符号，共682个；16～55区为一级汉字3755个（按汉语拼音排序）；56～87区为二级汉字3008个（按偏旁部首排序），其余区段留作扩充使用。汉字共6763个。$kp$, section = '' where id = 23253;
update t_knowledge_point set title = $kp$GB2312汉字的机内码$kp$, content = $kp$问题：文本中的汉字与西文字符经常混合使用，汉字信息如不予以特别的标识，就会与单字节的标准ASCII码混淆不清。

解决方法：把一个汉字看作两个扩展ASCII码，使表示GB2312汉字的两个字节的最高位（b7）都等于1（即加80H）。这种高位为1的双字节（16位）汉字编码称为GB2312汉字的“机内码”，又称内码。例如“大”字的内码是10110100 11110011，即B4F3。

汉字的区位码、国标码、机内码关系：
- 国标码 = 区位码 + 2020H
- 机内码 = 国标码 + 8080H
- 机内码 = 区位码 + A0A0H

汉字机内码为双字节，最高位是1；西文字符机内码为单字节，最高位是0。$kp$, section = '' where id = 23507;
update t_knowledge_point set title = $kp$GB2312机内码的字节格式$kp$, content = $kp$GB2312汉字机内码占两个字节，每个字节的最高位均为1，格式为“1xxxxxxx 1xxxxxxx”。例如“南”字的代码是11000100 11001111，用十六进制表示为C4CF。$kp$, section = '' where id = 23512;
update t_knowledge_point set title = $kp$西文字符的编码（ASCII码）$kp$, content = $kp$西文字符集由拉丁字母、数字、标点符号及一些特殊符号组成。目前计算机中使用得最广泛的西文字符集及其编码是ASCII字符集和ASCII码，即美国标准信息交换码。

- 每个ASCII字符使用7个二进制位进行编码，以一个字节存放（8位，最高位为0）。
- 基本ASCII字符集共有128个字符，包括96个可打印字符（常用的字母、数字、标点符号等）和32个控制字符。
- 一般要记住几个特殊字符的ASCII码：空格32、A 65、a 97、0 48。
- 数字、字母的ASCII码是连续的；对应的大小写字母ASCII码相差32（20H）。
- 不同类型字符的ASCII码十进制值由小到大依次为：空格 < 数字 < 大写字母 < 小写字母。$kp$, section = '' where id = 23559;
update t_knowledge_point set title = $kp$标准ASCII码$kp$, content = $kp$西文字符集由拉丁字母、数字、标点符号及一些特殊符号组成。西文字符的编码是对字符集中每一个字符各有一个二进制编码，通常记为十进制数或十六进制数。

标准ASCII码（American Standard Code for Information Interchange，美国标准信息交换码）使用7个二进位对字符进行编码，每个ASCII字符以一个字节存放（8位，最高位为0）。标准的ASCII字符集共有128个字符，其中含96个可打印字符（常用字母、数字、标点符号等）和32个控制字符。

一般要记住几个特殊字符的ASCII码：空格32、A 65、a 97、0 48。注意：数字、字母的ASCII码是连续的；对应大小写字母的ASCII码相差32。不同类型字符的ASCII码十进制值由小到大依次为：空格、数字、大写字母、小写字母。$kp$, section = '' where id = 23560;
update t_knowledge_point set title = $kp$GBK汉字内码扩充规范$kp$, content = $kp$问题：GB2312-80只有6763个汉字，使用时功能不够。

解决方法：1995年发布GBK，全称为《汉字内码扩展规范》。GBK字符集中一共有21003个汉字和883个图形符号，它与GB2312国标汉字字符集及其内码保持兼容。

GBK/1：GB2312中的符号；GBK/2：GB2312中的全部汉字；GBK/3和GBK/4：包括繁体字在内的大量汉字；GBK/5：符号。例如“計算機”等繁体汉字和冃、冄、円、冇、鎔等生僻汉字。

GBK仍用双字节表示，第1个字节的最高位为1。$kp$, section = '' where id = 23585;
update t_knowledge_point set title = $kp$UCS/Unicode与UTF-8编码转换$kp$, content = $kp$通用编码字符集UCS/Unicode：为了与目前大量使用的8位系统兼容，且避免与数据通信中使用的控制码冲突，UCS/Unicode在实现时可将双字节变换为可变长代码。

UCS-2编码到UTF-8编码的部分转换规则：

| UCS-2编码范围 | 转换前的代码 | 转换后的代码 |
| --- | --- | --- |
| 0000～007F | 00000000 0xxxxxxx | 0xxxxxxx |
| 0080～07FF | 00000xxx xxyyyyyy | 110xxxxx 10yyyyyy |
| 0800～FFFF | xxxxyyyy yyzzzzzz | 1110xxxx 10yyyyyy 10zzzzzz |$kp$, section = '' where id = 23654;
update t_knowledge_point set title = $kp$扩充ASCII字符集$kp$, content = $kp$标准ASCII码是七位的编码，但字节是计算机中最基本的处理单位，故以一个字节来存放一个ASCII字符。每个字节中多出来的一位一般保持为“0”，在数据传输时可用作奇偶校验位。

扩充ASCII字符集：标准ASCII字符集只有128个不同的字符，在很多应用中无法满足要求。按照ISO 2022标准（《七位字符集的代码扩充技术》）的规定，ISO陆续制定了一批适用于不同地区的扩充ASCII字符集，每个扩充ASCII字符集分别可以扩充128个字符，这些扩充字符的编码均是高位为1的8位代码（十进制数128～255），称为扩展ASCII码。$kp$, section = '' where id = 23761;
update t_knowledge_point set title = $kp$GB2312代码空间的分布$kp$, content = $kp$GB2312汉字机内码的代码空间：首字节A1～F7，尾字节A1～FE。其中首字节A1～A9为图形符号区，B0～F7为汉字区，共6763个汉字。$kp$, section = '' where id = 23766;
update t_knowledge_point set title = $kp$GBK代码空间与码位分布$kp$, content = $kp$GBK的代码空间：首字节81～FE，尾字节40～FE（7F除外）。其中：
- GBK/1：GB2312中的符号
- GBK/2：GB2312中的全部汉字（6763个）
- GBK/3、GBK/4：扩充汉字
- GBK/5：扩充符号$kp$, section = '' where id = 23767;
update t_knowledge_point set title = $kp$GB2312区位表的结构$kp$, content = $kp$GB2312区位表共94个区、每区94个位。1～9区为符号区，16～55区为一级汉字3755个（按汉语拼音排列），56～87区为二级汉字3008个（按偏旁部首排列），10～15区和88～94区留作扩充使用。共6763个汉字和682个符号，每个汉字和符号都有一个确定的位置。$kp$, section = '' where id = 23769;
update t_knowledge_point set title = $kp$GB18030汉字编码标准$kp$, content = $kp$背景：无论是Unicode的UTF-8还是UTF-16，其CJK汉字字符集虽然覆盖了我国已使用多年的GB2312和GBK标准中的汉字，但编码并不相同。为了既能与UCS/Unicode编码标准接轨，又能保护我国已有的大量汉字信息资源，我国在2000年和2005年两次发布GB18030汉字编码国家标准。

GB18030实质上是UCS/Unicode字符集的另一种编码方案：
- 单字节编码（128个）表示ASCII字符；
- 双字节编码（23940个）表示汉字，与GBK（以及GB2312）保持向下兼容；
- 四字节编码（约158万个）用于表示UCS/Unicode中的其他字符。

GB18030目前已在我国信息处理产品中强制贯彻执行。$kp$, section = '' where id = 23785;
update t_knowledge_point set title = $kp$GB2312汉字的编码$kp$, content = $kp$每一个GB2312汉字使用16位（2个字节）表示；为了与ASCII字符相区别，每个字节的最高位均为1。$kp$, section = '' where id = 23786;
update t_knowledge_point set title = $kp$GB2312汉字编码字符集$kp$, content = $kp$1980年颁布《信息交换用汉字编码字符集·基本集》GB2312-1980。GB2312字符集由三个部分构成：图形符号（682个，1～9区）、一级汉字（3755个，16～55区）、二级汉字（3008个，56～87区），每个字符都按区号和位号定位。$kp$, section = '' where id = 23787;
update t_knowledge_point set title = $kp$UCS/Unicode多文种大字符集$kp$, content = $kp$背景：为了实现全球数以千计的不同语言文字的统一编码。

方案：ISO将全球所有文字字母和符号集中在一个字符集中进行统一编码（目前共收集了17×2^16 = 1,114,112个），称为UCS/Unicode。

UCS/Unicode的编码方案：
- 先实现部分字符的编码（近11万个字符）；
- 尽量与已有编码标准兼容；
- 包含中、日、韩、越统一整理出来的约7万汉字（称CJKV汉字）；
- 允许有若干不同的编码方案，常用的两种是UTF-8和UTF-16。$kp$, section = '' where id = 23832;
update t_knowledge_point set title = $kp$UTF-16双字节可变长编码$kp$, content = $kp$双字节：ASCII字符、拉丁、希腊、阿拉伯、常用CJKV汉字等。

四字节：非常用CJKV汉字。

应用：Windows、Mac、Java等。$kp$, section = '' where id = 23833;
update t_knowledge_point set title = $kp$UTF-8单字节可变长编码$kp$, content = $kp$单字节：ASCII字符。

双字节：拉丁、希腊、阿拉伯等。

三字节：CJKV汉字。

四字节：其他字符。

应用：Linux、Web网页、电子邮件。$kp$, section = '' where id = 23834;
update t_knowledge_point set title = $kp$ASCII码与汉字编码预测试题$kp$, content = $kp$1．在下列字符中，其ASCII码值最大的一个是______。（2005单选）
A．X B．6 C．5 D．Y

2．下列字符中，其ASCII码值最大的是______。
A．9 B．D C．a D．y

3．已知ASCII码字符“5”的编码为00110101，则“7”的ASCII码是00110111。

4．已知英文小写字母a的ASCII码为十六进制数61H，则英文小写字母d的ASCII码为______。
A．34H B．54H C．64H D．24H

5．已知英文小写字母d的ASCII码为十进制数100，则英文小写字母h的ASCII码为十进制数______。
A．103 B．104 C．105 D．106

6．已知英文大写字母G的ASCII码为十进制数71，则英文大写字母W的ASCII码为十进制数______。
A．84 B．85 C．86 D．87

7．数字字符2的ASCII码为十进制数50，数字字符5的ASCII码为十进制数______。
A．52 B．53 C．54 D．55

8．设某汉字的区位码为(2710)D，则其______。（2005多选）
A．机内码为(BBAA)H B．国标码为(3B2A)H
C．国标码为(4730)H D．机内码为(9B8A)H

9．已知汉字的区号为22，位号为50，则其机内码为B6D2H。

10．汉字“灯”的区位码为“2138”，该汉字的机内码的十六进制表示为______。
A．B5C6H B．C1D8H C．B538H D．21C6H

11．汉字“啊”的十进制区位码是“1601”，它的十六进制国标码为______。
A．1601H B．3621H C．3021H D．1621H

12．按照GB2312-80标准，存储一个汉字的内码需要______字节。
A．1 B．2 C．3 D．4

13．利用ASCII码表示一个英文字母和用国标GB2312-80码表示一个汉字，分别需要______个二进制位。
A．7和8 B．7和16 C．8和8 D．8和16

14．按照GB2312-80标准，在计算机中，汉字系统把一个汉字表示为______。
A．汉语拼音字母的ASCII代码 B．十进制数的二进制编码
C．按字形笔划设计的二进制码 D．两个字节的二进制编码

15．在“全角”方式下输入1个ASCII字符，要占用______显示位置。
A．半个汉字 B．1个汉字 C．2个汉字 D．3个汉字

16．计算机存储器中的一个字节可以存放______。
A．一个汉字 B．两个汉字 C．一个西文字符 D．两个西文字符

17．一个字符的标准ASCII码由______位二进制数组成。
A．7 B．1 C．8 D．16

18．一个字符的标准ASCII码在内存储器中由______位二进制数存储。
A．7 B．1 C．8 D．16

19．一个字符的标准ASCII码在内存储器中由______字节存储。
A．7 B．1 C．8 D．16

20．计算机处理信息时，一个汉字占用的字节数是______。
A．2 B．4 C．6 D．8

21．在中文Windows环境下，西文使用标准ASCII码，汉字采用GB2312编码，现有一段文本的内码为：AB F4 D1 E3 78 C2 B7 55，则在这段文本中，含有的汉字和西文字符的个数分别是______。（2006填空）

22．若计算机中相邻2个字节的内容其十六进制形式为34和51，则它们不可能是______。
A．2个西文字符的ASCII码 B．1个汉字的机内码 C．1个16位整数 D．一条指令

23．在计算机中表示数据的连续2个字节为34H、51H，则其______。
A．是2个西文字符的ASCII码 B．是1个汉字的国标码
C．不是1个汉字的国标码 D．可能是2个西文字符的ASCII码，也可能是1个汉字的国标码

24．在中文Windows 95/98环境下，设有一段文本的内码为CB F5 D0 B4 50 43 CA C7 D6 B8，在这段文本中，含有（ ）个汉字和西文字符。
A．2个汉字和1个西文字符 B．4个汉字和2个西文字符
C．8个汉字和2个西文字符 D．4个汉字和1个西文字符

25．目前，汉字信息在计算机内大多以双字节编码表示，在下列用十六进制表示的两个字节的编码中，哪一个可能是汉字“大”的机内码？
A．B4F3H B．3546H C．73F3H D．B10H$kp$, section = '' where id = 23838;
update t_knowledge_point set title = $kp$丰富格式文本$kp$, content = $kp$有字体、字号等属性变化，并设置了段落和页面排版格式的文本称为“丰富格式文本”。

丰富格式文本中，除了正文内容之外，还使用了许多“标记”来描述字符的属性和格式的设置。例如：标题的中文用黑体、西文用Arial Black体并居中，其正文内容为“本书由南京大学出版社(Publishing House of Nanjing University)出版”。

用一对尖括号括起来的是标记，如<font>和</font>等，用于说明排版的格式和文字属性，它们不属于正文内容。$kp$, section = '' where id = 23847;
update t_knowledge_point set title = $kp$字符在计算机内部的表示$kp$, content = $kp$ASCII码即美国信息交换标准码，采用7位二进制进行编码：0000000B～1111111B，即0～127，共128个编码。

- A～Z：65～90
- a～z：97～122
- 0～9：48～57
- 空格（space）：32

标准ASCII字符128个，扩展ASCII字符128个。$kp$, section = '' where id = 23850;
update t_knowledge_point set title = $kp$西文字符的编码——ASCII码$kp$, content = $kp$西文是表音文字（拼音文字），它由拉丁字母、数字、标点符号以及一些特殊符号所组成。

美国信息交换标准码（ASCII码）：
- ASCII字符集包含96个可打印字符和32个控制字符；
- 采用7个二进位进行编码，编码形式为0xxxxxxx；
- 计算机中使用1个字节存储1个ASCII字符。

存在问题：
- 字符集太小，只有128个字符；
- 不同国家和地区使用不同的字符集及其编码，互不兼容。$kp$, section = '' where id = 23962;
update t_knowledge_point set title = $kp$字符、字符集及其编码$kp$, content = $kp$文字的基本元素是字母和符号，统称为“字符”（character），它包括字母、数字、标点、符号等。

字符集：一组特定字符的集合。不同的字符集包含的字符数目与内容不同，如中文字符集、西文字符集、日文字符集等。

字符的编码：字符集中每个字符的二进位表示，称为该字符的编码或代码（code）；不同的字符其编码各不相同。$kp$, section = '' where id = 23972;
update t_knowledge_point set title = $kp$字符编码转换与常用结论$kp$, content = $kp$基本知识：ASCII码即美国标准信息交换码（American Standard Code for Information Interchange），使用7个二进位对字符进行编码，每个ASCII字符以一个字节存放（8位，最高位为0）。标准的ASCII字符集共有128个字符，其中含96个可打印字符（常用字母、数字、标点符号等）和32个控制字符。

一般要记住几个特殊字符的ASCII码：空格32、A 65、a 97、0 48。ASCII码中数字、字母的码值由小到大依次为：数字 < 大写字母 < 小写字母。

常用换算：
- 机内码 = 国标码 + 8080H
- 机内码 = 区位码 + A0A0H

补充：汉字2字节，英文标点1字节，中文标点2字节，空格1字节，数字1字节，全角数字2字节。汉字机内码为双字节，最高位是1；西文字符机内码为单字节，最高位是0。$kp$, section = '' where id = 23973;
update t_knowledge_point set title = $kp$同一文本在不同编码标准下的表示$kp$, content = $kp$由于采用不同的编码标准，相同文字在计算机中可以有不同的二进制代码表示。例如“南京大学1234ABCD”在各编码下的前12个字节：

| 编码 | 字节序列 |
| --- | --- |
| GB | C4 CF BE A9 B4 F3 D1 A7 31 32 33 34 |
| UTF-8 | E5 8D 97 E4 BA AC E5 A4 A7 E5 AD A6 |
| UTF-16LE | 57 53 AC 4E 27 59 66 5B 31 00 32 00 |

其中GB码“南”为C4CF、“京”为BEA9、“大”为B4F3、“学”为D1A7；UTF-8中一个汉字占3个字节，UTF-16LE中一个汉字占2个字节。$kp$, section = '' where id = 23979;
update t_knowledge_point set title = $kp$几种汉字编码标准的对比$kp$, content = $kp$| 标准名称 | 字符集 | 编码方法 | 兼容性 |
| --- | --- | --- | --- |
| GB2312 | 6763个汉字（简体字） | 双字节存储和表示，每个字节的最高位均为1 | 向下兼容 |
| GBK | 21003个汉字（包括GB2312汉字在内） | 双字节存储和表示，第1个字节的最高位必为1 | 向下兼容GB2312 |
| GB18030 | 近3万汉字（包括GBK汉字和CJKV及其扩充中的汉字） | 部分双字节、部分4字节表示，双字节表示方案与GBK相同 | 向下兼容 |
| UCS-2（Unicode） | 包含近11万字符，其中的汉字与GB18030相同 | UTF-8采用单字节可变长编码，UTF-16采用双字节可变长编码 | 编码不兼容 |$kp$, section = '' where id = 23980;
update t_knowledge_point set title = $kp$常用的汉字编码字符集$kp$, content = $kp$- 国家标准GB2312-1980
- 汉字扩充规范GBK（已被GB18030取代）
- 国家标准GB18030-2005
- 港澳台使用的汉字编码字符集CNS 11643（BIG 5，俗称“大五码”）
- UCS/Unicode多文种大字符集：Unicode的UTF-8、Unicode的UTF-16$kp$, section = '' where id = 23984;
update t_knowledge_point set title = $kp$汉字如何编码$kp$, content = $kp$汉字是记录汉语（国语、华语）的文字，属于表意文字，它用符号直接表达词或词素，有多个国家和地区使用（中、日、韩、新、马等）。

汉字的特点：数量大；字形复杂，同音字多，异体字多。

编码需要确定：
- 收入多少字、哪些字；
- 在字符集中如何排列；
- 使用多少个二进位进行编码。$kp$, section = '' where id = 24043;
update t_knowledge_point set title = $kp$字形的点阵描述与字库$kp$, content = $kp$文本输出的过程中，文字字形的生成是关键。字形是指每一个字符的形状描述信息，同一种字体的所有字符的形状描述信息集合在一起成为字型库，简称字库（font），不同的字体（如宋体、楷体、黑体等）对应不同的字库。

每一种字库中的形状信息通过两种形式进行描述：点阵描述和轮廓描述。点阵描述用一组排成矩形阵列的点来表示一个字符，每一个点就是一个像素，每个像素用二进制0或1表示，即黑点用1表示，白点用0表示。$kp$, section = '' where id = 24047;
update t_knowledge_point set title = $kp$GB2312二级汉字（3008个）$kp$, content = $kp$第三部分为二级常用字，共3008个，按偏旁部首排列。GB2312所有字符共7445个，其中汉字6763个。$kp$, section = '' where id = 24066;
update t_knowledge_point set title = $kp$简单文本（纯文本）$kp$, content = $kp$没有字体、字号的变化，无图片和表格，也不能建立超链接，其文件后缀名是.txt。在计算机中，.txt文件由一串字符代码所组成，几乎不包含任何其他的格式信息和结构信息。

例：“本书由南京大学出版社(Publishing House of Nanjing University)出版”按字符编码存放，其中“本书由南京大学出版社”的内码为B1BE CAE9 D3C9 C4CF BEA9 B4F3 D1A7 B3F6 B0E6 C9E7，其后的“(Publishing House of Nanjing…”按ASCII码存放（28 50 75 62 6C 69 73 68 69 6E 67 …）。$kp$, section = '' where id = 24070;
update t_knowledge_point set title = $kp$GB2312的不足$kp$, content = $kp$汉字字数太少，缺少繁体字，无法满足人名、地名、古籍整理、古典文献研究等应用的需要；汉字采用双字节编码，与单字节的ASCII字符混排时需依靠最高位加以区分。$kp$, section = '' where id = 24120;
update t_knowledge_point set title = $kp$GBK汉字内码扩充规范（1995）$kp$, content = $kp$在GB2312基础上，增加了1万多汉字（包括繁体字）和符号，共有21003个汉字和883个图形符号，如“計算機”以及冃、冄、円、冇等繁体字和生僻字。

与GB2312保持向下兼容，也使用双字节表示，第1字节的最高位必须为1。$kp$, section = '' where id = 24121;
update t_knowledge_point set title = $kp$GB2312的图形符号区（1～9区）$kp$, content = $kp$1～9区为图形符号区，收录拉丁字母、俄文、日文平假名与片假名、希腊字母、汉语拼音等共682个符号；汉字从16区开始排列。$kp$, section = '' where id = 24579;
update t_knowledge_point set title = $kp$字库的两种描述方式$kp$, content = $kp$点阵描述：用排成矩形阵列的像素点表示字符。

轮廓描述：用轮廓点、直线和二次曲线描述字符的外形。$kp$, section = '' where id = 25142;
update t_knowledge_point set title = $kp$存储容量单位及其换算$kp$, content = $kp$一个汉字占2个字节。

- 字节（Byte，B）：1B = 8bit
- 千字节（KB）：1KB = 1024B = 2^10 B
- 兆字节（MB）：1MB = 1024KB = 2^20 B
- 千兆字节（GB）：1GB = 1024MB = 2^30 B
- 兆兆字节（TB）：1TB = 1024GB = 2^40 B

传输速率换算：1KB = 8Kb，1B/s = 8bps（b/s），1KB/s = 8Kbps，1MB/s = 8Mbps。$kp$, section = '' where id = 25163;
update t_knowledge_point set title = $kp$西文字符的编码——ASCII码$kp$, content = $kp$ASCII 码用 7 位二进制对字符编码，共表示 128 个字符，码值范围 0～127，包括数字、大小写字母、标点符号和特殊符号。每个字符在计算机内部占 1 个字节（8 位），最高位补 0。码值大小关系为：数字＜大写字母＜小写字母；同一字母的大写与小写码值相差 32。汉字采用 2 个字节编码，以与 ASCII 码区分。$kp$, section = '' where id = 25269;
update t_knowledge_point set title = $kp$汉字的编码与汉字字符集$kp$, content = $kp$GB2312-1980：共收录 7445 个字符。第一部分为字母、数字及各种符号 682 个；第二部分为一级常用汉字 3755 个，按汉语拼音排列；第三部分为二级汉字 3008 个，按偏旁部首排列，汉字共 6763 个。每个汉字用两个字节编码，每个字节的最高位均为 1，以与 ASCII 码区分；不含繁体字。汉字还可用区号、位号表示，从输入到存储涉及输入码与机内码。
GBK：双字节编码，向下兼容 GB2312；第一字节最高位必须为 1，第二字节最高位可为 0 或 1；收录繁体字。
GB18030：与 GB2312、GBK 向下兼容，采用不等长编码，单字节对应 ASCII 字符，双字节部分与 GBK 相同，并有四字节编码。
Big5：供台湾、香港、澳门地区使用，只支持繁体字，与 GB2312 不兼容。
Unicode（UCS）：与我国的编码标准不兼容；GB18030 与 Unicode 接轨，有利于过渡。UTF-8 为变长编码，ASCII 字符占 1 字节、汉字占 3 字节，安卓系统使用；UTF-16LE 中 ASCII 字符占 2 字节、汉字占 2 或 4 字节，Windows 使用；UTF-16BE 中 ASCII 字符占 2 字节、汉字占 2 或 4 字节，iOS、Mac OS X 使用。
说明：常用汉字在 GB2312、GBK、GB18030 中的机内码相同，但与 Unicode 中的编码不同。
汉字输入：在键盘输入、联机手写输入、语音识别输入、印刷体汉字识别输入中，易学易用、适合在手机等移动设备上使用的是联机手写输入。$kp$, section = '' where id = 25270;
update t_knowledge_point set title = $kp$点阵字$kp$, content = $kp$点阵字用排成矩形的点阵来表示一个字符，每一个点就是一个像素，占一个 bit。$kp$, section = '' where id = 27077;
update t_knowledge_point set title = $kp$常用点阵尺寸$kp$, content = $kp$常用点阵为 N×N，如 16×16、24×24、32×32（像素）。$kp$, section = '' where id = 27078;
update t_knowledge_point set title = $kp$点阵字的表示$kp$, content = $kp$点阵字用排成矩形的点阵来表示一个字符，每一个点就是一个像素，占一个 bit。$kp$, section = '' where id = 27512;
update t_knowledge_point set title = $kp$区位码、国标码与机内码的换算$kp$, content = $kp$区位码 + 2020H = 国标码；国标码 + 8080H = 机内码；区位码 + A0A0H = 机内码。$kp$, section = '' where id = 27625;
update t_knowledge_point set title = $kp$丰富格式文本的组成$kp$, content = $kp$丰富格式文本由正文和标记组成，标记用于说明文本的格式信息。$kp$, section = '' where id = 27724;
update t_knowledge_point set title = $kp$两种不同的字库$kp$, content = $kp$字库分为两种：点阵描述和轮廓描述。$kp$, section = '' where id = 27730;
update t_knowledge_point set title = $kp$由区位码计算国标码和机内码$kp$, content = $kp$区位码 + 2020H = 国标码；国标码 + 8080H = 机内码；区位码 + A0A0H = 机内码。$kp$, section = '' where id = 27748;
update t_knowledge_point set title = $kp$字库的两种描述方式$kp$, content = $kp$字库分为两种：点阵描述（用于计算存储空间）和轮廓描述（如 TrueType）。$kp$, section = '' where id = 29521;
update t_knowledge_point set title = $kp$字库的两种类型与点阵存储空间$kp$, content = $kp$字库包括点阵描述和轮廓描述两种。Windows 中的 TrueType 就是轮廓描述的字库。
点阵存储空间计算：N×N/8（B）。$kp$, section = '' where id = 29600;
update t_knowledge_point set title = $kp$中文字符以机内码存储$kp$, content = $kp$中文字符（GB2312、GBK、GB18030）在计算机中以机内码（内码）存储，占 2 字节，码值大于 A0A0H。$kp$, section = '' where id = 30116;
update t_knowledge_point set title = $kp$GB18030 的特点$kp$, content = $kp$2000 年颁布的 GB18030 含有十几万个字符，与 GB2312 和 GBK 保持向下兼容。$kp$, section = '' where id = 30147;
update t_knowledge_point set title = $kp$GB2312 字符在 GBK 与 GB18030 中的机内码$kp$, content = $kp$GB2312 中的每个字符在 GBK 和 GB18030 中都存在，而且在计算机中的机内码完全相同。$kp$, section = '' where id = 30150;
update t_knowledge_point set title = $kp$GB18030的字节扩充与兼容性$kp$, content = $kp$GB18030扩充到多个字节编码，向下兼容GBK和GB2312。$kp$, section = '' where id = 32031;
update t_knowledge_point set title = $kp$文本的分类$kp$, content = $kp$文本分为纯文本和丰富格式文本，又可分为线性文本和超文本；超文本属于丰富格式文本。

① 丰富格式文本的举例：doc、pdf、HTML、rtf、hlp。
② RTF：可以在不同软件和系统中互换各种丰富格式文本的公用中间格式。
③ 超文本：由链源、超链、链宿构成。$kp$, section = '' where id = 32033;
update t_knowledge_point set title = $kp$GB2312字符集与三种编码形式$kp$, content = $kp$GB2312收录6763个常用汉字：一级汉字3755个（按汉语拼音排序），二级汉字3008个（按偏旁部首排序）。

① GB2312编码中只有简体字。
② 有三种表现形式：区位码、国标码、机内码。
③ 区位码：行号称为区号，列号称为位号，共有94行和94列。
④ 机内码：汉字在计算机内部都以机内码的形式存放；GB2312编码的汉字机内码占两个字节，最高位均为1。$kp$, section = '' where id = 32051;

do $$
begin
  if (select count(*) from t_knowledge_point where id in (22800,23216,23253,23507,23512,23559,23560,23585,23654,23761,23766,23767,23769,23785,23786,23787,23832,23833,23834,23838,23847,23850,23962,23972,23973,23979,23980,23984,24043,24047,24066,24070,24120,24121,24579,25142,25163,25269,25270,27077,27078,27512,27625,27724,27730,27748,29521,29600,30116,30147,30150,32031,32033,32051) and not deleted) <> 54 then
    raise exception '清洗条目数异常';
  end if;
end $$;
commit;
