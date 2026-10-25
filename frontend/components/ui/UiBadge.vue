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
  slate: 'bg-slate-100 text-slate-600',
  blue: 'bg-blue-50 text-blue-700',
  green: 'bg-green-50 text-green-700',
  red: 'bg-red-50 text-red-700',
  amber: 'bg-amber-50 text-amber-800',
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
