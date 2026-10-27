// 动态 sitemap：入口页 + 章节树 + 真题卷；后端不可用时退回入口页
interface ChapterNode {
  id: number
  children?: ChapterNode[]
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
    const [chapters, papers] = await Promise.all([
      $fetch<ChapterNode[]>(`${api}/api/chapters/tree`),
      $fetch<Array<{ id: number }>>(`${api}/api/papers`),
    ])

    const walk = (nodes: ChapterNode[]) => {
      for (const node of nodes) {
        paths.add(`/chapters/${node.id}`)
        if (node.children?.length) walk(node.children)
      }
    }
    walk(chapters ?? [])
    for (const paper of papers ?? []) paths.add(`/papers/${paper.id}`)
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
