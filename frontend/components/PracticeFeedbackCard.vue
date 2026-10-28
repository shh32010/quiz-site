<script setup lang="ts">
// 判分结果卡：状态头 + 正确答案 + 解析 + AI 操作
import { formatText } from '~/composables/format'

interface FeedbackState {
  is_correct: boolean
  score_got: number
  max_score: number
}

interface ReviewState {
  correct?: string
  analysis?: string
  qcGrade?: string
}

interface AiState {
  loading: boolean
  content: string
  err: string
}

withDefaults(defineProps<{
  feedback: FeedbackState
  review?: ReviewState | null
  advancePending?: boolean
  ai: AiState
  variant: AiState
  favorited?: boolean
}>(), {
  review: null,
  advancePending: false,
  favorited: false,
})

const emit = defineEmits<{
  askAi: [guide: boolean]
  askVariant: []
  toggleFav: []
}>()
</script>

<template>
  <div class="quiz-rise mt-5 overflow-hidden rounded-2xl border bg-surface-card shadow-sm"
       :class="feedback.is_correct ? 'border-success-border' : 'border-danger-border'">
    <!-- 状态头 -->
    <div class="flex items-center gap-3 border-b px-4 py-3.5"
         :class="feedback.is_correct ? 'border-success-border/60 bg-success-bg' : 'border-danger-border/60 bg-danger-bg'">
      <span class="grid h-10 w-10 shrink-0 place-items-center rounded-full text-lg font-bold"
            :class="feedback.is_correct ? 'bg-success-fg/10 text-success-fg' : 'bg-danger-fg/10 text-danger-fg'">
        {{ feedback.is_correct ? '✓' : '✕' }}
      </span>
      <div class="min-w-0 flex-1">
        <p class="font-semibold" :class="feedback.is_correct ? 'text-success-fg' : 'text-danger-fg'">
          {{ feedback.is_correct ? '回答正确' : '回答错误' }}
        </p>
        <p class="mt-0.5 text-xs text-fg-secondary">
          {{ feedback.is_correct ? '保持这个节奏，下一题继续。' : '别急，看完正确答案和解析再继续。' }}
        </p>
      </div>
      <span class="shrink-0 rounded-full bg-surface-card/80 px-2.5 py-1 text-xs font-semibold tabular-nums"
            :class="feedback.is_correct ? 'text-success-fg' : 'text-danger-fg'">
        {{ feedback.score_got }} / {{ feedback.max_score }} 分
      </span>
    </div>

    <div class="space-y-3 p-4">
      <!-- 正确答案 -->
      <div v-if="review" class="rounded-xl border border-line-subtle bg-surface-muted/60 px-3 py-2.5">
        <p class="text-[11px] font-semibold uppercase tracking-wide text-fg-muted">正确答案</p>
        <p class="mt-1 whitespace-pre-wrap break-words text-sm font-medium text-fg-primary">{{ formatText(review.correct) }}</p>
      </div>

      <p v-if="review?.qcGrade === 'error'"
         class="flex items-start gap-2 rounded-xl border border-warn-border bg-warn-bg px-3 py-2 text-xs leading-5 text-warn-fg">
        <span aria-hidden="true">⚠</span>
        <span>本题解析可能不准确，建议结合 AI 讲解或提交报错。</span>
      </p>

      <!-- 解析 -->
      <div v-if="review?.analysis" class="rounded-xl border border-line-subtle bg-surface-muted/50 px-3 py-2.5">
        <p class="text-[11px] font-semibold uppercase tracking-wide text-fg-muted">解析</p>
        <p class="mt-1 whitespace-pre-wrap break-words text-sm leading-6 text-fg-secondary">{{ formatText(review.analysis) }}</p>
      </div>

      <div v-if="advancePending" class="flex items-center gap-2 text-xs text-success-fg">
        <span class="h-1.5 w-1.5 animate-pulse rounded-full bg-success-fg" />
        即将进入下一题…
      </div>

      <!-- 操作条 -->
      <div class="flex flex-wrap items-center gap-2">
        <button type="button"
                class="inline-flex min-h-9 items-center rounded-full border border-brand/25 bg-brand-soft px-3 text-xs font-medium text-brand-on-soft transition hover:border-brand"
                @click="emit('askAi', false)">✦ AI 讲解</button>
        <button type="button"
                class="inline-flex min-h-9 items-center rounded-full border border-line-subtle bg-surface-card px-3 text-xs font-medium text-fg-secondary transition hover:border-brand hover:text-brand"
                @click="emit('askAi', true)">引导思考</button>
        <button type="button"
                class="inline-flex min-h-9 items-center rounded-full border border-line-subtle bg-surface-card px-3 text-xs font-medium text-fg-secondary transition hover:border-brand hover:text-brand"
                @click="emit('askVariant')">举一反三</button>
        <button type="button"
                class="inline-flex min-h-9 items-center rounded-full border border-line-subtle bg-surface-card px-3 text-xs font-medium text-fg-secondary transition hover:border-brand hover:text-brand"
                @click="emit('toggleFav')">{{ favorited ? '★ 已收藏' : '☆ 收藏' }}</button>
      </div>

      <!-- AI / 变式题结果 -->
      <div v-if="variant.loading" class="flex items-center gap-2 text-xs text-fg-muted">
        <span class="h-3 w-3 animate-spin rounded-full border-2 border-brand border-t-transparent" />
        正在生成变式题…
      </div>
      <p v-if="variant.err" class="text-xs text-danger-fg">{{ variant.err }}</p>
      <div v-if="variant.content" class="quiz-rise rounded-xl border border-line-subtle bg-surface-muted/50 p-3">
        <p class="mb-1 text-[11px] font-semibold uppercase tracking-wide text-fg-muted">同考点变式题</p>
        <p class="whitespace-pre-wrap break-words text-sm leading-6 text-fg-secondary">{{ variant.content }}</p>
      </div>

      <div v-if="ai.loading" class="flex items-center gap-2 text-xs text-fg-muted">
        <span class="h-3 w-3 animate-spin rounded-full border-2 border-brand border-t-transparent" />
        AI 思考中…
      </div>
      <p v-if="ai.err" class="text-xs text-danger-fg">{{ ai.err }}</p>
      <div v-if="ai.content" class="quiz-rise rounded-xl border border-line-subtle bg-surface-muted/50 p-3">
        <p class="mb-1 text-[11px] font-semibold uppercase tracking-wide text-fg-muted">AI 讲解</p>
        <p class="whitespace-pre-wrap break-words text-sm leading-6 text-fg-secondary">{{ ai.content }}</p>
      </div>
    </div>
  </div>
</template>
