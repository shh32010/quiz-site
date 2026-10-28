import { marked } from 'marked'

function escapeHtml(text: string): string {
  return (text ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
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
 * 知识点 Markdown 渲染：先转义原始 HTML，再渲染 Markdown，并拦截危险链接。
 * 表格外包一层，移动端可横向滚动而不撑破正文。
 */
export function renderMarkdown(text: string): string {
  const safe = (text ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
  const html = marked.parse(safe, { async: false, gfm: true, breaks: true }) as string
  return html
    .replace(/\s(href|src)=["'](?:javascript|data|vbscript):[^"']*["']/gi, ' $1="#"')
    .replace(/<table>/g, '<div class="table-wrap"><table>')
    .replace(/<\/table>/g, '</table></div>')
}

/** 搜索/列表用的纯文本片段 */
export function plainSnippet(text: string, max = 140): string {
  const plain = (text ?? '')
    .replace(/<[^>]+>/g, ' ')
    .replace(/[#*_>`~\[\]()|]/g, ' ')
    .replace(/-{3,}/g, ' ')
    .replace(/\s+/g, ' ')
    .trim()
  return plain.length > max ? `${plain.slice(0, max)}…` : plain
}
