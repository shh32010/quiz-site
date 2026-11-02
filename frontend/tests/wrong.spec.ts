import { describe, expect, it } from 'vitest'
import { buildWrongPracticeUrl, filterWrongRows, fmtReviewDue } from '../utils/wrong'

describe('wrong question filters and review due label', () => {
  const now = new Date('2026-11-02T12:00:00Z').getTime()
  const sampleRows = [
    { questionId: 1, questionType: 1, wrongCount: 1, resolved: false, nextReviewAt: '2026-11-01T10:00:00Z' },
    { questionId: 2, questionType: 1, wrongCount: 3, resolved: false, nextReviewAt: '2026-11-05T10:00:00Z' },
    { questionId: 3, questionType: 2, wrongCount: 2, resolved: true, nextReviewAt: '2026-11-10T10:00:00Z' },
  ]

  it('支持按复习状态（全部/今日到期/待复习/高频错题/已掌握）与题型组合过滤', () => {
    expect(filterWrongRows(sampleRows, 0, 'all', now).map(r => r.questionId)).toEqual([1, 2, 3])
    expect(filterWrongRows(sampleRows, 0, 'due', now).map(r => r.questionId)).toEqual([1])
    expect(filterWrongRows(sampleRows, 0, 'pending', now).map(r => r.questionId)).toEqual([1, 2])
    expect(filterWrongRows(sampleRows, 0, 'frequent', now).map(r => r.questionId)).toEqual([2, 3])
    expect(filterWrongRows(sampleRows, 0, 'resolved', now).map(r => r.questionId)).toEqual([3])
    expect(filterWrongRows(sampleRows, 1, 'frequent', now).map(r => r.questionId)).toEqual([2])
  })

  it('生成带间隔重复状态与题型参数的错题练习 URL', () => {
    expect(buildWrongPracticeUrl(0, 'all')).toBe('/practice?mode=wrong')
    expect(buildWrongPracticeUrl(0, 'due')).toBe('/practice?mode=wrong&target=due')
    expect(buildWrongPracticeUrl(1, 'frequent', 20)).toBe('/practice?mode=wrong&target=frequent&limit=20&type=1')
  })

  it('格式化下次复习提示', () => {
    expect(fmtReviewDue('2026-11-01T10:00:00Z', false, now)).toBe('今日待复习')
    expect(fmtReviewDue('2026-11-05T10:00:00Z', false, now)).toContain('下次复习')
    expect(fmtReviewDue('2026-11-05T10:00:00Z', true, now)).toBe('已掌握')
  })
})
