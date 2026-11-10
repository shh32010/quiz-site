<script setup lang="ts">
// 站内公告：首次进入按版本弹一次，也可从页脚手动打开（优先拉取后台配置，回退内置配置）
const { open, announcement, dismiss, showIfNew } = useAnnouncement()
const route = useRoute()
useOverlayScrollLock(open)

// 等客户端挂载后再渲染 Teleport，避免 SSR 水合时 teleport 锚点错位
const mounted = ref(false)
const panel = ref<HTMLElement | null>(null)
const confirmButton = ref<HTMLButtonElement | null>(null)
let lastFocused: HTMLElement | null = null
let autoTimer: ReturnType<typeof setTimeout> | null = null

/** 练习、知识点阅读与登录类表单属于专注场景，不在进入时打断 */
const QUIET_PREFIXES = [
  '/practice',
  '/knowledge/section/',
  '/login',
  '/forgot',
  '/reset',
  '/verify-email',
]

function isFocusPath(path: string) {
  return QUIET_PREFIXES.some(prefix => path.startsWith(prefix))
}

onMounted(() => {
  mounted.value = true
  // 也不要盖住用户已经打开的弹窗
  autoTimer = setTimeout(() => {
    if (isFocusPath(route.path)) return
    if (document.querySelector('[aria-modal="true"]')) return
    showIfNew()
  }, 700)
  window.addEventListener('keydown', onKeydown)
})

onUnmounted(() => {
  if (autoTimer) clearTimeout(autoTimer)
  window.removeEventListener('keydown', onKeydown)
})

watch(open, async (value) => {
  if (value) {
    lastFocused = document.activeElement as HTMLElement | null
    await nextTick()
    confirmButton.value?.focus()
  } else {
    lastFocused?.focus?.()
    lastFocused = null
  }
})

/** Tab 焦点限制在弹层内，避免走到背景页面 */
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

// 从练习页离开后补一次提示（首次进入练习时不打断）
watch(() => route.path, (path) => {
  if (!mounted.value || isFocusPath(path) || open.value) return
  if (document.querySelector('[aria-modal="true"]')) return
  showIfNew()
})

function onKeydown(e: KeyboardEvent) {
  if (!open.value) return
  if (e.key === 'Escape') {
    e.preventDefault()
    dismiss()
  } else if (e.key === 'Tab') {
    trapTab(e)
  }
}

/** 展开更新历史后滚到列表底部，避免点了箭头却看不到内容 */
function onHistoryToggle(event: Event) {
  const details = event.currentTarget as HTMLDetailsElement
  if (!details.open) return
  nextTick(() => {
    const scroller = details.parentElement
    if (scroller) scroller.scrollTop = scroller.scrollHeight
  })
}
</script>

