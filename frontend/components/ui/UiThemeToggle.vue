<script setup lang="ts">
/** 主题切换：compact 用于顶栏/刷题页，segmented 用于“我的” */
const props = withDefaults(defineProps<{ mode?: 'compact' | 'segmented' }>(), {
  mode: 'compact',
})
const theme = useTheme()

const modes = [
  { value: 'system' as const, label: '跟随系统', icon: '◐' },
  { value: 'light' as const, label: '日间', icon: '☀' },
  { value: 'dark' as const, label: '夜间', icon: '☾' },
]

function select(value: 'system' | 'light' | 'dark') {
  theme.setPreference(value)
}
</script>

<template>
  <button v-if="props.mode === 'compact'" type="button" aria-label="切换主题" title="切换日间/夜间"
          class="flex h-11 w-11 items-center justify-center rounded-lg text-fg-secondary hover:bg-surface-muted hover:text-fg-primary"
          @click="theme.toggle()">
    <svg class="h-5 w-5 dark:hidden" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
      <circle cx="12" cy="12" r="4" />
      <path d="M12 2v2M12 20v2M4.9 4.9l1.4 1.4M17.7 17.7l1.4 1.4M2 12h2M20 12h2M4.9 19.1l1.4-1.4M17.7 6.3l1.4-1.4" />
    </svg>
    <svg class="hidden h-5 w-5 dark:block" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="1.8">
      <path d="M20.5 14.2A8.5 8.5 0 0 1 9.8 3.5 8.5 8.5 0 1 0 20.5 14.2Z" />
    </svg>
  </button>

  <div v-else class="grid grid-cols-3 gap-1 rounded-xl bg-surface-muted p-1" role="group" aria-label="外观模式">
    <button v-for="m in modes" :key="m.value" type="button"
            class="min-h-11 rounded-lg px-2 text-xs font-medium transition-colors"
            :class="theme.pref.value === m.value
              ? 'bg-surface-elevated text-fg-primary shadow-sm'
              : 'text-fg-secondary hover:text-fg-primary'"
            @click="select(m.value)">
      <span class="mr-1" aria-hidden="true">{{ m.icon }}</span>{{ m.label }}
    </button>
  </div>
</template>
