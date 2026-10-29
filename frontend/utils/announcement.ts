/**
 * 站内公告配置。
 * 发布新公告时递增 version（如日期-序号），已读用户会再次看到弹窗。
 * 公告内容只影响前端展示，不需要改数据库。
 */
export interface AnnouncementItem {
  /** 小标签，如「新功能」 */
  tag: string
  /** 条目标题 */
  title: string
  /** 一句话说明 */
  desc: string
}

export interface Announcement {
  /** 版本号：变化后所有用户重新看到一次 */
  version: string
  title: string
  subtitle: string
  /** 展示用日期 */
  date: string
  items: AnnouncementItem[]
  /** 底部补充说明 */
  footnote?: string
}

export const ANNOUNCEMENT: Announcement = {
  version: '2026-10-29-1',
  title: '关于这个刷题站：题库、技术与部署',
  subtitle: '把题库来源、开发方式和运行情况一次说清楚。',
  date: '2026 年 10 月 29 日',
  items: [
    {
      tag: '题库',
      title: '公开资料，多轮清洗',
      desc: '素材整理自公开网络流传的机构资料 PDF，经 MinerU 识别提取，再由 DeepSeek-V4.1-Flash（1017 版）多轮精读、清洗、去重、补全答案与解析。',
    },
    {
      tag: '协作',
      title: '按江苏考纲整理，三个模型协作',
      desc: '参照江苏省计算机专转本考试大纲设计题库结构与知识点目录；DeepSeek-V4.1-Flash、Claude Opus 5.5、Gemini 4 Argon 协同完成开发、清洗与审查。',
    },
    {
      tag: '部署',
      title: '阿里云杭州节点，域名已备案',
      desc: '站点部署在阿里云杭州节点，域名已完成 ICP 备案，页面响应毫秒级；手机浏览器直接打开即可使用。',
    },
  ],
  footnote: '题库仅用于学习交流，如涉及版权问题可在站内「我的 → 联系作者」联系删除。公告每次更新只提示一次，也可从页脚「站内公告」重新查看。',
}
