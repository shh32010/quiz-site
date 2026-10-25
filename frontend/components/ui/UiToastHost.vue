<script setup lang="ts">
const { toasts, remove } = useToast()
const tones: Record<string, string> = {
  info: 'border-slate-200 bg-white text-slate-700',
  success: 'border-green-200 bg-green-50 text-green-800',
  warn: 'border-amber-200 bg-amber-50 text-amber-800',
  error: 'border-red-200 bg-red-50 text-red-800',
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
