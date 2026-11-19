-- 17 道强一致跨章节/跨科目题重挂 L3 正式执行脚本（2026-11-19，末尾 COMMIT）
-- 口径：
--   1. 基于 scratch/kp387/rehang/agree.json（18 题），剔除 380610（保留原章 A1-1.7），包含 368570（隔离金标归位至 S6-3.1）；
--   2. 维持 8 道双 low 一致题（346694,349204,350763,350952,366178,370336,367943,376921）不动；
--   3. 同步更新 subject_id / chapter_id / cat_l1 / cat_l2 / cat_l3，严禁改动题干、选项、答案、解析、审核状态等受金标触发器保护字段；
--   4. 先备份原行至 t_question_backup_20261118_rehang（仅含这 17 行）。

BEGIN;

-- 1. 备份 17 道目标题原行
CREATE TABLE t_question_backup_20261118_rehang AS
SELECT *
FROM t_question
WHERE id IN (
  344150, 347505, 350709, 351497, 355139, 357598, 363759, 366182,
  366222, 366548, 368570, 368786, 369139, 375465, 380990, 385329, 389877
);

-- 2. 构建 17 题目标映射表（目标 L3 及对应 subject_id / cat_l1 / cat_l2 / cat_l3 规范格式）
CREATE TEMP TABLE rehang_map (
  qid integer PRIMARY KEY,
  subject_id smallint NOT NULL,
  chapter_id integer NOT NULL,
  cat_l1 text NOT NULL,
  cat_l2 text NOT NULL,
  cat_l3 text NOT NULL
) ON COMMIT DROP;

INSERT INTO rehang_map (qid, subject_id, chapter_id, cat_l1, cat_l2, cat_l3) VALUES
  -- 4 道跨科目重挂（subject_id 5 -> 4）
  (366222, 4,  49, 'A',  '1.3',  '1.3.2'),   -- 原 317 (S5-3)   -> A1-1.3.2
  (366548, 4, 217, 'B',  '6.1',  '6.1.2'),   -- 原 264 (S1-7)   -> B6-6.1.2
  (368786, 4,  96, 'A',  '3.2',  '3.2.1'),   -- 原 303 (S4-1)   -> A3-3.2.1
  (369139, 4,  96, 'A',  '3.2',  '3.2.1'),   -- 原 303 (S4-1)   -> A3-3.2.1
  -- 2 道同科目跨课程（subject_id 4 -> 4，cat_l1 B -> A）
  (351497, 4, 136, 'A',  '4.4',  '4.4.5'),   -- 原 138 (B1-1.1) -> A4-4.4.5
  (355139, 4,  78, 'A',  '2.3',  '2.3.5'),   -- 原 224 (B6-6.3) -> A2-2.3.5
  -- 1 道隔离金标跨课程归位（subject_id 5 -> 5，is_golden=true, review_status='quarantined'）
  (368570, 5, 335, 'S6', 'S6-3', 'S6-3.1'),  -- 原  22 (S2)     -> S6-3.1
  -- 6 道同课程跨章/跨节重挂（subject_id 4 -> 4）
  (344150, 4, 103, 'A',  '3.4',  '3.4.1'),   -- 原  92 (A3-3.1) -> A3-3.4.1
  (347505, 4, 217, 'B',  '6.1',  '6.1.2'),   -- 原 138 (B1-1.1) -> B6-6.1.2
  (350709, 4, 216, 'B',  '6.1',  '6.1.1'),   -- 原 138 (B1-1.1) -> B6-6.1.1
  (357598, 4, 119, 'A',  '4.1',  '4.1.4'),   -- 原  65 (A2-2.1) -> A4-4.1.4
  (366182, 4, 116, 'A',  '4.1',  '4.1.1'),   -- 原  68 (A2-2.2) -> A4-4.1.1
  (385329, 4,  42, 'A',  '1.1',  '1.1.3'),   -- 原  58 (A1-1.6) -> A1-1.1.3
  -- 4 道同二级章内由 L2 下移至所属 L3 并补全分类字段（subject_id 4 -> 4）
  (363759, 4, 140, 'B',  '1.1',  '1.1.2'),   -- 原 138 (B1-1.1) -> B1-1.1.2
  (375465, 4,  89, 'A',  '2.5',  '2.5.3'),   -- 原  86 (A2-2.5) -> A2-2.5.3
  (380990, 4, 172, 'B',  '2.2',  '2.2.2'),   -- 原 170 (B2-2.2) -> B2-2.2.2
  (389877, 4, 119, 'A',  '4.1',  '4.1.4');   -- 原 115 (A4-4.1) -> A4-4.1.4

