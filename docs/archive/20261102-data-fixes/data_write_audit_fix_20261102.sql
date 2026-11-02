BEGIN;

SET LOCAL session_replication_role = replica;

-- 0. 先从 audit_fix_backup_20261102 还原刚才被 PowerShell 管道编码污染的字段
UPDATE t_question q
SET question_type = b.question_type,
    chapter_id    = b.chapter_id,
    correct       = b.correct,
    stem          = b.stem,
    option_json   = b.option_json,
    analysis      = b.analysis,
    qc_grade      = b.qc_grade,
    review_status = b.review_status,
    deleted       = b.deleted
FROM audit_fix_backup_20261102 b
WHERE q.id = b.id;

-- 0.1 修复 22 组重复题脚本中含中文常量的 3 道题与日志表
TRUNCATE dup_review_22_log_20261102;
INSERT INTO dup_review_22_log_20261102 (grp, keeper_id, deleted_id, note) VALUES
  (1,  339537, 339283, '非线性结构含集合/树/图(B,C,D)，修正题干错别字非性线->非线性'),
  (2,  340496, 357724, '传感器技术以传感器(A)为核心'),
  (3,  354502, 354490, '大数据采集含日志/网络/数据库(A,B,C)，合并354490详细解析'),
  (4,  361136, 356179, '区块链技术价值不包括经济(B)'),
  (5,  335764, NULL,   '335764(多选ACD)与337562(单选A)题型不同均保留，335764归入ch43'),
  (6,  383616, 342628, '调制解调器主要目的非提高传输距离(B错误)，归入ch100'),
  (7,  349120, 364556, '车载网络难保连通性(A,B,C)，保留ch141'),
  (8,  337279, 336923, '哈希探查保留ch81且解析正确的337279'),
  (9,  342869, 383589, '拨号上网不必装网卡保留理论章节ch103的342869'),
  (10, 352036, 347834, '二进制转十六进制保留ch62常用进制数的352036'),
  (11, 351816, 350161, 'RFID保留ch172感知层关键技术的351816'),
  (12, 389163, 389263, '2012真题重题，保留ch65软件基本概念'),
  (13, 389270, 389170, '2012真题重题，保留ch183移动互联网关键技术'),
  (14, 389212, 389312, '2012真题重题，保留ch65软件基本概念'),
  (15, 389314, 389214, '2012真题重题，保留ch65软件基本概念'),
  (16, 389215, 389315, '2012真题重题，保留389215并归入ch65软件基本概念'),
  (17, 389348, 389448, '2013真题重题，保留ch39计算机基本原理'),
  (18, 389356, 389456, '2013真题重题，保留解析正确的389356并归入ch117字符编码'),
  (19, 389376, 389476, '2013真题重题，保留ch39计算机基本原理'),
  (20, 389412, 389512, '2013真题重题，保留ch65软件基本概念'),
  (21, 389424, 389524, '2013真题重题，保留ch65并修复串行的磁盘等待时间解析'),
  (22, 389525, 389425, '2013真题重题，保留ch65软件基本概念');

UPDATE t_question SET stem = '以下属于非线性结构的是（）', qc_grade = 'good' WHERE id = 339537;

UPDATE t_question dst
SET analysis = 'A,B,C：大数据常见采集方法包括系统日志采集、网络数据采集（爬虫/API）和数据库采集；“人工写手”不属于数据采集方法。' || E'\n\n' || src.analysis,
    qc_grade = 'good'
FROM t_question src
WHERE dst.id = 354502 AND src.id = 354490;

UPDATE t_question
SET analysis = 'Excel 2003 原生支持工作簿（.xls）、模板（.xlt）、文本文件（.txt）及 Access 数据库（.mdb）的打开与数据导入处理，故 A、B、C、D 均正确。',
    qc_grade = 'good'
WHERE id = 389424;

