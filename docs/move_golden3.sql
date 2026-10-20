-- 3 道金标题归位（用户 2026-10-21 明确指示）
-- 367533 → A1-1.6 外存储器；388534 → A2-2.2 操作系统；390505 → S2-3 SQL 数据操纵语言
BEGIN;

\copy (select id, chapter_id, subject_id, cat_l1 from t_question where id in (367533,388534,390505) order by id) to '/tmp/golden3_backup.csv' with (format csv, header)

UPDATE t_question SET chapter_id = 58,  subject_id = 4, cat_l1 = 'A'  WHERE id = 367533;
UPDATE t_question SET chapter_id = 68,  subject_id = 4, cat_l1 = 'A'  WHERE id = 388534;
UPDATE t_question SET chapter_id = 277, subject_id = 5, cat_l1 = 'S2' WHERE id = 390505;

SELECT id, chapter_id, subject_id, cat_l1, is_golden
  FROM t_question WHERE id IN (367533,388534,390505) ORDER BY id;

COMMIT;
