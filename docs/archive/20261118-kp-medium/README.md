# 知识点补挂：medium 三轮共识 + no_match 高频簇（2026-11-18）

## 范围

- **medium 600 题**：来自全量补挂中置信度为 medium 的题，采用三轮独立盲选（第一轮为原全量结果，第二、三轮各 12 个代理重新标注）。
- **no_match 551 题**：按“只补高频簇”策略，仅处理出现 ≥3 题的概念；其余 514 题保持未挂。

## 方法

### medium 三轮共识
1. 三轮结果按题目比对 kp 集合。
2. 写库条件：三轮存在**共同知识点**（核心语义一致），且最终只写获得 **≥2 轮支持** 的知识点。
3. 结果：341 题达成共识，423 条链接；其余 259 题因三轮分歧或三轮均无合适候选，暂不写。

### no_match 高频簇
新建 8 个知识点（`t_knowledge_point.id` 32713–32720）：

| id | 节点 | 标题 |
| ---: | ---: | :--- |
| 32713 | 311 | Windows Defender 警报级别 |
| 32714 | 205 | 数据颗粒度 |
| 32715 | 279 | IN 与 OR 等价条件 |
| 32716 | 321 | ipconfig 命令 |
| 32717 | 324 | 远程协助与邀请设置 |
| 32718 | 292 | UML 约束表示 |
| 32719 | 292 | UML 扩展机制 |
| 32720 | 110 | 系统漏洞 |

挂载 37 题。

## 结果

- 写入来源 `KP补挂v5_20261118`：**457 条链接 / 375 题**（medium 423 + no_match 37，重叠 3 题）。
- 有效链接核对：457/457。
- 剩余无挂题：773 道（含 medium 未共识 259、no_match 未处理 514）。
- `t_question_kp` 总量：约 107,252（与其他终端并发清理有关，以最新 `STATUS` 为准）。

## 回滚

```sql
-- medium 共识链接
delete from t_question_kp
 where match_source = 'KP补挂v5_20261118' and confidence = 'medium';
-- no_match 高频簇链接与新建知识点
delete from t_question_kp
 where match_source = 'KP补挂v5_20261118' and confidence = 'medium'
   and kp_id between 32713 and 32720;
delete from t_knowledge_point where id between 32713 and 32720;
```

备份表：`t_question_kp_backup_20261118_medium`（写入前目标题的既有链接）。

## 文件

- 三轮盲选：`private/agy-context/link-pilot/medium-*.json`、`medium-r2-*.json`、`medium-r3-*.json`
- 共识清单：`private/agy-context/link-pilot/medium-consensus.json`
- 比对脚本：`private/agy-context/compare_medium.py`
- 新建知识点计划：`private/agy-context/link-pilot/new-kp-plan.json`
- 落库 SQL：`private/agy-context/sql_kp_medium_20261118.sql`、`sql_new_kp_20261118.sql`
