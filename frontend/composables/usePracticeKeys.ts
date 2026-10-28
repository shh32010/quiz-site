/**
 * 刷题页键盘操作。输入框/文本域内不抢按键；
 * 文本域只响应 Ctrl/Cmd+Enter 提交。
 */
import { onMounted, onUnmounted } from 'vue'

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
    const el = e.target instanceof HTMLElement ? e.target : null
    const tag = el?.tagName

    // 文本域：只有主作答框支持 Ctrl/Cmd+Enter，反馈等附属文本域不抢按键
    if (tag === 'TEXTAREA') {
      if (el?.hasAttribute('data-practice-answer') && (e.ctrlKey || e.metaKey) && e.key === 'Enter') {
        e.preventDefault()
        handlers.onCancelAdvance()
        handlers.onSubmit()
      }
      return
    }
    if (isTyping(el) || e.ctrlKey) return
    // 按钮/链接上的 Enter 交给原生点击，避免误触本题提交
    if (el?.closest('button, a, [role="button"]')) return

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
