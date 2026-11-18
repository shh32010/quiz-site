# 运维垃圾清理（2026-11-18）

## 会话

- 清理条件：`finished_at IS NULL`、`deleted_at IS NULL`、`started_at < now()-interval '7 days'`。
- 命中 **62 个**陈旧未交卷会话，`deleted_at=now()` 软删；保留最近 7 天 22 个。
- 备份：`practice_session_backup_20261118_stale`（62 行）。
- 未删除 `session_question` / `practice_answer`，只隐藏会话入口。

## 备份表

- 保留 2026-11-16 及以后；删除 11-02、11-13 两批共 **10 张**旧备份表：
  `audit_fix_backup_20261102`、`t_kp_s1_backup_20261102`、`t_kp_s2_s6_backup_20261102`、`t_kp_theory_backup_20261102`、`kb_asset_backup_20261113_z24`、`kb_asset_bak_20261113_p0`、`kb_entry_backup_20261113_z24`、`kb_entry_bak_20261113_p0`、`kb_revision_backup_20261113_z24`、`kb_revision_bak_20261113_p0`。
- 删除前记录清单：`backup_drop_manifest_20261118`（10 行，含行数与字节数）。
- 释放约 **8 MB**。

## 未动

- 题目、知识点、试卷引用、227 道隔离题、7 道金标 uncertain 均未改动。
