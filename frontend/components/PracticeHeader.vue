<script setup lang="ts">
// 刷题页顶栏：退出、进度、主题、计时、答题卡入口
defineProps<{
  modeLabel: string
  currentOrder: number
  total: number
  progressPercent: number
  remain: number
  remainText: string
  guest: boolean
  hasQuestion: boolean
}>()

const emit = defineEmits<{ exit: []; openSheet: [] }>()
</script>

<template>
  <header class="sticky top-0 z-30 border-b border-line-subtle bg-surface-glass backdrop-blur">
    <div class="mx-auto flex max-w-3xl items-center gap-2 px-3 py-2 sm:max-w-4xl sm:px-4">
      <button type="button" class="shrink-0 rounded-lg px-2 py-1.5 text-sm text-slate-500 hover:bg-slate-100 hover:text-slate-800"
              @click="emit('exit')">← 退出</button>
      <div class="min-w-0 flex-1">
        <div class="flex items-center justify-between gap-2 text-xs text-slate-500">
          <span class="truncate">{{ modeLabel }}</span>
          <span class="shrink-0 tabular-nums">{{ hasQuestion ? currentOrder : 0 }} / {{ total || '—' }}</span>
        </div>
        <div class="mt-1 h-1 overflow-hidden rounded-full bg-slate-100">
          <div class="h-full rounded-full bg-blue-600 transition-all" :style="{ width: `${progressPercent}%` }" />
        </div>
      </div>
      <UiThemeToggle class="shrink-0" />
      <span v-if="remain >= 0" class="shrink-0 rounded-lg bg-surface-muted px-2 py-1 text-xs font-medium tabular-nums"
            :class="remain < 300 ? 'text-danger-fg' : 'text-fg-secondary'">⏱ {{ remainText }}</span>
      <button v-if="!guest && hasQuestion" type="button"
              class="min-h-11 shrink-0 rounded-lg border border-line-subtle px-2.5 py-1.5 text-xs text-fg-secondary hover:border-brand hover:text-brand"
              @click="emit('openSheet')">答题卡</button>
    </div>
  </header>
</template>
