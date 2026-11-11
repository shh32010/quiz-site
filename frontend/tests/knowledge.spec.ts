import { describe, expect, it } from 'vitest'
import {
  courseOf,
  filterKbBlocks,
  flattenSections,
  importanceBadgeMeta,
  renderInlineMarkup,
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

  it('importanceBadgeMeta 返回等级标签与左边框样式', () => {
    expect(importanceBadgeMeta('core').label).toBe('')
    expect(importanceBadgeMeta('important').label).toBe('重点')
    expect(importanceBadgeMeta('hard').label).toBe('难点')
    expect(importanceBadgeMeta('normal').label).toBe('')
  })
})
