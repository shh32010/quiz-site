import { marked } from 'marked'

function escapeHtml(text: string): string {
  return (text ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
}

function escapeAttr(text: string): string {
  return escapeHtml(text).replace(/"/g, '&quot;').replace(/'/g, '&#39;')
}

function safeCodePoint(code: number): string {
  return Number.isInteger(code) && code >= 0 && code <= 0x10ffff
    ? String.fromCodePoint(code)
    : ''
}

/** 解码实体并剥离控制字符后校验 URL 协议白名单，阻断编码/空白伪装的 javascript:/data:/vbscript: XSS */
function sanitizeUrl(raw: string | null | undefined, fallback: string): string {
  const value = (raw ?? '').trim()
  if (!value) return fallback
  const decoded = value
    .replace(/&#x([0-9a-f]+);?/gi, (_, hex) => safeCodePoint(parseInt(hex, 16)))
    .replace(/&#(\d+);?/g, (_, dec) => safeCodePoint(parseInt(dec, 10)))
    .replace(/&colon;/gi, ':')
    .replace(/&tab;/gi, '\t')
    .replace(/&newline;/gi, '\n')
    .replace(/[\u0000-\u0020]+/g, '')
    .toLowerCase()

  // 允许单斜杠站内路径、锚点、相对路径；禁止协议相对 // 与非白名单 scheme
  if (decoded.startsWith('//')) return fallback
  if (/^[a-z][a-z0-9+.-]*:/.test(decoded)) {
    if (!/^(https?:|mailto:)/.test(decoded)) return fallback
  }
  return value
}

/** 搜索关键词高亮（先转义 HTML，避免把用户输入当标签） */
export function highlightText(text: string, keyword: string): string {
  const safe = escapeHtml(text)
  const kw = (keyword ?? '').trim()
  if (!kw) return safe
  const escaped = kw.replace(/[.*+?^${}()|[\]\\]/g, '\\$&')
  return safe.replace(new RegExp(escaped, 'gi'), match =>
    `<mark style="background:rgb(var(--warn-bg));color:inherit;border-radius:2px;padding:0 2px">${match}</mark>`)
}

/**
 * 知识点 Markdown 渲染：用 renderer 转义原始 HTML，并对链接/图片执行协议白名单消毒；
 * 避免先把代码块里的 `<stdio.h>` 转成 `&lt;` 后被 marked 再转义一次；表格外层支持横向滚动。
 */
export function renderMarkdown(text: string): string {
  const renderer = new marked.Renderer()
  renderer.html = ({ text: raw }) => escapeHtml(raw)
  renderer.link = function ({ href, title, tokens }) {
    const safeHref = sanitizeUrl(href, '#')
    const label = this.parser.parseInline(tokens)
    const titleAttr = title ? ` title="${escapeAttr(title)}"` : ''
    return `<a href="${escapeAttr(safeHref)}"${titleAttr}>${label}</a>`
  }
  renderer.image = function ({ href, title, text: alt }) {
    const safeSrc = sanitizeUrl(href, '')
    if (!safeSrc) return escapeHtml(alt ?? '')
    const titleAttr = title ? ` title="${escapeAttr(title)}"` : ''
    return `<img src="${escapeAttr(safeSrc)}" alt="${escapeAttr(alt ?? '')}"${titleAttr}>`
  }
  const html = marked.parse(text ?? '', {
    async: false, gfm: true, breaks: true, renderer,
  }) as string
  return html
    .replace(/<table>/g, '<div class="table-wrap"><table>')
    .replace(/<\/table>/g, '</table></div>')
}

/**
 * 知识点内容展示前清洗：
 * - 统一换行、<br>、常见 HTML 实体和段落标签
 * - 保留图片并转成 Markdown
 * - 去掉与知识点标题重复的首行标题
 */
export function normalizeKnowledgeContent(text: string, title = ''): string {
  let value = (text ?? '')
    .replace(/\r\n?/g, '\n')
    .replace(/<br\s*\/?>/gi, '\n')
    .replace(/<p\b[^>]*>/gi, '')
    .replace(/<\/p>/gi, '\n\n')
    .replace(/<img[^>]+src=["']([^"']+)["'][^>]*>/gi, '![]($1)')
    .replace(/&nbsp;/gi, ' ')
    .replace(/&quot;/gi, '"')
    .replace(/&#x27;|&#39;/gi, "'")
    .replace(/&lt;/gi, '<')
    .replace(/&gt;/gi, '>')
    .replace(/&amp;/gi, '&')
    .replace(/\n{3,}/g, '\n\n')
    .trim()

  if (title.trim()) {
    const lines = value.split('\n')
    const first = lines.findIndex(line => line.trim())
    if (first >= 0) {
      const heading = lines[first]!.replace(/^#{1,6}\s*/, '').replace(/^[-*]\s*/, '').trim()
      if (heading === title.trim()) {
        lines.splice(first, 1)
        value = lines.join('\n').replace(/^\n+/, '')
      }
    }
  }
  return value
}

/** 搜索/列表用的纯文本片段 */
export function plainSnippet(text: string, max = 140): string {
  const plain = (text ?? '')
    // 去掉知识库颜色定界符，避免摘要里出现 ==/^^/@@
    .replace(/==|\^\^|@@/g, '')
    .replace(/[#*_`~\[\]()|]/g, ' ')
    .replace(/-{3,}/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
  return plain.length > max ? `${plain.slice(0, max)}…` : plain
}
