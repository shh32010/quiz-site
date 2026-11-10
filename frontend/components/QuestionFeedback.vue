<script setup lang="ts">
// 题干旁的常驻反馈入口：做题过程中随时可以报错，不必等到判分后
const props = withDefaults(defineProps<{
  questionId: number
  guest?: boolean
}>(), {
  guest: false,
})

const MAX_CONTENT = 500
const api = useApi()
const route = useRoute()

const open = ref(false)
const type = ref('answer')
const content = ref('')
// 按题目记录提交中状态：切题后自动解锁，同一题收起再打开也不会重复提交
const sendingFor = ref<number | null>(null)
const sending = computed(() => sendingFor.value === props.questionId)
const error = ref('')
const done = ref(false)
const similarCount = ref(0)
const textarea = ref<HTMLTextAreaElement | null>(null)

const types = [
  { key: 'answer', label: '答案错误' },
  { key: 'stem', label: '题干错误' },
  { key: 'option', label: '选项错误' },
  { key: 'image', label: '图片问题' },
  { key: 'other', label: '其他' },
]

const loginTo = computed(() => ({ path: '/login', query: { redirect: route.fullPath } }))
const activeTypeLabel = computed(() => types.find(item => item.key === type.value)?.label ?? '其他')

function toggle() {
  open.value = !open.value
  error.value = ''
  if (open.value && !props.guest) {
    nextTick(() => textarea.value?.focus())
  }
}

function reset() {
  open.value = false
  type.value = 'answer'
  content.value = ''
  error.value = ''
  done.value = false
  similarCount.value = 0
}

function again() {
  done.value = false
  content.value = ''
  error.value = ''
  similarCount.value = 0
  nextTick(() => textarea.value?.focus())
}

async function send() {
  if (sending.value) return
  // 内容选填：没写具体描述时，用类型作为默认内容，后台仍能定位
  const text = content.value.trim() || `未填写具体描述（${activeTypeLabel.value}）`
  const qid = props.questionId
  sendingFor.value = qid
  error.value = ''
  try {
    const result = await api.post<any>('/api/feedback', { questionId: qid, type: type.value, content: text })
    if (props.questionId === qid) {
      done.value = true
      similarCount.value = Number(result?.similarCount ?? 0)
    }
  } catch (e: any) {
    if (props.questionId === qid) error.value = e.message ?? '提交失败，请稍后重试'
  } finally {
    if (sendingFor.value === qid) sendingFor.value = null
  }
}

watch(() => props.questionId, reset)
watch(content, () => {
  if (error.value) error.value = ''
})
</script>

<template>
  <div class="print:hidden" @keydown.stop>
    <div class="flex justify-end">
      <button type="button"
              class="inline-flex min-h-9 items-center gap-1 rounded-full border border-line-subtle bg-surface-card px-2.5 py-1 text-xs text-fg-muted transition hover:border-brand hover:text-brand"
              :aria-expanded="open" aria-controls="question-feedback-panel" @click="toggle">
        <svg viewBox="0 0 24 24" class="h-3.5 w-3.5" fill="none" stroke="currentColor" stroke-width="1.8" stroke-linecap="round" stroke-linejoin="round">
          <path d="M5 21V4.5A1.5 1.5 0 0 1 6.5 3H18l-2.5 4.5L18 12H6.5" />
        </svg>
        题目有误？反馈
      </button>
    </div>

    <Transition name="qfb">
      <div v-if="open" id="question-feedback-panel"
           class="qfb-panel mt-2 rounded-2xl border border-line-subtle bg-surface-muted/50 p-3.5 text-left">
        <!-- 游客 -->
        <div v-if="guest" class="flex flex-wrap items-center justify-between gap-2">
          <p class="text-xs leading-5 text-fg-secondary">登录后可以向作者提交题目问题。</p>
          <NuxtLink :to="loginTo"
                    class="rounded-lg bg-brand px-3 py-1.5 text-xs font-medium text-white transition hover:bg-brand-hover">
            去登录
          </NuxtLink>
        </div>

        <!-- 成功态 -->
        <div v-else-if="done" class="flex flex-wrap items-center gap-2" role="status" aria-live="polite">
          <span class="grid h-6 w-6 place-items-center rounded-full bg-success-bg text-xs text-success-fg">✓</span>
          <p class="flex-1 text-xs leading-5 text-fg-secondary">
            已收到，作者会核实处理，感谢你的反馈。
            <span v-if="similarCount > 0">同类题还有 {{ similarCount }} 道，会一并检查。</span>
          </p>
          <button type="button" class="rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-2.5 py-1 text-xs text-fg-secondary hover:border-brand hover:text-brand"
                  @click="again">再反馈一条</button>
          <button type="button" class="rounded-lg px-2.5 py-1 text-xs text-fg-muted hover:text-fg-primary" @click="reset">收起</button>
        </div>

        <!-- 表单 -->
        <template v-else>
          <div class="flex items-center justify-between gap-2">
            <p class="text-sm font-medium text-fg-primary">反馈这道题</p>
            <button type="button" class="rounded-lg px-1.5 py-0.5 text-xs text-fg-muted hover:text-fg-primary" @click="reset">收起</button>
          </div>
          <p class="mt-0.5 text-[11px] text-fg-muted">选择问题类型，说明具体情况即可，不需要等判分。</p>

          <div class="mt-2 flex flex-wrap gap-1.5">
            <button v-for="item in types" :key="item.key" type="button"
                    class="min-h-9 rounded-full border px-2.5 text-xs transition"
                    :class="type === item.key
                      ? 'border-brand bg-brand-soft font-medium text-brand-on-soft'
                      : 'border-line-subtle bg-surface-card text-fg-secondary hover:border-brand/40 hover:text-brand'"
                    :aria-pressed="type === item.key" @click="type = item.key">
              {{ item.label }}
            </button>
          </div>

          <textarea ref="textarea" v-model="content" :maxlength="MAX_CONTENT" rows="3"
                    aria-label="题目反馈内容"
                    placeholder="选填：正确答案应该是 B / 题干公式显示不完整 / 配图和题目对不上…"
                    class="mt-2 w-full resize-none rounded-xl border border-line-strong bg-surface-card px-3 py-2 text-sm leading-6 text-fg-primary outline-none transition placeholder:text-fg-muted focus:border-brand focus:ring-2 focus:ring-brand/15"
                    @keydown.ctrl.enter.prevent="send" @keydown.meta.enter.prevent="send" />

          <div class="mt-2 flex items-center justify-between gap-2">
            <span class="text-[11px] tabular-nums text-fg-muted">{{ content.length }}/{{ MAX_CONTENT }}</span>
            <div class="flex items-center gap-2">
              <button type="button" class="rounded-lg px-2.5 py-1 text-xs text-fg-muted hover:text-fg-primary" @click="reset">取消</button>
              <button type="button"
                      class="min-h-9 rounded-lg bg-brand px-3 text-xs font-medium text-white transition hover:bg-brand-hover disabled:cursor-not-allowed disabled:opacity-50"
                      :disabled="sending" @click="send">
                {{ sending ? '提交中…' : '提交反馈' }}
              </button>
            </div>
          </div>
          <p v-if="error" class="mt-1.5 text-xs text-danger-fg" role="alert">{{ error }}</p>
        </template>
      </div>
    </Transition>
  </div>
</template>

<style scoped>
.qfb-enter-active,
.qfb-leave-active {
  transition: opacity 0.18s ease, transform 0.24s cubic-bezier(0.22, 1, 0.36, 1);
}
.qfb-enter-from,
.qfb-leave-to {
  opacity: 0;
  transform: translateY(-6px);
}
</style>
