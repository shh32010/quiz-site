# 题库知识点补挂（2026-11-17）

## 背景

生产库有 3,161 道活跃题未关联任何知识点（`t_question_kp`），同时约 696 个知识点无题。采用“题→知识点”方向补挂：按题干/选项/解析做全库关键词检索（知识点标题权重 3、内容权重 1，取 top 50–60），再由 LLM 从候选中选 1～3 个并给出 high/medium 置信度；只写 high。

## 流程

1. 试点 200 道（10 个章节各 20 道）：首轮章节内候选 high 59/200，暴露知识点树错挂与缺失；改为全库候选后重跑，high 142/200。
2. 全量 3,013 道无挂题（剔除试点已挂 141 题），拆 61 批 × 50 题，12 个代理并行标注。
3. 每批结果校验：`kp_ids` 必须属于该题候选、题序一致、`no_match` 为空数组、reason ≤30 字。
4. 抽检：试点 30 条 high → 26 correct / 4 partial / 0 wrong；全量 40 条 high → 38 correct / 2 partial / 0 wrong（95%）。
5. 落库：`ON CONFLICT (question_id,kp_id) DO NOTHING`，`max(id)` 起始，插入前校验题目与知识点均未删除；写前备份目标题链接。

## 结果

- 全量标注：3,013 题中 **high 1,862 题 / 2,742 条链接**；medium 600 题（未写）；no_match 551 题（18%）。
- 试点：141 题 / 271 条。
- 合计写入 `match_source='KP补挂v5_20261117'`：**3,013 条链接 / 2,003 题**。
- `t_question_kp` 总量：116,886 → **119,628**（净增 2,742，无冲突跳过）。
- 83% 的 high 链接跨章节——知识点树本身存在历史错挂，匹配按语义而非章节。

## 回滚

```sql
delete from t_question_kp where match_source = 'KP补挂v5_20261117';
```

备份表 `t_question_kp_backup_20261117_all` 为空（目标题此前均无链接），回滚即删除上述来源即可。

## 文件指针

- 批次与结果：`private/agy-context/link-pilot/`（`batch-*.json`、`result-all-*.json`、`qa-all-40-result.json`）
- 生成脚本：`private/agy-context/gen_link_all.py`
- 落库 SQL：`private/agy-context/sql_kp_link_all_20261117.sql`

## 后续

- medium 600 题与 no_match 551 题仍未挂；其中大量是知识点库本身缺失的考点（如 IS NULL、ROUND、路由协议、UWP、系统还原等），建议先补知识点再补挂。
- 跨章节链接占总量的 83%，若产品侧希望“相关知识点”只显示同章节点，可在查询层按章节过滤。
