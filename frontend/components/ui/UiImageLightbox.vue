<script setup lang="ts">
/**
 * 题目图片放大查看器：多图切换、Esc 关闭、方向键翻页、+/- 缩放。
 * 只负责展示，不修改题目数据；打开时锁页面滚动并管理焦点。
 */
const props = withDefaults(defineProps<{
  modelValue: boolean
  images: string[]
  startIndex?: number
}>(), {
  startIndex: 0,
})

const emit = defineEmits<{ 'update:modelValue': [value: boolean] }>()

const index = ref(0)
const scale = ref(1)
const panel = ref<HTMLElement | null>(null)
const closeButton = ref<HTMLButtonElement | null>(null)
let lastFocused: HTMLElement | null = null

const total = computed(() => props.images.length)
const current = computed(() => props.images[index.value] ?? '')
const imgStyle = computed(() => scale.value === 1
  ? { maxWidth: '100%', maxHeight: '100%' }
  : { width: `${Math.round(scale.value * 100)}%`, maxWidth: 'none', maxHeight: 'none' })

function close() {
  emit('update:modelValue', false)
}

function prev() {
  if (index.value <= 0) return
  index.value -= 1
  scale.value = 1
}

function next() {
  if (index.value >= total.value - 1) return
  index.value += 1
  scale.value = 1
}

function zoom(delta: number) {
  scale.value = Math.min(3, Math.max(1, Math.round((scale.value + delta) * 10) / 10))
}

/** Tab 焦点限制在弹层内，避免走到背景的答题按钮 */
function trapTab(e: KeyboardEvent) {
  if (!panel.value) return
  const items = Array.from(panel.value.querySelectorAll<HTMLElement>(
    'button:not([disabled]), [href], input, select, textarea, [tabindex]:not([tabindex="-1"])',
  )).filter(el => el.offsetParent !== null)
  if (!items.length) return
  const first = items[0]
  const last = items[items.length - 1]
  const active = document.activeElement as HTMLElement | null
  if (e.shiftKey && active === first) {
    e.preventDefault()
    last.focus()
  } else if (!e.shiftKey && active === last) {
    e.preventDefault()
    first.focus()
  }
}

function onKeydown(e: KeyboardEvent) {
  if (!props.modelValue) return
  // 不拦截浏览器/系统快捷键（Alt+←、Ctrl+- 等）
  if (e.altKey || e.ctrlKey || e.metaKey) return
  if (e.key === 'Tab') {
    trapTab(e)
  } else if (e.key === 'Escape') {
    e.preventDefault()
    close()
  } else if (e.key === 'ArrowLeft') {
    e.preventDefault()
    prev()
  } else if (e.key === 'ArrowRight') {
    e.preventDefault()
    next()
  } else if (e.key === '+' || e.key === '=') {
    e.preventDefault()
    zoom(0.5)
  } else if (e.key === '-') {
    e.preventDefault()
    zoom(-0.5)
  }
}

/** 打开且有图时锁页面滚动、定位到点击的那张图并聚焦关闭按钮 */
function sync(open: boolean) {
  if (typeof document === 'undefined') return
  const visible = open && total.value > 0
  document.body.style.overflow = visible ? 'hidden' : ''
  if (visible) {
    index.value = Math.min(Math.max(0, props.startIndex), total.value - 1)
    scale.value = 1
    lastFocused = document.activeElement as HTMLElement | null
    nextTick(() => closeButton.value?.focus())
  } else if (lastFocused) {
    lastFocused.focus()
    lastFocused = null
  }
}

/** 题图被清空（如交卷）时自动关闭，避免不可见的滚动锁 */
watch(total, (n) => {
  if (!n) {
    close()
    return
  }
  if (index.value >= n) index.value = n - 1
})
watch(() => props.modelValue, sync, { immediate: true })
watch(() => props.startIndex, (v) => {
  if (!props.modelValue) return
  index.value = Math.min(Math.max(0, v), Math.max(0, total.value - 1))
  scale.value = 1
})
onMounted(() => window.addEventListener('keydown', onKeydown))
onUnmounted(() => {
  window.removeEventListener('keydown', onKeydown)
  sync(false)
})
</script>

<template>
  <Teleport to="body">
    <div v-if="modelValue && total" ref="panel" class="fixed inset-0 z-[70] flex flex-col bg-black/95"
         role="dialog" aria-modal="true" aria-label="题目图片预览" @click.self="close">
      <div class="flex items-center justify-between gap-2 px-3 py-2 text-white sm:px-4">
        <span class="text-xs tabular-nums text-white/70" aria-live="polite">{{ index + 1 }} / {{ total }}</span>
        <div class="flex items-center gap-1">
          <button type="button" class="flex h-11 w-11 items-center justify-center rounded-lg text-lg hover:bg-white/10 disabled:opacity-30"
                  :disabled="scale <= 1" aria-label="缩小" @click="zoom(-0.5)">−</button>
          <span class="w-12 text-center text-xs tabular-nums text-white/70">{{ Math.round(scale * 100) }}%</span>
          <button type="button" class="flex h-11 w-11 items-center justify-center rounded-lg text-lg hover:bg-white/10 disabled:opacity-30"
                  :disabled="scale >= 3" aria-label="放大" @click="zoom(0.5)">＋</button>
          <button ref="closeButton" type="button"
                  class="ml-1 flex h-11 w-11 items-center justify-center rounded-lg text-lg hover:bg-white/10"
                  aria-label="关闭" @click="close">✕</button>
        </div>
      </div>

      <div class="relative flex min-h-0 flex-1">
        <div class="flex min-h-0 flex-1 overflow-auto p-2 sm:p-6"
             :class="scale > 1 ? 'items-start justify-start' : 'items-center justify-center'"
             @click.self="close">
          <img :src="current" alt="题目配图" :style="imgStyle" class="m-auto shrink-0 object-contain" @click.stop />
        </div>
        <button v-if="index > 0" type="button"
                class="absolute left-2 top-1/2 z-10 flex h-11 w-11 -translate-y-1/2 items-center justify-center rounded-full bg-black/50 text-2xl text-white hover:bg-black/70"
                aria-label="上一张" @click.stop="prev">‹</button>
        <button v-if="index < total - 1" type="button"
                class="absolute right-2 top-1/2 z-10 flex h-11 w-11 -translate-y-1/2 items-center justify-center rounded-full bg-black/50 text-2xl text-white hover:bg-black/70"
                aria-label="下一张" @click.stop="next">›</button>
      </div>

      <p class="px-4 pb-3 text-center text-xs text-white/50">
        点击背景或按 Esc 关闭 · 方向键切换 · +/− 缩放
      </p>
    </div>
  </Teleport>
</template>
