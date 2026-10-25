/**
 * 全局登录态与登录过期处理。
 * token 仍在 localStorage；SSR 首屏按未登录渲染，客户端挂载后再同步。
 */
export function useAuth() {
  const api = useApi()
  const router = useRouter()
  const route = useRoute()
  const loggedIn = useState<boolean>('logged_in', () => false)
  const initialized = useState<boolean>('auth_initialized', () => false)
  const expiredNoticeAt = useState<number>('auth_expired_notice_at', () => 0)

  /** 从 localStorage 同步登录态（仅客户端） */
  function sync() {
    loggedIn.value = api.hasToken()
    initialized.value = true
  }

  /** 应用启动时调用一次；避免 SSR 读取 localStorage */
  function init() {
    if (import.meta.server || initialized.value) return
    sync()
  }

  function saveToken(token: string) {
    api.setToken(token)
    loggedIn.value = true
    initialized.value = true
  }

  function clear() {
    api.clearToken()
    loggedIn.value = false
    initialized.value = true
  }

  function logout() {
    clear()
    return router.push('/login')
  }

  /** 带 token 的请求收到 401：清状态并回登录页，保留当前地址 */
  function onAuthExpired() {
    loggedIn.value = false
    initialized.value = true
    if (import.meta.server || route.path === '/login') return
    // 多个并发请求会同时 401，2 秒内只提示一次
    if (Date.now() - expiredNoticeAt.value > 2000) {
      expiredNoticeAt.value = Date.now()
      useToast().show('登录已过期，请重新登录', 'warn', 5000)
    }
    const redirect = route.fullPath
    router.push({ path: '/login', query: { redirect } })
  }

  function bindAuthExpired() {
    if (import.meta.server) return
    window.addEventListener('quiz-auth-expired', onAuthExpired)
  }

  function unbindAuthExpired() {
    if (import.meta.server) return
    window.removeEventListener('quiz-auth-expired', onAuthExpired)
  }

  return {
    loggedIn,
    initialized,
    init,
    sync,
    saveToken,
    clear,
    logout,
    bindAuthExpired,
    unbindAuthExpired,
  }
}
