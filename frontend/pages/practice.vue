<script setup lang="ts">
// 刷题页：/practice?mode=chapter&target=1
const api = useApi()
const route = useRoute()
const router = useRouter()

const sessionId = ref<number | null>(null)
const question = ref<any>(null)
const total = ref(0)
const answered = ref(0)
const answer = ref<string>('')          // 单选/判断
const multi = ref<string[]>([])         // 多选
const fill = ref<string>('')            // 填空/综合
const feedback = ref<any>(null)         // 判分结果
const review = ref<any>(null)           // 答案+解析
const finished = ref<any>(null)
const loading = ref(true)
const error = ref('')
const ai = ref<{ loading: boolean; content: string; err: string }>({ loading: false, content: '', err: '' })
const fb = ref({ type: 'other', content: '', msg: '' })

const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
const options = computed<[string, string][]>(() => {
  try {
    const o = JSON.parse(question.value?.optionJson || '{}')
    return Object.entries(o) as [string, string][]
  } catch { return [] }
})

function resetAnswer() {
  answer.value = ''
  multi.value = []
  fill.value = ''
  feedback.value = null
  review.value = null
  ai.value = { loading: false, content: '', err: '' }
  fb.value = { type: 'other', content: '', msg: '' }
}

async function askAi(guide = false) {
  ai.value = { loading: true, content: '', err: '' }
  try {
    const r = await api.post<{ content: string; cached: boolean }>('/api/ai/explain', {
      questionId: question.value.id, mode: guide ? 'guide' : 'explain',
    })
    ai.value = { loading: false, content: r.content, err: '' }
  } catch (e: any) {
    ai.value = { loading: false, content: '', err: e.message }
  }
}

async function sendFeedback() {
  if (!fb.value.content.trim()) { fb.value.msg = '请填写问题描述'; return }
  try {
    await api.post('/api/feedback', {
      questionId: question.value.id, type: fb.value.type, content: fb.value.content,
    })
    fb.value = { type: 'other', content: '', msg: '✓ 已提交，谢谢反馈' }
  } catch (e: any) {
    fb.value.msg = e.message
  }
}

async function start() {
  if (!api.hasToken()) { router.push('/login'); return }
  try {
    // 已有会话（组卷页创建的）直接用
    if (route.query.session) {
      sessionId.value = Number(route.query.session)
    } else {
      const mode = String(route.query.mode || 'chapter')
      const target = String(route.query.target || '')
      const r = await api.post('/api/practice/start', { mode, target, limit: 50 })
      sessionId.value = r.sessionId
      total.value = r.count
    }
    await next()
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}

async function next() {
  resetAnswer()
  const r = await api.get(`/api/practice/${sessionId.value}/next`)
  if (r.kind === 'done') {
    finished.value = await api.post(`/api/practice/${sessionId.value}/finish`, {})
    question.value = null
    return
  }
  question.value = r.question
  answered.value = r.question.answered
  total.value = r.question.total
}

async function submit() {
  const q = question.value
  let payload = ''
  if (q.questionType === 2) payload = multi.value.sort().join(',')
  else if (q.questionType === 4 || q.questionType === 5) payload = fill.value
  else payload = answer.value

  feedback.value = await api.post(`/api/practice/${sessionId.value}/answer`, {
    questionId: q.id, answer: payload,
  })
  review.value = await api.get(`/api/practice/${sessionId.value}/review/${q.id}`)
}

onMounted(start)
</script>

<template>
  <section class="space-y-4">
    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>

    <template v-if="finished">
      <div class="rounded-xl border border-slate-200 p-6 text-center">
        <p class="text-lg font-semibold text-slate-800">练习完成</p>
        <p class="mt-2 text-3xl font-bold text-blue-600">{{ finished.score }} / {{ finished.total_score }}</p>
        <p class="mt-1 text-sm text-slate-500">
          共 {{ finished.question_count }} 题，答对 {{ finished.correct_count }} 题
        </p>
        <div class="mt-4 flex justify-center gap-3">
          <NuxtLink to="/chapters" class="rounded-lg border px-4 py-2 text-sm">返回章节</NuxtLink>
          <NuxtLink to="/wrong" class="rounded-lg border px-4 py-2 text-sm">查看错题</NuxtLink>
        </div>
      </div>
    </template>

    <template v-else-if="question">
      <div class="flex items-center justify-between text-sm text-slate-500">
        <span>第 {{ question.itemOrder }} / {{ total }} 题</span>
        <span>{{ TYPE_LABEL[question.questionType] }} · {{ question.score }} 分</span>
      </div>

      <div class="rounded-xl border border-slate-200 p-5">
        <p class="text-base leading-7 text-slate-800 whitespace-pre-wrap">{{ question.stem }}</p>

        <!-- 单选 / 判断 -->
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

        <!-- 多选 -->
        <div v-else-if="question.questionType === 2" class="mt-4 space-y-2">
          <label v-for="[k, v] in options" :key="k"
                 class="flex cursor-pointer items-start gap-2 rounded-lg border p-2.5 text-sm"
                 :class="multi.includes(k) ? 'border-blue-500 bg-blue-50' : 'border-slate-200'">
            <input v-model="multi" type="checkbox" :value="k" :disabled="!!feedback" class="mt-1" />
            <span>{{ k }}. {{ v }}</span>
          </label>
        </div>

        <!-- 填空 / 综合 -->
        <div v-else class="mt-4">
          <input v-model="fill" :disabled="!!feedback" placeholder="多空用中文分号「；」分隔"
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
        <p v-if="review" class="mt-2 text-slate-700"><b>正确答案：</b>{{ review.correct }}</p>
        <p v-if="review?.analysis" class="mt-1 whitespace-pre-wrap text-slate-600">
          <b>解析：</b>{{ review.analysis }}
        </p>
        <div class="mt-3 flex flex-wrap items-center gap-2">
          <button class="rounded-lg bg-slate-800 px-5 py-2 text-sm text-white" @click="next">下一题</button>
          <button class="rounded-lg border border-slate-300 px-3 py-2 text-xs" @click="askAi(false)">AI 讲解</button>
          <button class="rounded-lg border border-slate-300 px-3 py-2 text-xs" @click="askAi(true)">引导思考</button>
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
  </section>
</template>