-- ============================================================================
-- 1. 站内公告表 site_announcement UTF-8 写入
-- ============================================================================
INSERT INTO site_announcement (id, version, title, subtitle, date_label, footnote, items_json, history_json, updated_at)
VALUES (
  1,
  '2026-11-02-3',
  '关于这个刷题站的几句说明',
  '跟大家交个底，说说题库哪来的、怎么做的，还有平时怎么维护。',
  '2026 年 11 月 2 日',
  '题库仅用于学习交流，如果哪部分涉及版权问题，在站内「我的 → 联系作者」跟我说一声，会尽快处理。这个公告每天只提示一次，关掉后想再看，从页面底部的「站内公告」随时能点开。',
  $json$[
    {"tag":"规则","title":"每天 200 题，够用也留余地","desc":"普通账号每天最多做 200 道不同的题，同一道题重做不重复占额度；免限用户和管理员不受限。达到上限后，可以在刷题页直接联系作者申请免限。"},
    {"tag":"更新","title":"练习、反馈和历史又顺手了一点","desc":"随机组卷加了 100/50 分钟计时，试卷模式也和练习一样判分、答对自动下一题。游客退出会提醒保存进度；清空历史改为归档；题目反馈和联系作者反馈都可以不写描述；知识点目录按小节编号，S1-1 已先按三个大纲条目重排。"},
    {"tag":"题库","title":"公开资料整理，做过多轮清洗","desc":"里面的题目来自公开网络流传的机构资料 PDF，先用 MinerU 识别提取出来，再由 DeepSeek-V4.1-Flash（1017 版）一轮轮精读、清洗、去重，顺手把缺的答案和解析也补全了。"},
    {"tag":"协作","title":"按江苏考纲搭结构，三个模型一起写","desc":"题库结构和知识点目录都是参照江苏省计算机专转本考试大纲排的。网站开发、内容清洗和代码检查，由 DeepSeek-V4.1-Flash、Claude Opus 5.5 和 Gemini 4 Argon 一起完成。"},
    {"tag":"部署","title":"放在阿里云杭州节点，已经备案","desc":"站点部署在阿里云杭州节点，域名已完成 ICP 备案和公安联网备案，平时打开和切题基本是毫秒级响应。不用装软件，手机浏览器直接点开就能刷。"}
  ]$json$::jsonb,
  $json$[
    {"date":"2026-11-02","text":"完成 C 语言错题解析、229 道误标填空的选择题题型修正及 X9 未分类章节清零；支持后台免发版热更新公告"},
    {"date":"2026-11-02","text":"「我的」新增反馈处理进度查看；错题本支持待复习/高频错题筛选，章节题表显示错题与收藏标记；复核清理 22 组重复题与冲突答案"},
    {"date":"2026-11-02","text":"公安联网备案通过，页脚已展示苏公网安备32132402000835号"},
    {"date":"2026-10-31","text":"普通账号每天最多做 200 道不同的题，免限用户和管理员不受限；达到上限可直接联系作者申请"},
    {"date":"2026-10-30","text":"注册新增确认密码，两次输入不一致时会先提示，不会直接提交"},
    {"date":"2026-10-30","text":"联系作者反馈也支持不写内容，选个分类就能提交"},
    {"date":"2026-10-29","text":"处理 19 条待处理反馈：修正 7 道题，合并 9 个重复题，清理探测反馈"},
    {"date":"2026-10-29","text":"S1-1 按大纲拆成 3 个条目：82 条内容保留 55 条，移出或清理 27 条"},
    {"date":"2026-10-29","text":"随机组卷加入 100/50 分钟计时，试卷模式判分与练习统一"},
    {"date":"2026-10-29","text":"反馈支持选填并提示同类题，清空历史改为归档，游客退出提示保存进度"},
    {"date":"2026-10-29","text":"知识点目录按小节编号，S5/S6 课程名称与考试大纲对齐"},
    {"date":"2026-10-29","text":"在公告里把题库来源、三个模型协同开发和阿里云杭州节点部署的情况说清楚了"},
    {"date":"2026-10-28","text":"加上了站内公告、联系作者和题目报错入口，顺便重做了交卷后的判分结果卡"},
    {"date":"2026-10-28","text":"把知识点和 C 语言代码类题目又整理了一遍，修掉了之前的乱码和串行问题"},
    {"date":"2026-10-28","text":"知识点阅读器加上了目录、进度和自测，手机上也能一节节连续往下滑"},
    {"date":"2026-10-27","text":"新增邮箱验证和匿名访问统计，学习报告能看节级掌握度，错题也能按筛选打印"},
    {"date":"2026-10-27","text":"补齐备案页脚、隐私协议和用户协议，SEO 基础配置也弄好了"}
  ]$json$::jsonb,
  now()
)
ON CONFLICT (id) DO UPDATE SET
  version = EXCLUDED.version,
  title = EXCLUDED.title,
  subtitle = EXCLUDED.subtitle,
  date_label = EXCLUDED.date_label,
  footnote = EXCLUDED.footnote,
  items_json = EXCLUDED.items_json,
  history_json = EXCLUDED.history_json,
  updated_at = now();

