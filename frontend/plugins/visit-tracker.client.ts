/**
 * 匿名访问统计：路由切换时上报页面路径。
 * 尊重 Do Not Track；不读取 IP（由服务端决定不存）；只使用浏览器本地随机访客 ID。
 */
export default defineNuxtPlugin((nuxtApp) => {
  const router = useRouter()

  function visitorId(): string {
    try {
      const key = 'quiz_visitor'
      const existing = localStorage.getItem(key)
      if (existing && /^[A-Za-z0-9_-]{8,64}$/.test(existing)) return existing
      const raw = crypto.randomUUID?.() ?? `${Date.now()}${Math.random().toString(36).slice(2)}`
      const id = raw.replace(/[^A-Za-z0-9_-]/g, '').slice(0, 64)
      localStorage.setItem(key, id)
      return id
    } catch {
      return ''
    }
  }

  function track(path: string) {
    if (!path.startsWith('/') || path.startsWith('/api/')
        || path.startsWith('/admin') || path.startsWith('/verify-email')) return
    if (navigator.doNotTrack === '1' || (window as any).doNotTrack === '1') return
    const id = visitorId()
    if (!id) return

    const payload = JSON.stringify({
      path,
      visitorId: id,
      referrer: document.referrer,
      mobile: window.matchMedia('(max-width: 767px)').matches,
    })
    try {
      if (navigator.sendBeacon) {
        navigator.sendBeacon('/api/stats/collect', new Blob([payload], { type: 'application/json' }))
      } else {
        fetch('/api/stats/collect', {
          method: 'POST',
          headers: { 'Content-Type': 'application/json' },
          body: payload,
          keepalive: true,
        }).catch(() => { /* 统计失败不影响使用 */ })
      }
    } catch {
      // 忽略统计异常
    }
  }

  router.afterEach((to, from) => {
    if (to.path !== from.path) track(to.path)
  })
  nuxtApp.hook('app:mounted', () => track(router.currentRoute.value.path))
})
