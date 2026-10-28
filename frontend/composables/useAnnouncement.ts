import { ANNOUNCEMENT } from '~/utils/announcement'

/** 已读标记按公告版本隔离：发新公告时无需清理旧 key */
const SEEN_PREFIX = 'quiz_announcement_seen:'

export function useAnnouncement() {
  const open = useState<boolean>('announcement_open', () => false)

  function storageKey(): string {
    return `${SEEN_PREFIX}${ANNOUNCEMENT.version}`
  }

  function hasSeen(): boolean {
    if (!import.meta.client) return true
    try {
      return localStorage.getItem(storageKey()) === '1'
    } catch {
      return false
    }
  }

  /** 手动打开（页脚入口），不改变已读状态 */
  function show() {
    open.value = true
  }

  /** 关闭并记为当前版本已读 */
  function dismiss() {
    open.value = false
    if (!import.meta.client) return
    try {
      localStorage.setItem(storageKey(), '1')
    } catch {
      /* 隐私模式下写入失败时，仅本次会话不再弹 */
    }
  }

  /** 首次进入且当前版本未读时自动打开 */
  function showIfNew() {
    if (!hasSeen()) open.value = true
  }

  return { open, hasSeen, show, dismiss, showIfNew }
}
