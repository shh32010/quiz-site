import katex from 'katex'
import 'katex/dist/katex.min.css'
import { formatText } from '~/composables/format'

/** 转义 HTML，非公式部分一律按纯文本输出，防止题干中的标签注入 */
function escapeHtml(text: string): string {
  return text
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
    .replace(/"/g, '&quot;')
    .replace(/'/g, '&#39;')
}

const PLACEHOLDER = '\u0001'
const FORMULA_RE = /\$([^$\n]{1,300})\$/g

/**
 * 题干 / 选项 / 答案 / 解析渲染：
 * - `$...$` 行内公式交给 KaTeX 渲染；
 * - `\$` 视为字面美元符（Excel 绝对引用），不参与公式配对；
 * - 不配对、超长或渲染失败的公式保留原文；
 * - 非公式文本全部 HTML 转义，KaTeX 输出默认 trust=false，阻断注入。
 */
export function renderMathText(text?: string | null): string {
  const cleaned = formatText(text)
  if (!cleaned) return ''
  const src = cleaned.replace(/\\\$/g, PLACEHOLDER)
  let out = ''
  let last = 0
  let match: RegExpExecArray | null
  FORMULA_RE.lastIndex = 0
  while ((match = FORMULA_RE.exec(src)) !== null) {
    out += escapeHtml(src.slice(last, match.index))
    try {
      out += katex.renderToString(match[1], {
        throwOnError: true,
        displayMode: false,
        strict: false,
        trust: false,
      })
    } catch {
      out += escapeHtml(match[0])
    }
    last = match.index + match[0].length
  }
  out += escapeHtml(src.slice(last))
  return out.replaceAll(PLACEHOLDER, '$')
}
