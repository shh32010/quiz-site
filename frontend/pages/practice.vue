<script setup lang="ts">
// 刷题页：/practice?mode=chapter|paper|course|kp|wrong|single&target=X
//          或 /practice?session=ID
// 未登录 = 游客模式：可试做，判分不落库、不进错题本
import { MODE_LABEL, TYPE_LABEL } from '~/utils/constants'

definePageMeta({ layout: 'immersive' })
useHead({ title: '刷题' })

const api = useApi()
const route = useRoute()
const router = useRouter()

const sessionId = ref<number | null>(null)
const guest = ref(false)
const guestRows = ref<any[]>([])
const guestIdx = ref(0)
const guestState = ref<Record<number, { feedback: any; review: any; answer: string; multi: string[]; fill: string }>>({})

const mode = ref('')
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
const notice = ref('')
const submitting = ref(false)
const navigating = ref(false)
const favorited = ref(false)
const relatedKps = ref<any[]>([])
const answerBox = ref<HTMLTextAreaElement | null>(null)
const ai = ref<{ loading: boolean; content: string; err: string }>({ loading: false, content: '', err: '' })
const variant = ref<{ loading: boolean; content: string; err: string }>({ loading: false, content: '', err: '' })

const remain = ref(-1)
let timer: ReturnType<typeof setInterval> | null = null
let advanceTimer: ReturnType<typeof setTimeout> | null = null
let disposed = false

const sheetOpen = ref(false)
const finishOpen = ref(false)
const helpOpen = ref(false)
const lightboxOpen = ref(false)
const lightboxIndex = ref(0)
const advancePending = ref(false)
const sheet = ref<{ total: number; answered: number; remaining: number; rows: any[] }>({
  total: 0, answered: 0, remaining: 0, rows: [],
})
const finishInfo = ref({ unanswered: 0, firstUnanswered: 1 })

/** 答题卡按题型分组：判断 → 单选 → 多选 → 填空 → 综合（按会话实际顺序） */
const sheetGroups = computed(() => {
  const rows = sheet.value.rows ?? []
  const groups = new Map<number, any[]>()
  for (const row of rows) {
    const t = Number(row.questionType)
    if (!groups.has(t)) groups.set(t, [])
    groups.get(t)!.push(row)
  }
  const present = new Set(rows.map(r => Number(r.questionType)))
  // 理论：单选→多选→判断→填空；实操：单选→判断→填空→综合
  const order = present.has(5) && !present.has(2) ? [1, 3, 4, 5] : [1, 2, 3, 4, 5]
  return [...groups.entries()]
    .sort((a, b) => {
      const ai = order.indexOf(a[0])
      const bi = order.indexOf(b[0])
      return (ai < 0 ? 99 : ai) - (bi < 0 ? 99 : bi)
    })
    .map(([type, list]) => ({
      type,
      rows: list,
      total: list.length,
      answered: list.filter(r => r.answered).length,
    }))
})
const sheetPct = computed(() =>
  sheet.value.total > 0 ? Math.round(sheet.value.answered / sheet.value.total * 100) : 0)
const sheetCorrect = computed(() =>
  (sheet.value.rows ?? []).filter(r => r.answered && r.isCorrect).length)
const sheetWrong = computed(() =>
  (sheet.value.rows ?? []).filter(r => r.answered && !r.isCorrect).length)

const modeLabel = computed(() => MODE_LABEL[mode.value] ?? '刷题')
const isPaper = computed(() => mode.value === 'paper')
const isSingle = computed(() => mode.value === 'single')
const canAutoNext = computed(() =>
  ['chapter', 'course', 'kp', 'wrong'].includes(mode.value)
  && !isPaper.value && !isSingle.value && total.value > 1)
