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
    if (t) headers.Authorization = `Bearer ${t}`
    const res = await fetch(path, { ...opts, headers })
    const text = await res.text()
    const data = text ? JSON.parse(text) : null
    if (!res.ok) {
      throw new Error(data?.message ?? `请求失败 (${res.status})`)
    }
    return data as T
  }

  return {
    get: <T = any>(path: string) => request<T>(path),
    post: <T = any>(path: string, body: unknown) =>
      request<T>(path, { method: 'POST', body: JSON.stringify(body) }),
    hasToken: () => Boolean(token()),
    setToken: (t: string) => localStorage.setItem('quiz_token', t),
    clearToken: () => localStorage.removeItem('quiz_token'),
  }
}
