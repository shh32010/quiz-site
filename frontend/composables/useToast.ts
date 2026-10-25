/** 轻量全局 Toast；只保存内存，不持久化 */
export type ToastTone = 'info' | 'success' | 'warn' | 'error'
export interface ToastItem {
  id: number
  message: string
  tone: ToastTone
}

let seq = 0

export function useToast() {
  const toasts = useState<ToastItem[]>('toasts', () => [])

  function remove(id: number) {
    toasts.value = toasts.value.filter(t => t.id !== id)
  }

  function show(message: string, tone: ToastTone = 'info', duration = 2800) {
    const id = ++seq
    toasts.value = [...toasts.value, { id, message, tone }]
    if (import.meta.client) {
      window.setTimeout(() => remove(id), duration)
    }
  }

  return { toasts, show, remove }
}
