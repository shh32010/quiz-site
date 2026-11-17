# 知识库全量颜色精读与内容修复（2026-11-17）

## 范围与批次

- 全库 **232 个知识节点**全部写入 `source_ref.color_meta`（`difficulty` / `error_prone` / `frequency`）。
- 分 **12 批、220 个节点** 生成颜色补丁；另有 12 个试点节点（40–43、80–85、263、321）先期上线。
- 补丁文件：`private/agy-context/color/full-color-01..12.json`（含 blocks、issues、metadata、fixes）。
- 质检报告：`private/agy-context/color/qa-full-1..7.json`。

## 流程

1. 12 个代理按 `COLOR_SPEC.md` 逐节点精读：内联红/绿/黄标记、块级 `imp` 同步、问题记录、难度/易错/考频。
2. 自动校验：`validate_color_patch.py`（块结构、标记成对、节点级密度、imp 一致）。
3. 独立质检：每批由另一代理按同规范复检，输出 pass/fix 与逐条改法。
4. 返修与二轮质检：处理同句多色、整条涂色、错误表述误标、公式/代码内标记不渲染等问题。
5. 落库：`build_color_sql.py` 生成 SQL（备份表 `kb_color_bak_20261117`），分批执行并清 `knowledgeTree::all`、`chapterTree::all`。

## 规则要点

- 颜色语义：红=核心必背、绿=重点理解、黄=难点易错、无色=常规。
- 节点级软上限：红 ≤20%、绿 ≤25%、黄 ≤15%；同句最多一种颜色；不整段涂色。
- 标记不得写进行内代码（反引号）或 `\(...\)` 公式内部，否则前端不渲染。
- 裸 C 运算符 `==`（如 `i%2==0`）必须用反引号包裹，避免被误配成红标。
- 块级 `imp` 与块内最强颜色一致；`frontier`/`callout` 原有标记保留。
- `search_text` 落库时剥离颜色定界符，前端 `plainSnippet` 兜底，搜索摘要不显示 `==/^^/@@`。

## 结果

- 12/12 补丁校验 0 问题；正文审计 12/12 未登记改动 0。
- **471 条 issues**：已处理 **461 条**（fact / structure / table / caption / errata / code / image）；剩余 **10 条 deferred**，为独有信息合并、跨节点移动、表 id 重命名等边缘项，清单见 `private/agy-context/color/deferred_issues_20261117.md`。
- 生产库：`kb_revision` 共 3548 个版本；232 个已发布节点均带 `color_meta`；备份表 232 行。
- 前端：代码语法高亮、搜索摘要清洗、`nested-loop-flow.svg` 新流程图均已部署。

## 回滚

1. 备份表 `kb_color_bak_20261117(node_id, old_rev)` 记录首次落库前的 `published_rev`。
2. 单节点回滚：`update kb_entry set published_rev = (select old_rev from kb_color_bak_20261117 where node_id = ?) where node_id = ?;`
3. 回滚后清理缓存：`redis-cli DEL knowledgeTree::all chapterTree::all`。

## 文件指针

- 规范：`private/agy-context/COLOR_SPEC.md`
- 补丁：`private/agy-context/color/full-color-*.json`
- 历史 SQL：`private/agy-context/archive/color-20261117/sql/`
- 映射与工作区说明：`private/agy-context/README.md`、`ARCHIVE_MAPPING.md`
