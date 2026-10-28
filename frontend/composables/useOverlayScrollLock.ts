import type { Ref } from 'vue'

/**
 * 多个弹层共用 body 滚动锁：用计数避免一个弹层关闭时把另一个弹层的锁解掉。
 * 只在客户端生效；组件卸载时自动释放自己持有的锁。
 */
let lockCount = 0

function applyLock() {
  if (typeof document === 'undefined') return
  document.body.style.overflow = lockCount > 0 ? 'hidden' : ''
}

export function useOverlayScrollLock(active: Ref<boolean>) {
  let locked = false

  function sync(value: boolean) {
    if (value === locked) return
    locked = value
    lockCount = Math.max(0, lockCount + (value ? 1 : -1))
    applyLock()
  }

  if (import.meta.client) {
    watch(active, sync, { immediate: true })
    onUnmounted(() => sync(false))
  }
}
