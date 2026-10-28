-- 知识点内容质量只读审计（2026-10-28）
-- 目的：量化标题重复、空/短正文、残留 HTML、表格文本；不修改任何数据。
-- 执行：sudo -u postgres psql -d quiz -P pager=off -f knowledge_audit_20261028.sql

\echo === 总体统计 ===
select count(*) as total,
       count(*) filter (where content is null or btrim(content) = '') as empty_content,
       count(*) filter (where content is not null and length(btrim(content)) < 20) as short_lt20,
       count(*) filter (where content ~* '<br|&nbsp;|&lt;|&gt;|&amp;|<p>|</p>') as raw_html,
       count(*) filter (where content ~ '\|') as has_pipe,
       count(*) filter (where content ~ '^\s*#{1,6}\s') as leading_heading
from t_knowledge_point
where not deleted;

\echo === 首行标题是否与知识点标题重复 ===
with x as (
  select id, title,
         lower(btrim(regexp_replace(
           regexp_replace(split_part(btrim(content), E'\n', 1), '^#{1,6}\s*', ''),
           '<[^>]+>', '', 'g'))) as first_line
  from t_knowledge_point
  where not deleted and content ~ '^\s*#{1,6}\s'
)
select count(*) filter (where first_line = lower(btrim(title))) as title_heading,
       count(*) filter (where first_line <> lower(btrim(title))) as other_heading
from x;

\echo === 同一节点内重复标题 ===
with d as (
  select node_id, lower(btrim(title)) as t, count(*) as c
  from t_knowledge_point
  where not deleted and node_id is not null
  group by 1, 2 having count(*) > 1
)
select count(*) as dup_groups, coalesce(sum(c - 1), 0) as extra_rows, max(c) as max_copies
from d;

\echo === 全局重复标题 ===
with d as (
  select lower(btrim(title)) as t, count(*) as c
  from t_knowledge_point
  where not deleted
  group by 1 having count(*) > 1
)
select count(*) as dup_groups, coalesce(sum(c - 1), 0) as extra_rows, max(c) as max_copies
from d;

\echo === 空/短正文样例 ===
select id, node_id, left(title, 40) as title, length(btrim(coalesce(content, ''))) as len,
       left(regexp_replace(coalesce(content, ''), '\s+', ' ', 'g'), 80) as preview
from t_knowledge_point
where not deleted and (content is null or length(btrim(content)) < 20)
order by length(btrim(coalesce(content, ''))), id
limit 20;

\echo === 残留 HTML 样例 ===
select id, node_id, left(title, 40) as title,
       left(regexp_replace(content, '\s+', ' ', 'g'), 100) as preview
from t_knowledge_point
where not deleted and content ~* '<br|&nbsp;|&lt;|&gt;|&amp;|<p>|</p>'
order by id
limit 15;
