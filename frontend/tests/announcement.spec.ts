import { describe, expect, it } from 'vitest'
import { ANNOUNCEMENT, announcementMarker, localDateKey, nextAnnouncementVersion } from '../utils/announcement'

describe('announcement daily marker', () => {
  it('使用本地日期生成 YYYY-MM-DD', () => {
    expect(localDateKey(new Date(2026, 9, 29, 23, 59))).toBe('2026-10-29')
    expect(localDateKey(new Date(2026, 0, 5, 0, 0))).toBe('2026-01-05')
  })

  it('生成今日下一个公告版本号', () => {
    const d = new Date(2026, 10, 2, 12, 0)
    expect(nextAnnouncementVersion('2026-10-31-1', d)).toBe('2026-11-02-1')
    expect(nextAnnouncementVersion('2026-11-02-2', d)).toBe('2026-11-02-3')
  })

  it('同一版本跨天标记保持一致（仅按版本变动弹出）', () => {
    const today = announcementMarker('v1', new Date(2026, 9, 29, 8, 0))
    const tomorrow = announcementMarker('v1', new Date(2026, 9, 30, 23, 59))
    expect(today).toBe(tomorrow)
    expect(today).toBe('v1')
  })

  it('版本变化时标记不同', () => {
    const v1 = announcementMarker('v1', new Date(2026, 9, 29))
    const v2 = announcementMarker('v2', new Date(2026, 9, 29))
    expect(v1).not.toBe(v2)
  })

  it('公告主条目与更新历史条目均包含日期和说明，且严格按日期倒序、历史无重复日期', () => {
    expect(ANNOUNCEMENT.date.trim().length).toBeGreaterThan(0)
    expect(ANNOUNCEMENT.items.length).toBeGreaterThan(0)
    for (let i = 0; i < ANNOUNCEMENT.items.length; i++) {
      const item = ANNOUNCEMENT.items[i]
      expect(item.date).toMatch(/^\d{4}-\d{2}-\d{2}$/)
      expect(item.title.trim().length).toBeGreaterThan(0)
      expect(item.desc.trim().length).toBeGreaterThan(0)
      if (i > 0) {
        expect(ANNOUNCEMENT.items[i - 1].date! >= item.date!).toBe(true)
      }
    }
    const history = ANNOUNCEMENT.history ?? []
    expect(history.length).toBe(14)
    const seenDates = new Set<string>()
    for (let i = 0; i < history.length; i++) {
      const item = history[i]
      expect(item.date).toMatch(/^\d{4}-\d{2}-\d{2}$/)
      expect(item.text.trim().length).toBeGreaterThan(0)
      expect(seenDates.has(item.date)).toBe(false)
      seenDates.add(item.date)
      if (i > 0) {
        expect(history[i - 1].date > item.date).toBe(true)
      }
    }
  })
})
