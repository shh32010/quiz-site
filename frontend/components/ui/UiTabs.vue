<script setup lang="ts">
/** 胶囊 Tab：支持计数、横向滚动 */
interface TabItem {
  value: number | string
  label: string
  count?: number
}

const props = defineProps<{
  modelValue: number | string
  items: TabItem[]
}>()
const emit = defineEmits<{ 'update:modelValue': [value: number | string] }>()

function select(value: number | string) {
  if (value !== props.modelValue) emit('update:modelValue', value)
}
</script>

<template>
  <div class="scrollbar-none flex min-h-11 gap-2 overflow-x-auto pb-1" role="tablist">
    <button v-for="item in items" :key="item.value" type="button" role="tab"
            :aria-selected="item.value === modelValue"
            class="min-h-10 shrink-0 rounded-full border px-4 py-2 text-sm transition-colors"
            :class="item.value === modelValue
              ? 'border-brand bg-brand text-white'
              : 'border-line-subtle bg-surface-card text-fg-secondary hover:border-brand'"
            @click="select(item.value)">
      {{ item.label }}
      <span v-if="item.count !== undefined" class="ml-1"
            :class="item.value === modelValue ? 'text-white opacity-80' : 'text-fg-muted'">{{ item.count }}</span>
    </button>
  </div>
</template>
