-- 知识点映射落库（2026-10-21）
BEGIN;

ALTER TABLE t_knowledge_point ADD COLUMN IF NOT EXISTS node_id integer;
CREATE INDEX IF NOT EXISTS idx_kp_node ON t_knowledge_point(node_id) WHERE NOT deleted;

CREATE TEMP TABLE tmp_kp(id int primary key, node_id int, method text);
\copy tmp_kp from '/tmp/kp_map.csv' with (format csv)
UPDATE t_knowledge_point k SET node_id = t.node_id FROM tmp_kp t WHERE k.id = t.id;

SELECT count(*) AS total,
       count(*) FILTER (WHERE node_id IS NOT NULL) AS mapped,
       count(*) FILTER (WHERE node_id IS NULL) AS unmapped
  FROM t_knowledge_point WHERE NOT deleted;

COMMIT;
