<script setup lang="ts">
// 章节树节点（章 → 节 → 目），递归渲染
interface Node {
  id: number
  code: string | null
  name: string
  level: number
  questionCount: number
  children: Node[]
}

const props = defineProps<{
  node: Node
  open: Record<number, boolean>
  depth: number
  /** 额外前缀标签，如「技能一」「理论」 */
  label?: string
  /** 覆盖显示名 */
  displayName?: string
  /** 当前章的已做进度（只在根章节显示） */
  progress?: { answered: number; total: number; pct: number }
}>()

const emit = defineEmits<{ (e: 'toggle', id: number): void }>()

const isLeaf = computed(() => !props.node.children?.length)
const pad = computed(() => (props.depth === 0 ? 'pl-5' : props.depth === 1 ? 'pl-12' : 'pl-20'))
const nameClass = computed(() =>
  props.depth === 0 ? 'text-sm text-slate-800'
    : props.depth === 1 ? 'text-xs text-slate-600' : 'text-xs text-slate-500')

/** 从 code 取标题序号：A1-1.1 → 1.1；S1-3 → 3 */
function num(code: string | null): string {
  if (!code) return ''
  const i = code.indexOf('-')
  return i >= 0 ? code.slice(i + 1) : ''
}
</script>

<template>
  <li>
    <div class="flex items-center justify-between py-2 pr-5" :class="pad">
      <button class="flex min-w-0 items-center gap-2 text-left" :disabled="isLeaf"
              @click="emit('toggle', node.id)">
        <span class="w-4 shrink-0 text-slate-400">{{ isLeaf ? '' : (open[node.id] ? '−' : '+') }}</span>
        <span v-if="label" class="shrink-0 rounded bg-blue-50 px-1.5 py-0.5 text-xs text-blue-600">{{ label }}</span>
        <span v-if="depth === 0" class="shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">{{ node.code }}</span>
        <span v-else-if="num(node.code)" class="shrink-0 font-mono text-xs text-slate-400">{{ num(node.code) }}</span>
        <span class="truncate" :class="nameClass">{{ displayName ?? node.name }}</span>
      </button>
      <NuxtLink :to="`/chapters/${node.id}`" class="shrink-0 text-xs text-blue-600 hover:underline">
        {{ node.questionCount.toLocaleString() }} 题 ›
      </NuxtLink>
    </div>

    <div v-if="depth === 0 && progress" class="flex items-center gap-2 pb-2 pl-11 pr-5">
      <div class="h-1.5 flex-1 overflow-hidden rounded-full bg-surface-muted" role="progressbar"
           :aria-valuenow="progress.pct" aria-valuemin="0" aria-valuemax="100">
        <div class="h-full rounded-full bg-brand transition-all"
             :style="{ width: progress.answered > 0 ? `max(3px, ${progress.pct}%)` : '0%' }" />
      </div>
      <span class="shrink-0 text-xs tabular-nums text-fg-muted">
        {{ progress.answered }}/{{ progress.total }} 已做
      </span>
    </div>

    <ul v-if="!isLeaf && open[node.id]" class="bg-slate-50/60">
      <ChapterTreeItem v-for="child in node.children" :key="child.id"
                       :node="child" :open="open" :depth="depth + 1"
                       @toggle="emit('toggle', $event)" />
    </ul>
  </li>
</template>
