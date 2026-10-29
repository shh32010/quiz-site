import { describe, expect, it } from 'vitest'
import { ANNOUNCEMENT, announcementMarker, localDateKey } from '../utils/announcement'

describe('announcement daily marker', () => {
  it('使用本地日期生成 YYYY-MM-DD', () => {
    expect(localDateKey(new Date(2026, 9, 29, 23, 59))).toBe('2026-10-29')
    expect(localDateKey(new Date(2026, 0, 5, 0, 0))).toBe('2026-01-05')
  })

  it('同一天、同一版本的标记相同', () => {
    const morning = announcementMarker('v1', new Date(2026, 9, 29, 8, 0))
    const night = announcementMarker('v1', new Date(2026, 9, 29, 23, 59))
    expect(morning).toBe(night)
    expect(morning).toBe('v1|2026-10-29')
  })

  it('跨天或版本变化时标记不同', () => {
    const today = announcementMarker('v1', new Date(2026, 9, 29))
    const tomorrow = announcementMarker('v1', new Date(2026, 9, 30))
    const newVersion = announcementMarker('v2', new Date(2026, 9, 29))
    expect(today).not.toBe(tomorrow)
    expect(today).not.toBe(newVersion)
  })

  it('更新历史条目包含日期和说明', () => {
    expect(ANNOUNCEMENT.history?.length ?? 0).toBeGreaterThan(0)
    for (const item of ANNOUNCEMENT.history ?? []) {
      expect(item.date).toMatch(/^\d{4}-\d{2}-\d{2}$/)
      expect(item.text.trim().length).toBeGreaterThan(0)
    }
  })
})
