#!/usr/bin/env bash
# 生产环境健康与观测巡检脚本（systemd 服务、内存、磁盘、open 反馈、PostgreSQL Top 慢查询）
set -euo pipefail

echo "=== 1. 核心服务状态 ==="
systemctl is-active quiz-backend quiz-frontend nginx postgresql redis-server

echo "=== 2. 内存与磁盘余量 ==="
free -m
df -h /

echo "=== 3. 待处理用户反馈（open） ==="
sudo -u postgres psql -d quiz -Atc "SELECT 'open_feedback=' || count(*) FROM feedback WHERE status='open';"

echo "=== 4. PostgreSQL Top 5 慢查询（按总耗时排序） ==="
sudo -u postgres psql -d quiz -c "
SELECT calls,
       round(total_exec_time::numeric, 1) AS total_ms,
       round(mean_exec_time::numeric, 2)  AS mean_ms,
       left(regexp_replace(query, '\s+', ' ', 'g'), 100) AS query_snippet
  FROM extensions.pg_stat_statements
 WHERE dbid = (SELECT oid FROM pg_database WHERE datname = 'quiz')
 ORDER BY total_exec_time DESC
 LIMIT 5;
"
