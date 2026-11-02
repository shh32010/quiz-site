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