-- ============================================================================
-- 2. 专项 A：题型 4/5 误标的选择题修复
-- ============================================================================
UPDATE t_question SET deleted = true WHERE id IN (385365, 367300, 369996);
UPDATE t_question SET review_status = 'quarantined' WHERE id = 368620;

UPDATE t_question SET stem = 'CPU不能直接读取和执行存储在____中的指令。', option_json = '{"A":"Cache","B":"RAM","C":"ROM","D":"硬盘"}', question_type = 1 WHERE id = 334726;
UPDATE t_question SET stem = '数据传输速率是计算机网络的一项重要性能指标，下面不属于计算机网络数据传输常用单位的是____。', option_json = '{"A":"kb/s","B":"Mb/s","C":"Gb/s","D":"MB/s"}', question_type = 1 WHERE id = 342360;
UPDATE t_question SET stem = 'Internet 上有许多应用，其中特别适合用来进行远程文件操作（如复制、移动、更名、创建、删除等）的一种服务是____。', option_json = '{"A":"E-mail","B":"Telnet","C":"WWW","D":"FTP"}', question_type = 1 WHERE id = 342375;
UPDATE t_question SET option_json = '{"A":"/etc/HOSTNAME","B":"/etc/hosts","C":"/etc/resolv.conf","D":"/etc/networks"}', question_type = 1 WHERE id = 361972;
UPDATE t_question SET stem = '下面关于内存储器的叙述中，正确的是____。', option_json = '{"A":"内存储器和外存储器是统一编址的，字是存储器的基本编址单位","B":"内存储器与外存储器相比，存取速度慢、价格便宜","C":"内存储器与外存储器相比，存取速度快、价格贵","D":"RAM 和 ROM 在断电后信息将全部丢失"}', question_type = 1 WHERE id = 367012;
UPDATE t_question SET option_json = '{"A":"CREATE DATA monsterdb CHARACTER SET GBK;","B":"CREATE DATABASE monsterdb CHARACTER SET GBK;","C":"CREATE TABLE monsterdb CHARACTER SET GBK;","D":"ALTER DATABASE monsterdb CHARACTER SET GBK;"}', question_type = 1 WHERE id = 369722;
UPDATE t_question SET option_json = '{"A":"x%(-3)","B":"w+=-2","C":"k=a+b","D":"a=b=c=1"}', question_type = 1 WHERE id = 370620;
UPDATE t_question SET option_json = '{"A":"包含1个字符。","B":"包含2个字符。","C":"包含3个字符。","D":"说明不合法,c的值不确定。"}', question_type = 1 WHERE id = 370622;
UPDATE t_question SET option_json = '{"A":"x=y=6,x+y,x+1","B":"x=y=6,x+y,y+1","C":"x=6,x+1,y=6,x+y","D":"y=6,y+1,x=y,x+1"}', question_type = 1 WHERE id = 370630;
UPDATE t_question SET option_json = '{"A":"while循环执行10次","B":"循环是无限循环","C":"循环体语句一次也不执行","D":"循环体语句执行一次"}', question_type = 1 WHERE id = 370666;
UPDATE t_question SET option_json = '{"A":"整型常量","B":"整型表达式","C":"整型常量或整型表达式","D":"任何类型的表达式"}', question_type = 1 WHERE id = 370680;
UPDATE t_question SET option_json = '{"A":"[常量表达式]","B":"[整型表达式]","C":"[整型表达式]或[整型常量]","D":"[整型常量]"}', question_type = 1 WHERE id = 370683;
UPDATE t_question SET option_json = '{"A":"int a[3][];","B":"float a(3,4);","C":"double a[1][4];","D":"float a(3)(4);"}', question_type = 1 WHERE id = 370684;
UPDATE t_question SET option_json = '{"A":"int a[2][3]={0};","B":"int a[][3]={{1,2},{0}};","C":"int a[2][3]={{1,2},{3,4},{5,6}};","D":"int a[][3]={1,2,3,4,5,6};"}', question_type = 1 WHERE id = 370688;
UPDATE t_question SET stem = 'C语言的函数体由()括起来。', option_json = '{"A":"( )","B":"{ }","C":"[ ]","D":"/**/"}', question_type = 1 WHERE id = 371016;
UPDATE t_question SET option_json = '{"A":"1,234","B":"''\\123''","C":"1234","D":"\"\\x7d\""}', question_type = 1 WHERE id = 371338;
UPDATE t_question SET option_json = '{"A":"直线箭头","B":"虚线箭头","C":"实心菱形","D":"空心三角形"}', question_type = 1 WHERE id = 374996;
UPDATE t_question SET option_json = '{"A":"交互图","B":"活动图","C":"状态图","D":"类图"}', question_type = 1 WHERE id = 375069;
UPDATE t_question SET option_json = '{"A":"AB?.*","B":"?F.*","C":"A*.*","D":"*.?"}', question_type = 1 WHERE id = 377534;
UPDATE t_question SET option_json = '{"A":"select avg(price),type from book group by type","B":"select count(price),type from book group by price","C":"select avg(price),type from book group by price","D":"select count(price),type from book group by type"}', question_type = 1 WHERE id = 385358;
UPDATE t_question SET question_type = 1 WHERE id = 334848;

