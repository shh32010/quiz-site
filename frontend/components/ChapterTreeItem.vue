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
  /** 可选锚点 id，用于从首页课程卡定位 */
  anchorId?: string
}>()

const emit = defineEmits<{ (e: 'toggle', id: number): void }>()

const isLeaf = computed(() => !props.node.children?.length)
const pad = computed(() => (props.depth === 0 ? 'pl-5' : props.depth === 1 ? 'pl-12' : 'pl-20'))
const nameClass = computed(() =>
  props.depth === 0 ? 'text-sm text-fg-primary'
    : props.depth === 1 ? 'text-xs text-fg-secondary' : 'text-xs text-fg-secondary')

/** 从 code 取标题序号：A1-1.1 → 1.1；S1-3 → 3 */
function num(code: string | null): string {
  if (!code) return ''
  const i = code.indexOf('-')
  return i >= 0 ? code.slice(i + 1) : ''
}
</script>

<template>
  <li :id="anchorId" class="scroll-mt-20">
    <div class="flex items-center justify-between py-1 pr-5" :class="pad">
      <button class="flex min-h-11 min-w-0 items-center gap-2 text-left" :disabled="isLeaf"
              @click="emit('toggle', node.id)">
        <span class="w-4 shrink-0 text-fg-muted">{{ isLeaf ? '' : (open[node.id] ? '−' : '+') }}</span>
        <span v-if="label" class="shrink-0 rounded bg-brand-soft px-1.5 py-0.5 text-xs text-brand">{{ label }}</span>
        <span v-if="depth === 0" class="shrink-0 rounded bg-surface-muted px-1.5 py-0.5 text-xs text-fg-secondary">{{ node.code }}</span>
        <span v-else-if="num(node.code)" class="shrink-0 font-mono text-xs text-fg-muted">{{ num(node.code) }}</span>
        <span class="truncate" :class="nameClass">{{ displayName ?? node.name }}</span>
      </button>
      <NuxtLink :to="`/chapters/${node.id}`" class="inline-flex min-h-11 shrink-0 items-center px-1 text-xs text-brand hover:underline">
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

    <ul v-if="!isLeaf && open[node.id]" class="bg-surface-muted/60">
      <ChapterTreeItem v-for="child in node.children" :key="child.id"
                       :node="child" :open="open" :depth="depth + 1"
                       @toggle="emit('toggle', $event)" />
    </ul>
  </li>
</template>
