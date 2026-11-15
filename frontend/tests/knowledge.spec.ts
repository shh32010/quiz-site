import { describe, expect, it } from 'vitest'
import {
  calloutTheme,
  courseOf,
  filterKbBlocks,
  flattenSections,
  importanceBadgeMeta,
  parseSectionAnchorId,
  renderInlineMarkup,
  resolveActiveTocNodeId,
  resolveDisplayActiveGroupId,
  rootsFor,
  type KbBlock,
  type KNode,
} from '../utils/knowledge'

function node(partial: Partial<KNode> & Pick<KNode, 'id' | 'code' | 'name' | 'level'>): KNode {
  return { subjectId: 4, kpCount: 0, children: [], ...partial }
}

describe('knowledge tree utils', () => {
  it('课程 code 归并', () => {
    expect(courseOf('A1-1.1')).toBe('A')
    expect(courseOf('B7-1')).toBe('B')
    expect(courseOf('S3')).toBe('S3')
    expect(courseOf('X9')).toBeNull()
  })

  it('节列表按树顺序展开并带上章信息', () => {
    const tree: KNode[] = [
      node({
        id: 1, code: 'A1', name: '计算机硬件', level: 1, kpCount: 30,
        children: [
          node({ id: 39, code: 'A1-1.1', name: '计算机基本原理', level: 2, kpCount: 20 }),
          node({ id: 40, code: 'A1-1.2', name: '集成电路', level: 2, kpCount: 10 }),
        ],
      }),
    ]
    const sections = flattenSections(tree)
    expect(sections).toHaveLength(2)
    expect(sections[0]).toMatchObject({
      id: 39, course: 'A', chapterCode: 'A1', chapterName: '计算机硬件',
    })
    expect(sections[1].id).toBe(40)
  })

  it('B 课程根章按 B1…B7 排序，不按 item_order', () => {
    const tree: KNode[] = [
      node({ id: 2, code: 'B3', name: '移动互联网技术', level: 1 }),
      node({ id: 3, code: 'B4', name: '云计算技术', level: 1 }),
      node({ id: 4, code: 'B1', name: '信息和信息系统', level: 1 }),
    ]
    expect(rootsFor(tree, 'B').map(n => n.code)).toEqual(['B1', 'B3', 'B4'])
  })

  it('renderInlineMarkup 转义 HTML 并渲染核心高亮、行内代码、粗体与搜索词', () => {
    const html = renderInlineMarkup('包含 `<stdio.h>` 时，**主函数** 是 ==唯一入口==', '入口')
    expect(html).toContain('<code>&lt;stdio.h&gt;</code>')
    expect(html).toContain('<strong>主函数</strong>')
    expect(html).toContain('<mark class="kb-mark">唯一<mark class="kb-hl">入口</mark></mark>')
  })

  it('renderInlineMarkup 将 \\(...\\) 数学公式渲染为结构化公式（支持上下标、取整、分式与变量）', () => {
    const html = renderInlineMarkup('最坏比较次数为：\\(\\log_2 n\\) 次，严格上界为 \\(\\lfloor \\log_2 n \\rfloor + 1\\)')
    expect(html).toContain('<span class="kb-math">')
    expect(html).toContain('<span class="kb-math-op">log</span><sub>2</sub><var>n</var>')
    expect(html).toContain('<span class="kb-math-delim">⌊</span>')
    expect(html).toContain('<span class="kb-math-delim">⌋</span>')
    expect(html).not.toContain('\\(')
    expect(html).not.toContain('\\)')

    const fracHtml = renderInlineMarkup('比较次数最多 \\(\\frac{n(n-1)}{2}\\) 次，满二叉树节点 \\(2^k - 1\\)')
    expect(fracHtml).toContain('class="kb-math-frac"')
    expect(fracHtml).toContain('<sup><var>k</var></sup>')

    const extHtml = renderInlineMarkup(
      '\\(\\log_2 16 = 4\\)，范围 \\(-2^{n-1} \\sim 2^{n-1} - 1\\)，取模 \\((m + \\text{rear} - \\text{front}) \\% m\\)，采样 \\(f_s \\ge 2 \\times f_{\\max}\\)',
    )
    expect(extHtml).toContain('<sub>2</sub><span class="kb-math-num">16</span>')
    expect(extHtml).toContain('<span class="kb-math-bin">~</span>')
    expect(extHtml).toContain('<span class="kb-math-bin">%</span>')
    expect(extHtml).toContain('<sub><span class="kb-math-op">max</span></sub>')
  })

  it('renderInlineMarkup 正确处理 ^\\circ / ^{\\circ} 度号（不包 <sup>）、\\circ 复合符及 \\dots / \\lor / \\land / \\neg', () => {
    // 1. 弧度与角度：^\circ 与 ^{\circ} 均直接输出 Unicode 度号 °，不得套入 <sup>
    const degHtml = renderInlineMarkup('换算：\\(\\pi = 180^\\circ\\)，直角 \\(90^{\\circ}\\)，差值 \\(180^\\circ - 90^\\circ\\)')
    expect(degHtml).toContain('<span class="kb-math">π<span class="kb-math-bin">=</span><span class="kb-math-num">180</span>°</span>')
    expect(degHtml).toContain('<span class="kb-math"><span class="kb-math-num">90</span>°</span>')
    expect(degHtml).toContain('°<span class="kb-math-bin">−</span><span class="kb-math-num">90</span>°')
    expect(degHtml).not.toContain('<sup>')
    expect(degHtml).not.toContain('circ')

    // 2. 独立出现的 \circ 仍作为复合符号 ∘ (bin)，\degree 直接输出 °
    const compHtml = renderInlineMarkup('复合运算 \\(f \\circ g\\) 与 \\(\\degree\\)')
    expect(compHtml).toContain('<span class="kb-math"><var>f</var><span class="kb-math-bin">∘</span><var>g</var></span>')
    expect(compHtml).toContain('<span class="kb-math">°</span>')

    // 3. 省略号与逻辑运算符：\dots / \ldots / \cdots / \lor / \land / \neg
    const logicHtml = renderInlineMarkup('序列 \\(0, 1, 2, \\dots\\)、\\(a_1, \\ldots, a_n\\)、\\(1 + \\cdots + n\\)，逻辑 \\(\\lor\\)、\\(p \\land q\\)、\\(\\neg\\)、\\(\\neg p\\)')
    expect(logicHtml).toContain('<span class="kb-math-num">2</span><span class="kb-math-punct">,</span>…</span>')
    expect(logicHtml).toContain('<span class="kb-math-punct">,</span>…<span class="kb-math-punct">,</span>')
    expect(logicHtml).toContain('<span class="kb-math-bin">+</span>⋯<span class="kb-math-bin">+</span>')
    expect(logicHtml).toContain('<span class="kb-math"><span class="kb-math-bin">∨</span></span>')
    expect(logicHtml).toContain('<span class="kb-math"><var>p</var><span class="kb-math-bin">∧</span><var>q</var></span>')
    expect(logicHtml).toContain('<span class="kb-math">¬</span>')
    expect(logicHtml).toContain('<span class="kb-math">¬<var>p</var></span>')
    expect(logicHtml).not.toContain('dots')
    expect(logicHtml).not.toContain('lor')
    expect(logicHtml).not.toContain('neg')

    // 4. 与难点标记 @@...@@ 及搜索词高亮组合
    const markedHtml = renderInlineMarkup('@@角度与弧度换算（\\(\\pi = 180^\\circ\\)）@@', '弧度')
    expect(markedHtml).toContain('<mark class="kb-hard">角度与<mark class="kb-hl">弧度</mark>换算（<span class="kb-math">π<span class="kb-math-bin">=</span><span class="kb-math-num">180</span>°</span>）</mark>')
    expect(markedHtml).not.toContain('<sup>')
  })

  it('renderInlineMarkup 公式解析不误伤 shell $、代码反引号、三色标记、搜索高亮与 XSS', () => {
    const safeHtml = renderInlineMarkup(
      '命令 `$ ln -s /a /b` 与代码 `\\(\\log_2 n\\)`；==\\(\\log_2 n\\)==；\\(<script>i < n</script>\\)',
      'log',
    )
    expect(safeHtml).toContain('<code>$ ln -s /a /b</code>')
    expect(safeHtml).toContain('<code>\\(\\<mark class="kb-hl">log</mark>_2 n\\)</code>')
    expect(safeHtml).not.toContain('<code><span class="kb-math">')
    expect(safeHtml).toContain('<mark class="kb-mark"><span class="kb-math"><span class="kb-math-op"><mark class="kb-hl">log</mark></span><sub>')
    expect(safeHtml).not.toContain('<script>')
    expect(safeHtml).toContain('&lt;')
  })

  it('renderInlineMarkup 支持公式含单个 =、代码含 ==、绿色重点与黄色难点', () => {
    const input = '计算公式：==容量 = 长 × 宽==，在 C 语言中使用 `a == b` 进行判断，^^重点语法^^ 与 @@难点分析@@'
    const html = renderInlineMarkup(input)
    expect(html).toContain('<mark class="kb-mark">容量 = 长 × 宽</mark>')
    expect(html).toContain('<code>a == b</code>')
    expect(html).not.toContain('<mark class="kb-mark">b`')
    expect(html).toContain('<mark class="kb-imp">重点语法</mark>')
    expect(html).toContain('<mark class="kb-hard">难点分析</mark>')
  })

  it('filterKbBlocks 支持只看核心过滤', () => {
    const blocks: KbBlock[] = [
      { id: 'b1', t: 'list', imp: 'core', items: ['核心要点'] },
      { id: 'b2', t: 'code', imp: 'important', code: 'int main(void) { return 0; }' },
      { id: 'b3', t: 'callout', kind: 'trap', text: '易错陷阱' },
      { id: 'b4', t: 'table', imp: 'normal', headers: ['名称', '公式'], rows: [['面积', '==S = a * b==']] },
      { id: 'b5', t: 'table', imp: 'normal', headers: ['名称', '说明'], rows: [['常规', '普通内容']] },
    ]
    expect(filterKbBlocks(blocks, false)).toHaveLength(5)
    expect(filterKbBlocks(blocks, true).map(b => b.id)).toEqual(['b1', 'b3', 'b4'])
  })

  it('importanceBadgeMeta 返回与四色图例一致的等级标签、色调与左边框样式', () => {
    expect(importanceBadgeMeta('core')).toEqual({
      label: '',
      tone: 'red',
      borderClass: 'border-l-danger-fg',
    })
    expect(importanceBadgeMeta('important')).toEqual({
      label: '重点',
      tone: 'green',
      borderClass: 'border-l-success-fg',
    })
    expect(importanceBadgeMeta('hard')).toEqual({
      label: '难点',
      tone: 'amber',
      borderClass: 'border-l-warn-fg',
    })
    expect(importanceBadgeMeta('normal')).toEqual({
      label: '',
      tone: 'slate',
      borderClass: 'border-l-line-strong',
    })
  })

  it('calloutTheme 为 trap/warn/tip 返回各自专属语义配色与图标', () => {
    expect(calloutTheme('trap')).toMatchObject({
      kind: 'trap',
      icon: '⚠️',
      badge: '高频易错陷阱',
      fallbackTitle: '核心避坑要点',
    })
    const warn = calloutTheme('warn')
    expect(warn).toMatchObject({
      kind: 'warn',
      icon: '📌',
      badge: '重点注意事项',
      fallbackTitle: '重点注意事项',
    })
    expect(warn.cardClass).toContain('border-amber')
    expect(warn.cardClass).toContain('border-l-warn-fg')
    expect(calloutTheme('tip')).toMatchObject({
      kind: 'tip',
      icon: '💡',
      badge: '考向复习提示',
    })
    expect(calloutTheme(undefined).kind).toBe('tip')
  })

  it('parseSectionAnchorId 正确解析章节导读与考点锚点', () => {
    expect(parseSectionAnchorId('group-chapter-intro')).toBe(-999)
    expect(parseSectionAnchorId('group-76')).toBe(76)
    expect(parseSectionAnchorId('group-0')).toBeNull()
    expect(parseSectionAnchorId('other-76')).toBeNull()
  })

  it('resolveActiveTocNodeId 根据视口阅读线与首尾边界返回唯一当前小节', () => {
    const items = [
      { nodeId: 74, top: -3200 },
      { nodeId: 75, top: -1800 },
      { nodeId: 76, top: -400 },
      { nodeId: 77, top: 80 },
      { nodeId: 78, top: 960 },
    ]
    // 1. 接近顶部时锁定首个条目
    expect(resolveActiveTocNodeId(items, { scrollY: 40, scrollHeight: 8000, innerHeight: 900 })).toBe(74)
    // 2. 中间滚动时命中最后一个 top <= 130 的条目（模拟刷新直接停在 77 附近）
    expect(resolveActiveTocNodeId(items, { scrollY: 3600, scrollHeight: 8000, innerHeight: 900 })).toBe(77)
    // 3. 向上回滚使 77 移出阅读线、76 成为最后一个 top <= 130 的条目
    expect(resolveActiveTocNodeId([
      { nodeId: 74, top: -2200 },
      { nodeId: 75, top: -800 },
      { nodeId: 76, top: -50 },
      { nodeId: 77, top: 260 },
      { nodeId: 78, top: 1140 },
    ], { scrollY: 2600, scrollHeight: 8000, innerHeight: 900 })).toBe(76)
    // 4. 接近底部时锁定最后一个条目
    expect(resolveActiveTocNodeId(items, { scrollY: 7050, scrollHeight: 8000, innerHeight: 900 })).toBe(78)
  })

  it('resolveDisplayActiveGroupId 在 SSR 与初次水合前返回 null 以避免首个目录焦点残留', () => {
    const tocIds = [74, 75, 76, 77, 78]
    // 未完成挂载前始终返回 null，保证 SSR 与客户端水合 DOM class 完全一致
    expect(resolveDisplayActiveGroupId(null, tocIds, false)).toBeNull()
    expect(resolveDisplayActiveGroupId(77, tocIds, false)).toBeNull()
    // 挂载后优先返回精确命中的节点，否则回退首项
    expect(resolveDisplayActiveGroupId(77, tocIds, true)).toBe(77)
    expect(resolveDisplayActiveGroupId(999, tocIds, true)).toBe(74)
    expect(resolveDisplayActiveGroupId(null, tocIds, true)).toBe(74)
    expect(resolveDisplayActiveGroupId(null, [], true)).toBeNull()
  })
})
