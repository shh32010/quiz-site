# `docs/` 目录索引

**最后整理**：2026-11-11

---

## 1. 目录结构一览

```text
docs/
├── KNOWLEDGE_STANDARD.md  知识点讲义内容与展示标准（唯一标准，入库）
├── project/        本机项目核心文档（Git 忽略）：STATUS.md / TODO.md / KNOWLEDGE_REFACTOR.md
├── reference/      本机考试大纲与真题参考（Git 忽略）
├── sql/            数据库结构、核心判分/抽题函数、长期触发器基线 SQL
├── nginx/          线上 Nginx 站点、反代、安全头与限流配置
├── ops/            备份、巡检、数据一致性校验脚本与运维记录
└── archive/        历史一次性数据清洗与修题 SQL 归档（只作历史记录，切勿重复执行）
```

> **知识点讲义**的编写、重写、审核、验收一律以 [`KNOWLEDGE_STANDARD.md`](KNOWLEDGE_STANDARD.md) 为准：PDF 内容与红/绿/黄标记全覆盖，前端只展示一份讲义。

---

## 2. 项目核心文档（`docs/project/`，仅本机保留）

日常开发与接手只看以下 **3 份无日期后缀的常驻文档**：

| 文档 | 说明 |
| :--- | :--- |
| **[`project/STATUS.md`](project/STATUS.md)** | **项目状态与运维手册**：线上入口、服务器与数据库连接、最新数据基线、角色限额规则、测试与部署流程 |
| **[`project/TODO.md`](project/TODO.md)** | **待办清单与里程碑**：按 P0 / P1 / P2 / 暂缓排列的唯一真实待办表与近期完成记录 |
| **[`project/KNOWLEDGE_REFACTOR.md`](project/KNOWLEDGE_REFACTOR.md)** | **知识点重构专案历史**：表结构设计与阶段记录（内容约束已被 `KNOWLEDGE_STANDARD.md` 取代） |

---

## 3. 数据库基线 SQL（`docs/sql/`）

新环境初始化或函数升级时按需参考（均已在生产库生效）：

| 文件 | 用途 |
| :--- | :--- |
| [`sql/email_login.sql`](sql/email_login.sql) | `profiles.email`、`token_version`、`password_reset_token` 表与授权 |
| [`sql/forgot_password.sql`](sql/forgot_password.sql) | 管理员兜底的 `password_reset_request` 表 |
| [`sql/user_last_login.sql`](sql/user_last_login.sql) | `profiles.last_ip`、`last_login_at` |
| [`sql/single_practice.sql`](sql/single_practice.sql) | `practice_session.mode` 扩展 `single` / `course` |
| [`sql/data_write_chapter_random_20261026.sql`](sql/data_write_chapter_random_20261026.sql) | `practice_session.mode` 扩展 `chapter_random`（章节随机组卷） |
| [`sql/judge_alt_answers.sql`](sql/judge_alt_answers.sql) | 登录判分函数（备选答案 `¦`、多行填空、错题本间隔节奏） |
| [`sql/guest_judge.sql`](sql/guest_judge.sql) | 游客模式判分函数 |
| [`sql/data_write_compose_unseen_20261025.sql`](sql/data_write_compose_unseen_20261025.sql) | 随机组卷抽题函数 `pick_questions_for_user`（优先抽取未做题） |
| [`sql/data_write_compose_score_20261026.sql`](sql/data_write_compose_score_20261026.sql) | 全站随机组卷按大纲标准分值抽题（理论 150 分 / 实操 80 分） |
| [`sql/ops_gold_trigger_20261025.sql`](sql/ops_gold_trigger_20261025.sql) | 金标防误改触发器 `trg_protect_gold_question`（锁内容与审核列） |
| [`sql/schema_email_verification_20261027.sql`](sql/schema_email_verification_20261027.sql) | 邮箱归属验证：`profiles.email_verified` / `pending_email` 与 `email_verification_token` |
| [`sql/schema_email_claiming_20261027.sql`](sql/schema_email_claiming_20261027.sql) | 邮箱防抢占：唯一索引仅约束已验证邮箱 |
| [`sql/schema_page_view_20261027.sql`](sql/schema_page_view_20261027.sql) | 匿名访问统计 `page_view` 表 |
| [`sql/schema_soft_delete_20261029.sql`](sql/schema_soft_delete_20261029.sql) | `practice_session` / `practice_answer` / `wrong_question` 软删除 `deleted_at` 与恢复触发器 |
| [`sql/schema_feedback_question_nullable_20261030.sql`](sql/schema_feedback_question_nullable_20261030.sql) | `feedback.question_id` 允许为空（支持「联系作者」通用消息） |
| [`sql/schema_role_unlimited_20261031.sql`](sql/schema_role_unlimited_20261031.sql) | `profiles.role` 新增 `unlimited` 免限角色 |
| [`sql/schema_site_announcement_20261102.sql`](sql/schema_site_announcement_20261102.sql) | 站内公告表 `site_announcement`（支持 `/admin` 在线热更新） |

