# 379832 综合题拆分（2026-11-18）

## 背景

379832 是金标题且已隔离，题干含学生表结构 + 索引小问 (1)-(7) + 另一道 SQL 题，`correct` 却是 `INDEX；ON`，无法判分。源 PDF 本地已不存在，按 OCR（智狐 24 操作技能习题册）与《智狐实操 2000 题》答案键重建。

## 处理

- 原 379832 保持 `quarantined` + 金标，不删不改。
- 新建 7 道 type4 可练题（390707–390713），答案与空数：

| id | 内容 | 答案 | 空数 |
|---|---|---|---:|
| 390707 | 建表 + 唯一索引 | PRIMARY；KEY；UNIQUE；InnoDB | 4 |
| 390708 | s_name 普通索引 | ALTER；ADD；INDEX；s_NameIdx | 4 |
| 390709 | s_age+s_address 组合索引 | CREATE；INDEX；ON | 3 |
| 390710 | s_introduction 全文索引 | CREATE；FULLTEXT；INDEX；ON；s_introduction | 5 |
| 390711 | s_sex 普通索引 | ALTER；ADD；INDEX；s_SexIdx | 4 |
| 390712 | 查看索引 | SHOW；INDEX；FROM | 3 |
| 390713 | 删除 s_SexIdx | DROP；INDEX；ON；student；DROP | 5 |

- 每道复制原题 3 条知识点，共 21 条。
- 活跃 44,383 → **44,390**；金标仍 200；type4 8,116 → **8,123**。
- 备份：`t_question_backup_20261118_379832_split`、`t_text_content_backup_...`、`t_question_kp_backup_...`。
- SQL：`sql/01_backup.sql`、`02_split.sql`、`02_split_dryrun.sql`。
