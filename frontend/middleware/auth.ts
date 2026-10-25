/**
 * 私有页面守卫：只在客户端执行。
 * token 存在 localStorage，SSR 阶段无法判断登录态，交给客户端首屏路由处理。
 */
export default defineNuxtRouteMiddleware((to) => {
  if (import.meta.server) return

  // 只依赖 token 判断，避免在中间件里调用 useRoute 拿到旧路由
  const api = useApi()
  if (api.hasToken()) return

  return navigateTo({
    path: '/login',
    query: { redirect: to.fullPath },
  })
})
