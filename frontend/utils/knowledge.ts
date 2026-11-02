/** 知识点树与结构化讲义块的前端共用类型与工具函数。 */

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

export interface KbTreeNode {
  label: string
  children?: KbTreeNode[]
}

export interface KbBlock {
  id: string
  t: 'p' | 'list' | 'table' | 'code' | 'tree' | 'callout' | 'media'
  imp?: 'core' | 'important' | 'hard' | 'normal'
  title?: string
  text?: string
  ordered?: boolean
  items?: string[]
  headers?: string[]
  rows?: string[][]
  lang?: string
  code?: string
  root?: KbTreeNode
  kind?: 'tip' | 'warn' | 'trap'
}

export interface KbEntry {
  nodeId: number
  nodeCode: string | null
  nodeName: string
  revNo: number
  questionCount: number
  blocks: KbBlock[]
  questions: any[]
}

/** 知识点在整节中的连续序号（分片后也不从 1 重置） */
export function kpOrdinal(part: number, index: number, size: number): number {
  return (Math.max(part, 1) - 1) * size + index + 1
}

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

function escapeHtml(text: string): string {
  return (text ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
}

/**
 * 渲染讲义块内的行内标记：
 * - 转义原始 HTML（如 `<stdio.h>`）
 * - `` `code` `` -> `<code>code</code>`
 * - `==必记==` -> `<mark class="kb-mark">必记</mark>`
 * - `**重点**` -> `<strong>重点</strong>`
 * - 可选搜索关键词高亮 `?hl=` -> `<mark class="kb-hl">...</mark>`
 */
export function renderInlineMarkup(text: string, highlightKeyword = ''): string {
  let html = escapeHtml(text)
    .replace(/`([^`]+)`/g, '<code>$1</code>')
    .replace(/==([^=]+)==/g, '<mark class="kb-mark">$1</mark>')
    .replace(/\*\*([^*]+)\*\*/g, '<strong>$1</strong>')

  const kw = (highlightKeyword ?? '').trim()
  if (kw) {
    const escaped = escapeHtml(kw).replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
    const re = new RegExp(escaped, 'gi')
    html = html.replace(/(<[^>]+>)|([^<]+)/g, (_m, tag, plain) => {
      if (tag) return tag
      return String(plain).replace(re, hit => `<mark class="kb-hl">${hit}</mark>`)
    })
  }
  return html
}

/** “只看必记”过滤：保留必记块、提示框（易错陷阱）以及含 `==...==` 必记标记的块 */
export function filterKbBlocks(blocks: KbBlock[], coreOnly: boolean): KbBlock[] {
  if (!coreOnly) return blocks
  return (blocks ?? []).filter(block =>
    block.imp === 'core'
    || block.t === 'callout'
    || (block.text ?? '').includes('==')
    || (block.items ?? []).some(item => item.includes('==')),
  )
}

/** 知识点/讲义块重要度对应的徽章与左边框样式 */
export function importanceBadgeMeta(imp?: string): {
  label: string
  tone: 'red' | 'amber' | 'blue' | 'slate'
  borderClass: string
} {
  const v = (imp ?? '').trim().toLowerCase()
  if (v === 'core' || v === '必记') {
    return { label: '必记', tone: 'red', borderClass: 'border-l-danger-fg' }
  }
  if (v === 'important' || v === '重点') {
    return { label: '重点', tone: 'amber', borderClass: 'border-l-warn-fg' }
  }
  if (v === 'hard' || v === '难点') {
    return { label: '难点', tone: 'blue', borderClass: 'border-l-brand' }
  }
  return { label: '', tone: 'slate', borderClass: 'border-l-line-strong' }
}
