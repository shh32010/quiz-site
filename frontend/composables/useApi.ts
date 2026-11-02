/**
 * 带 JWT 的 API 客户端（仅浏览器端使用）。
 * token 存在 localStorage，随请求头 Authorization 发送。
 */
export function useApi() {
  const token = () =>
    typeof localStorage === 'undefined' ? '' : (localStorage.getItem('quiz_token') ?? '')

  async function request<T = any>(path: string, opts: RequestInit = {}): Promise<T> {
    const headers: Record<string, string> = {
      'Content-Type': 'application/json',
      ...(opts.headers as Record<string, string> | undefined),
    }
    const t = token()
    const hadToken = Boolean(t)
    if (t) headers.Authorization = `Bearer ${t}`
    const res = await fetch(path, { ...opts, headers })
    const text = await res.text()
    let data: any = null
    try { data = text ? JSON.parse(text) : null } catch { data = null }
    // 登录/注册的 401 是“账号密码错误”，不能当成 token 过期
    const isCredentialCheck = path === '/api/auth/login' || path === '/api/auth/register'
    if (res.status === 401 && hadToken && !isCredentialCheck) {
      try { localStorage.removeItem('quiz_token') } catch { /* 忽略 */ }
      if (typeof window !== 'undefined') window.dispatchEvent(new Event('quiz-auth-expired'))
    }
    if (!res.ok) {
      const msg = data?.message
        ?? (res.status === 401 ? '登录已过期，请重新登录' : `请求失败 (${res.status})`)
      throw new Error(msg)
    }
    return data as T
  }

  return {
    get: <T = any>(path: string) => request<T>(path),
    post: <T = any>(path: string, body: unknown) =>
      request<T>(path, { method: 'POST', body: JSON.stringify(body) }),
    put: <T = any>(path: string, body: unknown) =>
      request<T>(path, { method: 'PUT', body: JSON.stringify(body) }),
    del: <T = any>(path: string) => request<T>(path, { method: 'DELETE' }),
    hasToken: () => Boolean(token()),
    setToken: (t: string) => localStorage.setItem('quiz_token', t),
    clearToken: () => localStorage.removeItem('quiz_token'),
  }
}
