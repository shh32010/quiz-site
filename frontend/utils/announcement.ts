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
  version: '2026-10-28-1',
  title: '知识点阅读器上线，刷题体验也顺手了',
  subtitle: '这次更新围绕「读得进去、练得顺手」做了三件事。',
  date: '2026 年 10 月 28 日',
  items: [
    {
      tag: '新功能',
      title: '知识点可以按节连续阅读',
      desc: '目录、搜索、字号切换、阅读进度和随手自测都齐了，手机上也能一屏读到底。',
    },
    {
      tag: '题库',
      title: 'C 语言与代码类题目完成清洗',
      desc: '修正了题干、选项和解析中的乱码、LaTeX 残片与串行问题，做题时看到的文字更干净。',
    },
    {
      tag: '体验',
      title: '判分更快，反馈更近',
      desc: '单选/判断点选即判分，答对自动进入下一题；题目有问题可以随时在题干下方反馈。',
    },
  ],
  footnote: '公告每次更新只提示一次，也可以从页脚「站内公告」重新查看。',
}