-- 3. 前置断言 + 执行更新 + 后置全量断言校验
DO $$
DECLARE
  n integer;
  updated_n integer;
BEGIN
  -- 校验备份表行数
  SELECT count(*) INTO n FROM t_question_backup_20261118_rehang;
  IF n <> 17 THEN
    RAISE EXCEPTION '备份表行数异常：期望 17，实际 %', n;
  END IF;

  -- 校验映射表与目标 L3 节点合法性（存在、未删除、level=3、subject_id 匹配）
  SELECT count(*) INTO n
  FROM rehang_map m
  JOIN t_chapter c ON c.id = m.chapter_id
  WHERE NOT c.deleted
    AND c.level = 3
    AND c.subject_id = m.subject_id;
  IF n <> 17 THEN
    RAISE EXCEPTION '目标 L3 映射校验异常：期望 17，实际 %', n;
  END IF;

  -- 确认 380610 不在本次备份与映射中
  IF EXISTS (SELECT 1 FROM rehang_map WHERE qid = 380610)
     OR EXISTS (SELECT 1 FROM t_question_backup_20261118_rehang WHERE id = 380610) THEN
    RAISE EXCEPTION '380610 不应包含在本次重挂中';
  END IF;

  -- 确认更新前 17 题的 chapter_id 均不等于目标 chapter_id
  SELECT count(*) INTO n
  FROM t_question q
  JOIN rehang_map m ON m.qid = q.id
  WHERE q.chapter_id IS DISTINCT FROM m.chapter_id;
  IF n <> 17 THEN
    RAISE EXCEPTION '更新前状态异常：期望 17 题待重挂，实际 %', n;
  END IF;

  -- 执行重挂更新（同步维护 subject_id / chapter_id / cat_l1 / cat_l2 / cat_l3）
  UPDATE t_question q
  SET subject_id = m.subject_id,
      chapter_id = m.chapter_id,
      cat_l1     = m.cat_l1,
      cat_l2     = m.cat_l2,
      cat_l3     = m.cat_l3
  FROM rehang_map m
  WHERE q.id = m.qid;

  GET DIAGNOSTICS updated_n = ROW_COUNT;
  IF updated_n <> 17 THEN
    RAISE EXCEPTION '更新行数异常：期望 17，实际 %', updated_n;
  END IF;

  -- 校验 17 题全部指向目标 L3 且 c.level=3、subject_id 与分类字段完全一致
  SELECT count(*) INTO n
  FROM t_question q
  JOIN rehang_map m ON m.qid = q.id
  JOIN t_chapter c ON c.id = q.chapter_id
  WHERE NOT c.deleted
    AND c.level = 3
    AND q.chapter_id = m.chapter_id
    AND q.subject_id = m.subject_id
    AND q.subject_id = c.subject_id
    AND q.cat_l1 = m.cat_l1
    AND q.cat_l2 = m.cat_l2
    AND q.cat_l3 = m.cat_l3;
  IF n <> 17 THEN
    RAISE EXCEPTION '更新后目标 L3 校验异常：期望 17，实际 %', n;
  END IF;

  -- 校验隔离金标 368570：触发器放行且受保护字段零改动
  SELECT count(*) INTO n
  FROM t_question q
  JOIN t_question_backup_20261118_rehang b ON b.id = q.id
  WHERE q.id = 368570
    AND q.is_golden = true
    AND q.review_status = 'quarantined'
    AND q.deleted = false
    AND q.subject_id = 5
    AND q.chapter_id = 335
    AND q.cat_l1 = 'S6'
    AND q.cat_l2 = 'S6-3'
    AND q.cat_l3 = 'S6-3.1'
    AND q.stem IS NOT DISTINCT FROM b.stem
    AND q.option_json IS NOT DISTINCT FROM b.option_json
    AND q.correct IS NOT DISTINCT FROM b.correct
    AND q.analysis IS NOT DISTINCT FROM b.analysis;
  IF n <> 1 THEN
    RAISE EXCEPTION '隔离金标 368570 校验失败';
  END IF;

  -- 校验 380610 未被修改
  SELECT count(*) INTO n
  FROM t_question
  WHERE id = 380610
    AND subject_id = 4
    AND chapter_id = 61
    AND cat_l1 = 'A'
    AND cat_l2 = 'S1-1'
    AND cat_l3 = 'belongs_to_other';
  IF n <> 1 THEN
    RAISE EXCEPTION '380610 被意外修改或状态异常';
  END IF;

  -- 校验 8 道双 low 一致题维持原章节不动
  SELECT count(*) INTO n
  FROM t_question q
  JOIN t_chapter c ON c.id = q.chapter_id
  WHERE (q.id, q.chapter_id) IN (
    (346694, 61), (349204, 47), (350763, 146), (350952, 138),
    (366178, 68), (367943, 95), (370336, 311), (376921, 47)
  )
    AND c.level = 2;
  IF n <> 8 THEN
    RAISE EXCEPTION '8 道双 low 题状态异常：期望 8，实际 %', n;
  END IF;

  -- 全局计数断言
  SELECT count(*) INTO n FROM t_question WHERE NOT deleted;
  IF n <> 44323 THEN
    RAISE EXCEPTION '活跃题数异常：期望 44323，实际 %', n;
  END IF;

  SELECT count(*) INTO n FROM t_question WHERE NOT deleted AND review_status = 'ok';
  IF n <> 44096 THEN
    RAISE EXCEPTION '可练题数异常：期望 44096，实际 %', n;
  END IF;

  SELECT count(*) INTO n FROM t_question_kp;
  IF n <> 107687 THEN
    RAISE EXCEPTION 't_question_kp 总数异常：期望 107687，实际 %', n;
  END IF;

  SELECT count(*) INTO n FROM t_question WHERE is_golden;
  IF n <> 200 THEN
    RAISE EXCEPTION '金标题数异常：期望 200，实际 %', n;
  END IF;

  SELECT count(*) INTO n
  FROM t_question q
  LEFT JOIN t_chapter c ON c.id = q.chapter_id
  WHERE NOT q.deleted AND (c.id IS NULL OR c.deleted);
  IF n <> 0 THEN
    RAISE EXCEPTION '存在 chapter_id 为空或指向已删章节的活跃题：%', n;
  END IF;

  RAISE NOTICE '所有断言通过：更新 % 题（含 368570），380610 与 8 道双 low 未动，活跃题=44323，KP=107687，金标=200', updated_n;
END $$;

-- 4. 打印变更对照与课程计数
SELECT q.id,
       b.subject_id AS old_subj, q.subject_id AS new_subj,
       b.chapter_id AS old_chap, q.chapter_id AS new_chap, c.code AS new_code,
       b.cat_l1 AS old_l1, q.cat_l1 AS new_l1,
       q.cat_l2 AS new_l2, q.cat_l3 AS new_l3,
       q.is_golden, q.review_status
FROM t_question q
JOIN t_question_backup_20261118_rehang b ON b.id = q.id
JOIN t_chapter c ON c.id = q.chapter_id
ORDER BY q.id;

SELECT course, cnt FROM v_course_counts ORDER BY course;

COMMIT;

-- 如确需回滚（恢复 17 道题原章节与分类字段）：
-- BEGIN;
-- UPDATE t_question q
-- SET subject_id = b.subject_id,
--     chapter_id = b.chapter_id,
--     cat_l1     = b.cat_l1,
--     cat_l2     = b.cat_l2,
--     cat_l3     = b.cat_l3
-- FROM t_question_backup_20261118_rehang b
-- WHERE q.id = b.id;
-- COMMIT;
