import { marked } from 'marked'

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
