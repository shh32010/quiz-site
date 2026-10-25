<script setup lang="ts">
const { toasts, remove } = useToast()
const tones: Record<string, string> = {
  info: 'border-line-subtle bg-surface-elevated text-fg-primary',
  success: 'border-success-border bg-success-bg text-success-fg',
  warn: 'border-warn-border bg-warn-bg text-warn-fg',
  error: 'border-danger-border bg-danger-bg text-danger-fg',
}
</script>

<template>
  <Teleport to="body">
    <div class="pointer-events-none fixed inset-x-0 top-3 z-[60] flex flex-col items-center gap-2 px-3">
      <button v-for="t in toasts" :key="t.id" type="button"
              class="pointer-events-auto max-w-md rounded-xl border px-4 py-2 text-sm shadow-lg"
              :class="tones[t.tone]" @click="remove(t.id)">
        {{ t.message }}
      </button>
    </div>
  </Teleport>
</template>
