const SITE_ORIGIN = 'https://quiz.teacher-wishes.asia'

export interface CourseItemInput {
  code: string
  name: string
  desc?: string
}

export interface PaperItemInput {
  id: number
  name: string
  questionCount?: number
  availableCount?: number
  score?: number
}

/** 构造首页 WebSite + Course 列表 JSON-LD 结构化数据 */
export function buildHomeJsonLd(courses: CourseItemInput[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'WebSite',
    name: '专转本计算机刷题',
    url: SITE_ORIGIN,
    description: '江苏省普通高校专转本计算机专业大类章节练习、历年真题模考、错题复习与知识点学习平台',
    hasPart: courses.map(c => ({
      '@type': 'Course',
      courseCode: c.code,
      name: c.name,
      description: c.desc ?? c.name,
      url: `${SITE_ORIGIN}/chapters?course=${encodeURIComponent(c.code)}`,
    })),
  }
}

/** 构造历年真题列表页 ItemList JSON-LD 结构化数据 */
export function buildPaperListJsonLd(papers: PaperItemInput[]) {
  return {
    '@context': 'https://schema.org',
    '@type': 'ItemList',
    name: '江苏省专转本计算机历年真题（2005–2025）',
    numberOfItems: papers.length,
    itemListElement: papers.map((p, index) => ({
      '@type': 'ListItem',
      position: index + 1,
      name: p.name,
      url: `${SITE_ORIGIN}/papers/${p.id}`,
    })),
  }
}

/** 构造单套真题卷详情页 Quiz JSON-LD 结构化数据 */
export function buildPaperDetailJsonLd(paper: PaperItemInput) {
  const count = paper.availableCount ?? paper.questionCount ?? 0
  return {
    '@context': 'https://schema.org',
    '@type': 'Quiz',
    name: paper.name,
    url: `${SITE_ORIGIN}/papers/${paper.id}`,
    educationalLevel: '江苏省普通高校专转本考试',
    description: `${paper.name}在线刷题与解析（可练 ${count} 题，满分 ${paper.score ?? 150} 分）`,
  }
}
