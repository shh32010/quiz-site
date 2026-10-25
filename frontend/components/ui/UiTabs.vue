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
  <div class="flex gap-2 overflow-x-auto pb-1" role="tablist">
    <button v-for="item in items" :key="item.value" type="button" role="tab"
            :aria-selected="item.value === modelValue"
            class="shrink-0 rounded-full border px-3 py-1 text-xs transition-colors"
            :class="item.value === modelValue
              ? 'border-blue-600 bg-blue-600 text-white'
              : 'border-slate-300 bg-white text-slate-600 hover:border-blue-400'"
            @click="select(item.value)">
      {{ item.label }}
      <span v-if="item.count !== undefined" class="ml-1"
            :class="item.value === modelValue ? 'text-blue-100' : 'text-slate-400'">{{ item.count }}</span>
    </button>
  </div>
</template>
