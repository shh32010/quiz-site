# quiz-v2 文档与脚本索引

**最后整理**：2026-10-23

## 数据库变更 SQL（按需手工执行）

| 文件 | 用途 |
|---|---|
| `email_login.sql` | `profiles.email`、token_version、`password_reset_token` 表与授权 |
| `forgot_password.sql` | 管理员兜底的 `password_reset_request` 表 |
| `single_practice.sql` | `practice_session.mode` 扩展 single/course |
| `user_last_login.sql` | `profiles.last_ip`、`last_login_at` |
| `judge_alt_answers.sql` | 判分函数（备选答案 `¦`、多行填空、错题本节奏） |
| `guest_judge.sql` | 游客判分函数 |
| `clean_html_text.sql` | 历史 HTML 清洗 |
| `fix_multiline_fill.sql`、`fix_q364454.sql`、`fix_paper_gaps.sql`、`move_golden3.sql` | 历史一次性修复 |
| `paper6_20261021/` | 6 套真题卷修复记录 |

> 新环境按依赖顺序执行；已有库不要重复跑破坏性脚本，先备份 `/opt/quiz-backups/`。

## nginx / 运维配置

| 文件 | 用途 |
|---|---|
| `quiz-site.nginx.live.conf` | 线上 nginx 站点配置（HTTPS/跳转/静态/代理） |
| `quiz-proxy.conf` | 反代头、超时、隐藏上游头 |
| `quiz-security-headers.conf` | HSTS / nosniff / X-Frame-Options / Referrer-Policy / Permissions-Policy |
| `nginx-quiz-rate.conf`、`nginx-quiz-rate-locations.conf` | 限流区与 location |
| `backup-cron.sh` | 每日 DB + 每周图片备份（700/600 权限） |
| `ops_20261024.md` | 2026-10-24 索引/权限/pg_stat_statements/旧数据/依赖加固记录 |

## 数据工程 / 复核记录

| 目录 | 内容 |
|---|---|
| `maintenance_20261021/assoc/` | 知识点↔题目关联补全（候选、buddy 结果、落库） |
| `maintenance_20261021/deep_map/` | 知识点章节深层映射 |
| `maintenance_20261021/audit_fix_20261023/` | 审查小批量修复（试卷冲突/选项/答案格式） |
| `maintenance_20261021/round2_20261023/` | 第二轮补挂（软删关联/无题知识点/跨学科/C4） |
| `other_reclass_20261020/` | 「其他题目」1,598 道归位 |
| `direct_reclass_20261021/` | 章直属题 6,939 道归节 |
| `knowledge_20261021/` | 知识点映射脚本与映射表 |

## 校验脚本

- `verify_data.py`：题数/知识点/章节一致性核对
- `final_check.sh`、`test_practice.sh`：部署后冒烟
- 详细项目结论见 `../../题库交付/04-项目文档/项目状态与待办_20261021.md`
