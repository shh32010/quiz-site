<script setup lang="ts">
// 刷题页：/practice?mode=chapter|paper|course&target=X  或  /practice?session=ID
// 未登录 = 游客模式：可试做，判分不落库、不进错题本
const api = useApi()
const route = useRoute()
const router = useRouter()

const sessionId = ref<number | null>(null)
const guest = ref(false)
const guestRows = ref<any[]>([])
const guestIdx = ref(0)

const question = ref<any>(null)
const total = ref(0)
const answer = ref('')
const multi = ref<string[]>([])
const fill = ref('')
const feedback = ref<any>(null)
const review = ref<any>(null)
const finished = ref<any>(null)
const loading = ref(true)
const error = ref('')
const ai = ref<{ loading: boolean; content: string; err: string }>({ loading: false, content: '', err: '' })
const fb = ref({ type: 'other', content: '', msg: '' })
const remain = ref(-1)
let timer: ReturnType<typeof setInterval> | null = null
const favorited = ref(false)
const relatedKps = ref<any[]>([])
const wrongModal = ref(false)
const correctHint = ref(false)
const guestState = ref<Record<number, { feedback: any; review: any; answer: string; multi: string[]; fill: string }>>({})
let advanceTimer: ReturnType<typeof setTimeout> | null = null

function clearAdvance() {
  if (advanceTimer) { clearTimeout(advanceTimer); advanceTimer = null }
}
const variant = ref<{ loading: boolean; content: string; err: string }>({ loading: false, content: '', err: '' })

const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
const options = computed<[string, string][]>(() => {
  try {
    return (Object.entries(JSON.parse(question.value?.optionJson || '{}')) as [string, string][])
      .map(([k, v]) => [k, formatText(v)])
  } catch { return [] }
})
const remainText = computed(() => {
  if (remain.value < 0) return ''
  const m = Math.floor(remain.value / 60), s = remain.value % 60
  return `${m}:${String(s).padStart(2, '0')}`
})

function resetAnswer() {
  answer.value = ''; multi.value = []; fill.value = ''
  feedback.value = null; review.value = null
  wrongModal.value = false; correctHint.value = false
  clearAdvance()
  ai.value = { loading: false, content: '', err: '' }
  fb.value = { type: 'other', content: '', msg: '' }
}

