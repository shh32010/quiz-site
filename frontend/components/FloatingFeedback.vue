<script setup lang="ts">
// 「我的」页悬浮反馈窗：直接给作者留言，复用现有 /api/feedback
const api = useApi()
const { show: showAnnouncement } = useAnnouncement()

const MAX_CONTENT = 800
const categories = [
  { key: 'feature', label: '功能建议', icon: '💡' },
  { key: 'content', label: '内容纠错', icon: '✏️' },
  { key: 'usage', label: '使用问题', icon: '🧭' },
  { key: 'other', label: '其他', icon: '💬' },
] as const

type CategoryKey = typeof categories[number]['key']

// 等客户端挂载后再渲染 Teleport，避免 SSR 水合时 teleport 锚点错位
const mounted = ref(false)
const open = ref(false)
const category = ref<CategoryKey>('feature')
const content = ref('')
const contact = ref('')
const sending = ref(false)
const error = ref('')
const done = ref(false)
const textarea = ref<HTMLTextAreaElement | null>(null)
const panel = ref<HTMLElement | null>(null)
const againButton = ref<HTMLButtonElement | null>(null)
let lastFocused: HTMLElement | null = null

const activeCategory = computed(() =>
  categories.find(item => item.key === category.value) ?? categories[3])

useOverlayScrollLock(open)

function openPanel() {
  // 发送成功后再次打开时回到新表单，而不是停在“已送达”
  if (done.value) reset()
  lastFocused = document.activeElement as HTMLElement | null
  open.value = true
  error.value = ''
  nextTick(() => textarea.value?.focus())
}

function closePanel() {
  open.value = false
  lastFocused?.focus?.()
  lastFocused = null
}

function reset() {
  content.value = ''
  contact.value = ''
  error.value = ''
  done.value = false
  nextTick(() => textarea.value?.focus())
}

function viewAnnouncement() {
  open.value = false
  showAnnouncement()
}

async function send() {
  if (sending.value) return
  const text = content.value.trim()
  if (!text) {
    error.value = '请先写点内容，方便作者了解情况'
    return
  }
  sending.value = true
  error.value = ''
  try {
    const contactLine = contact.value.trim() ? `\n联系方式：${contact.value.trim()}` : ''
    await api.post('/api/feedback', {
      questionId: null,
      type: 'other',
      content: `【${activeCategory.value.label}】${text}${contactLine}`,
    })
    done.value = true
    content.value = ''
    contact.value = ''
  } catch (e: any) {
    error.value = e.message ?? '发送失败，请稍后重试'
  } finally {
    sending.value = false
  }
}

watch(content, () => {
  if (error.value) error.value = ''
})
watch(done, (value) => {
  if (value) nextTick(() => againButton.value?.focus())
})

/** Tab 焦点限制在面板内，避免走到背后的页面 */
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
  if (!open.value) return
  if (e.key === 'Escape') {
    e.preventDefault()
    closePanel()
  } else if (e.key === 'Tab') {
    trapTab(e)
  }
}

onMounted(() => {
  mounted.value = true
  window.addEventListener('keydown', onKeydown)
})
onUnmounted(() => window.removeEventListener('keydown', onKeydown))
</script>

