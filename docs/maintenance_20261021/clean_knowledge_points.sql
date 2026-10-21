-- 知识点表整理（2026-10-21，用户指示「做6」）
-- 只做机械清洗：题干误入、占位符、超短碎片、同标题重复
-- 全表先快照到 /tmp，再软删；不物理删除，可回滚
BEGIN;

\copy (select * from t_knowledge_point) to '/tmp/kp_backup_20261021.csv' with (format csv, header)
\copy (select * from t_question_kp) to '/tmp/question_kp_backup_20261021.csv' with (format csv, header)

-- 1) 题号开头的题目误入（如「10、第三代计算机…」）
UPDATE t_knowledge_point SET deleted = true
 WHERE NOT deleted AND title ~ '^[0-9]+、';

-- 2) 占位符 / 图片标记 / 随堂练习题 / 代码片段
UPDATE t_knowledge_point SET deleted = true
 WHERE NOT deleted AND (
   title IN ('text_image', 'flowchart', '随堂练习题')
   OR title LIKE 'include %'
   OR title LIKE '%<stdio.h>%'
 );

-- 3) 超短或纯数字碎片
UPDATE t_knowledge_point SET deleted = true
 WHERE NOT deleted AND (length(btrim(title)) < 2 OR title ~ '^[0-9. ]+$');

-- 4) 同标题重复：保留内容最长的一条（并列取 id 最小）
WITH ranked AS (
  SELECT id, row_number() OVER (PARTITION BY title ORDER BY length(content) DESC, id) AS rn
    FROM t_knowledge_point WHERE NOT deleted
)
UPDATE t_knowledge_point k SET deleted = true
  FROM ranked r
 WHERE k.id = r.id AND r.rn > 1;

SELECT
  count(*) FILTER (WHERE NOT deleted) AS remaining,
  count(*) FILTER (WHERE deleted)     AS deleted,
  count(*)                            AS total
FROM t_knowledge_point;

COMMIT;
