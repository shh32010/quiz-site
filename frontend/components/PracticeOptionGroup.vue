<script setup lang="ts">
// 刷题页选项与文本作答区组件（单选/判断、多选、填空/综合）
const props = defineProps<{
  questionType: number
  choiceOptions: [string, string][]
  answer: string
  multi: string[]
  fill: string
  hasFeedback: boolean
  correctKeys: string[]
}>()

const emit = defineEmits<{
  'select-option': [key: string]
  'update:multi': [value: string[]]
  'update:fill': [value: string]
}>()

function optionSelected(key: string) {
  return props.questionType === 2 ? props.multi.includes(key) : props.answer === key
}

function optionIsCorrect(key: string) {
  return props.hasFeedback && props.correctKeys.includes(key)
}

function optionClass(key: string) {
  if (props.hasFeedback) {
    if (optionIsCorrect(key)) return 'border-success-border bg-success-bg text-success-fg'
    if (optionSelected(key)) return 'border-danger-border bg-danger-bg text-danger-fg'
    return 'border-line-subtle bg-surface-card text-fg-muted'
  }
  return optionSelected(key)
    ? 'border-brand bg-brand-soft text-fg-primary'
    : 'border-line-subtle bg-surface-card text-fg-secondary hover:border-brand'
}

function toggleMulti(key: string) {
  if (props.hasFeedback) return
  const next = props.multi.includes(key)
    ? props.multi.filter(k => k !== key)
    : [...props.multi, key]
  emit('update:multi', next)
}
</script>

<template>
  <div v-if="questionType === 1 || questionType === 3" class="mt-5 space-y-2">
    <label v-for="[k, v] in choiceOptions" :key="k"
           class="flex cursor-pointer items-start gap-2.5 rounded-xl border p-3 text-sm transition-colors"
           :class="optionClass(k)">
      <input :checked="answer === k" type="radio" :value="k" :disabled="hasFeedback"
             class="mt-1" @change="emit('select-option', k)" />
      <span class="min-w-0 flex-1"><b class="mr-1">{{ k }}.</b>{{ v }}</span>
      <span v-if="optionIsCorrect(k)" class="text-success-fg">✓</span>
      <span v-else-if="hasFeedback && optionSelected(k)" class="text-danger-fg">✗</span>
    </label>
  </div>

  <div v-else-if="questionType === 2" class="mt-5 space-y-2">
    <label v-for="[k, v] in choiceOptions" :key="k"
           class="flex cursor-pointer items-start gap-2.5 rounded-xl border p-3 text-sm transition-colors"
           :class="optionClass(k)">
      <input :checked="multi.includes(k)" type="checkbox" :value="k" :disabled="hasFeedback"
             class="mt-1" @change="toggleMulti(k)" />
      <span class="min-w-0 flex-1"><b class="mr-1">{{ k }}.</b>{{ v }}</span>
      <span v-if="optionIsCorrect(k)" class="text-success-fg">✓</span>
      <span v-else-if="hasFeedback && optionSelected(k)" class="text-danger-fg">✗</span>
    </label>
  </div>

  <div v-else class="mt-5">
    <textarea :value="fill" :disabled="hasFeedback"
              data-practice-answer="true"
              :rows="questionType === 5 ? 5 : 3"
              placeholder="多空用中文分号「；」分隔；程序题可直接按行输入"
              class="w-full rounded-xl border border-line-strong bg-surface-card px-3 py-2.5 text-base outline-none focus:border-brand sm:text-sm"
              @input="emit('update:fill', ($event.target as HTMLTextAreaElement).value)" />
  </div>
</template>