<template>
  <Teleport v-if="mounted" to="body">
    <!-- 悬浮按钮 -->
    <div class="fixed bottom-[calc(4.25rem+env(safe-area-inset-bottom))] right-3 z-40 print:hidden sm:right-4 lg:bottom-8 lg:right-6">
      <span aria-hidden="true" class="quiz-halo pointer-events-none absolute inset-0 rounded-full bg-brand/25" />
      <button type="button"
              class="relative flex h-11 w-11 items-center justify-center gap-2 rounded-full bg-gradient-to-br from-brand to-indigo-600 text-sm font-semibold text-white shadow-lg shadow-brand/30 transition duration-200 hover:-translate-y-0.5 hover:shadow-xl hover:shadow-brand/35 active:translate-y-0 sm:h-12 sm:w-auto sm:px-4"
              aria-label="联系作者，提交反馈" @click="openPanel">
        <svg viewBox="0 0 24 24" class="h-5 w-5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
          <path d="M21 11.5a8.4 8.4 0 0 1-9 8.4 9.5 9.5 0 0 1-3.2-.6L3 21l1.7-4.4A8.2 8.2 0 0 1 4 11.5a8.4 8.4 0 0 1 9-8.4 8.4 8.4 0 0 1 8 8.4Z" />
          <path d="M8.5 10.5h.01M12 10.5h.01M15.5 10.5h.01" />
        </svg>
        <span class="hidden sm:inline">联系作者</span>
      </button>
    </div>

    <!-- 反馈面板 -->
    <Transition name="contact">
      <div v-if="open"
           class="fixed inset-0 z-[60] flex items-end justify-center bg-black/50 backdrop-blur-[2px] sm:items-center sm:p-4"
           @click.self="closePanel">
        <div ref="panel" class="contact-panel w-full overflow-hidden rounded-t-3xl border border-line-subtle bg-surface-elevated shadow-2xl sm:max-w-md sm:rounded-3xl"
             role="dialog" aria-modal="true" aria-labelledby="contact-author-title">
          <div class="h-1 bg-gradient-to-r from-brand via-indigo-500 to-amber-400" />

          <!-- 对话式头部 -->
          <div class="flex items-start gap-3 px-5 pb-4 pt-4">
            <div class="relative grid h-11 w-11 shrink-0 place-items-center rounded-2xl bg-gradient-to-br from-brand to-indigo-600 text-base font-bold text-white shadow-md shadow-brand/20">
              作
              <span class="absolute -bottom-0.5 -right-0.5 h-3 w-3 rounded-full border-2 border-surface-elevated bg-green-500" aria-hidden="true" />
            </div>
            <div class="min-w-0 flex-1">
              <h2 id="contact-author-title" class="text-base font-bold text-fg-primary">和作者聊聊</h2>
              <p class="mt-0.5 text-xs leading-5 text-fg-secondary">内容纠错、功能建议、使用问题，都可以直接说。</p>
            </div>
            <button type="button"
                    class="grid h-11 w-11 shrink-0 place-items-center rounded-full text-fg-muted transition hover:bg-surface-muted hover:text-fg-primary"
                    aria-label="关闭反馈窗口" @click="closePanel">
              <svg viewBox="0 0 24 24" class="h-4 w-4" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round">
                <path d="m6 6 12 12M18 6 6 18" />
              </svg>
            </button>
          </div>

          <!-- 成功态 -->
          <div v-if="done" class="px-5 pb-6 pt-2 text-center" role="status" aria-live="polite">
            <div class="quiz-pop mx-auto grid h-14 w-14 place-items-center rounded-full bg-success-bg text-success-fg">
              <svg viewBox="0 0 24 24" class="h-7 w-7" fill="none" stroke="currentColor" stroke-width="2.2" stroke-linecap="round" stroke-linejoin="round">
                <path d="m5 12.5 4.5 4.5L19 7.5" />
              </svg>
            </div>
            <p class="mt-3 font-semibold text-fg-primary">反馈已送达</p>
            <p class="mt-1 text-sm leading-6 text-fg-muted">作者会尽快查看，感谢你让题库变得更好。</p>
            <div class="mt-4 flex gap-2">
              <button ref="againButton" type="button"
                      class="min-h-10 flex-1 rounded-xl border border-line-strong bg-surface-card text-sm text-fg-secondary transition hover:border-brand hover:text-brand"
                      @click="reset">再写一条</button>
              <button type="button"
                      class="min-h-10 flex-1 rounded-xl bg-brand text-sm font-medium text-white transition hover:bg-brand-hover"
                      @click="closePanel">关闭</button>
            </div>
          </div>

          <!-- 表单态 -->
          <template v-else>
            <div class="px-5">
              <p class="text-[11px] font-semibold uppercase tracking-wide text-fg-muted">反馈类型</p>
              <div class="mt-1.5 flex flex-wrap gap-1.5">
                <button v-for="item in categories" :key="item.key" type="button"
                        class="min-h-10 rounded-full border px-2.5 text-xs font-medium transition"
                        :class="category === item.key
                          ? 'border-brand bg-brand-soft text-brand-on-soft'
                          : 'border-line-subtle bg-surface-card text-fg-secondary hover:border-brand/40 hover:text-brand'"
                        :aria-pressed="category === item.key"
                        @click="category = item.key">
                  <span class="mr-0.5">{{ item.icon }}</span>{{ item.label }}
                </button>
              </div>

              <div class="mt-3">
                <div class="flex items-center justify-between">
                  <label for="contact-content" class="text-[11px] font-semibold uppercase tracking-wide text-fg-muted">想说的话</label>
                  <span class="text-[11px] tabular-nums text-fg-muted">{{ content.length }}/{{ MAX_CONTENT }}</span>
                </div>
                <textarea id="contact-content" ref="textarea" v-model="content" :maxlength="MAX_CONTENT" rows="4"
                          placeholder="例如：这道题的答案好像不对 / 希望增加错题导出 / 手机上字号有点小…"
                          class="mt-1.5 w-full resize-none rounded-xl border border-line-strong bg-surface-card px-3 py-2.5 text-sm leading-6 text-fg-primary outline-none transition placeholder:text-fg-muted focus:border-brand focus:ring-2 focus:ring-brand/15"
                          @keydown.ctrl.enter.prevent="send" @keydown.meta.enter.prevent="send" />
              </div>

              <div class="mt-3">
                <label for="contact-way" class="text-[11px] font-semibold uppercase tracking-wide text-fg-muted">联系方式（选填）</label>
                <input id="contact-way" v-model="contact" maxlength="80" type="text"
                       placeholder="邮箱或 QQ，方便作者回复你"
                       class="mt-1.5 min-h-10 w-full rounded-xl border border-line-strong bg-surface-card px-3 text-sm text-fg-primary outline-none transition placeholder:text-fg-muted focus:border-brand focus:ring-2 focus:ring-brand/15" />
              </div>

              <p v-if="error" class="mt-2 text-xs text-danger-fg" role="alert">{{ error }}</p>
            </div>

            <div class="mt-4 border-t border-line-subtle bg-surface-muted/40 px-5 py-3.5">
              <button type="button"
                      class="flex min-h-11 w-full items-center justify-center gap-2 rounded-xl bg-brand text-sm font-semibold text-white shadow-sm transition hover:bg-brand-hover active:scale-[0.99] disabled:cursor-not-allowed disabled:opacity-50"
                      :disabled="sending || !content.trim()" @click="send">
                <span v-if="sending" class="h-3.5 w-3.5 animate-spin rounded-full border-2 border-white border-t-transparent" />
                {{ sending ? '发送中…' : '发送给作者' }}
              </button>
              <div class="mt-2 flex items-center justify-between gap-2 text-[11px] leading-4 text-fg-muted">
                <span>反馈只进入后台，不会公开</span>
                <button type="button" class="shrink-0 text-brand hover:underline" @click="viewAnnouncement">查看站内公告</button>
              </div>
            </div>
          </template>
        </div>
      </div>
    </Transition>
  </Teleport>
</template>

<style scoped>
.contact-enter-active,
.contact-leave-active {
  transition: opacity 0.22s ease;
}
.contact-enter-active .contact-panel,
.contact-leave-active .contact-panel {
  transition: transform 0.3s cubic-bezier(0.22, 1, 0.36, 1), opacity 0.22s ease;
}
.contact-enter-from,
.contact-leave-to {
  opacity: 0;
}
.contact-enter-from .contact-panel,
.contact-leave-to .contact-panel {
  opacity: 0;
  transform: translateY(28px) scale(0.98);
}
@media (min-width: 640px) {
  .contact-enter-from .contact-panel,
  .contact-leave-to .contact-panel {
    transform: translateY(12px) scale(0.97);
  }
}
</style>
