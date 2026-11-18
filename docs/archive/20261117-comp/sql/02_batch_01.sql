-- 综合 10 道（7 keep + 2 change + 1 unresolved）
BEGIN;
CREATE TEMP TABLE comp_expected (
  id integer PRIMARY KEY,
  analysis text,
  correct text,
  action text NOT NULL
) ON COMMIT DROP;
INSERT INTO comp_expected (id, analysis, correct, action) VALUES
(342200, $q$当前目录为 zhangsan，files 是相对路径；rm -r 递归删除目录，-f 强制不询问，合写为 rm -rf files。$q$, NULL, 'keep'),(342210, $q$nmcli 连接列表中，名称 dhcp 的连接类型为 802-3-ethernet 且设备列为 ens33，说明该以太网连接已激活；ens33 和 static 两条设备列为 --，未激活。$q$, NULL, 'keep'),(359347, NULL, NULL, 'unresolved'),(363951, $q$SC(SId,CId,score) 中，先用 NOT IN 子查询排除选修过 01 课程的 SId，再限定 CId='02'，即可查出不存在 01 但存在 02 课程的学生选课记录。$q$, NULL, 'keep'),(363959, $q$student 表的姓名字段为 name；姓李即 name 以“李”开头，使用 LIKE '李%' 匹配。$q$, NULL, 'keep'),(366249, $q$按 s_sex 分组后统计每组人数，应使用聚合函数 COUNT(s_sex)，并为结果列取别名“个数”。$q$, NULL, 'keep'),(370095, $q$问题1 需连接 Student 与 School 并按学院名排序；问题2 按学院名“计算机”把 schstunum 自增 1。原答案已完整，保留。$q$, NULL, 'keep'),(384492, $q$student(sno,sname,ssex,sage,deptno) 与 dept(deptno,deptname) 按 deptno 等值连接；系名称字段是 deptname，不是 dname。$q$, 'SELECT A.sno, A.sname, A.ssex, B.deptname FROM student A, dept B WHERE A.deptno = B.deptno;', 'change_answer'),(384946, $q$按源题给出的表结构补全：sno 为主键，sname、ssex 非空，另有 sbirthday 和 class 两列；原答案存在 snane、not aul1 等 OCR/拼写错误且未闭合。$q$, 'CREATE TABLE student (sno varchar(10) PRIMARY KEY, sname varchar(20) NOT NULL, ssex varchar(10) NOT NULL, sbirthday datetime, class varchar(20));', 'change_answer'),(390385, $q$冒泡排序按降序完成后，用 for(i=0;i<10;i++) 遍历数组，printf("%d",a[i]) 逐个输出成绩。$q$, NULL, 'keep')
;
UPDATE t_question q
SET analysis = e.analysis,
    correct = coalesce(e.correct, q.correct),
    qc_grade = 'good',
    answer_check = 'match'
FROM comp_expected e
WHERE q.id = e.id AND e.action IN ('keep', 'change_answer') AND NOT q.is_golden;
UPDATE t_question q
SET qc_grade = 'error',
    answer_check = 'uncertain'
FROM comp_expected e
WHERE q.id = e.id AND e.action = 'unresolved' AND NOT q.is_golden;
DO $$
DECLARE n int;
BEGIN
  SELECT count(*) INTO n
    FROM t_question q JOIN comp_expected e ON e.id = q.id
   WHERE e.action IN ('keep', 'change_answer')
     AND q.analysis = e.analysis
     AND q.qc_grade = 'good'
     AND q.answer_check = 'match'
     AND (e.correct IS NULL OR q.correct = e.correct);
  IF n <> 9 THEN RAISE EXCEPTION '写入数应为 9，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN comp_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_comp b ON b.id = q.id
   WHERE e.action = 'unresolved'
     AND q.qc_grade = 'error'
     AND q.answer_check = 'uncertain'
     AND q.analysis IS NOT DISTINCT FROM b.analysis
     AND q.correct IS NOT DISTINCT FROM b.correct;
  IF n <> 1 THEN RAISE EXCEPTION '保留数应为 1，实际 %', n; END IF;

  SELECT count(*) INTO n
    FROM t_question q JOIN comp_expected e ON e.id = q.id
    JOIN t_question_backup_20261117_comp b ON b.id = q.id
   WHERE e.action = 'change_answer'
     AND q.correct IS DISTINCT FROM b.correct;
  IF n <> 2 THEN RAISE EXCEPTION '改答案数应为 2，实际 %', n; END IF;

  SELECT count(*) INTO n FROM t_question q JOIN comp_expected e ON e.id = q.id WHERE q.is_golden;
  IF n <> 0 THEN RAISE EXCEPTION '本批触及金标 % 道', n; END IF;
END $$;
COMMIT;
