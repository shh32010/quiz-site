<script setup lang="ts">
/** 语义徽标 */
withDefaults(defineProps<{
  tone?: 'slate' | 'blue' | 'green' | 'red' | 'amber' | 'indigo'
  size?: 'sm' | 'md'
}>(), {
  tone: 'slate',
  size: 'sm',
})
const tones: Record<string, string> = {
  slate: 'bg-surface-muted text-fg-secondary',
  blue: 'bg-brand-soft text-brand-on-soft',
  green: 'bg-success-bg text-success-fg',
  red: 'bg-danger-bg text-danger-fg',
  amber: 'bg-warn-bg text-warn-fg',
  indigo: 'bg-indigo-50 text-indigo-700',
}
const sizes: Record<string, string> = {
  sm: 'px-2 py-0.5 text-[11px]',
  md: 'px-2.5 py-1 text-xs',
}
</script>

<template>
  <span class="inline-flex items-center rounded-full font-medium" :class="[tones[tone], sizes[size]]">
    <slot />
  </span>
</template>
