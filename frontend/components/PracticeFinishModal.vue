<script setup lang="ts">
// 交卷确认弹窗：未答题数、跳转首道未答题
defineProps<{
  modelValue: boolean
  info: { unanswered: number; firstUnanswered: number }
  submitting: boolean
}>()

const emit = defineEmits<{
  'update:modelValue': [value: boolean]
  goFirst: []
  finish: []
}>()
</script>

<template>
  <UiModal :model-value="modelValue" title="确认交卷" size="sm"
           @update:model-value="emit('update:modelValue', $event)">
    <p class="text-sm leading-6 text-fg-secondary">
      <template v-if="info.unanswered">还有 <b class="text-danger-fg">{{ info.unanswered }}</b> 题未答，未答题按 0 分计入总分。</template>
      <template v-else>所有题目都已作答，确认交卷？</template>
    </p>
    <template #footer>
      <div class="flex flex-wrap justify-end gap-2">
        <UiButton variant="secondary" @click="emit('update:modelValue', false)">继续答题</UiButton>
        <UiButton v-if="info.unanswered" variant="secondary" @click="emit('goFirst')">
          去第 {{ info.firstUnanswered }} 题
        </UiButton>
        <UiButton variant="danger" :loading="submitting" @click="emit('finish')">确认交卷</UiButton>
      </div>
    </template>
  </UiModal>
</template>
