import { describe, expect, it } from 'vitest'
import { parseQuestionOptions } from '../utils/question'

describe('question utils', () => {
  it('判断题没有选项时用 A/B', () => {
    expect(parseQuestionOptions(3, null)).toEqual([['A', '正确'], ['B', '错误']])
  })

  it('单选题正常解析并排序', () => {
    expect(parseQuestionOptions(1, '{"B":"错误","A":"正确"}')).toEqual([
      ['A', '正确'],
      ['B', '错误'],
    ])
  })

  it('选项 JSON 损坏时单选题回退为 A/B', () => {
    expect(parseQuestionOptions(1, '{bad json')).toEqual([['A', '正确'], ['B', '错误']])
  })

  it('填空题没有选项', () => {
    expect(parseQuestionOptions(4, null)).toEqual([])
  })
})