UPDATE t_question
SET question_type = 1
WHERE NOT deleted
  AND question_type IN (4, 5)
  AND option_json IS NOT NULL AND option_json <> '' AND option_json <> '{}'
  AND correct ~ '^[A-D]$'
  AND (option_json::jsonb ? 'A' AND option_json::jsonb ? 'B' AND option_json::jsonb ? 'C');

UPDATE t_question
SET question_type = 2
WHERE NOT deleted
  AND question_type IN (4, 5)
  AND option_json IS NOT NULL AND option_json <> '' AND option_json <> '{}'
  AND correct ~ '^[A-D](,[A-D])+$'
  AND (option_json::jsonb ? 'A' AND option_json::jsonb ? 'B' AND option_json::jsonb ? 'C');

-- ============================================================================
-- 3. 专项 B：C 语言（S1）48 道 error + 16 道 quarantined 修复
-- ============================================================================
UPDATE t_question SET deleted = true WHERE id IN (366940, 371706, 371809);

UPDATE t_question
SET chapter_id = 65,
    analysis = 'Excel 中单独的 E 不是有效单元格引用，会被当作未定义的名称，因此返回 #NAME? 错误，故选 A。',
    qc_grade = 'good'
WHERE id = 366892;

UPDATE t_question
SET chapter_id = 65,
    option_json = '{"A":"-（负号）","B":"*","C":"+","D":"%"}',
    analysis = '在 Excel 算术运算符中，百分比运算符 % 的优先级高于乘除（*、/）和加减（+、-），故选 D。',
    review_status = 'ok',
    qc_grade = 'good'
WHERE id = 381199;

-- 使用 chr(65372)（全角竖线 ｜）提取 answer_ai 中的核验解析
UPDATE t_question
SET analysis = split_part(answer_ai, chr(65372), 2),
    qc_grade = 'good'
WHERE id IN (
  365087, 365473, 366340, 366515, 366789, 366838, 367624, 368316,
  370742, 370794, 371087, 371801, 371876, 371883, 372038, 372047,
  372050, 372056, 372157, 372178, 372501, 372521, 372887, 377928,
  379142, 379371, 381303, 381330, 381561, 384730
) AND position(chr(65372) in coalesce(answer_ai, '')) > 0;

