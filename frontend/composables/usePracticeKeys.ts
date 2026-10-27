/**
 * 刷题页键盘操作。输入框/文本域内不抢按键；
 * 文本域只响应 Ctrl/Cmd+Enter 提交。
 */
export interface PracticeKeyHandlers {
  isEnabled: () => boolean
  onSelect: (key: string) => void
  onSubmit: () => void
  onNext: () => void
  onPrev: () => void
  onHelp: () => void
  onCancelAdvance: () => void
}

export function usePracticeKeys(handlers: PracticeKeyHandlers) {
  function isTyping(el: HTMLElement | null): boolean {
    const tag = el?.tagName
    return tag === 'INPUT' || tag === 'TEXTAREA' || tag === 'SELECT' || Boolean(el?.isContentEditable)
  }

  function onKeydown(e: KeyboardEvent) {
    if (e.defaultPrevented || e.isComposing || e.altKey || e.metaKey) return
    // 弹窗/交卷/复盘等状态下先整体禁用，避免文本框 Ctrl+Enter 绕过
    if (!handlers.isEnabled()) return
    const el = e.target as HTMLElement | null
    const tag = el?.tagName

    // 文本域：只允许 Ctrl/Cmd+Enter 提交，普通 Enter 保留换行
    if (tag === 'TEXTAREA') {
      if ((e.ctrlKey || e.metaKey) && e.key === 'Enter') {
        e.preventDefault()
        handlers.onCancelAdvance()
        handlers.onSubmit()
      }
      return
    }
    if (isTyping(el) || e.ctrlKey) return

    handlers.onCancelAdvance()
    if (e.key === 'Enter') {
      e.preventDefault()
      handlers.onSubmit()
    } else if (e.key === 'ArrowRight') {
      e.preventDefault()
      handlers.onNext()
    } else if (e.key === 'ArrowLeft') {
      e.preventDefault()
      handlers.onPrev()
    } else if (e.key === '?') {
      e.preventDefault()
      handlers.onHelp()
    } else if (/^[1-9]$/.test(e.key)) {
      e.preventDefault()
      handlers.onSelect(e.key)
    } else if (/^[a-hA-H]$/.test(e.key)) {
      e.preventDefault()
      handlers.onSelect(e.key.toUpperCase())
    }
  }

  onMounted(() => window.addEventListener('keydown', onKeydown))
  onUnmounted(() => window.removeEventListener('keydown', onKeydown))
}
