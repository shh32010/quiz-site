/**
 * 主题偏好：system / light / dark。
 * SSR 首屏由 nuxt.config 的内联脚本先设 html.dark；这里只负责挂载后的状态和切换。
 */
export type ThemePreference = 'system' | 'light' | 'dark'
export type ResolvedTheme = 'light' | 'dark'

const STORAGE_KEY = 'quiz_theme_pref'

export function useTheme() {
  const pref = useState<ThemePreference>('theme_pref', () => 'system')
  const resolved = useState<ResolvedTheme>('theme_resolved', () => 'light')
  const initialized = useState<boolean>('theme_initialized', () => false)

  const isDark = computed(() => resolved.value === 'dark')

  function mediaQuery(): MediaQueryList | null {
    if (import.meta.server) return null
    return window.matchMedia('(prefers-color-scheme: dark)')
  }

  function apply() {
    if (import.meta.server) return
    const systemDark = mediaQuery()?.matches ?? false
    const dark = pref.value === 'dark' || (pref.value === 'system' && systemDark)
    resolved.value = dark ? 'dark' : 'light'

    const root = document.documentElement
    root.classList.toggle('dark', dark)
    root.dataset.theme = resolved.value
    root.style.colorScheme = resolved.value

    const meta = document.querySelector('meta[name="theme-color"]')
    if (meta) meta.setAttribute('content', dark ? '#121417' : '#F6F5F2')
  }

  function init() {
    if (import.meta.server || initialized.value) return
    const stored = localStorage.getItem(STORAGE_KEY)
    if (stored === 'light' || stored === 'dark' || stored === 'system') {
      pref.value = stored
    }
    initialized.value = true
    apply()
    mediaQuery()?.addEventListener('change', () => {
      if (pref.value === 'system') apply()
    })
  }

  function setPreference(next: ThemePreference) {
    pref.value = next
    if (import.meta.client) {
      localStorage.setItem(STORAGE_KEY, next)
      apply()
    }
  }

  function toggle() {
    setPreference(resolved.value === 'dark' ? 'light' : 'dark')
  }

  return { pref, resolved, isDark, init, setPreference, toggle }
}
