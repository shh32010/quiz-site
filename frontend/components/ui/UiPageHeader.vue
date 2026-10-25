<script setup lang="ts">
/** 统一页面标题区：标题、副标题、返回链接、右侧操作 */
withDefaults(defineProps<{
  title: string
  subtitle?: string
  backTo?: string
  backLabel?: string
}>(), {
  subtitle: '',
  backTo: '',
  backLabel: '返回',
})
</script>

<template>
  <header class="flex flex-wrap items-start justify-between gap-3">
    <div class="min-w-0">
      <NuxtLink v-if="backTo" :to="backTo"
                class="mb-1 inline-flex min-h-9 items-center text-sm text-fg-secondary hover:text-brand">
        ← {{ backLabel }}
      </NuxtLink>
      <h1 class="text-2xl font-bold tracking-tight text-fg-primary">{{ title }}</h1>
      <p v-if="subtitle" class="mt-1 text-sm text-fg-secondary">{{ subtitle }}</p>
    </div>
    <div v-if="$slots.actions" class="flex flex-wrap items-center gap-2">
      <slot name="actions" />
    </div>
  </header>
</template>
