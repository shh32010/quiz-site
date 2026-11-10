/**
 * 站内公告配置。
 * 公告仅在有更新变动（version 变化）时提示一次；已读后跨天不再重复打扰。
 * 公告内容支持后台热更新，内置配置作为默认回退。
 */

/** 本地日期 YYYY-MM-DD */
export function localDateKey(date: Date = new Date()): string {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

/** 已读标记：仅按版本号标识；跨天保持已读，只有版本更新变动才重新提示 */
export function announcementMarker(version: string, _date?: Date): string {
  return (version ?? '').trim()
}

/** 生成今日下一个公告版本号（如 2026-11-10-1 -> 2026-11-10-2，跨天则为 YYYY-MM-DD-1） */
export function nextAnnouncementVersion(currentVersion: string, date: Date = new Date()): string {
  const today = localDateKey(date)
  const prefix = `${today}-`
  if (currentVersion.startsWith(prefix)) {
    const seq = Number.parseInt(currentVersion.slice(prefix.length), 10)
    if (Number.isFinite(seq) && seq >= 1) {
      return `${prefix}${seq + 1}`
    }
  }
  return `${prefix}1`
}
export interface AnnouncementItem {
  /** 小标签，如「新功能」 */
  tag: string
  /** 条目更新日期（YYYY-MM-DD） */
  date?: string
  /** 条目标题 */
  title: string
  /** 一句话说明 */
  desc: string
}

export interface AnnouncementHistoryItem {
  /** 展示用日期 */
  date: string
  /** 该次更新的一句话说明 */
  text: string
}

export interface Announcement {
  /** 版本号：变化后重新提示一次 */
  version: string
  title: string
  subtitle: string
  /** 展示用日期 */
  date: string
  items: AnnouncementItem[]
  /** 更新历史：只放对用户有感知的提交，不贴原始 commit message */
  history?: AnnouncementHistoryItem[]
  /** 底部补充说明 */
  footnote?: string
}

export const ANNOUNCEMENT: Announcement = {
  version: '2026-11-10-4',
  title: '站内更新与使用说明',
  subtitle: '江苏计算机专转本考纲题库与结构化知识讲义 · 近期重要更新及使用须知',
  date: '2026 年 11 月 10 日',
  history: [
    { date: '2026-11-10', text: '知识库二期全量升级：两本复习教程 PDF 正文、红/绿/黄三色重点标记、18 张表格与 431 张正向去水印配图 100% 无损收录，文末融合真题补充要点；题目关联全面切至考纲三级节点；公告改为仅在版本变动时提示' },
    { date: '2026-11-02', text: '全考纲 232 篇三级结构化讲义首版发布并上线「只看必记」模式；错题本新增「今日到期」间隔重复筛选；「我的」新增反馈处理进度；完成 C 语言与 229 道题型复核及 X9 未分类清零；通过公安联网备案' },
    { date: '2026-10-31', text: '上线普通账号每日 200 道不同题作答额度（重做不重复计次，免限用户与管理员不受限，达上限可直接联系作者申请）' },
    { date: '2026-10-30', text: '注册新增确认密码一致性校验；联系作者反馈改为选填描述；处理用户题目报错并修正争议题' },
    { date: '2026-10-29', text: '随机组卷加入 100/50 分钟计时并与常规练习判分统一；清空历史改为归档；游客退出提示保存进度；处理 19 条题目反馈' },
    { date: '2026-10-28', text: '知识点阅读器新增本节目录、阅读进度与随堂自测；清洗 C 语言代码类题目格式；新增站内公告、联系作者与题目报错入口' },
    { date: '2026-10-27', text: '重构知识点为节级连续阅读器；新增邮箱归属验证、学习报告节级掌握度、错题筛选抽测与含解析打印；补齐 ICP 备案页脚与隐私/用户协议' },
    { date: '2026-10-26', text: '支持一级章（80/40 题）与二级节（40 题）按考纲配比随机组卷；答题卡按题型分组；完成 85 组重复选择题去重' },
    { date: '2026-10-25', text: '上线暖砂纸阅读主题与夜间模式；首页展示全站学习总进度与章节进度条；随机组卷优先抽取未做过的题' },
    { date: '2026-10-24', text: '章节练习、错题本与做题历史支持按题型分类筛选与专项刷题；完成后端接口与权限加固' },
    { date: '2026-10-23', text: '新增邮箱登录与找回密码、做题历史与错题复习；完成多轮题库质检、跨学科误挂清理与答案修正' },
    { date: '2026-10-22', text: '完成知识点向考纲二级节的深层映射，并建立 1,876 条知识点与真题双向关联' },
    { date: '2026-10-21', text: '知识点学习页首版上线（大纲树浏览、双向跳转、全库搜索、知识点掌握度）；上线刷题快速模式；完成 8,500+ 道题目章节归位与阿里云 HTTPS 部署' },
    { date: '2026-10-20', text: '项目建站：采用 Vue 3 + Spring Boot 架构，按江苏计算机专转本考纲搭建课程 A/B 与技能一～六体系，上线章节刷题、错题本、收藏夹、随机组卷、AI 答疑与学习报告' },
  ],
  items: [
    {
      tag: '最新',
      date: '2026-11-10',
      title: '知识库二期全量升级，题目关联全部切至新版讲义',
      desc: '两本复习教程 PDF（理论 135 页 + 操作技能 168 页）正文、红（必记）/绿（重点）/黄（难点）三色标记、18 张表格与 431 张正向去水印配图已 100% 无损收录，并在每节末尾融合真题独有补充要点。刷题解析、错题本、收藏夹与学习报告已全部切换至新版 232 个考纲三级讲义节点。',
    },
    {
      tag: '讲义',
      date: '2026-11-02',
      title: '全考纲 232 篇三级讲义重构与双备案上线',
      desc: '知识库全面对齐江苏省计算机专转本考纲三级节点，支持「只看必记」一键背诵、错题本「今日到期」间隔重复筛选与反馈处理进度追踪。站点部署于阿里云杭州节点，已完成 ICP 备案与公安联网备案（苏公网安备32132402000835号）。',
    },
    {
      tag: '规则',
      date: '2026-10-31',
      title: '每日 200 道不同题作答额度说明',
      desc: '普通账号每日最多作答 200 道不同题目，同一题目重做不重复计次；免限用户与管理员不受限制。达到上限后可在刷题页直接联系作者申请免限。',
    },
    {
      tag: '建站',
      date: '2026-10-20',
      title: '题库与讲义来源及多模型协同维护',
      desc: '题库与讲义源自公开复习资料 PDF，经 MinerU 与 PyMuPDF 提取后，由 DeepSeek-V4.1-Flash、Claude Opus 5.5、Gemini 4 Argon 与 Gemini 3.8 Flash 协同完成结构化排版、多轮去重纠错与 C 语言编译校验。',
    },
  ],
  footnote: '本站内容仅供个人备考学习交流；如涉及版权或题目勘误，可通过「我的 → 联系作者」反馈。公告仅在版本更新时提示一次，关闭后可随时从页脚「站内公告」查看。',
}
