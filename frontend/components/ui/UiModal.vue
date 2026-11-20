<script setup lang="ts">
/** 基础弹窗：Teleport + Esc 关闭 + 引用计数滚动锁 + 初始焦点/Tab 焦点陷阱/关闭焦点归还 */
import { nextTick, onMounted, onUnmounted, ref, toRef, watch } from 'vue'
import { useOverlayScrollLock } from '~/composables/useOverlayScrollLock'

const props = withDefaults(defineProps<{
  modelValue: boolean
  title?: string
  size?: 'sm' | 'md' | 'lg'
  closeOnBackdrop?: boolean
}>(), {
  title: '',
  size: 'md',
  closeOnBackdrop: true,
})
const emit = defineEmits<{ 'update:modelValue': [value: boolean] }>()

const dialogRef = ref<HTMLElement | null>(null)
const closeBtnRef = ref<HTMLButtonElement | null>(null)
let lastFocused: HTMLElement | null = null

function close() {
  emit('update:modelValue', false)
}

function getFocusable(): HTMLElement[] {
  if (!dialogRef.value) return []
  return Array.from(dialogRef.value.querySelectorAll<HTMLElement>(
    'button:not([disabled]), [href], input:not([disabled]), select:not([disabled]), textarea:not([disabled]), [tabindex]:not([tabindex="-1"])',
  )).filter(el => el.offsetParent !== null)
}

function trapTab(e: KeyboardEvent) {
  const items = getFocusable()
  if (!items.length) return
  const first = items[0]
  const last = items[items.length - 1]
  const active = document.activeElement as HTMLElement | null
  if (e.shiftKey && active === first) {
    e.preventDefault()
    last.focus()
  } else if (!e.shiftKey && active === last) {
    e.preventDefault()
    first.focus()
  }
}

function onKeydown(e: KeyboardEvent) {
  if (!props.modelValue) return
  if (e.key === 'Escape') {
    e.preventDefault()
    close()
  } else if (e.key === 'Tab') {
    trapTab(e)
  }
}

useOverlayScrollLock(toRef(props, 'modelValue'))

function syncFocus(open: boolean) {
  if (typeof document === 'undefined') return
  if (open) {
    lastFocused = document.activeElement as HTMLElement | null
    nextTick(() => {
      const items = getFocusable()
      // 优先聚焦内容区首个可交互元素，若无则聚焦关闭按钮
      const target = items.find(el => el !== closeBtnRef.value) ?? closeBtnRef.value
      target?.focus()
    })
  } else if (lastFocused) {
    lastFocused.focus?.()
    lastFocused = null
  }
}

watch(() => props.modelValue, syncFocus, { immediate: true })
onMounted(() => window.addEventListener('keydown', onKeydown))
onUnmounted(() => {
  window.removeEventListener('keydown', onKeydown)
  syncFocus(false)
})

const widths: Record<string, string> = {
  sm: 'max-w-sm',
  md: 'max-w-lg',
  lg: 'max-w-2xl',
}
</script>

<template>
  <Teleport to="body">
    <div v-if="modelValue" class="fixed inset-0 z-50 flex items-end justify-center bg-black/60 p-0 backdrop-blur-[2px] sm:items-center sm:p-4"
         @click.self="closeOnBackdrop && close()">
      <div ref="dialogRef" class="max-h-[90vh] w-full overflow-hidden rounded-t-2xl border border-line-subtle bg-surface-elevated shadow-xl sm:rounded-2xl"
           :class="widths[size]" role="dialog" aria-modal="true" :aria-label="title">
        <div class="mx-auto mt-2 h-1 w-10 rounded-full bg-line-strong sm:hidden" />
        <div class="flex items-center justify-between border-b border-line-subtle px-4 py-3">
          <h2 class="text-base font-semibold text-fg-primary">{{ title }}</h2>
          <button ref="closeBtnRef" type="button" class="flex h-11 w-11 items-center justify-center rounded-lg text-fg-muted hover:bg-surface-muted hover:text-fg-primary"
                  aria-label="关闭" @click="close">✕</button>
        </div>
        <div class="max-h-[calc(90vh-8rem)] overflow-y-auto p-4">
          <slot />
        </div>
        <div v-if="$slots.footer" class="border-t border-line-subtle p-4">
          <slot name="footer" />
        </div>
      </div>
    </div>
  </Teleport>
</template>
