# 772 道未挂知识点补挂（2026-11-18）

## 方法

- 对 772 道无任何 `t_question_kp` 的活跃题（理论 467、实操 303、真题回放 2），用题干/选项/解析做字符 n-gram 检索，从 8,359 个知识点中取 top 30 候选。
- 20 批 ×40 题，10 个 agent 独立标注，只选候选内 id，给 high/medium/no_match。
- medium 再跑第二轮独立标注，两轮所选知识点取交集才写库。

## 第一轮结果（772 题全覆盖）

| 置信度 | 题数 |
|---|---:|
| high | 112 |
| medium | 259 |
| no_match | 401 |

## 已写库

| 批次 | 链接 | 题数 | match_source |
|---|---:|---:|---|
| high | 138 | 112 | `KP补挂v6_20261118` |
| medium 两轮交集（全部） | 194 | 191 | `KP补挂v6m_20261118` |

- 备份：`t_question_kp_backup_20261118_kp772`、`t_question_kp_backup_20261118_kp772m`。
- 写入后 `t_question_kp`：107,273 → **107,605**；未挂题 772 → **469**。
- SQL：`sql/01_apply.sql`、`sql/02_medium_apply.sql`。

## 剩余

- 469 道仍无挂：401 道 no_match（候选池无对应考点）+ 68 道 medium 第二轮判 no_match/无交集。
- medium 全部复核已完成，最终交集已写库。
- no_match 长尾集中在路由协议、MySQL 存储过程/游标/触发器、UML 元模型、Linux 进程/VFS、RAID、C 文件 I/O 等，需先补知识点。
