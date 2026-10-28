import { describe, expect, it } from 'vitest'
import { courseOf, flattenSections, type KNode } from '../utils/knowledge'

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
})