async function start() {
  const mode = String(route.query.mode || 'chapter')
  const target = String(route.query.target || '')
  try {
    if (!api.hasToken()) {
      // 游客：直接拉题，不建会话
      guest.value = true
      const qs = mode === 'paper' ? `paper=${target}`
        : mode === 'course' ? `course=${target}`
        : mode === 'kp' ? `kp=${target}` : `chapter=${target}`
      const r = await api.get<any>(`/api/questions?${qs}&size=20`)
      guestRows.value = r.rows ?? []
      if (!guestRows.value.length) throw new Error('该范围下没有题目')
      total.value = guestRows.value.length
      showGuest(0)
    } else if (route.query.session) {
      sessionId.value = Number(route.query.session)
      await loadStatus()
      await next()
    } else {
      const r = await api.post<any>('/api/practice/start', { mode, target, limit: 50 })
      sessionId.value = r.sessionId
      total.value = r.count
      await loadStatus()
      await next()
    }
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

function showGuest(i: number) {
  if (i < 0) return
  if (i >= guestRows.value.length) {
    question.value = null
    finished.value = { guest: true, score: 0, total_score: 0, correct_count: 0, question_count: guestRows.value.length }
    return
  }
  guestIdx.value = i
  const q = guestRows.value[i]
  resetAnswer()
  const saved = guestState.value[i]
  if (saved) {
    feedback.value = saved.feedback
    review.value = saved.review
    answer.value = saved.answer
    multi.value = saved.multi
    fill.value = saved.fill
  }
  question.value = { id: q.id, questionType: q.questionType, stem: q.stem, optionJson: q.optionJson,
    score: q.score, blankCount: q.blankCount, itemOrder: i + 1, total: guestRows.value.length, answered: i }
}

async function loadStatus() {
  try {
    const st = await api.get<any>(`/api/practice/${sessionId.value}/status`)
    remain.value = st.remainingSec
    if (st.limitSec > 0 && !st.finished) {
      timer = setInterval(async () => {
        remain.value = Math.max(0, remain.value - 1)
        if (remain.value === 0) {
          clearInterval(timer!); timer = null
          try { finished.value = await api.post(`/api/practice/${sessionId.value}/finish`, {}) } catch { /* 已结束 */ }
          question.value = null
        }
      }, 1000)
    }
  } catch { /* 忽略 */ }
}

async function next() {
  clearAdvance()
  if (guest.value) { showGuest(guestIdx.value + 1); return }
  resetAnswer()
  const r = await api.get<any>(`/api/practice/${sessionId.value}/next`)
  if (r.kind === 'done') {
    finished.value = await api.post(`/api/practice/${sessionId.value}/finish`, {})
    question.value = null
    return
  }
  question.value = r.question
  total.value = r.question.total
}

async function loadItem(order: number) {
  if (guest.value) { showGuest(order - 1); return }
  resetAnswer()
  try {
    const r = await api.get<any>(`/api/practice/${sessionId.value}/item/${order}`)
    if (r.kind === 'done') {
      finished.value = await api.post(`/api/practice/${sessionId.value}/finish`, {})
      question.value = null
      return
    }
    const q = r.question
    question.value = q
    total.value = q.total
    if (q.answered) {
      feedback.value = { is_correct: q.isCorrect, score_got: q.scoreGot, max_score: q.score }
      const raw = q.userAnswer ?? ''
      if (q.questionType === 2) multi.value = raw ? String(raw).split(',') : []
      else if (q.questionType === 4 || q.questionType === 5) fill.value = String(raw)
      else answer.value = String(raw)
      try {
        review.value = await api.get(`/api/practice/${sessionId.value}/review/${q.id}`)
      } catch { review.value = null }
    }
  } catch (e: any) {
    error.value = e.message
  }
}

async function goPrev() {
  clearAdvance()
  wrongModal.value = false
  if (!question.value) return
  const order = question.value.itemOrder ?? 1
  if (order <= 1) return
  if (guest.value) { showGuest(order - 2); return }
  await loadItem(order - 1)
}

async function goNext() {
  clearAdvance()
  wrongModal.value = false
  if (!question.value) return
  const order = question.value.itemOrder ?? 1
  if (guest.value) { showGuest(order); return }
  await loadItem(order + 1)
}

async function submit() {
  const q = question.value
  let payload = ''
  if (q.questionType === 2) payload = multi.value.slice().sort().join(',')
  else if (q.questionType === 4 || q.questionType === 5) payload = fill.value
  else payload = answer.value

  if (guest.value) {
    const r = await api.post<any>('/api/guest/answer', { questionId: q.id, answer: payload })
    feedback.value = r
    review.value = { correct: r.correct, analysis: r.analysis }
    guestState.value[guestIdx.value] = {
      feedback: r, review: { correct: r.correct, analysis: r.analysis },
      answer: answer.value, multi: [...multi.value], fill: fill.value,
    }
  } else {
    feedback.value = await api.post(`/api/practice/${sessionId.value}/answer`, { questionId: q.id, answer: payload })
    review.value = await api.get(`/api/practice/${sessionId.value}/review/${q.id}`)
  }

  if (feedback.value?.is_correct) {
    correctHint.value = true
    advanceTimer = setTimeout(() => { correctHint.value = false; goNext() }, 650)
  } else {
    wrongModal.value = true
  }
}

async function askAi(guide = false) {
  if (guest.value) { ai.value = { loading: false, content: '', err: '登录后可使用 AI 答疑' }; return }
  ai.value = { loading: true, content: '', err: '' }
  try {
    const r = await api.post<{ content: string }>('/api/ai/explain', {
      questionId: question.value.id, mode: guide ? 'guide' : 'explain' })
    ai.value = { loading: false, content: r.content, err: '' }
  } catch (e: any) {
    ai.value = { loading: false, content: '', err: e.message }
  }
}

async function toggleFav() {
  if (guest.value) return
  try {
    const id = question.value.id
    const r: any = favorited.value
      ? await api.del(`/api/favorites/${id}`)
      : await api.post(`/api/favorites/${id}`, {})
    favorited.value = Boolean(r.favorited)
  } catch { /* 忽略 */ }
}

async function askVariant() {
  if (guest.value) { variant.value = { loading: false, content: '', err: '登录后可使用' }; return }
  variant.value = { loading: true, content: '', err: '' }
  try {
    const r = await api.post<{ content: string }>('/api/ai/variant', { questionId: question.value.id })
    variant.value = { loading: false, content: r.content, err: '' }
  } catch (e: any) {
    variant.value = { loading: false, content: '', err: e.message }
  }
}

async function sendFeedback() {
  if (guest.value) { fb.value.msg = '登录后可提交反馈'; return }
  if (!fb.value.content.trim()) { fb.value.msg = '请填写问题描述'; return }
  try {
    await api.post('/api/feedback', { questionId: question.value.id, type: fb.value.type, content: fb.value.content })
    fb.value = { type: 'other', content: '', msg: '✓ 已提交，谢谢反馈' }
  } catch (e: any) { fb.value.msg = e.message }
}

async function loadRelated(id: number) {
  try {
    relatedKps.value = await api.get<any[]>(`/api/questions/${id}/knowledge`)
  } catch {
    relatedKps.value = []
  }
}

watch(() => question.value?.id, async (id) => {
  relatedKps.value = []
  if (!id) { favorited.value = false; return }
  loadRelated(id)
  if (guest.value) { favorited.value = false; return }
  try {
    const r = await api.get<any>(`/api/favorites/${id}`)
    favorited.value = Boolean(r.favorited)
  } catch { favorited.value = false }
})

onMounted(start)
onUnmounted(() => { if (timer) clearInterval(timer) })
</script>

<template>
  <section class="space-y-4">
    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>

    <div v-if="guest" class="rounded-lg border border-amber-300 bg-amber-50 px-4 py-2 text-xs text-amber-800">
      游客模式：可以试做，但**进度不会保存**。
      <NuxtLink to="/login" class="ml-1 underline">登录/注册</NuxtLink> 后可记录错题与学习报告。
    </div>

    <template v-if="finished">
      <div class="rounded-xl border border-slate-200 p-6 text-center">
        <p class="text-lg font-semibold text-slate-800">练习完成</p>
        <template v-if="finished.guest">
          <p class="mt-2 text-sm text-slate-500">游客模式未记录本次成绩</p>
          <NuxtLink to="/login" class="mt-4 inline-block rounded-lg bg-blue-600 px-5 py-2 text-sm text-white">
            登录后开始正式练习
          </NuxtLink>
        </template>
        <template v-else>
          <p class="mt-2 text-3xl font-bold text-blue-600">{{ finished.score }} / {{ finished.total_score }}</p>
          <p class="mt-1 text-sm text-slate-500">
            共 {{ finished.question_count }} 题，答对 {{ finished.correct_count }} 题
          </p>
          <div class="mt-4 flex justify-center gap-3">
            <NuxtLink to="/chapters" class="rounded-lg border px-4 py-2 text-sm">返回章节</NuxtLink>
            <NuxtLink to="/wrong" class="rounded-lg border px-4 py-2 text-sm">查看错题</NuxtLink>
          </div>
        </template>
      </div>
    </template>

    <template v-else-if="question">
      <div class="flex flex-wrap items-center justify-between gap-2 text-sm text-slate-500">
        <button :disabled="(question.itemOrder ?? 1) <= 1" @click="goPrev"
                class="rounded border border-slate-300 px-2.5 py-1 text-xs disabled:opacity-40">上一题</button>
        <span>第 {{ question.itemOrder }} / {{ total }} 题</span>
        <span class="flex items-center gap-3">
          <span v-if="remain >= 0" class="font-mono" :class="remain < 300 ? 'text-red-600' : ''">
            ⏱ {{ remainText }}
          </span>
          <span>{{ TYPE_LABEL[question.questionType] }} · {{ question.score }} 分</span>
        </span>
        <button :disabled="(question.itemOrder ?? 1) >= total" @click="goNext"
                class="rounded border border-slate-300 px-2.5 py-1 text-xs disabled:opacity-40">下一题</button>
      </div>

      <p v-if="correctHint" class="rounded-lg bg-green-50 px-3 py-2 text-sm text-green-700">
        ✓ 答对了，自动下一题…
      </p>

      <div class="rounded-xl border border-slate-200 p-5">
        <p class="whitespace-pre-wrap text-base leading-7 text-slate-800">{{ formatText(question.stem) }}</p>

        <div v-if="relatedKps.length" class="mt-2 flex flex-wrap items-center gap-1.5">
          <span class="text-xs text-slate-400">相关知识点：</span>
          <NuxtLink v-for="k in relatedKps" :key="k.id" :to="`/knowledge?kp=${k.id}`"
                    class="rounded bg-slate-100 px-1.5 py-0.5 text-[11px] text-slate-600 hover:bg-blue-50 hover:text-blue-700"
                    :title="k.nodeName">
            {{ k.title }}
          </NuxtLink>
        </div>

        <div v-if="question.questionType === 1 || question.questionType === 3" class="mt-4 space-y-2">
          <template v-if="options.length">
            <label v-for="[k, v] in options" :key="k"
                   class="flex cursor-pointer items-start gap-2 rounded-lg border p-2.5 text-sm"
                   :class="answer === k ? 'border-blue-500 bg-blue-50' : 'border-slate-200'">
              <input v-model="answer" type="radio" :value="k" :disabled="!!feedback" class="mt-1" />
              <span>{{ k }}. {{ v }}</span>
            </label>
          </template>
          <template v-else>
            <label class="flex cursor-pointer items-center gap-2 rounded-lg border p-2.5 text-sm"
                   :class="answer === 'A' ? 'border-blue-500 bg-blue-50' : 'border-slate-200'">
              <input v-model="answer" type="radio" value="A" :disabled="!!feedback" /> 对
            </label>
            <label class="flex cursor-pointer items-center gap-2 rounded-lg border p-2.5 text-sm"
                   :class="answer === 'B' ? 'border-blue-500 bg-blue-50' : 'border-slate-200'">
              <input v-model="answer" type="radio" value="B" :disabled="!!feedback" /> 错
            </label>
          </template>
        </div>

        <div v-else-if="question.questionType === 2" class="mt-4 space-y-2">
          <label v-for="[k, v] in options" :key="k"
                 class="flex cursor-pointer items-start gap-2 rounded-lg border p-2.5 text-sm"
                 :class="multi.includes(k) ? 'border-blue-500 bg-blue-50' : 'border-slate-200'">
            <input v-model="multi" type="checkbox" :value="k" :disabled="!!feedback" class="mt-1" />
            <span>{{ k }}. {{ v }}</span>
          </label>
        </div>

        <div v-else class="mt-4">
          <textarea v-model="fill" :disabled="!!feedback" :rows="question.questionType === 5 ? 5 : 3"
                    placeholder="多空用中文分号「；」分隔；程序题可直接按行输入"
                    class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
        </div>

        <button v-if="!feedback" :disabled="!answer && !multi.length && !fill"
                class="mt-4 rounded-lg bg-blue-600 px-5 py-2 text-sm font-medium text-white disabled:opacity-40"
                @click="submit">提交</button>
      </div>

      <div v-if="feedback" class="rounded-xl border p-5 text-sm"
           :class="feedback.is_correct ? 'border-green-300 bg-green-50' : 'border-red-300 bg-red-50'">
        <p class="font-semibold" :class="feedback.is_correct ? 'text-green-700' : 'text-red-700'">
          {{ feedback.is_correct ? '✓ 回答正确' : '✗ 回答错误' }}
          （得分 {{ feedback.score_got }} / {{ feedback.max_score }}）
        </p>
        <p v-if="review" class="mt-2 whitespace-pre-wrap text-slate-700"><b>正确答案：</b>{{ formatText(review.correct) }}</p>
        <p v-if="review?.analysis" class="mt-1 whitespace-pre-wrap text-slate-600">
          <b>解析：</b>{{ formatText(review.analysis) }}
        </p>
        <div class="mt-3 flex flex-wrap items-center gap-2">
          <button class="rounded-lg bg-slate-800 px-5 py-2 text-sm text-white" @click="goNext">下一题</button>
          <button class="rounded-lg border border-slate-300 px-3 py-2 text-xs" @click="askAi(false)">AI 讲解</button>
          <button class="rounded-lg border border-slate-300 px-3 py-2 text-xs" @click="askAi(true)">引导思考</button>
          <button class="rounded-lg border border-slate-300 px-3 py-2 text-xs" @click="askVariant">举一反三</button>
          <button class="rounded-lg border border-slate-300 px-3 py-2 text-xs" @click="toggleFav">
            {{ favorited ? '★ 已收藏' : '☆ 收藏' }}
          </button>
        </div>

        <div v-if="variant.loading" class="mt-3 text-xs text-slate-500">正在生成变式题…</div>
        <div v-if="variant.err" class="mt-3 text-xs text-red-600">{{ variant.err }}</div>
        <div v-if="variant.content" class="mt-3 whitespace-pre-wrap rounded-lg bg-white/70 p-3 text-sm text-slate-700">
          <b>同考点变式题：</b>{{ variant.content }}
        </div>

        <div v-if="ai.loading" class="mt-3 text-xs text-slate-500">AI 思考中…</div>
        <div v-if="ai.err" class="mt-3 text-xs text-red-600">{{ ai.err }}</div>
        <div v-if="ai.content" class="mt-3 whitespace-pre-wrap rounded-lg bg-white/70 p-3 text-sm text-slate-700">
          {{ ai.content }}
        </div>

        <details class="mt-3 text-xs">
          <summary class="cursor-pointer text-slate-500">题目有误？点此反馈</summary>
          <div class="mt-2 space-y-2">
            <select v-model="fb.type" class="rounded border border-slate-300 px-2 py-1">
              <option value="answer">答案错误</option>
              <option value="stem">题干错误</option>
              <option value="option">选项错误</option>
              <option value="image">图片问题</option>
              <option value="other">其他</option>
            </select>
            <textarea v-model="fb.content" rows="2" placeholder="请描述问题"
                      class="w-full rounded border border-slate-300 px-2 py-1" />
            <button class="rounded bg-slate-700 px-3 py-1 text-white" @click="sendFeedback">提交反馈</button>
            <span v-if="fb.msg" class="ml-2 text-slate-600">{{ fb.msg }}</span>
          </div>
        </details>
      </div>
    </template>

    <p v-else-if="loading" class="text-sm text-slate-500">加载中…</p>

    <!-- 答错弹窗：正确答案 + 解析 -->
    <div v-if="wrongModal" class="fixed inset-0 z-50 flex items-center justify-center bg-black/40 p-4"
         @click.self="wrongModal = false">
      <div class="max-h-[80vh] w-full max-w-lg overflow-auto rounded-xl bg-white p-5 shadow-xl">
        <p class="text-base font-semibold text-red-600">✗ 回答错误</p>
        <p v-if="review" class="mt-2 whitespace-pre-wrap text-sm text-slate-700">
          <b>正确答案：</b>{{ formatText(review.correct) }}
        </p>
        <p v-if="review?.analysis" class="mt-2 whitespace-pre-wrap text-sm leading-6 text-slate-600">
          <b>解析：</b>{{ formatText(review.analysis) }}
        </p>
        <div class="mt-4 flex justify-end gap-2">
          <button class="rounded-lg border border-slate-300 px-4 py-2 text-sm" @click="wrongModal = false">关闭</button>
          <button class="rounded-lg bg-blue-600 px-4 py-2 text-sm text-white" @click="goNext">下一题</button>
        </div>
      </div>
    </div>
  </section>
</template>