---

## 4. Nginx 与运维脚本（`docs/nginx/` & `docs/ops/`）

| 路径 | 用途 |
| :--- | :--- |
| [`nginx/quiz-site.nginx.live.conf`](nginx/quiz-site.nginx.live.conf) | 线上 Nginx 站点主配置（HTTPS / 跳转 / 静态 / 反代） |
| [`nginx/quiz-proxy.conf`](nginx/quiz-proxy.conf) | 反代头、超时与隐藏上游头 |
| [`nginx/quiz-security-headers.conf`](nginx/quiz-security-headers.conf) | HSTS / nosniff / X-Frame-Options / Referrer-Policy |
| [`nginx/nginx-quiz-rate.conf`](nginx/nginx-quiz-rate.conf)、[`nginx/nginx-quiz-rate-locations.conf`](nginx/nginx-quiz-rate-locations.conf) | 接口限流区与 location 规则 |
| [`ops/backup-cron.sh`](ops/backup-cron.sh) | 服务器每日 03:00 数据库 dump 与每周图片备份脚本 |
| [`ops/verify_data.py`](ops/verify_data.py)、[`ops/knowledge_audit_20261028.sql`](ops/knowledge_audit_20261028.sql) | 题库/知识点/章节只读一致性校验与内容审计查询 |
| [`ops/final_check.sh`](ops/final_check.sh)、[`ops/test_practice.sh`](ops/test_practice.sh) | 部署后接口冒烟检查脚本 |
| [`ops/ops_20261024.md`](ops/ops_20261024.md) | 2026-10-24 数据库索引、权限、`pg_stat_statements` 加固记录 |

---

## 5. 历史一次性数据修复归档（`docs/archive/`）

- **[`archive/20261102-data-fixes/data_write_audit_fix_20261102.sql`](archive/20261102-data-fixes/data_write_audit_fix_20261102.sql)**：2026-11-02 题库四大专项治理（22 组重复题复核合并、229 道题型错标恢复、S1 C 语言 48 `error` + 16 `quarantined` 深复核、X9 47 题与 18 知识点清零）。
- **[`archive/20261111-announcement/data_write_announcement_20261111.sql`](archive/20261111-announcement/data_write_announcement_20261111.sql)**：2026-11-11 公告卡片固定为 4 条（最新两条 + 部署/题库两条常驻），其余更新只保留在更新历史。
- **[`archive/20261111-renumber/data_write_kb_renumber_20261111.sql`](archive/20261111-renumber/data_write_kb_renumber_20261111.sql)**：2026-11-11 知识库 92 篇首号非 1 的讲义按“目”重排顶层序号；旧 revision 保留。
- **[`archive/20261111-kb-image-position/data_write_kb_image_position_20261111.sql`](archive/20261111-kb-image-position/data_write_kb_image_position_20261111.sql)**：2026-11-11 node 40（A1-1.1.1）第 7 项“如下图所示：”后紧接配图，后续编号项移到图片下方。
- **[`archive/20261111-kb-move-items/data_write_kb_move_items_20261111.sql`](archive/20261111-kb-move-items/data_write_kb_move_items_20261111.sql)**：2026-11-11 A1-1.1.2 保留第 1–7 项；第 8 项总线（改写通顺）及第 9–14 项移到 A1-1.1.3，并与总线子项合并。
- **[`archive/20261028-knowledge/`](archive/20261028-knowledge/)**：2026-10-28 全站 124 个章节知识点首轮文本清洗 SQL。
- **[`archive/202610-data-fixes/`](archive/202610-data-fixes/)**：2026-10-20 至 10-30 期间所有已执行完毕的一次性题目归位、反馈修复、探测账号清理 SQL 与过程目录。

---

## 6. SQL 编写与执行规范

1. **命名约定**：结构/函数变更放 `docs/sql/schema_<主题>_<YYYYMMDD>.sql`；一次性数据修复执行后归档至 `docs/archive/`。
2. **执行纪律**：生产库 DML 必须包裹在事务中，修改前先创建备份表或导出 CSV；金标题目（`is_gold=true`）受触发器保护不得批量覆盖；修改题目/章节/知识点后必须执行 `redis-cli FLUSHDB`。
