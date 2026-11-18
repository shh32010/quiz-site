-- P2 第 36 批（25 道；html=2 colon=23 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(388970, NULL, $q$GIF 是互联网上广泛使用的一种图像文件格式,它的颜色数目较少(不超过 256 色),可以形成动画的效果。$q$, NULL),(388972, NULL, $q$计算机合成音频有两类∶分别是计算机合成语音和计算机合成音乐，而计算机合成音乐就是 MIDI 技术。计算机语音合成，又称文语转换技术，该技术能将任意文字信息实时转化为标准流畅的语音朗读出来。$q$, NULL),(388975, $q${"A": "SELECT 姓名,课程,成绩 FROM 学生,成绩 SET 学生.学号=成绩.学号 AND 学生.性别='男'", "B": "SELECT 姓名,课程,成绩 FROM 学生,成绩 SET 学生.学号=成绩.学号 OR 学生.性别='男'", "C": "SELECT 姓名,课程,成绩 FROM 学生,成绩 WHERE 学生.学号=成绩.学号 AND 学生.性别='男'", "D": "SELECT 姓名,课程,成绩 FROM 学生,成绩 WHERE 学生.学号=成绩.学号 OR 学生.性别='男'"}$q$, NULL, NULL),(388998, NULL, $q$软件危机泛指在计算机软件的开发和维护过程中遇到的一系列严重的问题，集中表现在成本，质量，生产效率等几个方面。导致软件危机的主要原因有:软件规模越来越大；软件复杂度越来越大；软件需求不明确，容易造成无用和返工；软件开发缺乏正确的理论指导等。$q$, NULL),(389008, NULL, $q$优盘、扫描仪、数码相机等计算机外设都可使用 USB 接口与计算机连接。
【第 4 是】答案:柱面号；扇区号

解析:硬盘上的数据位置需要柱面号、扇区号和磁头号参数来定准。$q$, NULL),(389029, NULL, $q$应用软件是针对多种应用需求出现的用于解决各种不同具体应用问题的专门软件。应用软件包括通用应用软件和定制应用软件。$q$, NULL),(389048, NULL, $q$IC 卡按集成电路芯片分类,可分为存储器卡和 CPU 卡,其中 CPU 卡具有数据存储和处理的能力,则 CPU 卡中必定包含处理数据所需的程序软件作支持。$q$, NULL),(389058, NULL, $q$a=a+b→变量 a 中存放着 a 和 b 的和;b=a-b→变量 b 中存放着原来 a 的值;a=a-b→变量 a 中存放着原来 b 的值。$q$, NULL),(389063, NULL, $q$域名中的“.”和十进制 IP 地址中的“.”意思不同。前者是用于域名的层次而设立，比如顶级域、二级等。而 IP 中的点是为了方便在计算机中配置所使用，最终在配置文件或计算机中还是按二进制存。$q$, NULL),(389071, NULL, $q$像素深度为 16，=65536 色，首先求出一张图片的质量大小,1024×1024×16 /8/1024/1024=2MB(注意此处的单位),一张图片在没有实现压缩前为 2MB,经过 4 倍压缩后则为:512KB。则 4096× 1024/512,最终结果为 8192 张,故选择 D。$q$, NULL),(389073, NULL, $q$信息技术扩展信息器官功能:

①、扩展感觉器官（视、听、触等）的感测（获取）与识别技术。=>信息的获取与识别
②、扩展神经系统功能的通信技术。=>信息的通信与存储
③、扩展大脑功能（思维器管）的计算（处理）与存储技术。=>信息的计算与存储
④、扩展效应器官（手、脚、口等）功能的控制与显示技术。=>信息的控制与显示$q$, NULL),(389080, $q${"A": "AA. DOC. TXT", "B": "BB>XX. RTF", "C": "COULD This Be Love", "D": "背影-朱自清.DOC"}$q$, NULL, NULL),(389098, NULL, $q$机器语言编写的程序不需要翻译直接可以被计算机执行，速度要比高级语言程序快；选项 A 描述正确。机构语言程序对硬件比较依赖，不同的指令集上可能不兼容，所以移值性要比高级语言程序差；选项 B 描述有误。机器语言写代码比较困难，不容易理解，调试比较麻烦；所以选项 C 有误。机器语言为二进制,没有了多余的格式,故存储空间要小于高级语言；选项 D 描述正确。所以答案是 BC。$q$, NULL),(389108, NULL, $q$硬件系统遵循冯·诺依曼提出的存储程序与程序控制的原理。$q$, NULL),(389110, NULL, $q$编译程序(Compiler);从高级语言到机器语言或汇编语言的翻译程序。编译程序对源程序进行翻译的方法相当于"笔译"。在编译程序的执行过程中,要对源程序扫描一遍或几遍,最终形成一个可在具体计算机上执行的目标程序。优点;通过编译程序的处理可以一次性地产生高效运行的目标程序,并把它保存在磁盘上,以备多次执行。缺点:实现算法较为复杂。应用:编译程序适合于翻译那些规模大、结构复杂、运行时间长的大型应用程序。$q$, NULL),(389112, NULL, $q$让用户输入验证码是为防止有人使用程序或者人工进行暴力行为，也是一种安全策略。$q$, NULL),(389146, NULL, $q$光电鼠标使用微型镜头拍摄其下方的图像，由 DSP（数字信号处理）分析判断鼠标器的移动方向和距离。$q$, NULL),(389154, NULL, $q$操作系统是最接近于计算机硬件的系统软件。如下图所示，操作系统是离硬件最近的。而 DBMS 属于数据库软件需要运行在操作系统之上。$q$, NULL),(389168, NULL, $q$选项 A 错误,摩尔定律不可能永远成立,集成电路的集成度受制造工艺的限制。选项 C错误,世界上【第一台电子计算机的基本元器件是电子管,而不是集成电路。选项 D 错误,集成电路是在硅衬底上制作而成的,其主要制造流程为:硅抛光片--晶圆--芯片--成品测试--集成电路。$q$, NULL),(389178, NULL, $q$硬盘中的数据记录在连续的同心圆磁道上。$q$, NULL),(389181, NULL, $q$用户自身与硬件之间是无法进行交流沟通的,如果没有操作系统作为平台支持,用户也无法让计算机硬件完成任何功能操作。比如,让打印机打印出一份文件资料,或者让扫描仪扫描一幅图片等。$q$, NULL),(389186, NULL, $q$GB2312-80 字符集汉字机内码双字节,最高位是 1;西文字符机内码单字节,最高位是 0。GBK 汉字内码双字节编码,【第 1 字节的最高位必为 1,【第 2 字节的最高位不一定是 1;看清题目中使用的编码类型。一个汉字占两个字节,一个西文字符占一个字节,一个十六进制数占4 位二进制,则一个汉字占 4 个十六进制数。本题主要看是 GB2312 还是 GBK,之后观察其【第一位的情况,即可判断。$q$, NULL),(389187, NULL, $q$选项 D 正确,是将数据包分成很多个组,之后进行依次传输。在局域网是数据帧,在广域网就变成数据包。$q$, NULL),(389196, NULL, $q$信息技术扩展信息器官功能:

①、扩展感觉器官（视、听、触等）的感测（获取）与识别技术。=>信息的获取与识别
②、扩展神经系统功能的通信技术。=>信息的通信与存储
③、扩展大脑功能（思维器管）的计算（处理）与存储技术。=>信息的计算与存储
④、扩展效应器官（（手、脚、口等））功能的控制与显示技术。=>信息的控制与显示$q$, NULL),(389198, NULL, $q$JPEG 是一个静态图像数据压缩编码的国际标准,JPEG 支持有损压缩和无损压缩,实际应用中有损压缩更多。该标准适用范围广;能处理各种连续色调的彩色或灰度图像;算法复杂度适中;既可用硬件实现,也可用软件实现;图像的压缩比可控制。在计算机网络和数码相机中已得到广泛应用。$q$, NULL)
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
  IF n <> 2 THEN RAISE EXCEPTION '第 36 批 HTML 更新数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 23 THEN RAISE EXCEPTION '第 36 批解析去冒号数应为 23，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 36 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 36 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 36 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
