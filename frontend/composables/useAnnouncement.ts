import { ANNOUNCEMENT, announcementMarker } from '~/utils/announcement'

/** 每天最多提示一次；版本变化时当天也会重新提示 */
const SEEN_KEY = 'quiz_announcement_daily'

export function useAnnouncement() {
  const open = useState<boolean>('announcement_open', () => false)

  function marker(): string {
    return announcementMarker(ANNOUNCEMENT.version)
  }

  function hasSeen(): boolean {
    if (!import.meta.client) return true
    try {
      return localStorage.getItem(SEEN_KEY) === marker()
    } catch {
      return false
    }
  }

  /** 手动打开（页脚入口），不改变已读状态 */
  function show() {
    open.value = true
  }

  /** 关闭并记为当天已读 */
  function dismiss() {
    open.value = false
    if (!import.meta.client) return
    try {
      localStorage.setItem(SEEN_KEY, marker())
    } catch {
      /* 隐私模式下写入失败时，仅本次会话不再弹 */
    }
  }

  /** 当天未读时自动打开 */
  function showIfNew() {
    if (!hasSeen()) open.value = true
  }

  return { open, hasSeen, show, dismiss, showIfNew }
}
