<script setup lang="ts">
// 学习报告排序：薄弱优先（正确率升序）/ 题量优先（作答次数降序）
defineProps<{ modelValue: 'weak' | 'volume' }>()
const emit = defineEmits<{ 'update:modelValue': [value: 'weak' | 'volume'] }>()
</script>

<template>
  <div class="inline-flex rounded-lg border border-line-subtle p-0.5 text-xs" role="group" aria-label="排序方式">
    <button type="button"
            class="min-h-8 rounded-md px-2.5"
            :class="modelValue === 'weak' ? 'bg-brand text-white' : 'text-fg-secondary hover:bg-surface-muted'"
            @click="emit('update:modelValue', 'weak')">薄弱优先</button>
    <button type="button"
            class="min-h-8 rounded-md px-2.5"
            :class="modelValue === 'volume' ? 'bg-brand text-white' : 'text-fg-secondary hover:bg-surface-muted'"
            @click="emit('update:modelValue', 'volume')">题量优先</button>
  </div>
</template>
