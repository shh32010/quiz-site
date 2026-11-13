import { describe, expect, it } from 'vitest'
import {
  calcChapterComposeMinutes,
  derivePracticeTimerState,
  formatClockMmSs,
  formatPracticeTimerText,
  getPrimaryLabel,
  shouldAutoNext,
  shouldForceSubmitOnTimeout,
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

  it('章节随机卷按每题 75 秒折算建议分钟数并禁用强制交卷', () => {
    expect(calcChapterComposeMinutes(80)).toBe(100)
    expect(calcChapterComposeMinutes(40)).toBe(50)
    expect(calcChapterComposeMinutes(24)).toBe(30)
    expect(calcChapterComposeMinutes(10)).toBe(12.5)
    expect(calcChapterComposeMinutes(0)).toBe(0)

    expect(shouldForceSubmitOnTimeout('chapter_random')).toBe(false)
    expect(shouldForceSubmitOnTimeout('chapter_random', false)).toBe(false)
    expect(shouldForceSubmitOnTimeout('paper')).toBe(true)
    expect(shouldForceSubmitOnTimeout('random')).toBe(true)
    expect(shouldForceSubmitOnTimeout('random', true)).toBe(true)
  })

  it('计时状态机区分无计时、倒计时与只提醒模式超时正计时', () => {
    expect(formatClockMmSs(0)).toBe('0:00')
    expect(formatClockMmSs(135)).toBe('2:15')
    expect(formatClockMmSs(6000)).toBe('100:00')

    // 无计时模式
    const untimed = derivePracticeTimerState({
      mode: 'chapter', limitSec: 0, elapsedSecAtSync: 90, elapsedSinceSyncSec: 5,
    })
    expect(untimed).toEqual({
      limitSec: 0, remainingSec: -1, overtimeSec: 0, isOvertime: false, shouldAutoSubmit: false,
    })
    expect(formatPracticeTimerText(untimed)).toBe('')

    // 章节随机卷倒计时中（40 题 3000s，已用 100s，本地又过 20s）
    const active = derivePracticeTimerState({
      mode: 'chapter_random', limitSec: 3000, elapsedSecAtSync: 100, elapsedSinceSyncSec: 20, autoSubmit: false,
    })
    expect(active).toEqual({
      limitSec: 3000, remainingSec: 2880, overtimeSec: 0, isOvertime: false, shouldAutoSubmit: false,
    })
    expect(formatPracticeTimerText(active)).toBe('48:00')

    // 章节随机卷到点与超时：不自动交卷，切为 已超时 +mm:ss
    const exact = derivePracticeTimerState({
      mode: 'chapter_random', limitSec: 3000, elapsedSecAtSync: 2995, elapsedSinceSyncSec: 5, autoSubmit: false,
    })
    expect(exact.isOvertime).toBe(true)
    expect(exact.shouldAutoSubmit).toBe(false)
    expect(formatPracticeTimerText(exact)).toBe('已超时 +0:00')

    const overtime = derivePracticeTimerState({
      mode: 'chapter_random', limitSec: 3000, elapsedSecAtSync: 3130, elapsedSinceSyncSec: 5, autoSubmit: false,
    })
    expect(overtime).toEqual({
      limitSec: 3000, remainingSec: 0, overtimeSec: 135, isOvertime: true, shouldAutoSubmit: false,
    })
    expect(formatPracticeTimerText(overtime)).toBe('已超时 +2:15')

    // 真题/全站随机卷超时保持强制自动交卷
    const strictTimeout = derivePracticeTimerState({
      mode: 'random', limitSec: 6000, elapsedSecAtSync: 5995, elapsedSinceSyncSec: 5, autoSubmit: true,
    })
    expect(strictTimeout.shouldAutoSubmit).toBe(true)
  })
})