const currentOrder = computed(() => Number(question.value?.itemOrder ?? 1))
const isLast = computed(() => Boolean(question.value) && currentOrder.value >= total.value)
const progressPercent = computed(() => total.value ? Math.min(100, Math.round(currentOrder.value / total.value * 100)) : 0)
const remainText = computed(() => {
  if (remain.value < 0) return ''
  const m = Math.floor(remain.value / 60), s = remain.value % 60
  return `${m}:${String(s).padStart(2, '0')}`
})
const options = computed<[string, string][]>(() => {
  try {
    return (Object.entries(JSON.parse(question.value?.optionJson || '{}')) as [string, string][])
      .map(([k, v]) => [k, formatText(v)] as [string, string])
      // 题库源数据存在 A,C,B,D 的 JSON 键顺序；展示统一按字母排序，答案仍按原键判分
      .sort(([a], [b]) => a.localeCompare(b, 'en', { numeric: true }))
  } catch { return [] }
})
// 判断题没有 optionJson 时用 A/B 表示对/错；单选异常缺项时也至少可点
const choiceOptions = computed<[string, string][]>(() => {
  if (options.value.length) return options.value
  if (question.value?.questionType === 1 || question.value?.questionType === 3) {
    return [['A', '正确'], ['B', '错误']]
  }
  return []
})
const images = computed<string[]>(() => {
  const raw = question.value?.imageUrls || question.value?.imageUrl || ''
  return String(raw).split(',').map(s => s.trim()).filter(Boolean)
})
const hasAnswer = computed(() => {
  if (!question.value) return false
  if (question.value.questionType === 2) return multi.value.length > 0
  if (question.value.questionType === 4 || question.value.questionType === 5) return Boolean(fill.value.trim())
  return Boolean(answer.value)
})
const correctKeys = computed<string[]>(() => {
  const raw = String(review.value?.correct ?? '')
  return raw.toUpperCase().match(/[A-H]/g) ?? []
})
const primaryLabel = computed(() => {
  if (submitting.value) return '处理中…'
  if (!feedback.value) {
    if (isPaper.value && !hasAnswer.value) return '跳过'
    return hasAnswer.value ? '提交' : '不会，看答案'
  }
  if (isSingle.value) return '返回'
  return isLast.value ? '交卷' : '下一题'
})

function clearAdvance() {
  if (advanceTimer) { clearTimeout(advanceTimer); advanceTimer = null }
  advancePending.value = false
}

function resetAnswer() {
  answer.value = ''; multi.value = []; fill.value = ''
  feedback.value = null; review.value = null
  lightboxOpen.value = false
  clearAdvance()
  ai.value = { loading: false, content: '', err: '' }
  variant.value = { loading: false, content: '', err: '' }
}

