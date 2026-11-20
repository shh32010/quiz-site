import { describe, expect, it } from 'vitest'
import { CHAPTER_INTRO_MAP } from '../utils/chapter-intro'
import { ALL_COURSES, MODE_LABEL, TYPE_LABEL, fmtDur } from '../utils/constants'

describe('shared constants', () => {
  it('包含 8 个课程/技能且 code 唯一', () => {
    expect(ALL_COURSES).toHaveLength(8)
    expect(new Set(ALL_COURSES.map(course => course.code)).size).toBe(8)
  })

  it('题型与会话模式标签完整', () => {
    expect(TYPE_LABEL[1]).toBe('单选')
    expect(TYPE_LABEL[5]).toBe('综合')
    expect(MODE_LABEL.chapter_random).toBe('章节随机卷')
    expect(MODE_LABEL.single).toBe('单题练习')
  })

  it('用时格式化', () => {
    expect(fmtDur(0)).toBe('—')
    expect(fmtDur(65)).toBe('1 分 5 秒')
  })

  it('章节导读覆盖 A1-A4、B1-B7 与 S1-S6 共 17 个考纲模块', () => {
    const keys = Object.keys(CHAPTER_INTRO_MAP)
    expect(keys).toHaveLength(17)
    for (const [code, intro] of Object.entries(CHAPTER_INTRO_MAP)) {
      expect(intro.scoreDesc, `${code} scoreDesc 应包含 scoreTag`).toContain(intro.scoreTag)
    }
  })
})
