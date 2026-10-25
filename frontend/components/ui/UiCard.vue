<script setup lang="ts">
/** 基础卡片 */
withDefaults(defineProps<{
  padded?: 'none' | 'sm' | 'md' | 'lg'
  shadow?: boolean
}>(), {
  padded: 'md',
  shadow: true,
})
const padClass: Record<string, string> = {
  none: '',
  sm: 'p-3',
  md: 'p-4 sm:p-5',
  lg: 'p-5 sm:p-6',
}
</script>

<template>
  <div class="rounded-2xl border border-line-subtle bg-surface-card text-fg-primary"
       :class="[padClass[padded], shadow ? 'shadow-sm' : '']">
    <slot />
  </div>
</template>