<template>
  <Teleport v-if="mounted" to="body">
    <Transition name="announce">
      <div v-if="open"
           class="fixed inset-0 z-[70] flex items-end justify-center bg-black/55 p-0 backdrop-blur-[3px] sm:items-center sm:p-4"
           @click.self="dismiss">
        <div ref="panel" class="announce-panel relative w-full overflow-hidden rounded-t-3xl border border-line-subtle bg-surface-elevated shadow-2xl sm:max-w-lg sm:rounded-3xl"
             role="dialog" aria-modal="true" aria-labelledby="announcement-title">
          <!-- 头部：暖色渐变 + 柔光装饰 -->
          <div class="relative overflow-hidden border-b border-line-subtle bg-gradient-to-br from-brand-soft via-surface-card to-amber-50 px-5 pb-5 pt-5 sm:px-6">
            <div aria-hidden="true" class="pointer-events-none absolute -right-10 -top-14 h-40 w-40 rounded-full bg-brand/10 blur-2xl" />
            <div aria-hidden="true" class="pointer-events-none absolute -bottom-16 left-14 h-32 w-32 rounded-full bg-amber-300/20 blur-2xl" />

            <button type="button"
                    class="absolute right-2 top-2 grid h-11 w-11 place-items-center rounded-full text-fg-muted transition hover:bg-surface-card/80 hover:text-fg-primary"
                    aria-label="关闭公告" @click="dismiss">
              <svg viewBox="0 0 24 24" class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                <path d="m6 6 12 12M18 6 6 18" />
              </svg>
            </button>

            <div class="flex items-start gap-3.5">
              <span class="grid h-12 w-12 shrink-0 place-items-center rounded-2xl bg-gradient-to-br from-brand to-indigo-600 text-white shadow-lg shadow-brand/25">
                <svg viewBox="0 0 24 24" class="h-6 w-6" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                  <path d="M3 10.5v3a1.5 1.5 0 0 0 1.5 1.5H7l5 3.5v-14L7 8H4.5A1.5 1.5 0 0 0 3 9.5Z" />
                  <path d="M15.5 8.5a5 5 0 0 1 0 7M18.5 5.5a9 9 0 0 1 0 13" />
                </svg>
              </span>
              <div class="min-w-0 pr-10">
                <span class="inline-flex items-center gap-1 rounded-full border border-brand/20 bg-surface-card/70 px-2 py-0.5 text-[11px] font-medium text-brand">
                  站内公告 · {{ announcement.date }}
                </span>
                <h2 id="announcement-title" class="mt-2 text-lg font-bold leading-6 text-fg-primary sm:text-xl">
                  {{ announcement.title }}
                </h2>
                <p class="mt-1 text-xs leading-5 text-fg-secondary sm:text-sm">{{ announcement.subtitle }}</p>
              </div>
            </div>
          </div>

          <!-- 更新条目 -->
          <div class="max-h-[52vh] space-y-2.5 overflow-y-auto px-4 py-4 sm:max-h-[58vh] sm:px-5">
            <div v-for="(item, index) in announcement.items" :key="item.title"
                 class="flex gap-3 rounded-xl border border-line-subtle bg-surface-card p-3">
              <span class="mt-0.5 grid h-6 w-6 shrink-0 place-items-center rounded-lg bg-brand-soft text-[11px] font-bold text-brand-on-soft">
                {{ index + 1 }}
              </span>
              <div class="min-w-0">
                <div class="flex flex-wrap items-center gap-1.5">
                  <span class="rounded bg-surface-muted px-1.5 py-0.5 text-[10px] font-semibold text-fg-muted">{{ item.tag }}</span>
                  <p class="text-sm font-semibold text-fg-primary">{{ item.title }}</p>
                </div>
                <p class="mt-1 text-xs leading-5 text-fg-secondary">{{ item.desc }}</p>
              </div>
            </div>

            <!-- 更新历史：默认收起，避免公告过长 -->
            <details v-if="announcement.history?.length" class="group rounded-xl border border-line-subtle bg-surface-card"
                     @toggle="onHistoryToggle">
              <summary class="flex cursor-pointer list-none items-center justify-between gap-2 px-3 py-2.5 text-xs font-medium text-fg-secondary [&::-webkit-details-marker]:hidden">
                <span class="flex items-center gap-1.5">
                  <svg viewBox="0 0 24 24" class="h-3.5 w-3.5 text-fg-muted" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="12" cy="12" r="8.5" />
                    <path d="M12 7.5V12l3 1.8" />
                  </svg>
                  更新历史
                  <span class="rounded-full bg-surface-muted px-1.5 py-0.5 text-[10px] font-normal text-fg-muted">
                    {{ announcement.history.length }} 条
                  </span>
                </span>
                <svg viewBox="0 0 24 24" class="h-3.5 w-3.5 text-fg-muted transition-transform group-open:rotate-180" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                  <path d="m6 9 6 6 6-6" />
                </svg>
              </summary>
              <ol class="space-y-2.5 border-t border-line-subtle px-3 py-3">
                <li v-for="entry in announcement.history" :key="entry.date + entry.text" class="relative pl-3.5">
                  <span aria-hidden="true" class="absolute left-0 top-[7px] h-1.5 w-1.5 rounded-full bg-brand/50" />
                  <p class="text-[10px] tabular-nums text-fg-muted">{{ entry.date }}</p>
                  <p class="mt-0.5 text-xs leading-5 text-fg-secondary">{{ entry.text }}</p>
                </li>
              </ol>
            </details>
          </div>

          <!-- 底部操作 -->
          <div class="border-t border-line-subtle bg-surface-card/60 px-4 py-3.5 sm:px-5">
            <button ref="confirmButton" type="button"
                    class="min-h-11 w-full rounded-xl bg-brand px-4 text-sm font-semibold text-white shadow-sm transition hover:bg-brand-hover active:scale-[0.99]"
                    @click="dismiss">
              知道啦，开始学习
            </button>
            <p class="mt-2 text-center text-[11px] leading-4 text-fg-muted">{{ announcement.footnote }}</p>
          </div>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<style scoped>
.announce-enter-active,
.announce-leave-active {
  transition: opacity 0.22s ease;
}
.announce-enter-active .announce-panel,
.announce-leave-active .announce-panel {
  transition: transform 0.3s cubic-bezier(0.22, 1, 0.36, 1), opacity 0.22s ease;
}
.announce-enter-from,
.announce-leave-to {
  opacity: 0;
}
.announce-enter-from .announce-panel,
.announce-leave-to .announce-panel {
  opacity: 0;
  transform: translateY(28px) scale(0.98);
}
@media (min-width: 640px) {
  .announce-enter-from .announce-panel,
  .announce-leave-to .announce-panel {
    transform: translateY(12px) scale(0.97);
  }
}
</style>
