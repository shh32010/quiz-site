-- 填空第 5 批（22 道：17 keep + 0 change + 5 unresolved）
BEGIN;
CREATE TEMP TABLE fill_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO fill_expected (id, analysis, correct, action) VALUES
(389528, $q$显示器每秒更新图像的次数是刷新频率，题干已给出“频率”二字，应填“刷新”。$q$, NULL, 'keep'),(389537, $q$互联网上支持视频直播、点播的一般是流媒体（流式传输）技术，边下载边播放。$q$, NULL, 'keep'),(389538, $q$并运算结果至少等于较大关系的元组数15（S完全被R包含），最多为两者之和25（无重复元组）。$q$, NULL, 'keep'),(389644, NULL, NULL, 'unresolved'),(389735, $q$我国自主建设的全球卫星导航系统是北斗，与GPS、格洛纳斯、伽利略并列。$q$, NULL, 'keep'),(389738, $q$Visual FoxPro、SQL Server均为关系型数据库管理系统，采用关系数据模型。$q$, NULL, 'keep'),(389820, $q$用辅存扩充主存、给用户提供远大于物理主存的地址空间，属于虚拟存储技术。$q$, NULL, 'keep'),(389897, $q$Core i7/i5/i3是英特尔（Intel）公司的多核处理器，均为64位芯片。$q$, NULL, 'keep'),(389899, $q$局域网常用、成本低但易受电磁干扰且距离有限的是双绞线；作为干线、损耗小、容量大、抗窃听的是光纤（光缆）。$q$, NULL, 'keep'),(390141, NULL, NULL, 'unresolved'),(390142, $q$Windows 中 PrintScreen 键把整个屏幕复制到剪贴板，Alt+PrintScreen 组合键只把当前活动窗口复制到剪贴板。$q$, NULL, 'keep'),(390143, $q$Word 的“首字下沉”选项有“下沉”和“悬挂”两种效果，题干两处排版效果依次对应这两项。$q$, NULL, 'keep'),(390144, $q$按税额规则用 IF 判断销售额是否达到 2 万元，分别乘 5% 或 3%；二分店销售额用 SUM 对相应单元格区域求和；分类汇总前必须先按分类字段（部门）排序。$q$, NULL, 'keep'),(390216, $q$5 位二进制无符号数的最大值是 2^5-1=31，范围即 0-31；-16 的 5 位补码为 32-16=16，即 10000。$q$, NULL, 'keep'),(390218, $q$从应用角度通常把软件分为系统软件和应用软件两大类，题目注明不区分顺序。$q$, NULL, 'keep'),(390220, NULL, NULL, 'unresolved'),(390223, NULL, NULL, 'unresolved'),(390378, $q$MySQL 的 SELECT 语句中用通配符 * 表示查询表中的所有字段。$q$, NULL, 'keep'),(390379, $q$DROP VIEW 语句的作用是删除指定的视图，student 为视图名。$q$, NULL, 'keep'),(390380, $q$UML 用例图中常见的依赖关系是包含关系（include）和扩展关系（extend），空格对应“扩展”，英文 extend 亦可。$q$, NULL, 'keep'),(390382, NULL, NULL, 'unresolved'),(390502, $q$Windows 10 的“设置－系统”页面中，“存储”选项会以条形图列出本地存储空间的总量、已用和可用情况。从“显示设置”返回系统设置页后选择“存储”即可查看。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM fill_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM fill_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 17 THEN RAISE EXCEPTION '第 5 批写入数应为 17，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 5 THEN RAISE EXCEPTION '第 5 批保留数应为 5，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN fill_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_fill b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批改答案数应为 0，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN fill_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '第 5 批触及金标 % 道', n; END IF;
END $$;
COMMIT;