UPDATE t_question
SET stem = '在 C 语言中，当函数体只有一条语句时，花括号 {} 可以省略不写。',
    qc_grade = 'good'
WHERE id = 377928;

UPDATE t_question
SET answer_check = 'match',
    qc_grade = 'good'
WHERE id = 370755;

UPDATE t_question
SET correct = '8',
    answer_check = 'match',
    qc_grade = 'good'
WHERE id = 371271;

UPDATE t_question
SET option_json = '{"A":"(k>0) && (k%2==1)","B":"(k>0) && (k%2==0)","C":"(k>0) || (k%2==0)","D":"(k>0) && (k/2==0)"}',
    analysis = '描述“k 是大于 0 的偶数”需同时满足 k>0 且 k 能被 2 整除（k%2==0），即 (k>0) && (k%2==0)，故选 B。',
    qc_grade = 'good'
WHERE id = 372527;

UPDATE t_question
SET correct = 'A',
    analysis = '对于只包含表达式语句的程序段（顺序结构），执行顺序与书写顺序一致，A 正确；C 程序可以在子函数中调用 exit() 结束，不一定要从主函数结束，故 C 错误。',
    qc_grade = 'good'
WHERE id = 372612;

UPDATE t_question
SET stem = E'若有以下程序：\n```c\n#include <stdio.h>\nint main() {\n  int a=1, b=2, c=3, d=4, r=0;\n  if (a!=1) ; else r=1;\n  if (b==2) r+=2; else ;\n  if (c!=3) r+=3; else ;\n  if (d==4) r+=4;\n  printf("%d\\n", r);\n  return 0;\n}\n```\n则程序的输出结果是____。',
    analysis = 'a==1 走 else 分支得 r=1；b==2 为真得 r=1+2=3；c!=3 为假不执行 r+=3；d==4 为真得 r=3+4=7，故输出 7。',
    qc_grade = 'good'
WHERE id = 384837;

UPDATE t_question
SET review_status = 'quarantined'
WHERE id IN (367442, 370761, 370920, 371695, 372808, 379557, 381297);

UPDATE t_question SET option_json = '{"A":"只能使用<>来引用头文件","B":"只能使用\"\"来引用头文件","C":"<>和\"\"都可以用来引用头文件","D":"以上说法都不对"}', review_status = 'ok', qc_grade = 'good' WHERE id = 366107;
UPDATE t_question SET option_json = '{"A":"在 C 语言程序中, 主函数必须放在其他函数的最前面","B":"每个后缀为.C的C语言源程序都可以单独进行编译","C":"在 C 语言程序中, 只有 main 函数才可单独进行编译","D":"每个后缀为.C的C语言源程序都必须包含 main 函数"}', review_status = 'ok', qc_grade = 'good' WHERE id = 366391;
UPDATE t_question SET option_json = '{"A":"和之前与其具有相同缩进位置的 if 配对","B":"和之前与其最近的 if 配对","C":"和之前与其最近的且不带 else 的 if 配对","D":"和之前第一个 if 配对"}', review_status = 'ok', qc_grade = 'good' WHERE id = 366792;
UPDATE t_question SET stem = '若有说明：int a[3][4]; 则对 a 数组元素的正确引用是______。', option_json = '{"A":"a[2][4]","B":"a[1,3]","C":"a[1+1][0]","D":"a(2)(1)"}', review_status = 'ok', qc_grade = 'good' WHERE id = 370685;
UPDATE t_question SET option_json = '{"A":"a=b=58;","B":"i++;","C":"a=58,b=58","D":"k=int(a+b);"}', review_status = 'ok', qc_grade = 'good' WHERE id = 372485;
UPDATE t_question SET stem = E'以下程序的输出结果是( )。\n```c\nmain()\n{\n  int k=17;\n  printf("%d,%o,%x\\n", k, k, k);\n}\n```', option_json = '{"A":"17,021,0x11","B":"17,17,17","C":"17,0x11,021","D":"17,21,11"}', review_status = 'ok', qc_grade = 'good' WHERE id = 372559;
UPDATE t_question SET option_json = '{"A":"2_name","B":"_name","C":"switch","D":"first*2"}', review_status = 'ok', qc_grade = 'good' WHERE id = 372818;
UPDATE t_question SET option_json = '{"A":"%x","B":"$a + b$","C":"a123","D":"3d"}', review_status = 'ok', qc_grade = 'good' WHERE id = 378739;
UPDATE t_question SET option_json = '{"A":"p=\"abcd\";","B":"a=\"abcd\";","C":"*p=\"abcd\";","D":"a=''abcd'';"}', review_status = 'ok', qc_grade = 'good' WHERE id = 380561;
UPDATE t_question SET option_json = '{"A":"/","B":"%","C":"!","D":">"}', review_status = 'ok', qc_grade = 'good' WHERE id = 381267;

