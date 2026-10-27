<script setup lang="ts">
// 答题卡弹窗：题型分组、进度、状态配色与题号跳转
import { TYPE_LABEL } from '~/utils/constants'

const props = defineProps<{
  modelValue: boolean
  sheet: { total: number; answered: number; remaining: number; rows: any[] }
  groups: Array<{ type: number; rows: any[]; total: number; answered: number }>
  pct: number
  correct: number
  wrong: number
  currentOrder: number
  submitting: boolean
}>()

const emit = defineEmits<{
  'update:modelValue': [value: boolean]
  jump: [order: number]
  finish: []
}>()

const TYPE_TONE: Record<number, 'blue' | 'indigo' | 'amber' | 'green' | 'red'> = {
  1: 'blue', 2: 'indigo', 3: 'amber', 4: 'green', 5: 'red',
}

function sheetClass(row: any): string {
  if (row.itemOrder === props.currentOrder) return 'border-brand bg-brand text-white ring-2 ring-brand/25'
  if (!row.answered) return 'border-line-strong bg-surface-card text-fg-muted hover:border-brand hover:text-brand'
  if (row.isCorrect) return 'border-success-border bg-success-bg text-success-fg'
  return 'border-danger-border bg-danger-bg text-danger-fg'
}
</script>

<template>
  <UiModal :model-value="modelValue" title="答题卡" size="lg"
           @update:model-value="emit('update:modelValue', $event)">
    <div class="space-y-4">
      <div class="rounded-xl border border-line-subtle bg-surface-card p-3">
        <div class="flex items-baseline justify-between gap-2">
          <span class="text-sm font-semibold text-fg-primary">已答 {{ sheet.answered }} / {{ sheet.total }}</span>
          <span class="text-xs text-fg-muted">未答 {{ sheet.remaining }}</span>
        </div>
        <div class="mt-2 h-2 overflow-hidden rounded-full bg-surface-muted">
          <div class="h-full rounded-full bg-brand transition-all" :style="{ width: `${pct}%` }" />
        </div>
        <div class="mt-2 flex flex-wrap items-center gap-x-2 gap-y-1 text-xs text-fg-secondary">
          <span class="text-fg-muted">题型分布</span>
          <span v-for="(g, idx) in groups" :key="`summary-${g.type}`" class="inline-flex items-center gap-2">
            <span v-if="idx > 0" class="text-fg-muted">·</span>
            <span>{{ TYPE_LABEL[g.type] ?? '题目' }} {{ g.total }}</span>
          </span>
        </div>
        <div class="mt-2 flex flex-wrap gap-x-4 gap-y-1 text-xs">
          <span class="inline-flex items-center gap-1.5 text-success-fg">
            <span class="h-2.5 w-2.5 rounded-sm bg-success-fg" />答对 {{ correct }}
          </span>
          <span class="inline-flex items-center gap-1.5 text-danger-fg">
            <span class="h-2.5 w-2.5 rounded-sm bg-danger-fg" />答错 {{ wrong }}
          </span>
          <span class="inline-flex items-center gap-1.5 text-fg-muted">
            <span class="h-2.5 w-2.5 rounded-sm border border-line-strong bg-surface-card" />未答 {{ sheet.remaining }}
          </span>
          <span class="inline-flex items-center gap-1.5 text-brand">
            <span class="h-2.5 w-2.5 rounded-sm bg-brand" />当前
          </span>
        </div>
      </div>

      <section v-for="g in groups" :key="`group-${g.type}`" class="space-y-2">
        <div class="flex items-center justify-between gap-2">
          <div class="flex items-center gap-2">
            <UiBadge :tone="TYPE_TONE[g.type] ?? 'slate'">{{ TYPE_LABEL[g.type] ?? '题目' }}</UiBadge>
            <span class="text-xs tabular-nums text-fg-muted">{{ g.answered }}/{{ g.total }}</span>
          </div>
          <span class="text-xs tabular-nums text-fg-muted">
            第 {{ g.rows[0].itemOrder }}–{{ g.rows[g.rows.length - 1].itemOrder }} 题
          </span>
        </div>
        <div class="grid grid-cols-6 gap-2 sm:grid-cols-10">
          <button v-for="row in g.rows" :key="row.itemOrder" type="button"
                  class="aspect-square rounded-lg border text-sm font-semibold tabular-nums transition-colors"
                  :class="sheetClass(row)"
                  :aria-label="`第 ${row.itemOrder} 题，${TYPE_LABEL[row.questionType] ?? '题目'}，${row.answered ? (row.isCorrect ? '答对' : '答错') : '未答'}`"
                  :title="`第 ${row.itemOrder} 题 · ${TYPE_LABEL[row.questionType] ?? '题目'} · ${row.answered ? (row.isCorrect ? '答对' : '答错') : '未答'}`"
                  @click="emit('jump', row.itemOrder)">{{ row.itemOrder }}</button>
        </div>
      </section>
    </div>
    <template #footer>
      <UiButton variant="primary" class="w-full" :disabled="submitting" @click="emit('finish')">
        交卷（{{ sheet.remaining }} 题未答）
      </UiButton>
    </template>
  </UiModal>
</template>
