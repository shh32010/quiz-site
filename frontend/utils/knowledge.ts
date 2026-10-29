/** 知识点树的前端共用类型与展开逻辑（与 /api/knowledge/tree 对应）。 */

export interface KNode {
  id: number
  subjectId: number
  code: string | null
  name: string
  level: number
  kpCount: number
  children: KNode[]
}

export interface SectionRef {
  id: number
  code: string | null
  name: string
  level: number
  kpCount: number
  course: string
  chapterId: number
  chapterCode: string | null
  chapterName: string
}

/** 知识点在整节中的连续序号（分片后也不从 1 重置） */
export function kpOrdinal(part: number, index: number, size: number): number {
  return (Math.max(part, 1) - 1) * size + index + 1
}

/** 标题是否已自带编号；避免阅读器再叠加“1.” */
/** 去掉标题开头自带的 3.3 / 10.4.1 一类编号，用于目录显示 */
export function stripLeadingNumber(title: string): string {
  return title.replace(/^\s*\d+(?:\.\d+)+[.．、]?\s+/, '').trim()
}

export function hasOwnNumbering(title: string): boolean {
  return /^\s*(?:\d+(?:[.．、]|\.\d+)|[一二三四五六七八九十]+[、.．]|第\s*[一二三四五六七八九十百0-9]+\s*[章节部分])/.test(title)
}

/** A1 -> A，B3 -> B，S1 -> S1 */
export function courseOf(code: string | null): string | null {
  if (!code) return null
  if (/^A\d/.test(code)) return 'A'
  if (/^B\d/.test(code)) return 'B'
  if (/^S[1-6]$/.test(code)) return code
  return null
}

/** 课程代码自然排序：A1、A2、B1…B7、S1…S6 */
export function codeOrder(code: string | null): string {
  return (code ?? '').replace(/\d+/g, n => n.padStart(3, '0'))
}

function sortByCode<T extends { code: string | null }>(items: T[]): T[] {
  return [...items].sort((a, b) => codeOrder(a.code).localeCompare(codeOrder(b.code)))
}

/** 某课程/技能下的根节点（A/B 为章，S 为技能节点） */
export function rootsFor(tree: KNode[], course: string): KNode[] {
  if (course === 'A') return sortByCode(tree.filter(n => n.subjectId === 4 && /^A\d/.test(n.code ?? '')))
  if (course === 'B') return sortByCode(tree.filter(n => n.subjectId === 4 && /^B\d/.test(n.code ?? '')))
  return sortByCode(tree.filter(n => n.subjectId === 5 && n.code === course))
}

/**
 * 把树展开为可连续阅读的“节”列表：
 * 有子节点的课程/技能取二级节；没有子节点的根节点自身作为阅读单位。
 */
export function flattenSections(tree: KNode[]): SectionRef[] {
  const out: SectionRef[] = []
  for (const root of sortByCode(tree)) {
    const course = courseOf(root.code)
    if (!course) continue
    const children = (root.children ?? []).filter(child => child.level === 2)
    if (children.length) {
      for (const section of children) {
        out.push({
          id: section.id, code: section.code, name: section.name, level: section.level,
          kpCount: section.kpCount, course,
          chapterId: root.id, chapterCode: root.code, chapterName: root.name,
        })
      }
    } else if (root.kpCount > 0 || !root.children?.length) {
      out.push({
        id: root.id, code: root.code, name: root.name, level: root.level,
        kpCount: root.kpCount, course,
        chapterId: root.id, chapterCode: root.code, chapterName: root.name,
      })
    }
  }
  return out
}
