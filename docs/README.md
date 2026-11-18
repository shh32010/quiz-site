# `docs/` 目录索引

**最后整理**：2026-11-18

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

> **知识点讲义**的编写、重写、审核、验收一律以 [`KNOWLEDGE_STANDARD.md`](KNOWLEDGE_STANDARD.md) 为准：PDF 内容与红/绿/黄标记全覆盖，前端只展示一份讲义。2026-11-17 已增补 `frontier` 块、颜色密度上限、禁标位置、`color_meta`、一段一块与重绘规则。

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

### 知识库与讲义
- [`archive/20261028-knowledge/`](archive/20261028-knowledge/README.md)：2026-10-28 知识点清洗 SQL（历史归档）
- [`archive/20261111-kb-address-bus/`](archive/20261111-kb-address-bus/README.md)：地址总线原文恢复（2026-11-11）
- [`archive/20261111-kb-image-position/`](archive/20261111-kb-image-position/README.md)：node40 配图位置修正（2026-11-11）
- [`archive/20261111-kb-move-items/`](archive/20261111-kb-move-items/README.md)：A1-1.1.2 条目迁移（2026-11-11）
- [`archive/20261111-kb-reclass/`](archive/20261111-kb-reclass/README.md)：2026-11-11 知识点精修记录（1.1–1.3）
- [`archive/20261111-renumber/`](archive/20261111-renumber/README.md)：讲义顶层序号重排（2026-11-11）
- [`archive/20261116-kb-rebuild/`](archive/20261116-kb-rebuild/README.md)：全库 52 章 232 节点重建 SQL（2026-11-16）
- [`archive/20261117-kb-color/`](archive/20261117-kb-color/README.md)：知识库全量颜色精读与内容修复（2026-11-17）
- [`archive/20261117-kp-link/`](archive/20261117-kp-link/README.md)：题库知识点补挂（2026-11-17）
- [`archive/20261117-kp-orphans/`](archive/20261117-kp-orphans/README.md)：知识点孤儿链接清理（2026-11-17）
- [`archive/20261118-kp-medium/`](archive/20261118-kp-medium/README.md)：medium 三轮共识补挂 + no_match 高频知识点（2026-11-18）

### 题库治理 2026-11-17
- [`archive/20261117-feedback/`](archive/20261117-feedback/README.md)：2026-11-17 题库反馈批量修复
- [`archive/20261117-p0/`](archive/20261117-p0/README.md)：P0 题库整改归档（2026-11-17）
- [`archive/20261117-p0b/`](archive/20261117-p0b/README.md)：P0-B 题库整改归档（2026-11-17）
- [`archive/20261117-p0c/`](archive/20261117-p0c/README.md)：P0-C 题库整改归档（2026-11-17）
- [`archive/20261117-p0-data/`](archive/20261117-p0-data/README.md)：P0 数据核对与干跑（2026-11-17）
- [`archive/20261117-manual80/`](archive/20261117-manual80/README.md)：人工题 80 道盲答复核归档（2026-11-17）
- [`archive/20261117-judge/`](archive/20261117-judge/README.md)：20261117-judge
- [`archive/20261117-comp/`](archive/20261117-comp/README.md)：综合 10 道执行报告（2026-11-17）
- [`archive/20261117-fill/`](archive/20261117-fill/README.md)：填空 122 道执行报告（2026-11-17）
- [`archive/20261117-multi/`](archive/20261117-multi/README.md)：多选 98 道执行报告（2026-11-17）
- [`archive/20261117-p1-blanks/`](archive/20261117-p1-blanks/README.md)：P1 填空空线规范化（2026-11-17）
- [`archive/20261117-p1-images/`](archive/20261117-p1-images/README.md)：P1 缺图题分类（2026-11-17）
- [`archive/20261117-p2/`](archive/20261117-p2/README.md)：P2 机械修复执行报告（2026-11-17）
- [`archive/20261117-p3-dupes/`](archive/20261117-p3-dupes/README.md)：P3 严格重复题 dry-run（2026-11-17）
- [`archive/20261117-p3-near/`](archive/20261117-p3-near/README.md)：近重复题审计清单（2026-11-17）
- [`archive/20261117-p3-type45/`](archive/20261117-p3-type45/README.md)：P3 题型 4/5 带选项分类（2026-11-17）

### 题库治理 2026-11-18
- [`archive/20261118-368620/`](archive/20261118-368620/README.md)：368620 题处理（2026-11-18）
- [`archive/20261118-blank361828/`](archive/20261118-blank361828/README.md)：361828 填空空线修复（2026-11-18）
- [`archive/20261118-blank6/`](archive/20261118-blank6/README.md)：填空第 6 批修复（2026-11-18）
- [`archive/20261118-blank7/`](archive/20261118-blank7/README.md)：填空第 7 批修复（2026-11-18）
- [`archive/20261118-dupes-analysis/`](archive/20261118-dupes-analysis/README.md)：44 组严格重复题逐组分析（2026-11-18）
- [`archive/20261118-golden6/`](archive/20261118-golden6/README.md)：P2 金标 6 道受控修复（2026-11-18）
- [`archive/20261118-imgpilot/`](archive/20261118-imgpilot/README.md)：题目配图试点：7 张上线（2026-11-18）
- [`archive/20261118-imgpilot2/`](archive/20261118-imgpilot2/README.md)：题目配图第二批候选（2026-11-18）
- [`archive/20261118-imgpilot3/`](archive/20261118-imgpilot3/README.md)：题目配图第二批：5 张上线（2026-11-18）
- [`archive/20261118-imgpilot4/`](archive/20261118-imgpilot4/README.md)：题目配图第三批：28 张上线（2026-11-18）
- [`archive/20261118-imgpilot5/`](archive/20261118-imgpilot5/README.md)：题目配图第二轮候选：2 张上线（2026-11-18）
- [`archive/20261118-lane3/`](archive/20261118-lane3/README.md)：空线题 + 368620 并行处理（2026-11-18）
- [`archive/20261118-p0-blind11/`](archive/20261118-p0-blind11/README.md)：P0 十一题三路盲答复核（2026-11-18）
- [`archive/20261118-p0-source3/`](archive/20261118-p0-source3/README.md)：P0 三道保留题的源答案确认（2026-11-18）
- [`archive/20261118-type45-manual/`](archive/20261118-type45-manual/README.md)：题型 4/5 人工题再处理（2026-11-18）

### 数据修复与运维
- [`archive/202610-data-fixes/`](archive/202610-data-fixes/README.md)：章直属题归位（2026-10-21）
- [`archive/20261102-data-fixes/`](archive/20261102-data-fixes/README.md)：题库四大专项治理（2026-11-02）
- [`archive/20261111-announcement/`](archive/20261111-announcement/README.md)：公告卡片固定 4 条（2026-11-11）

## 6. SQL 编写与执行规范

1. **命名约定**：结构/函数变更放 `docs/sql/schema_<主题>_<YYYYMMDD>.sql`；一次性数据修复执行后归档至 `docs/archive/`。
2. **执行纪律**：生产库 DML 必须包裹在事务中，修改前先创建备份表或导出 CSV；金标题目（`is_gold=true`）受触发器保护不得批量覆盖；修改题目/章节/知识点后必须执行 `redis-cli FLUSHDB`。
