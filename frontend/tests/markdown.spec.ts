import { describe, expect, it } from 'vitest'
import { highlightText, plainSnippet, renderMarkdown } from '../utils/markdown'

describe('markdown utils', () => {
  it('搜索高亮会先转义 HTML', () => {
    const html = highlightText('<b>计算机</b>基础', '计算机')
    expect(html).toContain('&lt;b&gt;')
    expect(html).toContain('<mark')
    expect(html).not.toContain('<b>')
  })

  it('表格文本片段不保留管道和分隔线', () => {
    const text = plainSnippet('| 内存 | 外存 |\n| --- | --- |\n| 快 | 慢 |')
    expect(text).not.toContain('|')
    expect(text).not.toContain('---')
    expect(text).toContain('内存')
  })

  it('Markdown 渲染会转义原始 HTML', () => {
    const html = renderMarkdown('<script>alert(1)</script>')
    expect(html).not.toContain('<script>')
    expect(html).toContain('&lt;script&gt;')
  })
})
