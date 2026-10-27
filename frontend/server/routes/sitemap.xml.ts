// 动态 sitemap：入口页 + 章节树 + 真题卷；后端不可用时退回入口页
interface ChapterNode {
  id: number
  code?: string | null
  level?: number
  children?: ChapterNode[]
}

interface KnowledgeNode {
  id: number
  code: string | null
  level: number
  children?: KnowledgeNode[]
}

function courseOf(code: string | null): string | null {
  if (!code) return null
  if (/^A\d/.test(code)) return 'A'
  if (/^B\d/.test(code)) return 'B'
  if (/^S[1-6]$/.test(code)) return code
  return null
}

function escapeXml(value: string): string {
  return value
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&apos;')
}

export default defineEventHandler(async (event) => {
  const base = 'https://quiz.teacher-wishes.asia'
  const api = process.env.QUIZ_API_BASE || 'http://127.0.0.1:8080'
  const paths = new Set(['/', '/chapters', '/knowledge', '/papers'])

  try {
    const [chapters, papers, knowledge] = await Promise.all([
      $fetch<ChapterNode[]>(`${api}/api/chapters/tree`),
      $fetch<Array<{ id: number }>>(`${api}/api/papers`),
      $fetch<KnowledgeNode[]>(`${api}/api/knowledge/tree`),
    ])

    const walk = (nodes: ChapterNode[]) => {
      for (const node of nodes) {
        paths.add(`/chapters/${node.id}`)
        if (node.children?.length) walk(node.children)
      }
    }
    walk(chapters ?? [])
    for (const paper of papers ?? []) paths.add(`/papers/${paper.id}`)

    const courses = new Set<string>()
    const walkKnowledge = (nodes: KnowledgeNode[]) => {
      for (const node of nodes) {
        const course = courseOf(node.code)
        if (course) courses.add(course)
        if (node.level === 2) paths.add(`/knowledge/section/${node.id}`)
        if (node.children?.length) walkKnowledge(node.children)
      }
    }
    walkKnowledge(knowledge ?? [])
    for (const course of courses) paths.add(`/knowledge/course/${course}`)
  } catch {
    // 后端短暂不可用时仍返回入口页，避免 sitemap 500
  }

  const urls = [...paths]
    .map(path => `<url><loc>${escapeXml(base + path)}</loc></url>`)
    .join('')

  setHeader(event, 'content-type', 'application/xml; charset=utf-8')
  setHeader(event, 'cache-control', 'public, max-age=3600')
  return `<?xml version="1.0" encoding="UTF-8"?><urlset xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">${urls}</urlset>`
})
