-- P2 第 39 批（25 道；html=1 colon=25 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(389658, NULL, $q$MPEG-4 AVC:用于互联网或者移动通信环境下传输的标清数字视频、iPhone 等。$q$, NULL),(389659, NULL, $q$MPEG（Moving Picture Experts Group，动态图像专家组）是 ISO（International Standardization Organization，国际标准化组织）与 IEC（International Electrotechnical Commission，国际电工委员会）于 1988 年成立的专门针对运动图像和语音压缩制定国际标准的组织。

MPEG-1 audio 层 3 压缩音频，mp3；MPEG-1、MPEG-2、MPEG-4 等都可以压缩视频。$q$, NULL),(389666, NULL, $q$分组交换技术的相关特点→ 传输线路的利用率高;数据通信可靠;灵活性好$q$, NULL),(389669, NULL, $q$选项 A 不属于,Adobe Acrobat 是一种阅读器软件,属于应用软件类型。Adobe 公司推出的 PDF 格式是一种全新的电子文档格式。借助 Acrobat 几乎可以用便携式文档格式(Portable Document Format,PDF)出版所有的文档。PDF 格式的文档能如实保留原来的面貌和内容,以及字体和图像,Adobe Acrobat 的文件扩展名即为 PDF。$q$, NULL),(389673, $q${"A": "用程序设计语言编写的源程序可直接在计算机上执行", "B": "“软件危机”的出现是因为计算机硬件发展严重滞后", "C": "利用\"软件工程\"的理念与方法,可以编制高效高质的软件", "D": "用户购买一个软件后,仅获得该软件的使用权,并没有获得其版权"}$q$, $q$Android 属于嵌入式操作系统,主要应用于移动智能设备上。$q$, NULL),(389683, NULL, $q$算法的设计一般采用由粗到细、由抽象到具体的逐步求精的方法。选项 D 错误算法的必要满足条件:

①、确定性:算法的每一条指令必须有确切的定义，无二义性。
②、有穷性:是指算法必须在有限的时间内做完，即算法必须能在执行有限个步骤之后终止。
③、可行性:算法中的描述在计算机中能执行，且在有穷时间内完成。
④、至少有一个（1 个或多个）输出，但是可以没有（0 个或多个）输入

根据以上选项 A 和选项 C 错误

算法的表示（描述工具）:自然语言描述、流程图、程序设计语言、伪代码。选项 B 正确。$q$, NULL),(389689, NULL, $q$存储管理是对计算机硬件系统中内存资源的管理。$q$, NULL),(389702, NULL, $q$未压缩:码率 = 取样频率 × 量化位数 × 声道数 （基本单位:bit/s, 注意本题单位需要/8）

压缩:压缩后的码率 = 未压缩时的码率/压缩比

$$
8 \mathrm{kHz} * 8 / 8 * 1 * 2 * 6 0 / 4 = 4 8 0 \mathrm{KB}
$$

题目没提到声道数的，默认是单声道。

如果提到“立体声”或者“CD”或者“高保真”的等字样，意思就是双声道。$q$, NULL),(389731, NULL, $q$计算机采用"存储程序控制原理"完成各种操作,即一个问题的运算步骤(程序)连同它所处理的数据都使用二进制位表示,并预先存放在存储器中,程序运行时,CPU 从内存中一条一条地取出指令和相应的数据,按指令操作码的规定,对数据进行运算处理,直到程序执行完毕。指令是对计算机进行程序控制的最小单位。指令用二进制位表示,规定计算机执行什么操作。指令包括两部分:操作码和操作数。$q$, NULL),(389734, NULL, $q$为了实现总线上任意两个节点之间的通信,局域网中的每个节点都有一个唯一的地址,称为介质访问控制地址(Media Access Control address,简称 MAC 地址)。$q$, NULL),(389736, NULL, $q$1280×1024×24/8/1024/1024=3.75MB(横线一)

=256 →像素深度为 8 位(横线二)

1024×768×8/8/1024=768KB(横线三)

3.75MB/768KB →5 倍(横线四)→注意转换成统一单位。$q$, NULL),(389757, NULL, $q$一个完整的计算机软件通常包含程序、数据和文档,三者缺一不可,不能单一的认为软件就是程序,说明性的文档也非常重要。$q$, NULL),(389758, NULL, $q$购买一个商品软件仅仅是获得它一定的使用权,不可能具有其版权。$q$, NULL),(389768, NULL, $q$存储容量的单位是 B（字节，Byte）,有 KB,MB，GB,TB 等。$q$, NULL),(389775, NULL, $q$解析;目前个人计算机使用的操作系统一般都具有单用户多任务处理功能，而安装在网络服务器上运行的"网络操作系统"则具有多用户多任务处理的能力，它们都具有多种网络通信功能，提供丰富的网络应用服务。Windows 系统均属于多任务操作系统。$q$, NULL),(389779, NULL, $q$机器语言是所有程序设计类语言中运行速度最快的,由于其不需要进行翻译,所以在执行速度上比高级语言快很多。在可移植性方面,高级语言要优于机器语言,高级语言的跨平台性要强于机器语言。汇编语言不可以被直接执行,需要翻译为机器语言方能执行。$q$, NULL),(389780, NULL, $q$选项 B 错误,电子邮件的发送通常以群发的形式进行传输,如果电子邮件中包含病毒,则计算机被传染的数量相当可观,其影响范围也是很大的。$q$, NULL),(389781, NULL, $q$诸如学籍管理系统之类的系统,肯定都会涉及数据库系统的管理,所以对数据的处理是必不可少的。$q$, NULL),(389790, NULL, $q$对软盘写保护可以确保含有程序和数据的存储介质在使用过程中不感染病毒。$q$, NULL),(389796, NULL, $q$即可以使用有线通信，也可以使用无线通信。$q$, NULL),(389807, NULL, $q$选项 A 中描述有误，针式打印机可以打印图案、图片，只是分辨率比较低，效果不是很好。其他都是正确的。$q$, NULL),(389810, NULL, $q$压缩编码方法的评价:①、压缩倍数的高低（压缩比例）；②、重建图像的质量（有损压缩时）；③、压缩算法的复杂程度。选择 ACD。$q$, NULL),(389840, NULL, $q$计算机系统由硬件系统与软件系统组成,硬件与软件之间互相依存,硬件和软件无严格界线,硬件和软件协同发展,所以也不存在软件价值低于硬件价值一说。$q$, NULL),(389856, NULL, $q$研究数据结构一般包括三方面:数据的逻辑结构、数据的存储结构，定义在逻辑结构和存储结构上的运算。D 选项正确。$q$, NULL),(389859, NULL, $q$结构化程序设计方法按照模块划分原则以提高程序可读性和易维护性、可调性和可扩充性为目标的一种程序设计方法。$q$, NULL)
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
  IF n <> 1 THEN RAISE EXCEPTION '第 39 批 HTML 更新数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 39 批解析去冒号数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 39 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 39 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 39 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
