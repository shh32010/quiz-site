/**
 * 登录用户的错题与收藏标记缓存（零后端改动的轻量交叉索引）：
 * 供章节题目列表等页面标注「错 N 次」「★ 已收藏」并支持页内过滤。
 */
export interface WrongMark {
  wrongCount: number
  resolved: boolean
}

export function useUserMarks() {
  const api = useApi()
  const wrongMap = useState<Record<number, WrongMark>>('user_wrong_marks', () => ({}))
  const favMap = useState<Record<number, boolean>>('user_fav_marks', () => ({}))
  const loadedAt = useState<number>('user_marks_loaded_at', () => 0)

  async function refreshMarks(force = false) {
    if (typeof window === 'undefined' || !api.hasToken()) {
      wrongMap.value = {}
      favMap.value = {}
      loadedAt.value = 0
      return
    }
    // 30 秒内复用缓存，避免章节翻页时重复请求
    if (!force && Date.now() - loadedAt.value < 30_000) return
    try {
      const [w, f] = await Promise.all([
        api.get<{ rows?: any[] }>('/api/wrong').catch(() => ({ rows: [] })),
        api.get<{ rows?: any[] }>('/api/favorites').catch(() => ({ rows: [] })),
      ])
      const wm: Record<number, WrongMark> = {}
      for (const row of w.rows ?? []) {
        const qid = Number(row.questionId)
        if (qid) {
          wm[qid] = {
            wrongCount: Number(row.wrongCount ?? 1),
            resolved: Boolean(row.resolved),
          }
        }
      }
      const fm: Record<number, boolean> = {}
      for (const row of f.rows ?? []) {
        const qid = Number(row.questionId)
        if (qid) fm[qid] = true
      }
      wrongMap.value = wm
      favMap.value = fm
      loadedAt.value = Date.now()
    } catch {
      /* 标记加载失败不阻塞题目列表浏览 */
    }
  }

  return {
    wrongMap,
    favMap,
    refreshMarks,
  }
}
