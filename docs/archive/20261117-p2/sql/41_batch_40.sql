-- P2 第 40 批（25 道；html=10 colon=15 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(389871, NULL, $q$存储同样的音乐,WAV 文件比 MIDI 文件占用的存储空间大。WAV--微软公司开发的未压缩声音类型,音质与 CD 相当,对存储空间需求太大,不便于交流和传播。$q$, NULL),(389889, NULL, $q$分组交换技术延时长,不宜用于实时通信或交互通信。由于数据包在发送至目的地的过程中经过网络中的很多个节点,因此会有一定的延时,有时发生错还需要重新发送,这都将导致数据包到达目的地的顺序与发送时的顺序不一致。数据包到达接收端的顺序与发送端发出的顺序有一定的误差。选项 B 有误，选项 D 中的丢失数据包可以通知发送方重新发送丢失或出错的数据。选项 D 有误。$q$, NULL),(389896, NULL, $q$软件=程序+数据+相关档。
【第 4 是】答案:自由软件

解析:自由软件（开源软件）:用户可共享，并允许随意拷贝、修改其源代码，允许销售和自由传播。$q$, NULL),(389898, $q${"A": "--> D", "B": "--> E", "C": "--> E", "D": "--> E<br/>```<br/></details><br/><br/>题73图"}$q$, NULL, NULL),(389909, NULL, $q$主存储器的每个存储单元(一个字节)都有一个地址(以序列号的形式表示), CPU 按地址对存储器进行访问,存储单元的基本单位是字节（等于 8bit）。$q$, NULL),(389922, NULL, $q$现代的都是使用电子计算机，超大规模集成电路。$q$, NULL),(389934, NULL, $q$研究数据结构一般包括三方面:数据的逻辑结构、数据的存储结构，定义在逻辑结构和存储结构上的运算。D 选项正确。$q$, NULL),(389942, NULL, $q$www 是这台主机的名称;tsinghua 是清华大学的校园网络名;edu 是二级域名;cn 是中国地区域名（顶级域名）。$q$, NULL),(389949, NULL, $q$常用的图像获取设备:手机、扫描仪、数码相机、监控摄像头等。照片打印机是输出设备，主要打印照片。条形码阅读器并不是图像获得的设备，输入条形码所包含的信息。$q$, NULL),(389964, $q${"A": "![](2009～2019真题.images/9f981f0900a02690.jpg)<br/><br/><details><br/><summary>text_image</summary><br/><br/>A<br/>1<br/>2<br/>3<br/>4<br/>5<br/>6<br/></details>", "B": "![](2009～2019真题.images/bdf5fa72d7ac9bdc.jpg)<br/><br/><details><br/><summary>text_image</summary><br/><br/>A<br/>1<br/>1<br/>2<br/>2<br/>3<br/>3<br/>4<br/>1<br/>5<br/>2<br/>6<br/>3<br/></details>", "C": "![](2009～2019真题.images/fb532a6067e06f33.jpg)<br/><br/><details><br/><summary>text_image</summary><br/><br/>1<br/>2<br/>3<br/>4<br/>5<br/>6<br/></details>", "D": "![](2009～2019真题.images/52ef8eac61724beb.jpg)<br/><br/><details><br/><summary>text_image</summary><br/><br/>A<br/>1<br/>2<br/>3<br/>4<br/>5<br/>6<br/></details>"}$q$, NULL, NULL),(390003, NULL, $q$MapReduce 的功能:

（1）数据划分和计算任务调度:将 job 分成多个数据块来计算，并自动调度计算节点来处理这些数据块。
（2）数据/代码互定位:减少数据通信，从数据所在的本地机架上寻找可用节点以减少通信延迟。
（3）系统优化:为了减少数据通信开销，中间结果数据进入 Reduce 节点前会进行一定的合并处理
（4）出错检测和恢复: MapReduce 需要能检测并隔离出错节点，并调度分配新的节点接管出错节点的计算任务，维护数据存储的可靠性。$q$, NULL),(390030, NULL, $q$选项 C 错误,JPEG 支持有损压缩和无损压缩,实际应用中有损压缩更多。或特点是;适用范围广;能处理各种连续色调的彩色或灰度图像;算法复杂度适中;既可用硬件实现,也可用软件实现;图像的压缩比可控制。$q$, NULL),(390035, NULL, $q$(1)图形在进行缩放时不会失真,可以适应不同的分辨率。图像放大时会失真,可以看到整个图像是由很多像素组合而成的。

(2)图形是由计算机绘制而成的,而图像则是人为地用外部设备所捕捉到的外部景象。$q$, NULL),(390059, NULL, $q$文本输入:人工输入（键盘输入、联机手写输入、语言输入）和自动识别输入（光学字符识别、条形码、磁卡、IC 卡、RFID 等）$q$, NULL),(390090, NULL, $q$一屏显示的像素数越多,则分辨率就越高。这是衡量显示器性能好坏的一个重要指标。$q$, NULL),(390119, $q${"A": "SELECT 课程号,课程名,学号,成绩 FROM 课程表,成绩表 WHERE 课程表.课程号=成绩表.课程号 AND 成绩<60", "B": "SELECT 课程号,课程名,学号,成绩 FROM 课程表,成绩表 WHERE 课程表.课程号=成绩表.课程号 OR 成绩<60", "C": "SELECT 课程号,课程名,学号,成绩 WERE 课程表,成绩表 FROM 课程表.课程号=成绩表.课程号 AND 成绩<60", "D": "SELECT 课程号,课程名,学号,成绩 WHERE 课程表,成绩表 FROM 课程表.课程号=成绩表.课程号 OR 成绩<60"}$q$, NULL, NULL),(390186, NULL, $q$此题主要考查对汉字及西文字符在内存中所占空间大小及相关编码概念的掌握情况。汉字机内码双字节,最高位是 1;西文字符单字节,最高位是 0。$q$, NULL),(390188, NULL, $q$虚拟化技术是云计算最重要的核心技术之一，它为云计算服务提供基础设施层面支撑，是 ICT 服务快速走向云计算的最主要驱动力。$q$, NULL),(390199, $q${"A": "SELECT 教师姓名 FROM T WHERE 系部编号 ='D01' AND 教师编号 ='T03'", "B": "SELECT 教师姓名 FROM T WHERE 系部编号 ='D01' OR 教师编号='T03'", "C": "SELECT 教师姓名 FROM D, T WHERE 系部编号 ='D01', 教师编号='T03'", "D": "SELECT 教师姓名 FROM D, T WHERE D. 系部编号 = 'D01', 教师编号 = 'T03'"}$q$, NULL, NULL),(390204, $q${"A": "8/20", "B": "=8/20", "C": "\"8/20\"", "D": "$='' 8/20 ''$"}$q$, NULL, NULL),(390213, $q${"A": "按下 Ctrl 键，同时利用鼠标左键将该文件从 C 盘拖动到 D 盘指定位置", "B": "按下 Alt 键，同时利用鼠标左键将该文件从 C 盘拖动到 D 盘指定位置", "C": "选中文件后按 Ctrl+X 组合键，在 D 盘指定位置按 Ctrl+V 组合键", "D": "利用鼠标右键将该文件从 C 盘拖动到 D 盘指定位置释放鼠标，之后在弹出的快捷菜单中选择\"移动到当前位置\""}$q$, NULL, NULL),(390229, $q${"A": "‘a’ <ch≤‘z’", "B": "'a' <ch && ch<= 'z'", "C": "ch> 'a' llch≤ 'z'", "D": "! (ch< 'a') && (ch<= 'z')"}$q$, NULL, NULL),(390236, $q${"A": "SELECT SUM(height) AS 平均身高 FROM student", "B": "SELECT AVG(height) AS 平均身高 FROM student WHERE class='一班'", "C": "SELECT SUM(*) AS 平均身高 FROM student", "D": "SELECT AVG(*) AS 平均身高 FROM student WHERE class='一班'"}$q$, NULL, NULL),(390354, $q${"A": "update student age =15 where name ='张三';", "B": "update student age ='15' where name ='张三'；", "C": "update student set age =15 where name ='张三';", "D": "update student set name ='张三' where age =15;"}$q$, NULL, NULL),(390475, $q${"A": "select sum(*) as 专业数量 from zy;", "B": "select count(xymc) as 专业数量 from zy where xymc='计算机学院';", "C": "select sum(xymc) as 专业数量 from zy;", "D": "select count( * )as 专业数量 from zy where xymc='计算机学院;"}$q$, NULL, NULL)
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
  IF n <> 10 THEN RAISE EXCEPTION '第 40 批 HTML 更新数应为 10，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 15 THEN RAISE EXCEPTION '第 40 批解析去冒号数应为 15，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 40 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 40 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 40 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
