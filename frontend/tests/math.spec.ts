import { describe, expect, it } from 'vitest'
import { renderMathText } from '../utils/math'

describe('renderMathText 行内公式渲染', () => {
  it('成对的 $...$ 交给 KaTeX 渲染', () => {
    const html = renderMathText('主频为 $2\\mathrm{GHz}$ 的 CPU')
    expect(html).toContain('katex')
    expect(html).toContain('GHz')
  })

  it('\\$ 视为字面美元符，不参与公式配对', () => {
    const html = renderMathText('公式 =E3+\\$E\\$2 的结果')
    expect(html).not.toContain('katex')
    expect(html).toContain('$E$2')
    expect(html).not.toContain('\\$')
  })

  it('孤立的 $ 保留原文', () => {
    const html = renderMathText('价格 $ 100 元')
    expect(html).toContain('$ 100')
    expect(html).not.toContain('katex')
  })

  it('渲染失败的公式回退为转义原文', () => {
    const html = renderMathText('$\\frac{1}$ 是缺参数的公式')
    expect(html).toContain('\\frac')
    expect(html).not.toContain('katex')
  })

  it('非公式文本全部 HTML 转义，阻断注入', () => {
    const html = renderMathText('<script>alert(1)</script> "quoted"')
    expect(html).not.toContain('<script>')
    expect(html).toContain('&lt;script&gt;')
    expect(html).toContain('&quot;quoted&quot;')
  })

  it('公式内的 HTML 不会原样输出', () => {
    const html = renderMathText('$<img src=x onerror=alert(1)>$')
    expect(html).not.toContain('<img')
  })

  it('空输入返回空串', () => {
    expect(renderMathText(null)).toBe('')
    expect(renderMathText('')).toBe('')
  })
})
