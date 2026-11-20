/**
 * 考纲各章/操作技能考情分值与教程导读配置（独立纯数据模块，供节阅读器复用）。
 */
export interface ChapterIntroConfig {
  courseTitle: string
  chapterTitle: string
  scoreDesc: string
  scoreTag: string
}

export const CHAPTER_INTRO_MAP: Record<string, ChapterIntroConfig> = {
  // 操作技能：大纲官方明确切分各技能分值（总分 80 分，占比 34.8%）
  S1: {
    courseTitle: '操作技能：C 语言程序设计',
    chapterTitle: '技能一：C 语言程序设计',
    scoreDesc: '大纲官方分值约占 30%（24 分）',
    scoreTag: '24 分',
  },
  S2: {
    courseTitle: '操作技能：数据库（MySQL）',
    chapterTitle: '技能二：数据库（MySQL）',
    scoreDesc: '大纲官方分值约占 20%（16 分）',
    scoreTag: '16 分',
  },
  S3: {
    courseTitle: '操作技能：UML 建模',
    chapterTitle: '技能三：UML 建模',
    scoreDesc: '大纲官方分值约占 10%（8 分）',
    scoreTag: '8 分',
  },
  S4: {
    courseTitle: '操作技能：局域网组建',
    chapterTitle: '技能四：局域网组建（局域网搭建）',
    scoreDesc: '大纲官方分值约占 10%（8 分）',
    scoreTag: '8 分',
  },
  S5: {
    courseTitle: '操作技能：操作系统配置与管理',
    chapterTitle: '技能五：操作系统配置与管理（Windows 10）',
    scoreDesc: '大纲官方分值约占 15%（12 分）',
    scoreTag: '12 分',
  },
  S6: {
    courseTitle: '操作技能：Linux 配置与管理',
    chapterTitle: '技能六：Linux 配置与管理（CentOS7）',
    scoreDesc: '大纲官方分值约占 15%（12 分）',
    scoreTag: '12 分',
  },

  // 理论 A：大纲规定课程 A 总分 90 分（占理论 60%）；结合历年真题统计实际分值分布
  A1: {
    courseTitle: '课程A：计算机应用基础（理论总分 150 分中约占 60% · 共 90 分）',
    chapterTitle: '第一章 计算机硬件基础',
    scoreDesc: '本章历年真题考查约 20～24 分（高频基础大章）',
    scoreTag: '约 20～24 分',
  },
  A2: {
    courseTitle: '课程A：计算机应用基础（理论总分 150 分中约占 60% · 共 90 分）',
    chapterTitle: '第二章 计算机软件与操作系统',
    scoreDesc: '本章历年真题考查约 25～30 分（高频核心大章）',
    scoreTag: '约 25～30 分',
  },
  A3: {
    courseTitle: '课程A：计算机应用基础（理论总分 150 分中约占 60% · 共 90 分）',
    chapterTitle: '第三章 计算机网络与互联网',
    scoreDesc: '本章历年真题考查约 30～35 分（全卷分值最高大章）',
    scoreTag: '约 30～35 分',
  },
  A4: {
    courseTitle: '课程A：计算机应用基础（理论总分 150 分中约占 60% · 共 90 分）',
    chapterTitle: '第四章 数字媒体与多媒体技术',
    scoreDesc: '本章历年真题考查约 10～15 分',
    scoreTag: '约 10～15 分',
  },

  // 理论 B：大纲规定课程 B 总分 60 分（占理论 40%）；结合历年真题统计实际分值分布
  B1: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第一章 信息和信息系统',
    scoreDesc: '本章历年真题考查约 8～12 分',
    scoreTag: '约 8～12 分',
  },
  B2: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第二章 物联网技术',
    scoreDesc: '本章历年真题考查约 6～8 分',
    scoreTag: '约 6～8 分',
  },
  B3: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第三章 移动互联网技术',
    scoreDesc: '本章历年真题考查约 2～4 分',
    scoreTag: '约 2～4 分',
  },
  B4: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第四章 云计算技术',
    scoreDesc: '本章历年真题考查约 2～4 分',
    scoreTag: '约 2～4 分',
  },
  B5: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第五章 大数据技术',
    scoreDesc: '本章历年真题考查约 6～8 分',
    scoreTag: '约 6～8 分',
  },
  B6: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第六章 人工智能技术',
    scoreDesc: '本章历年真题考查约 10～12 分（前沿高频大章）',
    scoreTag: '约 10～12 分',
  },
  B7: {
    courseTitle: '课程B：信息技术导论（理论总分 150 分中约占 40% · 共 60 分）',
    chapterTitle: '第七章 区块链技术',
    scoreDesc: '本章历年真题考查约 8～10 分',
    scoreTag: '约 8～10 分',
  },
}
