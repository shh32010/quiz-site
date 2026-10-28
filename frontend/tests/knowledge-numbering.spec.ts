import { describe, expect, it } from 'vitest'
import { hasOwnNumbering, kpOrdinal } from '../utils/knowledge'

describe('knowledge title numbering', () => {
  it('识别自带编号的标题', () => {
    expect(hasOwnNumbering('3.3 数据的输入')).toBe(true)
    expect(hasOwnNumbering('10.4.1 切换幻灯片')).toBe(true)
    expect(hasOwnNumbering('一、复合语句')).toBe(true)
    expect(hasOwnNumbering('第 3 章 函数')).toBe(true)
  })

  it('普通标题不加误判', () => {
    expect(hasOwnNumbering('if 语句示例')).toBe(false)
    expect(hasOwnNumbering('2020 年真题')).toBe(false)
  })

  it('跨分片序号连续', () => {
    expect(kpOrdinal(1, 0, 100)).toBe(1)
    expect(kpOrdinal(2, 0, 100)).toBe(101)
    expect(kpOrdinal(2, 5, 100)).toBe(106)
  })
})
