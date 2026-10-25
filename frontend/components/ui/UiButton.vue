<script setup lang="ts">
/** 基础按钮：统一触控高度、语义色和 loading 状态 */
withDefaults(defineProps<{
  variant?: 'primary' | 'secondary' | 'ghost' | 'danger'
  size?: 'sm' | 'md' | 'lg'
  type?: 'button' | 'submit'
  disabled?: boolean
  loading?: boolean
}>(), {
  variant: 'primary',
  size: 'md',
  type: 'button',
  disabled: false,
  loading: false,
})

const variants: Record<string, string> = {
  primary: 'bg-brand text-white hover:bg-brand-hover disabled:bg-brand/40',
  secondary: 'border border-line-strong bg-surface-card text-fg-primary hover:border-brand hover:text-brand',
  ghost: 'text-fg-secondary hover:bg-surface-muted hover:text-fg-primary',
  danger: 'bg-danger-fg text-white hover:opacity-90 disabled:opacity-50',
}
const sizes: Record<string, string> = {
  sm: 'min-h-10 px-3 text-xs sm:min-h-9',
  md: 'min-h-11 px-4 text-sm',
  lg: 'min-h-12 px-5 text-base',
}
</script>

<template>
  <button :type="type" :disabled="disabled || loading"
          class="inline-flex items-center justify-center gap-1.5 rounded-lg font-medium transition-colors disabled:cursor-not-allowed disabled:opacity-60"
          :class="[variants[variant], sizes[size]]">
    <span v-if="loading" class="h-3.5 w-3.5 animate-spin rounded-full border-2 border-current border-t-transparent" />
    <slot v-else />
  </button>
</template>
