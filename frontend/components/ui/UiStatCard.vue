<script setup lang="ts">
/** 统一统计卡：标签 + 等宽大数字 + 辅助说明 */
withDefaults(defineProps<{
  label: string
  value: string | number
  suffix?: string
  hint?: string
  tone?: 'default' | 'brand' | 'success' | 'warn' | 'danger'
}>(), {
  suffix: '',
  hint: '',
  tone: 'default',
})
const tones: Record<string, string> = {
  default: 'text-fg-primary',
  brand: 'text-brand',
  success: 'text-success-fg',
  warn: 'text-warn-fg',
  danger: 'text-danger-fg',
}
</script>

<template>
  <UiCard padded="sm">
    <p class="text-xs text-fg-muted">{{ label }}</p>
    <p class="mt-1 text-2xl font-bold tabular-nums" :class="tones[tone]">
      {{ value }}<span v-if="suffix" class="ml-1 text-sm font-normal text-fg-muted">{{ suffix }}</span>
    </p>
    <p v-if="hint" class="mt-1 text-xs text-fg-muted">{{ hint }}</p>
  </UiCard>
</template>
