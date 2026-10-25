<script setup lang="ts">
/** 基础弹窗：Teleport + Esc 关闭 + 锁定页面滚动 */
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

function close() {
  emit('update:modelValue', false)
}
function onKeydown(e: KeyboardEvent) {
  if (e.key === 'Escape' && props.modelValue) close()
}
function syncBody(open: boolean) {
  if (typeof document === 'undefined') return
  document.body.style.overflow = open ? 'hidden' : ''
}

watch(() => props.modelValue, syncBody, { immediate: true })
onMounted(() => window.addEventListener('keydown', onKeydown))
onUnmounted(() => {
  window.removeEventListener('keydown', onKeydown)
  syncBody(false)
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
      <div class="max-h-[90vh] w-full overflow-hidden rounded-t-2xl border border-line-subtle bg-surface-elevated shadow-xl sm:rounded-2xl"
           :class="widths[size]" role="dialog" aria-modal="true" :aria-label="title">
        <div class="mx-auto mt-2 h-1 w-10 rounded-full bg-line-strong sm:hidden" />
        <div class="flex items-center justify-between border-b border-line-subtle px-4 py-3">
          <h2 class="text-base font-semibold text-fg-primary">{{ title }}</h2>
          <button type="button" class="flex h-11 w-11 items-center justify-center rounded-lg text-fg-muted hover:bg-surface-muted hover:text-fg-primary"
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
