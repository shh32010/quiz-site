import { fmtTime } from './constants'

export type WrongStatusFilter = 'all' | 'due' | 'pending' | 'frequent' | 'resolved'

export const WRONG_STATUS_TABS: { value: WrongStatusFilter; label: string }[] = [
  { value: 'all', label: '全部状态' },
  { value: 'due', label: '今日到期' },
  { value: 'pending', label: '待复习' },
  { value: 'frequent', label: '高频错题（≥2次）' },
  { value: 'resolved', label: '已掌握' },
]

/** 判断错题是否已到达间隔重复复习时间 */
export function isWrongDue(
  nextReviewAt: string | null | undefined,
  resolved?: boolean,
  nowMs: number = Date.now(),
): boolean {
  if (resolved) return false
  if (!nextReviewAt) return true
  const ts = new Date(nextReviewAt).getTime()
  return Number.isNaN(ts) || ts <= nowMs
}

/** 按题型与复习状态筛选错题列表 */
export function filterWrongRows<T extends {
  questionType?: number | string
  wrongCount?: number
  resolved?: boolean
  nextReviewAt?: string | null
}>(
  rows: T[],
  selectedType: number,
  statusFilter: WrongStatusFilter,
  nowMs: number = Date.now(),
): T[] {
  return rows.filter((q) => {
    if (selectedType && Number(q.questionType) !== selectedType) return false
    if (statusFilter === 'due') return isWrongDue(q.nextReviewAt, q.resolved, nowMs)
    if (statusFilter === 'pending') return !q.resolved
    if (statusFilter === 'frequent') return Number(q.wrongCount ?? 0) >= 2
    if (statusFilter === 'resolved') return Boolean(q.resolved)
    return true
  })
}

/** 构造错题复习跳转链接（联动当前间隔重复状态与题型过滤） */
export function buildWrongPracticeUrl(
  selectedType: number,
  statusFilter: WrongStatusFilter,
  limit?: number,
): string {
  const params = new URLSearchParams({ mode: 'wrong' })
  if (statusFilter && statusFilter !== 'all') params.set('target', statusFilter)
  if (limit && limit > 0) params.set('limit', String(limit))
  if (selectedType && selectedType > 0) params.set('type', String(selectedType))
  return `/practice?${params.toString()}`
}

/** 格式化错题的下次复习时间提示 */
export function fmtReviewDue(
  nextReviewAt: string | null | undefined,
  resolved?: boolean,
  nowMs: number = Date.now(),
): string {
  if (resolved) return '已掌握'
  if (isWrongDue(nextReviewAt, resolved, nowMs)) return '今日待复习'
  return `下次复习 ${fmtTime(nextReviewAt!)}`
}
