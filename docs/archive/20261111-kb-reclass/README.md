# 2026-11-11 知识点精修记录（1.1–1.3）

本目录保存当天在**线上生产库**执行过的一次性知识点修订 SQL，均已执行完毕、旧 revision 全部保留，可按 `node_id + rev_no` 回滚。

| 文件 | 作用 | 涉及节点 |
| :--- | :--- | :--- |
| `data_write_kb_node42_for_format_20261111.sql` | 1.1.3 总线定义句：`总线` 与 `用于` 分开标记，“用于”不标红 | 42 → rev7 |
| `data_write_kb_11_reclass_20261111.sql` | 1.1.2 / 1.1.3 / 1.1.4 按节标题重新归类并重排顶层序号 | 41/42/43 → rev5/8/4 |
| `data_write_kb_node41_numbering_20261111.sql` | 1.1.2“PC 机组成”子项 `1./2./3.` 改为 `（1）（2）（3）` | 41 → rev6 |
| `data_write_kb_node40_os_functions_20261111.sql` | 1.1.1 操作系统四大功能补齐红色标记 | 40 → rev4 |
| `data_write_kb_node40_remove_macro_red_20261111.sql` | 去掉“宏观上同时执行、微观上单一执行”的红标 | 40 → rev5 |
| `data_write_kb_node40_os_split_lines_20261111.sql` | 四大功能各自单独成行 | 40 → rev6 |
| `data_write_kb_node42_overview_lines_20261111.sql` | 1.1.3 概述 `1）2）3）` 各自成行，2）3）补绿/红标记 | 42 → rev9 |
| `data_write_kb_node42_storage_split_lines_20261111.sql` | “存储器的层状塔式结构”拆成三行 | 42 → rev10 |
| `data_write_kb_12_reclass_20261111.sql` | 1.2.1 / 1.2.2 概念与分类拆分去重，趋势条目独立 | 45/46 → rev3/4 |
| `data_write_kb_13_rebuild_20261111.sql` | 1.3.1–1.3.4 按节标题重建，删除重复与题目选项分析 | 48–51 → rev3/4/4/4 |
| `data_write_kb_13_image_positions_20261111.sql` | 存储层次塔式图归 1.3.2、I/O 控制方式对比表归 1.3.4 | 49/50/51 → rev5/5/5 |

## 执行与回滚

```sql
-- 查看某节历史版本
select node_id, rev_no, updated_at from kb_revision where node_id = 49 order by rev_no desc;

-- 回滚到指定版本（示例）
update kb_entry set published_rev = 4, updated_at = now() where node_id = 49;
```

执行后需清理知识树缓存（`knowledgeTree::all`），正文接口直接读库不受缓存影响。
