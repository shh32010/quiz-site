<script setup lang="ts">
/** 加载 / 错误 / 空态三合一 */
withDefaults(defineProps<{
  loading?: boolean
  error?: string
  empty?: boolean
  loadingText?: string
  emptyText?: string
}>(), {
  loading: false,
  error: '',
  empty: false,
  loadingText: '加载中…',
  emptyText: '暂无数据',
})
const emit = defineEmits<{ retry: [] }>()
</script>

<template>
  <div v-if="loading" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center">
    <div class="mx-auto max-w-sm space-y-2">
      <div class="h-3 animate-pulse rounded bg-surface-muted" />
      <div class="h-3 w-4/5 animate-pulse rounded bg-surface-muted" />
      <div class="h-3 w-3/5 animate-pulse rounded bg-surface-muted" />
    </div>
    <p class="mt-4 text-sm text-fg-muted">{{ loadingText }}</p>
  </div>
  <div v-else-if="error" class="rounded-xl border border-danger-border bg-danger-bg px-5 py-6 text-center text-sm text-danger-fg">
    <p>{{ error }}</p>
    <button type="button" class="mt-3 min-h-11 rounded-lg border border-danger-border px-4 text-sm font-medium" @click="emit('retry')">重试</button>
  </div>
  <p v-else-if="empty" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-muted">
    {{ emptyText }}
  </p>
  <slot v-else />
</template>
