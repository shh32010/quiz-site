/**
 * 站内公告配置。
 * 公告每天最多提示一次；发布新公告时递增 version，当天也会重新提示。
 * 公告内容只影响前端展示，不需要改数据库。
 */

/** 本地日期 YYYY-MM-DD，避免 UTC 跨天导致提前/延后弹出 */
export function localDateKey(date: Date = new Date()): string {
  const year = date.getFullYear()
  const month = String(date.getMonth() + 1).padStart(2, '0')
  const day = String(date.getDate()).padStart(2, '0')
  return `${year}-${month}-${day}`
}

/** 已读标记：版本 + 本地日期；跨天或版本变化都会重新提示 */
export function announcementMarker(version: string, date: Date = new Date()): string {
  return `${version}|${localDateKey(date)}`
}
export interface AnnouncementItem {
  /** 小标签，如「新功能」 */
  tag: string
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
  /** 版本号：变化后当天也会重新提示一次 */
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
  version: '2026-10-30-2',
  title: '关于这个刷题站的几句说明',
  subtitle: '跟大家交个底，说说题库哪来的、怎么做的，还有平时怎么维护。',
  date: '2026 年 10 月 29 日',
  history: [
    { date: '2026-10-30', text: '注册新增确认密码，两次输入不一致时会先提示，不会直接提交' },
    { date: '2026-10-30', text: '联系作者反馈也支持不写内容，选个分类就能提交' },
    { date: '2026-10-29', text: '处理 19 条待处理反馈：修正 7 道题，合并 9 个重复题，清理探测反馈' },
    { date: '2026-10-29', text: 'S1-1 按大纲拆成 3 个条目：82 条内容保留 55 条，移出或清理 27 条' },
    { date: '2026-10-29', text: '随机组卷加入 100/50 分钟计时，试卷模式判分与练习统一' },
    { date: '2026-10-29', text: '反馈支持选填并提示同类题，清空历史改为归档，游客退出提示保存进度' },
    { date: '2026-10-29', text: '知识点目录按小节编号，S5/S6 课程名称与考试大纲对齐' },
    { date: '2026-10-29', text: '在公告里把题库来源、三个模型协同开发和阿里云杭州节点部署的情况说清楚了' },
    { date: '2026-10-28', text: '加上了站内公告、联系作者和题目报错入口，顺便重做了交卷后的判分结果卡' },
    { date: '2026-10-28', text: '把知识点和 C 语言代码类题目又整理了一遍，修掉了之前的乱码和串行问题' },
    { date: '2026-10-28', text: '知识点阅读器加上了目录、进度和自测，手机上也能一节节连续往下滑' },
    { date: '2026-10-27', text: '新增邮箱验证和匿名访问统计，学习报告能看节级掌握度，错题也能按筛选打印' },
    { date: '2026-10-27', text: '补齐备案页脚、隐私协议和用户协议，SEO 基础配置也弄好了' },
  ],
  items: [
    {
      tag: '更新',
      title: '练习、反馈和历史又顺手了一点',
      desc: '随机组卷加了 100/50 分钟计时，试卷模式也和练习一样判分、答对自动下一题。游客退出会提醒保存进度；清空历史改为归档；题目反馈和联系作者反馈都可以不写描述；知识点目录按小节编号，S1-1 已先按三个大纲条目重排。',
    },
    {
      tag: '题库',
      title: '公开资料整理，做过多轮清洗',
      desc: '里面的题目来自公开网络流传的机构资料 PDF，先用 MinerU 识别提取出来，再由 DeepSeek-V4.1-Flash（1017 版）一轮轮精读、清洗、去重，顺手把缺的答案和解析也补全了。',
    },
    {
      tag: '协作',
      title: '按江苏考纲搭结构，三个模型一起写',
      desc: '题库结构和知识点目录都是参照江苏省计算机专转本考试大纲排的。网站开发、内容清洗和代码检查，由 DeepSeek-V4.1-Flash、Claude Opus 5.5 和 Gemini 4 Argon 一起完成。',
    },
    {
      tag: '部署',
      title: '放在阿里云杭州节点，已经备案',
      desc: '站点部署在阿里云杭州节点，域名已完成 ICP 备案，平时打开和切题基本是毫秒级响应。不用装软件，手机浏览器直接点开就能刷。',
    },
  ],
  footnote: '题库仅用于学习交流，如果哪部分涉及版权问题，在站内「我的 → 联系作者」跟我说一声，会尽快处理。这个公告每天只提示一次，关掉后想再看，从页面底部的「站内公告」随时能点开。',
}