function applyQuestion(q: any, forceUnanswered = false) {
  resetAnswer()
  question.value = q
  total.value = Number(q.total ?? total.value)
  // /next 返回的是“本会话已答总数”，不是当前题是否已答；只有 item 的布尔 true 才加载复盘
  if (!forceUnanswered && q.answered === true) {
    feedback.value = { is_correct: q.isCorrect, score_got: q.scoreGot, max_score: q.score }
    const raw = q.userAnswer ?? ''
    if (q.questionType === 2) multi.value = raw ? String(raw).split(',') : []
    else if (q.questionType === 4 || q.questionType === 5) fill.value = String(raw)
    else answer.value = String(raw)
    loadReview(q.id)
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
  question.value = {
    id: q.id, questionType: q.questionType, stem: q.stem, optionJson: q.optionJson,
    score: q.score, blankCount: q.blankCount, imageUrl: q.imageUrl, imageUrls: q.imageUrls,
    chapterId: q.chapterId, chapterCode: q.chapterCode, chapterName: q.chapterName,
    chapterPath: q.chapterPath, itemOrder: i + 1, total: guestRows.value.length,
  }
  total.value = guestRows.value.length
}

async function loadStatus(): Promise<boolean> {
  if (!sessionId.value) return false
  try {
    const st = await api.get<any>(`/api/practice/${sessionId.value}/status`)
    mode.value = st.mode || mode.value
    remain.value = st.remainingSec
    if (st.finished) {
      // 已交卷会话不要重新拉题，直接去历史明细复盘
      await router.replace(`/history/${sessionId.value}`)
      return true
    }
    if (st.expired) {
      notice.value = '时间到，已自动交卷'
      await finishSession()
      return true
    }
    if (!disposed && st.limitSec > 0) {
      if (timer) clearInterval(timer)
      timer = setInterval(async () => {
        remain.value = Math.max(0, remain.value - 1)
        if (remain.value === 0) {
          if (timer) { clearInterval(timer); timer = null }
          notice.value = '时间到，已自动交卷'
          await finishSession()
        }
      }, 1000)
    }
  } catch { /* 状态失败不阻塞答题 */ }
  return false
}

async function loadSheet() {
  if (guest.value || !sessionId.value) return
  try {
    sheet.value = await api.get<any>(`/api/practice/${sessionId.value}/sheet`)
  } catch { /* 答题卡失败不影响答题 */ }
}

async function loadReview(qid: number) {
  if (guest.value || !sessionId.value) return
  try {
    const rv = await api.get(`/api/practice/${sessionId.value}/review/${qid}`)
    if (question.value?.id === qid) review.value = rv
  } catch { /* 保留反馈卡，解析可为空 */ }
}

async function start() {
  const qmode = String(route.query.mode || 'chapter')
  const target = String(route.query.target || '')
  const type = Number(route.query.type) || 0
  mode.value = qmode
  try {
    if (route.query.session && !api.hasToken()) throw new Error('请先登录后继续练习')
    if (qmode === 'wrong' && !api.hasToken()) throw new Error('错题复习需要登录')

    if (!api.hasToken()) {
      guest.value = true
      const qs = qmode === 'paper' ? `paper=${target}`
        : qmode === 'course' ? `course=${target}`
        : qmode === 'kp' ? `kp=${target}`
        : qmode === 'single' ? `id=${target}` : `chapter=${target}`
      const guestSize = qmode === 'paper' ? 200 : 20
      const typeQuery = type ? `&type=${type}` : ''
      const r = await api.get<any>(`/api/questions?${qs}&size=${guestSize}${typeQuery}`)
      guestRows.value = r.rows ?? []
      if (!guestRows.value.length) throw new Error('该范围下没有题目')
      total.value = guestRows.value.length
      showGuest(0)
      return
    }

    if (route.query.session) {
      sessionId.value = Number(route.query.session)
      if (await loadStatus()) return
      await loadSheet()
      await loadNextInitial()
      return
    }

    // 错题抽测可通过 ?limit=20 指定题量；默认保持原有 500/50
    const requested = Number(route.query.limit) || 0
    const limit = requested > 0
      ? Math.min(requested, 500)
      : (qmode === 'paper' || qmode === 'wrong' ? 500 : 50)
    const r = await api.post<any>('/api/practice/start', {
      mode: qmode, target, limit, ...(type ? { type } : {}),
    })
    sessionId.value = r.sessionId
    total.value = r.count
    if (await loadStatus()) return
    await loadSheet()
    await loadNextInitial()
  } catch (e: any) {
    error.value = e.message ?? '加载失败'
  } finally {
    loading.value = false
  }
}

async function loadNextInitial() {
  if (!sessionId.value) return
  const r = await api.get<any>(`/api/practice/${sessionId.value}/next`)
  if (r.kind === 'done') {
    // 全部答完但还没交卷：回到第 1 题让用户复盘，并打开答题卡，而不是只弹交卷框
    await loadSheet()
    if ((sheet.value.rows ?? []).length) {
      await navigate(1)
      sheetOpen.value = true
    } else {
      await requestFinish()
    }
    return
  }
  applyQuestion(r.question, true)
}

async function navigate(order: number) {
  if (guest.value) { showGuest(order - 1); return }
  if (!sessionId.value || navigating.value || submitting.value) return
  clearAdvance()
  navigating.value = true
  error.value = ''
  try {
    const r = await api.get<any>(`/api/practice/${sessionId.value}/item/${order}`)
    if (r.kind === 'done') { await requestFinish(); return }
    applyQuestion(r.question)
  } catch (e: any) {
    error.value = e.message ?? '加载题目失败'
  } finally {
    navigating.value = false
  }
}

async function goPrev() {
  clearAdvance()
  if (!question.value || submitting.value || navigating.value) return
  const order = currentOrder.value
  if (order <= 1) return
  await navigate(order - 1)
}

async function goNext() {
  clearAdvance()
  if (!question.value || submitting.value || navigating.value) return
  if (currentOrder.value >= total.value) {
    await requestFinish()
    return
  }
  await navigate(currentOrder.value + 1)
}

async function requestFinish() {
  if (guest.value) { finishGuest(); return }
  if (!sessionId.value) return
  await loadSheet()
  const rows = sheet.value.rows ?? []
  finishInfo.value = {
    unanswered: rows.length ? sheet.value.remaining : Math.max(0, total.value - (feedback.value ? 1 : 0)),
    firstUnanswered: rows.find(r => !r.answered)?.itemOrder ?? 1,
  }
  sheetOpen.value = false
  finishOpen.value = true
}

function finishGuest() {
  finished.value = {
    guest: true, score: 0, total_score: 0, correct_count: 0, question_count: total.value,
  }
  lightboxOpen.value = false
  question.value = null
}

async function finishSession() {
  if (!sessionId.value || submitting.value || finished.value) return
  submitting.value = true
  try {
    finished.value = await api.post(`/api/practice/${sessionId.value}/finish`, {})
    lightboxOpen.value = false
    question.value = null
    finishOpen.value = false
    sheetOpen.value = false
    if (timer) { clearInterval(timer); timer = null }
    clearAdvance()
  } catch (e: any) {
    error.value = e.message ?? '交卷失败，请重试'
  } finally {
    submitting.value = false
  }
}

function goFirstUnanswered() {
  const order = finishInfo.value.firstUnanswered
  finishOpen.value = false
  if (order && order !== currentOrder.value) navigate(order)
}

async function primaryAction() {
  if (!question.value || submitting.value || navigating.value) return
  if (!feedback.value) {
    if (isPaper.value && !hasAnswer.value) { await goNext(); return }
    await submit()
    return
  }
  if (isSingle.value) { exit(); return }
  if (isLast.value) { await requestFinish(); return }
  await goNext()
}

async function selectOption(rawKey: string) {
  if (!question.value || feedback.value || submitting.value) return
  // 数字键 1-9 映射为 A-I，字母键统一大写
  const key = /^[1-9]$/.test(rawKey) ? String.fromCharCode(64 + Number(rawKey)) : rawKey.toUpperCase()
  if (!choiceOptions.value.some(([k]) => k === key)) return
  clearAdvance()
  if (question.value.questionType === 2) {
    multi.value = multi.value.includes(key)
      ? multi.value.filter(k => k !== key)
      : [...multi.value, key]
    return
  }
  answer.value = key
  // 单选/判断：点击选项即判分；答对后由 submit 自动进入下一题
  await submit()
}

function optionSelected(key: string) {
  return question.value?.questionType === 2 ? multi.value.includes(key) : answer.value === key
}

function optionIsCorrect(key: string) {
  return Boolean(feedback.value) && correctKeys.value.includes(key)
}

function optionClass(key: string) {
  if (feedback.value) {
    if (optionIsCorrect(key)) return 'border-green-400 bg-green-50 text-green-900'
    if (optionSelected(key)) return 'border-red-400 bg-red-50 text-red-900'
    return 'border-slate-200 bg-white text-slate-500'
  }
  return optionSelected(key)
    ? 'border-blue-500 bg-blue-50 text-slate-900'
    : 'border-slate-200 bg-white text-slate-700 hover:border-blue-300'
}

async function submit() {
  const q = question.value
  if (!q || feedback.value || submitting.value || navigating.value) return
  const qid = q.id
  submitting.value = true
  error.value = ''
  try {
    let payload = ''
    if (q.questionType === 2) payload = multi.value.slice().sort().join(',')
    else if (q.questionType === 4 || q.questionType === 5) payload = fill.value
    else payload = answer.value

    if (guest.value) {
      const r = await api.post<any>('/api/guest/answer', { questionId: qid, answer: payload })
      const rv = { correct: r.correct, analysis: r.analysis, qcGrade: r.qcGrade }
      guestState.value[guestIdx.value] = {
        feedback: r, review: rv, answer: answer.value,
        multi: [...multi.value], fill: fill.value,
      }
      if (question.value?.id !== qid) return
      feedback.value = r
      review.value = rv
    } else {
      const result = await api.post<any>(`/api/practice/${sessionId.value}/answer`, { questionId: qid, answer: payload })
      const rv = await api.get<any>(`/api/practice/${sessionId.value}/review/${qid}`).catch(() => null)
      if (question.value?.id !== qid) return
      feedback.value = result
      review.value = rv
      if (!rv) notice.value = '答案已记录，但解析加载失败，可稍后重试'
      markSheetAnswered(qid, result)
    }

    if (canAutoNext.value && feedback.value?.is_correct && !isLast.value) {
      advancePending.value = true
      advanceTimer = setTimeout(() => {
        advancePending.value = false
        if (question.value?.id === qid) goNext()
      }, 1000)
    }
  } catch (e: any) {
    error.value = e.message ?? '提交失败，请重试'
  } finally {
    submitting.value = false
  }
}

function markSheetAnswered(qid: number, result: any) {
  const row = sheet.value.rows.find(r => Number(r.questionId) === qid)
  if (row) {
    row.answered = true
    row.isCorrect = result.is_correct
    row.scoreGot = result.score_got
  }
  const answered = sheet.value.rows.filter(r => r.answered).length
  sheet.value.answered = answered
  sheet.value.remaining = Math.max(0, sheet.value.rows.length - answered)
  if (!sheet.value.total) sheet.value.total = total.value
}

async function openSheet() {
  if (guest.value) return
  await loadSheet()
  sheetOpen.value = true
}

function jumpTo(order: number) {
  sheetOpen.value = false
  if (order !== currentOrder.value) navigate(order)
}

function exit() {
  // 从知识点阅读器进入时，练完回到原节/原知识点锚点
  const returnTo = String(route.query.return || '')
  if (returnTo.startsWith('/knowledge/section/')) {
    router.push(returnTo)
    return
  }
  const from = String(route.query.from || '')
  router.push(from.startsWith('/') && !from.startsWith('//') ? from : '/')
}

async function askAi(guide = false) {
  if (guest.value) { ai.value = { loading: false, content: '', err: '登录后可使用 AI 答疑' }; return }
  const qid = question.value?.id
  if (!qid) return
  ai.value = { loading: true, content: '', err: '' }
  try {
    const r = await api.post<{ content: string }>('/api/ai/explain', {
      questionId: qid, mode: guide ? 'guide' : 'explain',
    })
    if (question.value?.id !== qid) return
    ai.value = { loading: false, content: r.content, err: '' }
  } catch (e: any) {
    if (question.value?.id !== qid) return
    ai.value = { loading: false, content: '', err: e.message }
  }
}

async function toggleFav() {
  if (guest.value) return
  const id = question.value?.id
  if (!id) return
  try {
    const r: any = favorited.value
      ? await api.del(`/api/favorites/${id}`)
      : await api.post(`/api/favorites/${id}`, {})
    if (question.value?.id !== id) return
    favorited.value = Boolean(r.favorited)
  } catch { /* 忽略 */ }
}

async function askVariant() {
  if (guest.value) { variant.value = { loading: false, content: '', err: '登录后可使用' }; return }
  const qid = question.value?.id
  if (!qid) return
  variant.value = { loading: true, content: '', err: '' }
  try {
    const r = await api.post<{ content: string }>('/api/ai/variant', { questionId: qid })
    if (question.value?.id !== qid) return
    variant.value = { loading: false, content: r.content, err: '' }
  } catch (e: any) {
    if (question.value?.id !== qid) return
    variant.value = { loading: false, content: '', err: e.message }
  }
}

async function loadRelated(id: number) {
  try {
    const kps = await api.get<any[]>(`/api/questions/${id}/knowledge`)
    if (question.value?.id === id) relatedKps.value = kps
  } catch {
    if (question.value?.id === id) relatedKps.value = []
  }
}

watch(() => question.value?.id, async (id) => {
  relatedKps.value = []
  if (!id) { favorited.value = false; return }
  loadRelated(id)
  if (guest.value) { favorited.value = false; return }
  try {
    const r = await api.get<any>(`/api/favorites/${id}`)
    if (question.value?.id !== id) return
    favorited.value = Boolean(r.favorited)
  } catch {
    if (question.value?.id === id) favorited.value = false
  }
})

usePracticeKeys({
  isEnabled: () => Boolean(question.value) && !finished.value && !sheetOpen.value && !finishOpen.value
    && !helpOpen.value && !lightboxOpen.value,
  onSelect: selectOption,
  onSubmit: () => { primaryAction() },
  onNext: () => { goNext() },
  onPrev: () => { goPrev() },
  onHelp: () => { helpOpen.value = true },
  onCancelAdvance: clearAdvance,
})

onMounted(() => {
  window.addEventListener('pointerdown', clearAdvance)
  start()
})
onUnmounted(() => {
  disposed = true
  window.removeEventListener('pointerdown', clearAdvance)
  if (timer) clearInterval(timer)
  clearAdvance()
})
</script>

<template>
  <div class="min-h-screen text-fg-primary">
    <PracticeHeader :mode-label="modeLabel" :current-order="currentOrder" :total="total"
                    :progress-percent="progressPercent" :remain="remain" :remain-text="remainText"
                    :guest="guest" :has-question="Boolean(question)"
                    @exit="exit" @open-sheet="openSheet" />

    <main class="mx-auto max-w-3xl px-3 pb-28 pt-4 sm:max-w-4xl sm:px-4">
      <p v-if="error" class="mb-3 rounded-lg border border-red-200 bg-red-50 px-3 py-2 text-sm text-red-700">{{ error }}</p>
      <p v-if="notice" class="mb-3 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-sm text-amber-800">{{ notice }}</p>

      <div v-if="guest" class="mb-3 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
        游客模式：可以试做，但进度不会保存。
        <NuxtLink :to="{ path: '/login', query: { redirect: route.fullPath } }" class="underline">登录/注册</NuxtLink>
        后可记录错题与学习报告。
      </div>

      <PracticeResult v-if="finished" :finished="finished" @exit="exit" />

      <template v-else-if="question">
        <article class="min-w-0 overflow-hidden rounded-2xl border border-slate-200 bg-white p-4 shadow-sm sm:p-6">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <div class="flex flex-wrap items-center gap-2 text-xs text-slate-500">
              <span class="rounded-full bg-blue-50 px-2 py-0.5 text-blue-700">{{ TYPE_LABEL[question.questionType] ?? '题目' }}</span>
              <span>{{ question.score }} 分</span>
            </div>
            <span class="text-xs text-slate-400">第 {{ currentOrder }} 题</span>
          </div>
          <p v-if="question.chapterPath || question.chapterName"
             class="mt-1 max-w-full break-words text-xs leading-5 text-slate-500">
            {{ question.chapterPath || ((question.chapterCode ? question.chapterCode + ' ' : '') + question.chapterName) }}
          </p>

          <p class="mt-4 whitespace-pre-wrap break-words text-base leading-7 text-slate-900 md:text-[17px]">{{ formatText(question.stem) }}</p>
          <div v-if="images.length" class="mt-3 space-y-2">
            <button v-for="(src, i) in images" :key="i" type="button"
                    class="block w-fit max-w-full cursor-zoom-in text-left"
                    :aria-label="`放大第 ${i + 1} 张题目配图`" @click="lightboxIndex = i; lightboxOpen = true">
              <img :src="src" alt="题目配图"
                   class="question-img max-h-80 w-auto max-w-full object-contain" />
            </button>
            <p class="text-xs text-fg-muted">点击图片放大</p>
          </div>

          <QuestionFeedback class="mt-3" :question-id="question.id" :guest="guest" />

          <div v-if="relatedKps.length" class="mt-3 flex flex-wrap items-center gap-1.5">
            <span class="text-xs text-slate-400">相关知识点：</span>
            <NuxtLink v-for="k in relatedKps" :key="k.id" :to="`/knowledge?kp=${k.id}`"
                      class="rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600 hover:bg-blue-50 hover:text-blue-700"
                      :title="k.nodeName">{{ k.title }}</NuxtLink>
          </div>

          <div v-if="question.questionType === 1 || question.questionType === 3" class="mt-5 space-y-2">
            <label v-for="[k, v] in choiceOptions" :key="k"
                   class="flex cursor-pointer items-start gap-2.5 rounded-xl border p-3 text-sm transition-colors"
                   :class="optionClass(k)">
              <input v-model="answer" type="radio" :value="k" :disabled="Boolean(feedback)"
                     class="mt-1" @change="selectOption(k)" />
              <span class="min-w-0 flex-1"><b class="mr-1">{{ k }}.</b>{{ v }}</span>
              <span v-if="optionIsCorrect(k)" class="text-green-600">✓</span>
              <span v-else-if="feedback && optionSelected(k)" class="text-red-600">✗</span>
            </label>
          </div>

          <div v-else-if="question.questionType === 2" class="mt-5 space-y-2">
            <label v-for="[k, v] in choiceOptions" :key="k"
                   class="flex cursor-pointer items-start gap-2.5 rounded-xl border p-3 text-sm transition-colors"
                   :class="optionClass(k)">
              <input v-model="multi" type="checkbox" :value="k" :disabled="Boolean(feedback)" class="mt-1" />
              <span class="min-w-0 flex-1"><b class="mr-1">{{ k }}.</b>{{ v }}</span>
              <span v-if="optionIsCorrect(k)" class="text-green-600">✓</span>
              <span v-else-if="feedback && optionSelected(k)" class="text-red-600">✗</span>
            </label>
          </div>

          <div v-else class="mt-5">
            <textarea ref="answerBox" v-model="fill" :disabled="Boolean(feedback)"
                      data-practice-answer="true"
                      :rows="question.questionType === 5 ? 5 : 3"
                      placeholder="多空用中文分号「；」分隔；程序题可直接按行输入"
                      class="w-full rounded-xl border border-line-strong bg-surface-card px-3 py-2.5 text-base outline-none focus:border-brand sm:text-sm" />
          </div>

          <p v-if="!feedback" class="mt-3 text-xs text-slate-400">
            单选/判断点击选项即判分；多选、填空、综合按 Enter 或 Ctrl+Enter 提交；← → 可切题
          </p>

          <PracticeFeedbackCard v-if="feedback" :feedback="feedback" :review="review"
                                :advance-pending="advancePending" :ai="ai" :variant="variant"
                                :favorited="favorited"
                                @ask-ai="askAi" @ask-variant="askVariant" @toggle-fav="toggleFav" />
        </article>
      </template>

      <p v-else-if="loading" class="py-12 text-center text-sm text-slate-500">加载中…</p>
      <p v-else class="py-12 text-center text-sm text-slate-500">这个范围暂时没有可练习题。</p>
    </main>

    <div v-if="!finished && question" class="fixed inset-x-0 bottom-0 z-30 border-t border-line-subtle bg-surface-glass backdrop-blur">
      <div class="mx-auto flex max-w-3xl items-center gap-2 px-3 py-2.5 pb-[max(0.625rem,env(safe-area-inset-bottom))] sm:max-w-4xl sm:px-4">
        <UiButton variant="secondary" size="md" :disabled="currentOrder <= 1 || submitting || navigating" @click="goPrev">
          上一题
        </UiButton>
        <UiButton v-if="!guest" variant="ghost" size="md" @click="toggleFav">
          {{ favorited ? '★' : '☆' }}
        </UiButton>
        <UiButton variant="primary" size="lg" class="flex-1" :loading="submitting" :disabled="navigating" @click="primaryAction">
          {{ primaryLabel }}
        </UiButton>
      </div>
    </div>

    <PracticeSheet v-model="sheetOpen" :sheet="sheet" :groups="sheetGroups" :pct="sheetPct"
                   :correct="sheetCorrect" :wrong="sheetWrong" :current-order="currentOrder"
                   :submitting="submitting" @jump="jumpTo" @finish="requestFinish" />

    <PracticeFinishModal v-model="finishOpen" :info="finishInfo" :submitting="submitting"
                         @go-first="goFirstUnanswered" @finish="finishSession" />

    <UiModal v-model="helpOpen" title="键盘快捷键" size="sm">
      <dl class="space-y-2 text-sm text-slate-600">
        <div class="flex justify-between"><dt>选择选项</dt><dd class="text-slate-900">1-9 / A-H</dd></div>
        <div class="flex justify-between"><dt>提交 / 下一题</dt><dd class="text-slate-900">Enter</dd></div>
        <div class="flex justify-between"><dt>上一题 / 下一题</dt><dd class="text-slate-900">← / →</dd></div>
        <div class="flex justify-between"><dt>文本题提交</dt><dd class="text-slate-900">Ctrl / Cmd + Enter</dd></div>
        <div class="flex justify-between"><dt>本帮助</dt><dd class="text-slate-900">?</dd></div>
      </dl>
    </UiModal>

    <UiImageLightbox v-model="lightboxOpen" :images="images" :start-index="lightboxIndex" />
  </div>
</template>
