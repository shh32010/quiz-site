import { describe, expect, it } from 'vitest'
import {
  getPrimaryLabel,
  shouldAutoNext,
  shouldInstantSubmitChoice,
} from '../utils/practice'

describe('practice mode state machine', () => {
  it('所有模式统一保持单选/判断即点即判快刷体验', () => {
    expect(shouldInstantSubmitChoice('chapter')).toBe(true)
    expect(shouldInstantSubmitChoice('paper')).toBe(true)
    expect(shouldInstantSubmitChoice('random')).toBe(true)
    expect(shouldInstantSubmitChoice('chapter_random')).toBe(true)
  })

  it('自动跳题覆盖章节/课程/知识点/错题/真题/随机卷/章节随机卷（单题除外）', () => {
    expect(shouldAutoNext('chapter', 20)).toBe(true)
    expect(shouldAutoNext('course', 20)).toBe(true)
    expect(shouldAutoNext('kp', 10)).toBe(true)
    expect(shouldAutoNext('wrong', 15)).toBe(true)
    expect(shouldAutoNext('paper', 80)).toBe(true)
    expect(shouldAutoNext('random', 80)).toBe(true)
    expect(shouldAutoNext('chapter_random', 20)).toBe(true)

    expect(shouldAutoNext('single', 1)).toBe(false)
    expect(shouldAutoNext('chapter', 1)).toBe(false)
  })

  it('主按钮文案随作答与判分状态切换', () => {
    expect(getPrimaryLabel({
      submitting: true, hasFeedback: false, hasAnswer: false, mode: 'chapter', isSingle: false, isLast: false,
    })).toBe('处理中…')

    expect(getPrimaryLabel({
      submitting: false, hasFeedback: false, hasAnswer: false, mode: 'paper', isSingle: false, isLast: false,
    })).toBe('不会，看答案')

    expect(getPrimaryLabel({
      submitting: false, hasFeedback: false, hasAnswer: true, mode: 'paper', isSingle: false, isLast: false,
    })).toBe('提交')

    expect(getPrimaryLabel({
      submitting: false, hasFeedback: true, hasAnswer: true, mode: 'paper', isSingle: false, isLast: false,
    })).toBe('下一题')
    expect(getPrimaryLabel({
      submitting: false, hasFeedback: true, hasAnswer: true, mode: 'paper', isSingle: false, isLast: true,
    })).toBe('交卷')
    expect(getPrimaryLabel({
      submitting: false, hasFeedback: true, hasAnswer: true, mode: 'single', isSingle: true, isLast: true,
    })).toBe('返回')
  })
})
