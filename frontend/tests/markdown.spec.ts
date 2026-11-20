import { describe, expect, it } from 'vitest'
import { highlightText, normalizeKnowledgeContent, plainSnippet, renderMarkdown } from '../utils/markdown'

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

  it('搜索片段保留代码尖括号', () => {
    expect(plainSnippet('#include <stdio.h>')).toContain('<stdio.h>')
  })

  it('Markdown 渲染会转义原始 HTML', () => {
    const html = renderMarkdown('<script>alert(1)</script>')
    expect(html).not.toContain('<script>')
    expect(html).toContain('&lt;script&gt;')
  })

  it('Markdown 渲染拦截实体编码与前导空白伪装的危险协议链接和图片', () => {
    const entityLink = renderMarkdown('[点我](&#106;avascript:alert(1))')
    expect(entityLink).not.toMatch(/javascript:/i)
    expect(entityLink).toContain('href="#"')

    const spacedLink = renderMarkdown('[点我](  JaVaScRiPt:alert(1))')
    expect(spacedLink).not.toMatch(/javascript:/i)
    expect(spacedLink).toContain('href="#"')

    const dataImg = renderMarkdown('![x](data:text/html,<script>alert(1)</script>)')
    expect(dataImg).not.toMatch(/data:/i)

    // 越界数字实体不会抛 RangeError 且仍拦截危险协议
    const hugeEntity = renderMarkdown('[点我](&#9999999999;javascript:alert(1))')
    expect(hugeEntity).not.toMatch(/javascript:/i)
    expect(hugeEntity).toContain('href="#"')

    const safeLink = renderMarkdown('[官网](https://quiz.teacher-wishes.asia/chapters)')
    expect(safeLink).toContain('href="https://quiz.teacher-wishes.asia/chapters"')
  })

  it('代码块里的尖括号只转义一次', () => {
    const html = renderMarkdown('```c\n#include <stdio.h>\n```')
    expect(html).toContain('#include &lt;stdio.h&gt;')
    expect(html).not.toContain('&amp;lt;')
  })

  it('知识点清洗去除重复标题和 HTML 片段', () => {
    const content = normalizeKnowledgeContent(
      '<p>计算机基本原理</p><br/>内存储器&nbsp;是主存。',
      '计算机基本原理',
    )
    expect(content).not.toContain('<p>')
    expect(content).not.toContain('<br')
    expect(content).not.toContain('&nbsp;')
    expect(content).not.toContain('计算机基本原理')
    expect(content).toContain('内存储器 是主存')
  })

  it('清洗不会误删代码里的尖括号', () => {
    const content = normalizeKnowledgeContent('#include <stdio.h>\nint main() { }')
    expect(content).toContain('#include <stdio.h>')
    expect(content).toContain('int main()')
  })
})
