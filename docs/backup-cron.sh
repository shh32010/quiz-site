#!/bin/bash
# 本地 PostgreSQL 备份：每日全库 + 保留 14 天
# 每周日额外备份题目图片 + 保留 4 周
set -u
DIR=/opt/quiz-backups
mkdir -p $DIR
chown postgres:postgres $DIR 2>/dev/null
LOG=/var/log/quiz-backup.log
TS=$(date +%Y%m%d-%H%M)
echo "[$(date '+%F %T')] 开始 pg_dump" >> $LOG
sudo -u postgres pg_dump -d quiz -Fc -f $DIR/quiz-$TS.dump >> $LOG 2>&1
if [ $? -eq 0 ]; then
  echo "[$(date '+%F %T')] 完成: quiz-$TS.dump ($(du -h $DIR/quiz-$TS.dump | cut -f1))" >> $LOG
else
  echo "[$(date '+%F %T')] 失败" >> $LOG
fi
find $DIR -name 'quiz-2*.dump' -mtime +14 -delete 2>/dev/null

# 每周日备份题目图片（/opt/quiz-assets，约 42MB），保留 28 天
if [ "$(date +%u)" = "7" ]; then
  tar -czf $DIR/assets-$TS.tar.gz -C /opt quiz-assets >> $LOG 2>&1
  if [ $? -eq 0 ]; then
    echo "[$(date '+%F %T')] 图片备份完成: assets-$TS.tar.gz ($(du -h $DIR/assets-$TS.tar.gz | cut -f1))" >> $LOG
  else
    echo "[$(date '+%F %T')] 图片备份失败" >> $LOG
  fi
  find $DIR -name 'assets-*.tar.gz' -mtime +28 -delete 2>/dev/null
fi
