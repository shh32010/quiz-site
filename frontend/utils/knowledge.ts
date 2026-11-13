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
  t: 'p' | 'list' | 'table' | 'code' | 'tree' | 'callout' | 'img'
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
  src?: string
  alt?: string
  caption?: string
  w?: number
  h?: number
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

/** 提取去掉章前缀后的层级序号：A1-1.1 -> 1.1，B6-6.3.1 -> 6.3.1，S1-1.1 -> 1.1 */
export function shortNodeCode(code: string | null | undefined): string {
  if (!code) return ''
  const idx = code.indexOf('-')
  return idx >= 0 ? code.slice(idx + 1).trim() : code.trim()
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

/** LaTeX 数学命令到显示字符与排版角色的映射表 */
const MATH_COMMANDS: Record<string, { text: string; kind: 'op' | 'delim' | 'bin' | 'sym' }> = {
  log: { text: 'log', kind: 'op' },
  ln: { text: 'ln', kind: 'op' },
  lg: { text: 'lg', kind: 'op' },
  max: { text: 'max', kind: 'op' },
  min: { text: 'min', kind: 'op' },
  lim: { text: 'lim', kind: 'op' },
  mod: { text: 'mod', kind: 'op' },
  sin: { text: 'sin', kind: 'op' },
  cos: { text: 'cos', kind: 'op' },
  tan: { text: 'tan', kind: 'op' },
  exp: { text: 'exp', kind: 'op' },
  sum: { text: '∑', kind: 'op' },
  prod: { text: '∏', kind: 'op' },
  lfloor: { text: '⌊', kind: 'delim' },
  rfloor: { text: '⌋', kind: 'delim' },
  lceil: { text: '⌈', kind: 'delim' },
  rceil: { text: '⌉', kind: 'delim' },
  langle: { text: '⟨', kind: 'delim' },
  rangle: { text: '⟩', kind: 'delim' },
  times: { text: '×', kind: 'bin' },
  cdot: { text: '·', kind: 'bin' },
  div: { text: '÷', kind: 'bin' },
  pm: { text: '±', kind: 'bin' },
  le: { text: '≤', kind: 'bin' },
  leq: { text: '≤', kind: 'bin' },
  ge: { text: '≥', kind: 'bin' },
  geq: { text: '≥', kind: 'bin' },
  ne: { text: '≠', kind: 'bin' },
  neq: { text: '≠', kind: 'bin' },
  approx: { text: '≈', kind: 'bin' },
  equiv: { text: '≡', kind: 'bin' },
  sim: { text: '~', kind: 'bin' },
  bmod: { text: 'mod', kind: 'bin' },
  to: { text: '→', kind: 'bin' },
  rightarrow: { text: '→', kind: 'bin' },
  Rightarrow: { text: '⇒', kind: 'bin' },
  in: { text: '∈', kind: 'bin' },
  notin: { text: '∉', kind: 'bin' },
  subset: { text: '⊂', kind: 'bin' },
  subseteq: { text: '⊆', kind: 'bin' },
  cup: { text: '∪', kind: 'bin' },
  cap: { text: '∩', kind: 'bin' },
  infty: { text: '∞', kind: 'sym' },
  alpha: { text: 'α', kind: 'sym' },
  beta: { text: 'β', kind: 'sym' },
  gamma: { text: 'γ', kind: 'sym' },
  delta: { text: 'δ', kind: 'sym' },
  epsilon: { text: 'ε', kind: 'sym' },
  theta: { text: 'θ', kind: 'sym' },
  lambda: { text: 'λ', kind: 'sym' },
  mu: { text: 'μ', kind: 'sym' },
  pi: { text: 'π', kind: 'sym' },
  sigma: { text: 'σ', kind: 'sym' },
  omega: { text: 'ω', kind: 'sym' },
  Delta: { text: 'Δ', kind: 'sym' },
  Theta: { text: 'Θ', kind: 'op' },
  Omega: { text: 'Ω', kind: 'op' },
  Sigma: { text: 'Σ', kind: 'op' },
}

const MATH_OPEN_DELIMS = new Set(['(', '[', '⌊', '⌈', '⟨', '{'])

/**
 * 将已做 HTML 转义的行内 LaTeX 公式（如 \log_2 n）转换为纯 HTML 公式片段
 * 不引入外部依赖，且保留可搜索文本与深浅色语义继承
 */
export function formatMathExpression(escapedExpr: string): string {
  const src = (escapedExpr ?? '').trim()
  if (!src) return ''

  let pos = 0

  const skipSpaces = () => {
    while (pos < src.length && /\s/.test(src[pos]!)) pos += 1
  }

  /** 读取 {...} 原始文本（用于 \text / \mathrm 等纯正体文本） */
  const readRawGroup = (): string => {
    skipSpaces()
    if (src[pos] !== '{') {
      const ch = src[pos] ?? ''
      if (ch) pos += 1
      return ch
    }
    pos += 1
    let depth = 1
    const start = pos
    while (pos < src.length && depth > 0) {
      if (src[pos] === '\\' && pos + 1 < src.length) {
        pos += 2
        continue
      }
      if (src[pos] === '{') depth += 1
      else if (src[pos] === '}') depth -= 1
      pos += 1
    }
    const end = depth === 0 ? pos - 1 : pos
    return src.slice(start, end)
  }

  /** 解析单个原子的主干与是否作为一元前导（开口定界符/运算符后接负号） */
  const parseAtom = (expectUnary: boolean): { html: string; nextUnary: boolean } => {
    skipSpaces()
    if (pos >= src.length) return { html: '', nextUnary: expectUnary }

    const ch = src[pos]!

    // 花括号分组
    if (ch === '{') {
      pos += 1
      const inner = parseSequence('}')
      if (src[pos] === '}') pos += 1
      return { html: inner, nextUnary: false }
    }

    // 已被 escapeHtml 转义的 HTML 实体（必须整体识别，不可拆成字母变量）
    for (const ent of ['&lt;', '&gt;', '&amp;']) {
      if (src.startsWith(ent, pos)) {
        pos += ent.length
        return { html: `<span class="kb-math-bin">${ent}</span>`, nextUnary: true }
      }
    }

    // LaTeX 命令
    if (ch === '\\') {
      pos += 1
      const cmdMatch = src.slice(pos).match(/^[A-Za-z]+/)
      if (cmdMatch) {
        const cmd = cmdMatch[0]
        pos += cmd.length
        if (cmd === 'frac') {
          const num = parseAtomOrGroup()
          const den = parseAtomOrGroup()
          return {
            html: `<span class="kb-math-frac"><span class="kb-math-frac-num">${num}</span><span class="kb-math-frac-den">${den}</span></span>`,
            nextUnary: false,
          }
        }
        if (cmd === 'sqrt') {
          const body = parseAtomOrGroup()
          return {
            html: `<span class="kb-math-sqrt"><span class="kb-math-sqrt-sign">√</span><span class="kb-math-sqrt-body">${body}</span></span>`,
            nextUnary: false,
          }
        }
        if (cmd === 'text' || cmd === 'mathrm') {
          const textBody = readRawGroup()
          return { html: `<span class="kb-math-text">${textBody}</span>`, nextUnary: false }
        }
        const entry = MATH_COMMANDS[cmd]
        if (entry) {
          if (entry.kind === 'sym') return { html: entry.text, nextUnary: false }
          const cls = `kb-math-${entry.kind}`
          return {
            html: `<span class="${cls}">${entry.text}</span>`,
            nextUnary: entry.kind === 'bin' || MATH_OPEN_DELIMS.has(entry.text),
          }
        }
        return { html: `<span class="kb-math-op">${cmd}</span>`, nextUnary: false }
      }
      // 符号转义如 \{ \} \, \; \|
      const escapedChar = src[pos] ?? ''
      pos += 1
      if (escapedChar === ',' || escapedChar === ';' || escapedChar === ' ') {
        return { html: '<span class="kb-math-gap"></span>', nextUnary: expectUnary }
      }
      if (escapedChar === '{' || escapedChar === '}' || escapedChar === '|') {
        return {
          html: `<span class="kb-math-delim">${escapedChar}</span>`,
          nextUnary: MATH_OPEN_DELIMS.has(escapedChar),
        }
      }
      if (escapedChar === '%') {
        return { html: '<span class="kb-math-bin">%</span>', nextUnary: true }
      }
      return { html: escapedChar, nextUnary: false }
    }

    // 数字字面量
    const numMatch = src.slice(pos).match(/^[0-9]+(?:\.[0-9]+)?/)
    if (numMatch) {
      pos += numMatch[0].length
      return { html: `<span class="kb-math-num">${numMatch[0]}</span>`, nextUnary: false }
    }

    // 英文字母：已知函数名（如无反斜杠的 log）保持正体，其余按数学变量斜体渲染
    const wordMatch = src.slice(pos).match(/^[A-Za-z]+/)
    if (wordMatch) {
      const word = wordMatch[0]
      pos += word.length
      if (MATH_COMMANDS[word]?.kind === 'op') {
        return { html: `<span class="kb-math-op">${word}</span>`, nextUnary: false }
      }
      return {
        html: word.split('').map(c => `<var>${c}</var>`).join(''),
        nextUnary: false,
      }
    }

    // 单字符运算符与定界符
    pos += 1
    if (ch === '(' || ch === ')' || ch === '[' || ch === ']' || ch === '|') {
      return {
        html: `<span class="kb-math-delim">${ch}</span>`,
        nextUnary: ch === '(' || ch === '[',
      }
    }
    if (ch === '+' || ch === '-') {
      const glyph = ch === '-' ? '−' : '+'
      const cls = expectUnary ? 'kb-math-unary' : 'kb-math-bin'
      return { html: `<span class="${cls}">${glyph}</span>`, nextUnary: true }
    }
    if (ch === '=' || ch === '/' || ch === '×' || ch === '÷' || ch === '≤' || ch === '≥' || ch === '≠' || ch === '~' || ch === '～') {
      return { html: `<span class="kb-math-bin">${ch === '～' ? '~' : ch}</span>`, nextUnary: true }
    }
    if (ch === ',' || ch === ';' || ch === ':') {
      return { html: `<span class="kb-math-punct">${ch}</span>`, nextUnary: true }
    }
    return { html: ch, nextUnary: false }
  }

  /** 读取下标/上标/\frac 参数（花括号整组或单个原子） */
  const parseAtomOrGroup = (): string => {
    skipSpaces()
    if (pos >= src.length) return ''
    if (src[pos] === '{') {
      pos += 1
      const inner = parseSequence('}')
      if (src[pos] === '}') pos += 1
      return inner
    }
    // 单字符数字或单字母变量优先于整串字母（如 a_ij 只取 i？标准 LaTeX x_2n 只取 2，x_ij 只取 i）
    const next = src[pos]!
    if (/[0-9A-Za-z]/.test(next)) {
      pos += 1
      return /[0-9]/.test(next) ? next : `<var>${next}</var>`
    }
    return parseAtom(true).html
  }

  const parseSequence = (stopChar?: string): string => {
    let out = ''
    let expectUnary = true

    while (pos < src.length) {
      skipSpaces()
      if (pos >= src.length) break
      if (stopChar && src[pos] === stopChar) break
      // 跳过意外孤立的上下标符号
      if (src[pos] === '_' || src[pos] === '^') {
        pos += 1
        continue
      }

      const atom = parseAtom(expectUnary)
      let subHtml = ''
      let supHtml = ''

      for (let i = 0; i < 2; i += 1) {
        skipSpaces()
        if (src[pos] === '_' && !subHtml) {
          pos += 1
          subHtml = parseAtomOrGroup()
        } else if (src[pos] === '^' && !supHtml) {
          pos += 1
          supHtml = parseAtomOrGroup()
        } else {
          break
        }
      }

      out += atom.html
      if (subHtml && supHtml) {
        out += `<span class="kb-math-subsup"><sup>${supHtml}</sup><sub>${subHtml}</sub></span>`
      } else if (subHtml) {
        out += `<sub>${subHtml}</sub>`
      } else if (supHtml) {
        out += `<sup>${supHtml}</sup>`
      }
      expectUnary = subHtml || supHtml ? false : atom.nextUnary
    }
    return out
  }

  return `<span class="kb-math">${parseSequence()}</span>`
}

/**
 * 渲染讲义块内的行内标记：
 * - 第一步：转义 HTML 并提取反引号代码、\(...\) 行内公式放入占位符，保护内部符号不被着色正则误切
 * - 第二步：转换三色行内标记与加粗：
 *   ==核心==（红）、^^重点^^（绿）、@@难点@@（黄）、**粗体**
 * - 第三步：还原行内代码与数学公式占位符
 * - 第四步：可选搜索关键词高亮 ?hl= -> <mark class="kb-hl">...</mark>
 */
export function renderInlineMarkup(text: string, highlightKeyword = ''): string {
  const codes: string[] = []
  const maths: string[] = []

  let html = escapeHtml(text)
    .replace(/`([^`]+)`/g, (_m, codeContent) => {
      const idx = codes.length
      codes.push(codeContent)
      return `\u0000CODE_${idx}\u0000`
    })
    .replace(/\\\((.+?)\\\)/g, (_m, mathContent) => {
      const idx = maths.length
      maths.push(formatMathExpression(mathContent))
      return `\u0000MATH_${idx}\u0000`
    })

  html = html
    .replace(/==(.+?)==/g, '<mark class="kb-mark">$1</mark>')
    .replace(/\^\^(.+?)\^\^/g, '<mark class="kb-imp">$1</mark>')
    .replace(/@@(.+?)@@/g, '<mark class="kb-hard">$1</mark>')
    .replace(/\*\*(.+?)\*\*/g, '<strong>$1</strong>')

  html = html
    .replace(/\u0000CODE_(\d+)\u0000/g, (_m, idxStr) => {
      const codeContent = codes[Number(idxStr)] ?? ''
      return `<code>${codeContent}</code>`
    })
    .replace(/\u0000MATH_(\d+)\u0000/g, (_m, idxStr) => maths[Number(idxStr)] ?? '')

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

/** “只看核心”过滤：保留核心块、提示框（易错陷阱）以及含 `==...==` 核心标记的块 */
export function filterKbBlocks(blocks: KbBlock[], coreOnly: boolean): KbBlock[] {
  if (!coreOnly) return blocks
  return (blocks ?? []).filter(block =>
    block.imp === 'core'
    || block.t === 'callout'
    || (block.text ?? '').includes('==')
    || (block.items ?? []).some(item => item.includes('=='))
    || (block.rows ?? []).some(row => row.some(cell => cell.includes('=='))),
  )
}

/** 知识点/讲义块重要度对应的徽章与左边框样式 */
export function importanceBadgeMeta(imp?: string): {
  label: string
  tone: 'red' | 'amber' | 'blue' | 'slate'
  borderClass: string
} {
  const v = (imp ?? '').trim().toLowerCase()
  if (v === 'core' || v === '核心') {
    return { label: '', tone: 'red', borderClass: 'border-l-danger-fg' }
  }
  if (v === 'important' || v === '重点') {
    return { label: '重点', tone: 'amber', borderClass: 'border-l-warn-fg' }
  }
  if (v === 'hard' || v === '难点') {
    return { label: '难点', tone: 'blue', borderClass: 'border-l-brand' }
  }
  return { label: '', tone: 'slate', borderClass: 'border-l-line-strong' }
}

/** 导读卡片在目录和锚点解析中的保留虚拟节点 ID */
export const CHAPTER_INTRO_NODE_ID = -999

/** 解析考纲条目的 DOM id（如 `group-76` / `group-chapter-intro`）为数字节点 ID */
export function parseSectionAnchorId(domId: string): number | null {
  if (domId === 'group-chapter-intro') return CHAPTER_INTRO_NODE_ID
  if (!domId.startsWith('group-')) return null
  const num = Number(domId.slice(6))
  return Number.isInteger(num) && num > 0 ? num : null
}

export interface TocAnchorPosition {
  nodeId: number
  /** 元素相对当前视口顶部的距离（通常为 getBoundingClientRect().top） */
  top: number
}

export interface ActiveTocScrollMetrics {
  scrollY: number
  scrollHeight: number
  innerHeight: number
  /** 视口黄金阅读线距离视口顶部的像素偏移（默认 130px） */
  readingOffset?: number
}

/** 根据各考纲条目相对视口顶部的实时位置与页面首尾边界，返回唯一应当高亮的节点 ID */
export function resolveActiveTocNodeId(
  items: TocAnchorPosition[],
  metrics: ActiveTocScrollMetrics,
): number | null {
  if (!items.length) return null
  const firstId = items[0]!.nodeId
  const lastId = items[items.length - 1]!.nodeId

  if (metrics.scrollY < 90) return firstId

  const maxScroll = metrics.scrollHeight - metrics.innerHeight
  if (maxScroll > 0 && metrics.scrollY >= maxScroll - 80) return lastId

  const readingOffset = metrics.readingOffset ?? 130
  let currentId: number | null = null
  for (const item of items) {
    if (item.top <= readingOffset) {
      currentId = item.nodeId
    } else {
      break
    }
  }
  return currentId ?? firstId
}

/**
 * 计算目录当前展示的激活节点 ID。
 * 注意：未完成客户端挂载（hydrated=false）前统一返回 null，确保 SSR HTML 与初次水合 VNode 的 class 完全一致，
 * 避免水合期间第 1 项保留 SSR 激活样式并在滚动后与新激活项同时高亮（双焦点）。
 */
export function resolveDisplayActiveGroupId(
  activeNodeId: number | null,
  tocNodeIds: number[],
  hydrated: boolean,
): number | null {
  if (!hydrated || !tocNodeIds.length) return null
  if (activeNodeId !== null && tocNodeIds.includes(activeNodeId)) {
    return activeNodeId
  }
  return tocNodeIds[0] ?? null
}
