-- P2 第 5 批（25 道；html=0 colon=0 prefix=25）
BEGIN;
CREATE TEMP TABLE p2_expected (
  id integer PRIMARY KEY,
  option_new text,
  analysis_new text,
  stem_new text
) ON COMMIT DROP;
INSERT INTO p2_expected (id, option_new, analysis_new, stem_new) VALUES
(338945, NULL, NULL, $q$存储在光盘中的数字音乐、JPEG 图片等都是计算机软件。$q$),(338946, NULL, NULL, $q$软件以二进位编码表示，且通常以电、磁、光等形式存储和传输，因而很容易被复制

和盗版。$q$),(338948, NULL, NULL, $q$Windows 常用的磁盘清理程序、格式化程序、文件备份程序等称为"实用程序"，它们 不属于系统软件。$q$),(338949, NULL, NULL, $q$应用软件分为通用应用软件和定制应用软件，学校教务管理软件属于定制应用软件。$q$),(338950, NULL, NULL, $q$Windows 系列软件和 Office 系列软件都是目前流行的操作系统软件。$q$),(338951, NULL, NULL, $q$共享软件是一种"买前免费试用"的具有版权的软件，它是一种为了节约市场营销费用

的有效的软件销售策略。$q$),(338952, NULL, NULL, $q$免费软件是一种不需付费就可取得并使用的软件，但用户并无修改和分发权，其源代

码也不一定公开。$q$),(338954, NULL, NULL, $q$在 Windows 系统中，采用图标（icon） 来形象地表示系统中的文件、程序和设备等软 硬件对象。$q$),(338955, NULL, NULL, $q$操作系统三个重要作用体现在： 管理系统硬软件资源、为用户提供各种服务界面、为 应用程序开发提供平台。$q$),(338956, NULL, NULL, $q$支持多任务处理和图形用户界面是 Windows 的两个特点。$q$),(338957, NULL, NULL, $q$操作系统通过各种管理程序提供了“任务管理”、 “存储管理”、“文件管理”、“设备管 理”等多种功能。$q$),(338958, NULL, NULL, $q$多任务处理就是 CPU 在某一时刻可以同时执行多个任务。$q$),(338959, NULL, NULL, $q$安装好操作系统后，任何硬件设备都不需安装驱动程序，就可以正常使用。$q$),(338960, NULL, NULL, $q$Windows 系统中，如果文件的扩展名不显示，可以通过设置资源管理器的选项使其显 示出来。$q$),(338962, NULL, NULL, $q$人类已经积累了大量的知识财富，算法的设计往往是有章可循、有法可依的，因此日 常生活中的任何问题都可以找到解决该问题的算法。$q$),(338963, NULL, NULL, $q$对于同一个问题可采用不同的算法去解决，但不同的算法通常具有相同的效率。$q$),(338964, NULL, NULL, $q$在数学中，求最大公约数的辗转相除法是一种算法。$q$),(338965, NULL, NULL, $q$流程图是惟一的一种算法表示方法。$q$),(338966, NULL, NULL, $q$算法与程序不同，算法是问题求解规则的一种过程描述。$q$),(338967, NULL, NULL, $q$汇编语言是面向机器指令系统的，因此汇编语言程序可以由计算机直接执行。$q$),(338968, NULL, NULL, $q$程序设计语言可分为机器语言、汇编语言和高级语言，其中高级语言比较接近自然语

言，而且易学、易用、易修改。$q$),(338970, NULL, NULL, $q$C++语言是对 C 语言的扩充。

）Matlab 是一种面向数值计算的高级程序设计语言。

）编译程序是一种把高级语言程序翻译成机器语言程序的翻译程序。$q$),(338972, NULL, NULL, $q$队列的特点是先进先出。$q$),(338973, NULL, NULL, $q$若让元素 1,2,3 依次进栈，则出栈次序 1,3,2 是不可能出现的情况。$q$),(338974, NULL, NULL, $q$单链表可以实现随机存取。$q$)
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
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批 HTML 更新数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.analysis_new IS NOT NULL AND q.analysis = e.analysis_new;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批解析去冒号数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
   WHERE e.stem_new IS NOT NULL AND q.stem = e.stem_new;
  IF n <> 25 THEN RAISE EXCEPTION '第 5 批前缀修复数应为 25，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN p2_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_p2 b ON b.id = q.id
   WHERE q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批不应改答案，实际改了 % 道', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN p2_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
