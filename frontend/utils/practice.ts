/** 刷题页模式状态机：统一快刷判分，补齐章节随机卷自动跳题。 */

/** 答对后自动进入下一题的模式：日常练习 + 真题 + 随机组卷 + 章节随机卷（单题模式不自动跳） */
const AUTO_NEXT_MODES = new Set([
  'chapter',
  'course',
  'kp',
  'wrong',
  'paper',
  'random',
  'chapter_random',
])

/** 单选/判断点击选项时是否立即提交判分（统一快刷体验） */
export function shouldInstantSubmitChoice(_mode: string): boolean {
  return true
}

/** 答对后是否自动跳到下一题 */
export function shouldAutoNext(mode: string, total: number): boolean {
  return AUTO_NEXT_MODES.has(mode) && mode !== 'single' && total > 1
}

export interface PrimaryLabelOptions {
  submitting: boolean
  hasFeedback: boolean
  hasAnswer: boolean
  mode: string
  isSingle: boolean
  isLast: boolean
}

/** 计算底部主操作按钮文案 */
export function getPrimaryLabel(opts: PrimaryLabelOptions): string {
  if (opts.submitting) return '处理中…'
  if (!opts.hasFeedback) {
    return opts.hasAnswer ? '提交' : '不会，看答案'
  }
  if (opts.isSingle) return '返回'
  return opts.isLast ? '交卷' : '下一题'
}

/** 章节随机卷默认每题建议用时（秒）：与全站理论 80题/100分钟、实操 40题/50分钟一致 */
export const CHAPTER_RANDOM_SEC_PER_QUESTION = 75

export interface PracticeTimerState {
  limitSec: number
  remainingSec: number
  overtimeSec: number
  isOvertime: boolean
  shouldAutoSubmit: boolean
}

/** 按实际题量折算章节随机卷建议用时（分钟），非整数保留 1 位小数 */
export function calcChapterComposeMinutes(questionCount: number): number {
  if (questionCount <= 0) return 0
  return Math.round((questionCount * CHAPTER_RANDOM_SEC_PER_QUESTION / 60) * 10) / 10
}

/** 仅章节随机卷超时后只提醒不强制交卷；其余带计时模式维持自动交卷 */
export function shouldForceSubmitOnTimeout(mode: string, autoSubmit?: boolean): boolean {
  if (typeof autoSubmit === 'boolean') return autoSubmit
  return mode !== 'chapter_random'
}

/** 秒数格式化为 m:ss */
export function formatClockMmSs(seconds: number): string {
  const safe = Math.max(0, Math.floor(seconds))
  const m = Math.floor(safe / 60)
  const s = safe % 60
  return `${m}:${String(s).padStart(2, '0')}`
}

/** 顶栏计时文本：未超时显示倒计时 m:ss，只提醒模式超时后显示 已超时 +m:ss */
export function formatPracticeTimerText(
  state: Pick<PracticeTimerState, 'limitSec' | 'remainingSec' | 'overtimeSec' | 'isOvertime'>,
): string {
  if (state.limitSec <= 0) return ''
  if (state.isOvertime) return `已超时 +${formatClockMmSs(state.overtimeSec)}`
  if (state.remainingSec >= 0) return formatClockMmSs(state.remainingSec)
  return ''
}

/** 结合服务端初始已用时与本地经过秒数推导当前计时状态（规避后台降频漂移） */
export function derivePracticeTimerState(opts: {
  mode: string
  limitSec: number
  elapsedSecAtSync: number
  elapsedSinceSyncSec: number
  autoSubmit?: boolean
}): PracticeTimerState {
  const limitSec = Math.max(0, Math.floor(opts.limitSec || 0))
  if (limitSec <= 0) {
    return { limitSec: 0, remainingSec: -1, overtimeSec: 0, isOvertime: false, shouldAutoSubmit: false }
  }
  const totalElapsed = Math.max(0, Math.floor(opts.elapsedSecAtSync || 0)) + Math.max(0, Math.floor(opts.elapsedSinceSyncSec || 0))
  const diff = limitSec - totalElapsed
  const strict = shouldForceSubmitOnTimeout(opts.mode, opts.autoSubmit)
  if (diff > 0) {
    return { limitSec, remainingSec: diff, overtimeSec: 0, isOvertime: false, shouldAutoSubmit: false }
  }
  if (strict) {
    return { limitSec, remainingSec: 0, overtimeSec: 0, isOvertime: true, shouldAutoSubmit: true }
  }
  return {
    limitSec,
    remainingSec: 0,
    overtimeSec: Math.abs(diff),
    isOvertime: true,
    shouldAutoSubmit: false,
  }
}
