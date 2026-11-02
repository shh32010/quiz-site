import { ANNOUNCEMENT, announcementMarker, type Announcement } from '~/utils/announcement'

/** 每天最多提示一次；版本变化时当天也会重新提示 */
const SEEN_KEY = 'quiz_announcement_daily'

export function useAnnouncement() {
  const open = useState<boolean>('announcement_open', () => false)
  const announcement = useState<Announcement>('announcement_data', () => ANNOUNCEMENT)
  const loaded = useState<boolean>('announcement_loaded', () => false)
  const api = useApi()

  async function load(force = false): Promise<Announcement> {
    if (!import.meta.client) return announcement.value
    if (loaded.value && !force) return announcement.value
    try {
      const remote = await api.get<Announcement>('/api/announcement')
      if (remote && remote.version && remote.title) {
        announcement.value = remote
      }
      loaded.value = true
    } catch {
      /* 离线或接口异常时回退内置 ANNOUNCEMENT */
      loaded.value = true
    }
    return announcement.value
  }

  function marker(): string {
    return announcementMarker(announcement.value.version)
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
  async function show() {
    await load()
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
  async function showIfNew() {
    await load()
    if (!hasSeen()) open.value = true
  }

  return { open, announcement, load, hasSeen, show, dismiss, showIfNew }
}
