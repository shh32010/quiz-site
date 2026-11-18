# 搜索引擎提交清单（2026-11-17）

站点：`https://quiz.teacher-wishes.asia`（HTTPS，已备案：苏ICP/公安联网备案已在页脚）。

## 零、执行状态（2026-11-18）

| 平台 | 状态 | 记录 |
| :--- | :--- | :--- |
| 百度搜索资源平台 | **站点已验证** | 文件验证 `baidu_verify_codeva-KvJGaqPSnt.html` 已上线；主体备案号已填（苏ICP备2026082091号）；API 推送 5 个核心 URL 成功。sitemap 配额暂为 0（次日/关联主体后重试）。 |
| Bing Webmaster Tools | **站点已验证 + sitemap 已提交** | `BingSiteAuth.xml` 已上线；`https://quiz.teacher-wishes.asia/sitemap.xml` 状态 Processing。 |
| Google Search Console | **未完成** | 本机直连与 10808 代理均不可达，待代理启动后补做。 |

## 一、当前技术状态（已验证）

| 项目 | 状态 |
| :--- | :--- |
| `sitemap.xml` | 200，`application/xml`，共 **426** 个 URL（含 69 个知识库节页、27 套真题） |
| `robots.txt` | 200，`Allow: /`，已屏蔽 `/account`、`/admin`、`/practice`、`/search` 等私有页 |
| JSON-LD | 首页 `WebSite` + `Course`；真题页 `ItemList`/`Quiz`（代码已就绪） |
| 验证文件 | **尚未放置**（三平台验证时按下方步骤添加） |

## 二、添加验证文件（三平台通用）

1. 在各平台选择“HTML 文件验证 / XML 文件验证”，下载验证文件（如 `baidu_verify_xxxx.html`、`googleXXXX.html`、`BingSiteAuth.xml`）。
2. 放入 `frontend/public/` 根目录。
3. 构建并部署（与常规前端发布一致）：
   ```bash
   cd frontend && npm run build
   tar -czf /tmp/quiz-frontend.tar.gz .output
   scp /tmp/quiz-frontend.tar.gz aliyun:/tmp/
   ssh aliyun "rm -rf /opt/quiz-frontend/.output.new && mkdir -p /opt/quiz-frontend/.output.new && tar -xzf /tmp/quiz-frontend.tar.gz -C /opt/quiz-frontend/.output.new && systemctl stop quiz-frontend && mv /opt/quiz-frontend/.output /opt/quiz-frontend/.output.prev && mv /opt/quiz-frontend/.output.new/.output /opt/quiz-frontend/.output && systemctl start quiz-frontend"
   ```
4. 浏览器访问 `https://quiz.teacher-wishes.asia/<验证文件名>`，返回 200 后回平台点“验证”。

## 三、平台步骤

### 1. 百度搜索资源平台
- 入口：<https://zi.baidu.com> → 用户中心 → 站点管理 → 添加网站。
- 验证：推荐“HTML 文件验证”（按第二节）；也可用 CNAME（需 DNS 权限）。
- 提交：资源提交 → 普通收录 → sitemap → 填入 `https://quiz.teacher-wishes.asia/sitemap.xml`。
- 注意：百度对新站抓取慢，提交后可在“抓取诊断”手动抓首页与 2～3 个知识库节页。

### 2. Bing Webmaster Tools
- 入口：<https://www.bing.com/webmasters> → Add site。
- 验证：可从 Google Search Console 导入，或下载 `BingSiteAuth.xml` 放 `frontend/public/`。
- 提交：Sitemaps → 填入 `https://quiz.teacher-wishes.asia/sitemap.xml`。
- 可顺手开启“URL Submission”提交首页、`/knowledge`、`/papers`。

### 3. Google Search Console
- 入口：<https://search.google.com/search-console> → 添加资源 → URL 前缀 `https://quiz.teacher-wishes.asia`。
- 验证：HTML 文件（`googleXXXX.html`）放 `frontend/public/`；已有 DNS 权限也可用 DNS 验证。
- 提交：索引 → 站点地图 → 填 `sitemap.xml`。
- 用“URL 检查”请求编入首页、`/knowledge`、`/chapters`、`/papers` 及 2 个知识节页。

## 四、提交后检查（1～7 天后）

- 三平台“站点地图”状态为“成功/已读取”，无 404。
- Google“网页编入”开始出现 `quiz.teacher-wishes.asia` 的结果；Bing 同理。
- 百度“索引量”从 0 开始增长；若长期 0，检查 `robots.txt` 是否被 CDN/防火墙拦截百度蜘蛛 UA。
- 用 `site:quiz.teacher-wishes.asia` 抽查三平台收录。

## 五、注意

- 验证文件不要删除，否则平台会周期性失验。
- 站点内容更新（新知识节/真题）后，sitemap 动态生成，无需手动改；只需在平台“重新提交 sitemap”。
- 不在 `robots.txt` 中屏蔽 `/knowledge` 与 `/papers`，否则收录不到核心内容。
