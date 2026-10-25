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
  <p v-if="loading" class="rounded-xl border border-slate-200 bg-white px-5 py-8 text-center text-sm text-slate-500">
    {{ loadingText }}
  </p>
  <div v-else-if="error" class="rounded-xl border border-red-200 bg-red-50 px-5 py-6 text-center text-sm text-red-700">
    <p>{{ error }}</p>
    <button type="button" class="mt-2 text-xs underline" @click="emit('retry')">重试</button>
  </div>
  <p v-else-if="empty" class="rounded-xl border border-slate-200 bg-white px-5 py-8 text-center text-sm text-slate-500">
    {{ emptyText }}
  </p>
  <slot v-else />
</template>
