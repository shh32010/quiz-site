-- P2 第 7 批（25 道；html=20 colon=5 prefix=0）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(339746, $q${"A": "通常用户需要付费才能得到商品软件的使用权,但这类软件的升级总是免费的", "B": "共享软件通常是一种\"买前免费试用\"的具有版权的软件", "C": "自由软件的原则是用户可共享,并允许拷贝和自由传播", "D": "软件许可证是一种法律合同,它确定了用户对软件的使用权限"}$q$, NULL, NULL),(339788, $q${"A": "A<B<C", "B": "B<C<A", "C": "B<A<C", "D": "C<B<A"}$q$, NULL, NULL),(339876, $q${"A": "加密算法是相对稳定的", "B": "解密算法所使用的密钥称为解密密钥", "C": "加密算法一定要做好保密工作", "D": "对密文解密时采用的一组规则称为解密算法 ![](26年智狐-理论.images/449c378b817c9a60.jpg) <details> <summary>text_image</summary> C D C I G J H C MSN"}$q$, NULL, NULL),(340039, $q${"A": "Windows 操作系统中的\"帮助\"文件(.hlp 文件)是一种丰富格式文本", "B": "简单文本由一连串用于表达正文内容的字符的编码组成, 它几乎不包含格式信息和结构信息", "C": "使用微软公司的 Word 软件只能生成 DOCX 文件，不能生成 TXT 文件", "D": "简单文本进行排版处理后以整齐、美观的形式展现给用户，就形成了丰富格式文本"}$q$, NULL, NULL),(340111, $q${"A": "<Alt> + <Esc>", "B": "<Alt> + <Enter>", "C": "<Ctrl> + <Esc>", "D": "<Ctrl> + <Enter>"}$q$, NULL, NULL),(340116, $q${"A": "<Del>", "B": "<Enter>", "C": "<Ins>", "D": "<Pause>"}$q$, NULL, NULL),(340194, $q${"A": "支持多种文件系统（如 FAT32、NTFS、CDFS 等） 以管理不同的外存储器", "B": "支持 I/O 设备的\"即插即用\"和\"热插拔\"", "C": "采用了虚拟存储技术进行存储管理，其页面调度算法为“最近最少使用”算法", "D": "仅当计算机中有多个处理器或处理器为多内核处理器时，才能执行多个任务"}$q$, NULL, NULL),(340255, $q${"A": "s->next=p->next;p->next=s ;", "C": "q->next=s;s->next=p ;", "B": "p->next=s->next;p->next=s;", "D": "p->next=s;s->next=q ;"}$q$, NULL, NULL),(340288, $q${"A": "支持多种文件系统（如FAT32、NTFS、CDFS等）以管理不同的外存储器", "B": "支持I/O设备的\"即插即用\"和\"热插拔\"", "C": "采用了虚拟存储技术进行存储管理，其页面调度算法为“最近最少使用”算法", "D": "仅当计算机中有多个处理器或处理器为多内核处理器时，才能执行多个任务"}$q$, NULL, NULL),(340319, $q${"A": "p->prior=q;q->next=p;p->prior->next=q; q->prior=p->prior", "B": "q->prior=p->prior;p->prior->next=q; q->next=p;p->prior=q->next", "C": "q->next=p;p->next=q; q->prior->next=q; q->next=p", "D": "p->prior->next=q;q->next=p; q->prior=p->prior; p->prior=q;"}$q$, NULL, NULL),(340396, $q${"A": "裁剪图片是指保存图片的大小不变，而将不希望显示的部分隐藏起来", "B": "当需要重新显示被隐藏的部分时，还可以通过\"裁剪\"工具进行恢复", "C": "如果要裁剪图片， 单击选定图片，再单击\"图片\"工具栏中的\"裁剪\"按钮", "D": "按住鼠标右键向图片内部拖动时，可以隐藏图片的部分区域"}$q$, NULL, NULL),(340479, $q${"A": "商品号进行选择运算", "B": "名称、价格进行投影", "C": "名称等于\"李芸迪《监狱疯云》\"进行选择运算，再按名称和价格进行投影运算", "D": "商品号等于“222002”进行选择运算，再按名称、价格进行排序。"}$q$, NULL, NULL),(340691, $q${"A": "head==NULL", "B": "head->next==NULL", "C": "head!=NULL", "D": "head->next==head"}$q$, NULL, NULL),(340770, $q${"A": "栈按\"先进先出\"组织数据", "B": "栈按\"先进后出\"组织数据", "C": "只能在栈底插入数据", "D": "不能删除数据"}$q$, NULL, NULL),(340986, $q${"A": "QU->front==QU->rear", "B": "QU->front!=QU->rear", "C": "QU->front==(QU->rear+1)%MaxSize", "D": "QU->front!=(QU->rear+1)%MaxSize"}$q$, NULL, NULL),(341041, $q${"A": "QU->front==QU->rear", "B": "QU->front!=QU->rear", "C": "QU->front==(QU->rear+1)%MaxSize", "D": "QU->front!=(QU->rear+1)%MaxSize"}$q$, NULL, NULL),(341087, NULL, $q$软件测试的过程是一个发现错误的过程，程序调试过程中可以来修改程序中的错误，完成软件严谨性设计，选 C。$q$, NULL),(341305, $q${"A": "简单文本由一连串用于表达正文内容的字符的编码组成,它几乎不包含任何格式信息和结构信息", "B": "简单文本进行排版处理后以整齐、美观的形式展现给用户,就形成了丰富格式文本", "C": "Windows操作系统中的”帮助\"文件(hlp文件)是一种丰富格式文本", "D": "使用微软公司的 Word软件只能生成 D0C文件,不能生成 TXT文件"}$q$, NULL, NULL),(341312, $q${"A": "中国&美国", "B": "中美国", "C": "[中美]国", "D": "国"}$q$, NULL, NULL),(341313, $q${"A": "\"Printscreen\"键", "B": "\"Alt+PrintScreen\"ft", "C": "Word中的“屏幕截图”功能", "D": "专用截屏工具软件"}$q$, NULL, NULL),(341416, $q${"A": "程序调试通常称为 Debug", "B": "\"错误定位\"是程序调试的必要步骤", "C": "软件测试的目的是改正错误，程序调试的目的是发现错误", "D": "软件测试应制定测试计划，排除测试的随意性"}$q$, NULL, NULL),(341595, NULL, $q$路由器的右侧网络是接口 B,其 IP 是 192.18.0.254,192~223 之间是 C 类地址,即子网掩网为 255.255.255.0;IP 是由网络号+主机号,其中 C 类地址的主机号为 8 位二进位表示,接口 B中的最右边一个十进制为主机号,所以 254 就是主机号;接口中 A 连接的是交换 A,交换机连接主机 A 和 Web 服务器,他们的地址中网络号为 192.18.26,所以也是 192.18.26,主机号则选择与接口 B 中主机号一致,则接口 A 的 IP 地址是 192.18.26.254.

视频讲解:$q$, NULL),(341624, NULL, $q$蕴含大价值（商业价值高、淘金等），但是价值密度相对要低的。$q$, NULL),(341625, NULL, $q$NoSQL 数据库是非关系型数据库，它主要是用来解决半结构化数据和非结构化数据的存储问题。（MongoDB、Redis、Hbase 等）$q$, NULL),(341827, NULL, $q$移动体现在:阅读、手机游戏、多媒体应用等方面$q$, NULL)
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
  IF n <> 20 THEN RAISE EXCEPTION '第 7 批 HTML 更新数应为 20，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 5 THEN RAISE EXCEPTION '第 7 批解析去冒号数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批前缀修复数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 7 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
