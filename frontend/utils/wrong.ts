import { fmtTime } from './constants'

export type WrongStatusFilter = 'all' | 'pending' | 'frequent' | 'resolved'

export const WRONG_STATUS_TABS: { value: WrongStatusFilter; label: string }[] = [
  { value: 'all', label: '全部状态' },
  { value: 'pending', label: '待复习' },
  { value: 'frequent', label: '高频错题（≥2次）' },
  { value: 'resolved', label: '已掌握' },
]

/** 按题型与复习状态筛选错题列表 */
export function filterWrongRows<T extends { questionType?: number | string; wrongCount?: number; resolved?: boolean }>(
  rows: T[],
  selectedType: number,
  statusFilter: WrongStatusFilter,
): T[] {
  return rows.filter((q) => {
    if (selectedType && Number(q.questionType) !== selectedType) return false
    if (statusFilter === 'pending') return !q.resolved
    if (statusFilter === 'frequent') return Number(q.wrongCount ?? 0) >= 2
    if (statusFilter === 'resolved') return Boolean(q.resolved)
    return true
  })
}

/** 格式化错题的下次复习时间提示 */
export function fmtReviewDue(
  nextReviewAt: string | null | undefined,
  resolved?: boolean,
  nowMs: number = Date.now(),
): string {
  if (resolved) return '已掌握'
  if (!nextReviewAt) return '待复习'
  const ts = new Date(nextReviewAt).getTime()
  if (Number.isNaN(ts) || ts <= nowMs) return '今日待复习'
  return `下次复习 ${fmtTime(nextReviewAt)}`
}
