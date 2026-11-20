<script setup lang="ts">
// 知识点内嵌自测：不落地、不记错题，复用游客判分接口
import { TYPE_LABEL } from '~/utils/constants'
import { parseQuestionOptions } from '~/utils/question'
import { renderMathText } from '~/utils/math'

const props = defineProps<{ question: any }>()
const api = useApi()

const answer = ref('')
const multi = ref<string[]>([])
const fill = ref('')
const feedback = ref<any>(null)
const loading = ref(false)
const error = ref('')

const questionType = computed(() => Number(props.question.questionType))
const isMulti = computed(() => questionType.value === 2)
const isChoice = computed(() => [1, 2, 3].includes(questionType.value))
const options = computed<[string, string][]>(() =>
  parseQuestionOptions(questionType.value, props.question.optionJson))
const correctKeys = computed(() =>
  String(feedback.value?.correct ?? '').toUpperCase().replace(/[^A-Z]/g, ''))

function selected(key: string): boolean {
  return isMulti.value ? multi.value.includes(key) : answer.value === key
}

function choose(key: string) {
  if (feedback.value) return
  if (isMulti.value) {
    multi.value = multi.value.includes(key)
      ? multi.value.filter(item => item !== key)
      : [...multi.value, key].sort()
  } else {
    answer.value = key
  }
}

function optionClass(key: string): string {
  if (!feedback.value) {
    return selected(key)
      ? 'border-brand bg-brand-soft text-brand-on-soft'
      : 'border-line-subtle bg-surface-card text-fg-secondary hover:border-brand'
  }
  if (correctKeys.value.includes(key.toUpperCase())) {
    return 'border-success-border bg-success-bg text-success-fg'
  }
  if (selected(key)) return 'border-danger-border bg-danger-bg text-danger-fg'
  return 'border-line-subtle bg-surface-card text-fg-muted opacity-70'
}

async function submit() {
  if (loading.value || feedback.value) return
  error.value = ''
  const payload = isMulti.value
    ? [...multi.value].sort().join(',')
    : (isChoice.value ? answer.value : fill.value)
  if (!payload.trim()) {
    error.value = '请先作答'
    return
  }
  loading.value = true
  try {
    feedback.value = await api.post<any>('/api/guest/answer', {
      questionId: props.question.id,
      answer: payload,
    })
  } catch (e: any) {
    error.value = e.message ?? '判分失败'
  } finally {
    loading.value = false
  }
}

function reset() {
  answer.value = ''
  multi.value = []
  fill.value = ''
  feedback.value = null
  error.value = ''
}
</script>

<template>
  <div class="rounded-lg border border-line-subtle bg-surface-card p-3">
    <div class="flex flex-wrap items-center gap-2 text-xs text-fg-muted">
      <UiBadge>{{ TYPE_LABEL[questionType] ?? '题目' }}</UiBadge>
      <span>{{ question.score }} 分</span>
      <span class="text-fg-muted">自测不计入学习进度</span>
    </div>
    <p class="mt-2 whitespace-pre-wrap text-sm leading-6 text-fg-secondary" v-html="renderMathText(question.stem)"></p>

    <div v-if="isChoice" class="mt-2 space-y-1.5">
      <button v-for="[key, text] in options" :key="key" type="button"
              class="flex min-h-11 w-full items-start gap-2 rounded-lg border p-2.5 text-left text-sm"
              :class="optionClass(key)" :aria-pressed="selected(key)" @click="choose(key)">
        <span class="shrink-0 font-medium">{{ key }}.</span>
        <span class="min-w-0 flex-1 whitespace-pre-wrap" v-html="renderMathText(text)"></span>
        <span v-if="feedback && correctKeys.includes(key.toUpperCase())" class="shrink-0 text-success-fg">✓</span>
        <span v-else-if="feedback && selected(key)" class="shrink-0 text-danger-fg">✗</span>
      </button>
    </div>

    <textarea v-else v-model="fill" :rows="questionType === 5 ? 4 : 2"
              :disabled="Boolean(feedback)"
              placeholder="多空用中文分号「；」分隔；程序题可直接按行输入"
              class="mt-2 w-full rounded-lg border border-line-strong bg-surface-card px-3 py-2 text-base outline-none focus:border-brand sm:text-sm" />

    <p v-if="error" class="mt-2 text-xs text-danger-fg">{{ error }}</p>

    <div v-if="feedback" class="mt-2 rounded-lg border px-3 py-2 text-xs leading-5"
         :class="feedback.is_correct ? 'border-success-border bg-success-bg text-success-fg' : 'border-danger-border bg-danger-bg text-danger-fg'">
      <p class="font-medium">{{ feedback.is_correct ? '✓ 答对' : '✗ 答错' }}</p>
      <p v-if="!feedback.is_correct">正确答案：<span v-html="renderMathText(feedback.correct)"></span></p>
      <p v-if="feedback.analysis" class="mt-1 whitespace-pre-wrap text-fg-secondary">解析：<span v-html="renderMathText(feedback.analysis)"></span></p>
      <p v-if="feedback.qcGrade === 'error'" class="mt-1 text-warn-fg">本题解析可能不准确，建议结合教材核对。</p>
    </div>

    <div class="mt-2 flex flex-wrap gap-2">
      <button v-if="!feedback" type="button"
              class="min-h-11 rounded-lg bg-brand px-3 text-xs font-medium text-white hover:bg-brand-hover disabled:opacity-50"
              :disabled="loading" @click="submit">
        {{ loading ? '判分中…' : '提交自测' }}
      </button>
      <button v-else type="button"
              class="min-h-11 rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 text-xs text-fg-secondary hover:border-brand hover:text-brand"
              @click="reset">
        重做
      </button>
    </div>
  </div>
</template>
