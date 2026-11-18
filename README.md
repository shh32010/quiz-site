# 专转本计算机刷题

江苏专转本（计算机专业大类）刷题网站。**Vue 3 + Spring Boot + PostgreSQL** 全自建架构。

## 技术栈

| 层 | 选型 |
|---|---|
| 前端 | Nuxt 3（Vue 3 + SSR） + Tailwind |
| 后端 | Spring Boot 3.5.16 + Java 21 + Spring Security(JWT) |
| 数据库 | PostgreSQL 17 |
| 缓存 | Redis 8 |

## 目录

```
quiz-v2/
├── backend/        Spring Boot 后端（端口 8080）
│   └── src/main/java/com/quiz/
│       ├── auth/         注册登录（JWT + BCrypt）
│       ├── knowledge/    知识库讲义、搜索与阅读进度
│       ├── chapter/      章节树 / 课程统计
│       ├── practice/     练习会话、判分与历史
│       ├── wrong/        错题本
│       ├── favorite/     收藏
│       ├── compose/      随机/章节组卷
│       ├── paper/        真题卷
│       ├── feedback/     题目与内容反馈
│       ├── announcement/ 站内公告
│       ├── admin/  stats/  report/  ai/
│       └── common/ config/  公共与配置
├── frontend/       Nuxt 3 前端（端口 3100）
│   ├── pages/            首页、章节、练习、知识库（course/kp/section）、搜索、错题、收藏、组卷、报告、账户与管理
│   ├── components/       知识块渲染、练习/反馈、导航与 UI
│   ├── public/kb-assets/ 讲义图片与重绘资源
│   └── nuxt.config.ts    /api 反代到后端
├── docs/           规范（KNOWLEDGE_STANDARD）、SQL、Nginx/运维与历史归档（archive/）
├── docs/project/   本机项目文档（Git 忽略）
├── docs/reference/ 大纲与真题（Git 忽略）
├── private/        本机原始资料与工作区（Git 忽略；agy-context 见其 README）
└── scripts/        辅助脚本
```

## 本地开发

### 后端

```bash
cd backend
# 需要环境变量：QUIZ_DB_URL / QUIZ_DB_USER / QUIZ_DB_PASSWORD / QUIZ_JWT_SECRET
mvn spring-boot:run
```

### 前端

```bash
cd frontend
npm install
npm run dev          # http://localhost:3000
```

## 生产部署（阿里云 ECS）

| 服务 | 方式 | 端口 |
|---|---|---|
| 后端 | systemd `quiz-backend`，jar 在 `/opt/quiz-backend` | 8080 |
| 前端 | systemd `quiz-frontend`，`.output` 在 `/opt/quiz-frontend` | 3100 |
| 数据库 | PostgreSQL 17 本机 | 5432 |
| 缓存 | Redis | 6379 |

环境变量通过 `EnvironmentFile` 注入（`/opt/quiz-site/.dbapp.env`、`.backend.env`），**不入库**。

## 接口一览

| 方法 | 路径 | 说明 |
|---|---|---|
| GET | `/api/health` | 健康检查 |
| POST | `/api/auth/register` | 注册 `{username,password}` |
| POST | `/api/auth/login` | 登录，返回 JWT |
| GET | `/api/auth/me` | 当前用户（需 Bearer） |
| GET | `/api/chapters/tree?subject=4` | 章节树（三级，含子树题数） |
| GET | `/api/courses` | 课程题数统计 |
| GET | `/api/papers` | 真题卷列表（含原卷/可练题数与分值） |
| GET | `/api/papers/{id}` | 卷面分节（含可练/缺失统计） |
| GET | `/api/questions?chapter=&course=&page=&size=` | 题目浏览（**不含答案**） |
| GET | `/api/practice/resume` | 最近一个可续做会话（需登录） |
| GET | `/api/practice/{id}/sheet` | 答题卡题位与作答状态（需登录） |

## 数据来源

题库 54,216 行（活跃 44,384，可练 44,146），来自江苏专转本真题与配套题库，
经大模型逐题精读（分类/难度/质检/答案四维）后入库。
当前状态/运维手册见 `docs/project/STATUS.md`，待办见 `docs/project/TODO.md`，知识点重构方案见 `docs/project/KNOWLEDGE_REFACTOR.md`（本机保留，Git 忽略）。考试大纲/真题见 `docs/reference/`，题库原始资料见 `private/reference/`（均本机保留，Git 忽略）。

## 约定

- **答案永不下发**：`correct` 不出现在任何浏览接口中，只在作答后经受控接口返回
- 密钥只走环境变量，仓库不含任何凭据
- 中文注释，代码风格见 `CLAUDE.md`
- Git 只提交代码、SQL 迁移和脚本；`docs/project/`、`docs/reference/`、`private/` 为本机资料，已忽略