-- ============================================================================
-- 4. 专项 C：X9 未归入标准章节（id=12, 36）47 道题 + 18 条知识点清零
-- ============================================================================
UPDATE exam_paper_question SET question_id = 389199 WHERE question_id = 389299;
UPDATE exam_paper_question SET question_id = 389200 WHERE question_id = 389300;
UPDATE exam_paper_question SET question_id = 389209 WHERE question_id = 389309;
UPDATE exam_paper_question SET question_id = 389413 WHERE question_id = 389513;
UPDATE t_question SET deleted = true WHERE id IN (389299, 389300, 389309, 389513);

UPDATE t_question
SET stem = '在 Excel 工作表的单元格中输入内容时，若以____符号开始，Excel 则认为输入的是公式。',
    correct = '=',
    analysis = '在 Excel 单元格中输入公式必须以等号“=”开头。',
    qc_grade = 'good'
WHERE id = 388555;

UPDATE t_question
SET correct = '剪贴板',
    analysis = '在 Windows 中，按 PrintScreen 键截取的屏幕图像暂存在系统剪贴板中。',
    qc_grade = 'good'
WHERE id = 389640;

UPDATE t_question
SET stem = '已知与教师表和部门表对应的关系模式分别是：教师(教师编号, 姓名, 部门编号)、部门(部门编号, 部门名称, 负责人)。若规定每位教师只能属于一个部门，而每个部门可以有多名教师，则教师与部门之间的联系类型是____。',
    correct = '多对一（或 n:1）',
    analysis = '一个部门可以有多名教师，每位教师只属于一个部门，因此教师与部门之间是多对一（n:1）联系。',
    qc_grade = 'good'
WHERE id = 389904;

UPDATE t_question
SET question_type = 3,
    correct = 'A',
    analysis = '在 PowerPoint 中，以“讲义”方式打印幻灯片时，每页可选择打印 1、2、3、4、6 或 9 张幻灯片，最多 9 张，故该说法正确。',
    qc_grade = 'good'
WHERE id = 390145;

UPDATE t_question SET chapter_id = 277 WHERE id IN (
  388496, 389015, 389199, 389200, 389707, 389904, 389959, 389992, 390212, 390258, 390265, 390384
);
UPDATE t_question SET chapter_id = 71 WHERE id IN (
  388503, 388877, 389079, 389305, 389406, 389640, 390383
);
UPDATE t_question SET chapter_id = 218 WHERE id IN (390332, 390450);
UPDATE t_question SET chapter_id = 146 WHERE id IN (390536);
UPDATE t_question SET chapter_id = 65 WHERE chapter_id IN (12, 36) AND NOT deleted;

UPDATE t_knowledge_point SET chapter_id = 277 WHERE id IN (27731, 27732, 27733, 31737);
UPDATE t_knowledge_point SET chapter_id = 71  WHERE id IN (27749, 31726, 31735, 31779, 31780);
UPDATE t_knowledge_point SET chapter_id = 156 WHERE id IN (27952, 27953, 27954, 27955, 31724, 31736);
UPDATE t_knowledge_point SET chapter_id = 65  WHERE id IN (30183);
UPDATE t_knowledge_point SET chapter_id = 117 WHERE id IN (31776, 31778);

UPDATE t_chapter SET deleted = true WHERE id IN (12, 36);

COMMIT;
