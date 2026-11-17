-- P0-211 第 3 批（25 道：22 写入 + 3 标 uncertain/manual）
BEGIN;
CREATE TEMP TABLE p0_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  stem text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO p0_expected (id, analysis, correct, stem, action) VALUES
(339855, NULL, NULL, NULL, 'manual'),(339870, $q$出栈序列 dceab 要求先出 d、再出 c，此时栈中自底向上为 a、b；压入 e 并弹出后栈顶仍是 b，无法先输出 a，所以该序列不可能。故选 C。$q$, NULL, NULL, 'keep'),(340329, $q$算法可以没有输入（如直接输出固定序列），但必须有输出，因此 A 中“必须有输入”的说法错误；B 的流程图与伪代码、C 的四类数据结构、D 的数组顺序存储均正确。故选 A。$q$, NULL, NULL, 'keep'),(340596, $q$现代操作系统中，线程是处理器调度和执行的基本单位，进程只是资源分配的基本单位；程序是静态的，文件与处理器管理无关。故处理器管理的最基本单位是线程，故选 C。$q$, NULL, NULL, 'keep'),(340784, $q$应用程序安装包的文件名通常带有 Setup、Install 等字样，C 项 SourceInsight4087_Setup.exe 正是安装程序；A、B 是安装后的主程序，D 为 PDF 文档无法执行。故选 C。$q$, NULL, NULL, 'keep'),(340953, $q$算法是对问题求解规则的一种过程描述，即把解题步骤明确成可执行的操作序列；B“计算方法”过于笼统，C 局限于运算器内部，D 排序只是算法的具体应用。故选 A。$q$, NULL, NULL, 'keep'),(341279, $q$Windows 10 的任务视图可创建多个虚拟桌面，D 称因硬件平台限制无法支持虚拟桌面，说法错误；A、B、C 描述其跨平台与内置 Edge 浏览器等特点。故选 D。$q$, NULL, NULL, 'keep'),(341295, $q$C++ 内置类、继承、多态等面向对象机制，支持数据抽象，是当前主流的面向对象语言；C 为过程式语言，LISP、ALGOL 也不以此见长。故选 D。$q$, NULL, NULL, 'keep'),(341308, $q$概念设计面向现实世界建模，独立于具体的计算机硬件和 DBMS 软件；物理设计依赖硬件与 DBMS，逻辑设计和系统实施同样离不开具体环境。故选 A。$q$, NULL, NULL, 'keep'),(341326, $q$Windows 10 的任务视图支持创建多个虚拟桌面，D 称因硬件限制无法支持虚拟桌面，与事实不符；A、B、C 均为其跨平台和内置 Edge 的特点。故选 D。$q$, NULL, NULL, 'keep'),(342543, $q$智能健康手环依靠加速度、心率等传感器采集人体数据，属于传感器数据采集技术；统计报表是数据呈现方式，网络爬虫抓网页，API 接口用于系统间调用。故选 D。$q$, NULL, NULL, 'keep'),(342917, $q$依据《网络安全法》，网络运营者应对收集的用户信息严格保密，不得泄露、篡改、毁损（A、D）；B 称无需建立保护制度错误，C 错误，匿名化处理后可不经同意提供。故选 AD。$q$, NULL, NULL, 'keep'),(342969, $q$NAT 通过网络地址转换使多台主机共用少量公网地址，是缓解 IPv4 地址紧缺的主要办法；DNS、RARP 属名称地址解析服务，NSLOOKUP 为查询工具，均不节省地址。故选 B。$q$, NULL, NULL, 'keep'),(343409, $q$全息技术需传输大容量三维影像，对带宽要求很高，对应增强移动宽带（eMBB）场景；海量大连接面向海量物联，低时延高可靠面向工业控制等实时业务。故选 A。$q$, NULL, NULL, 'keep'),(343413, $q$智能家居设备数量多、单次数据量小，符合海量大连接（mMTC）的场景特征；增强移动宽带面向高速多媒体，低时延高可靠面向实时控制类业务。故选 B。$q$, NULL, NULL, 'keep'),(343420, NULL, NULL, NULL, 'manual'),(343631, $q$Internet 域名按层次组织，从右到左范围越来越小：最右为顶级域，向左依次为二级、三级域，层数并不固定，也不限于四层，如 www.sina.com.cn 就有四级。故选 D。$q$, NULL, NULL, 'keep'),(343746, $q$同一网段内各主机与路由器端口的 IP 地址处于同一网络，网络号必然相同、主机号各不相同；A、B 按字节划分并不准确，D 恰好说反。故选 C。$q$, NULL, NULL, 'keep'),(343862, $q$星型网和总线网（还有环型网）是按拓扑结构划分的；以太网与 FDDI 按网络技术分，有线网与无线网按传输介质分，高速网与低速网按速率分。故选 A。$q$, NULL, NULL, 'keep'),(343946, $q$POP3 用于接收邮件，SMTP 用于发送邮件，MIME 是邮件多媒体内容的编码规范；Telnet 为远程登录协议，不参与电子邮件的收发。故选 D。$q$, NULL, NULL, 'keep'),(344071, NULL, NULL, NULL, 'uncertain'),(344101, $q$Web 工具栏中的“刷新当前页”按钮会重新从服务器或硬盘读取原文档，更新已打开的网页内容；返回、开始页、向前只做页面跳转，不更新内容。故选 B。$q$, NULL, NULL, 'keep'),(344119, $q$非对称密码体制公钥可公开、私钥各自保存，通信双方无须预先共享密钥，密钥管理比对称体制简单；它加密速度慢、实现复杂，安全程度也不是主要优势。故选 B。$q$, NULL, NULL, 'keep'),(344177, $q$完整 URL 由协议、主机名和路径依次构成，C 项 http://smartfox.com/index.html 格式规范；A 缺少协议名，B 主机名拼写有误且路径多出斜杠，D 文件名拼写有误。故选 C。$q$, NULL, NULL, 'keep'),(344537, $q$大数据的发展以信息科技为整体技术支撑，CPU 处理能力增强、网络带宽增长等都属于信息科技的具体体现；B 是数据产生方式的变化，不是技术支撑。故选 A。$q$, NULL, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    stem = coalesce(e.stem, q.stem),
    qc_grade = 'good',
    answer_check = 'match'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM p0_expected e
WHERE q.id = e.id AND e.action IN ('uncertain', 'manual') AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct)
     AND (e.stem IS NULL OR q.stem = e.stem);
  IF n <> 22 THEN RAISE EXCEPTION '第 3 批写入数应为 22，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p0_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p0 b ON b.id = q.id
   WHERE e.action IN ('uncertain', 'manual')
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct
     AND q.stem IS NOT DISTINCT FROM b.stem;
  IF n <> 3 THEN RAISE EXCEPTION '第 3 批 uncertain/manual 数应为 3，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p0_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 3 批触及金标 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN RAISE EXCEPTION '金标数应为 200，实际 %', n; END IF;
END $$;
COMMIT;
