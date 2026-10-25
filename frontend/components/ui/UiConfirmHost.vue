<script setup lang="ts">
const { state, answer } = useConfirmHost()
</script>

<template>
  <UiModal :model-value="Boolean(state)" :title="state?.title || '请确认'" size="sm"
           @update:model-value="answer(false)">
    <p class="whitespace-pre-wrap text-sm leading-6 text-fg-secondary">{{ state?.message }}</p>
    <template #footer>
      <div class="flex justify-end gap-2">
        <UiButton variant="secondary" @click="answer(false)">{{ state?.cancelText || '取消' }}</UiButton>
        <UiButton :variant="state?.danger ? 'danger' : 'primary'" @click="answer(true)">
          {{ state?.confirmText || '确定' }}
        </UiButton>
      </div>
    </template>
  </UiModal>
</template>
