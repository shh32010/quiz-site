<script setup lang="ts">
/** 胶囊 Tab：支持计数、横向滚动、方向键导航（ArrowLeft/Right/Home/End）与 44px 触控热区 */
import { ref } from 'vue'

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

const tablist = ref<HTMLElement | null>(null)

function select(value: number | string) {
  if (value !== props.modelValue) emit('update:modelValue', value)
}

function onKeydown(e: KeyboardEvent, index: number) {
  const len = props.items.length
  if (!len) return
  let nextIdx = -1
  if (e.key === 'ArrowRight') nextIdx = (index + 1) % len
  else if (e.key === 'ArrowLeft') nextIdx = (index - 1 + len) % len
  else if (e.key === 'Home') nextIdx = 0
  else if (e.key === 'End') nextIdx = len - 1
  if (nextIdx < 0) return
  e.preventDefault()
  select(props.items[nextIdx].value)
  const buttons = tablist.value?.querySelectorAll<HTMLButtonElement>('[role="tab"]')
  buttons?.[nextIdx]?.focus()
}
</script>

<template>
  <div ref="tablist" class="scrollbar-none flex min-h-11 gap-2 overflow-x-auto pb-1" role="tablist">
    <button v-for="(item, idx) in items" :key="item.value" type="button" role="tab"
            :aria-selected="item.value === modelValue"
            :tabindex="item.value === modelValue ? 0 : -1"
            class="min-h-11 shrink-0 rounded-full border px-4 py-2 text-sm transition-colors"
            :class="item.value === modelValue
              ? 'border-brand bg-brand text-white'
              : 'border-line-subtle bg-surface-card text-fg-secondary hover:border-brand'"
            @click="select(item.value)"
            @keydown="onKeydown($event, idx)">
      {{ item.label }}
      <span v-if="item.count !== undefined" class="ml-1"
            :class="item.value === modelValue ? 'text-white opacity-80' : 'text-fg-muted'">{{ item.count }}</span>
    </button>
  </div>
</template>
