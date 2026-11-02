import { describe, expect, it } from 'vitest'
import { filterWrongRows, fmtReviewDue } from '../utils/wrong'

describe('wrong question filters and review due label', () => {
  const sampleRows = [
    { questionId: 1, questionType: 1, wrongCount: 1, resolved: false, nextReviewAt: '2026-11-01T10:00:00Z' },
    { questionId: 2, questionType: 1, wrongCount: 3, resolved: false, nextReviewAt: '2026-11-05T10:00:00Z' },
    { questionId: 3, questionType: 2, wrongCount: 2, resolved: true, nextReviewAt: '2026-11-10T10:00:00Z' },
  ]

  it('支持按复习状态（全部/待复习/高频错题/已掌握）与题型组合过滤', () => {
    expect(filterWrongRows(sampleRows, 0, 'all').map(r => r.questionId)).toEqual([1, 2, 3])
    expect(filterWrongRows(sampleRows, 0, 'pending').map(r => r.questionId)).toEqual([1, 2])
    expect(filterWrongRows(sampleRows, 0, 'frequent').map(r => r.questionId)).toEqual([2, 3])
    expect(filterWrongRows(sampleRows, 0, 'resolved').map(r => r.questionId)).toEqual([3])
    expect(filterWrongRows(sampleRows, 1, 'frequent').map(r => r.questionId)).toEqual([2])
  })

  it('格式化下次复习提示', () => {
    const now = new Date('2026-11-02T12:00:00Z').getTime()
    expect(fmtReviewDue('2026-11-01T10:00:00Z', false, now)).toBe('今日待复习')
    expect(fmtReviewDue('2026-11-05T10:00:00Z', false, now)).toContain('下次复习')
    expect(fmtReviewDue('2026-11-05T10:00:00Z', true, now)).toBe('已掌握')
  })
})
