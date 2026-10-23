<script setup lang="ts">
// 做题历史：当前用户的历史练习会话
useHead({ title: '做题历史' })
const api = useApi()
const router = useRouter()
const rows = ref<any[]>([])
const total = ref(0)
const page = ref(1)
const size = 20
const loading = ref(true)
const error = ref('')

const MODE_LABEL: Record<string, string> = {
  chapter: '章节练习',
  paper: '真题练习',
  kp: '知识点练习',
  single: '单题练习',
  course: '课程练习',
  wrong: '错题复习',
  random: '随机组卷',
  exam: '模拟考试',
  random_exam: '随机模考',
}

const totalPages = computed(() => Math.max(1, Math.ceil(total.value / size)))

function fmtTime(v: string) {
  if (!v) return ''
  return new Date(v).toLocaleString('zh-CN', {
    month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

function fmtDur(sec: number) {
  if (!sec || sec <= 0) return '—'
  const m = Math.floor(sec / 60)
  const s = sec % 60
  return m > 0 ? `${m} 分 ${s} 秒` : `${s} 秒`
}

async function load(p = page.value) {
  loading.value = true
  error.value = ''
  try {
    const r = await api.get<any>(`/api/practice/history?page=${p}&size=${size}`)
    rows.value = r.rows ?? []
    total.value = r.total ?? 0
    page.value = r.page ?? p
  } catch (e: any) {
    error.value = e.message ?? '加载失败'
  } finally {
    loading.value = false
  }
}

onMounted(() => {
  if (!api.hasToken()) {
    loading.value = false
    router.push('/login')
    return
  }
  load(1)
})
</script>

<template>
  <section class="space-y-4">
    <div class="flex flex-wrap items-center justify-between gap-2">
      <h1 class="text-2xl font-bold text-slate-900">做题历史</h1>
      <NuxtLink to="/report" class="text-sm text-blue-600 hover:underline">学习报告 →</NuxtLink>
    </div>

    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>
    <p v-if="loading" class="text-sm text-slate-500">加载中…</p>

    <template v-if="!loading">
      <p v-if="!rows.length" class="rounded-xl border border-slate-200 px-5 py-8 text-center text-sm text-slate-500">
        还没有做题记录，去 <NuxtLink to="/chapters" class="text-blue-600 hover:underline">章节练习</NuxtLink> 开始吧。
      </p>

      <ul v-else class="space-y-3">
        <li v-for="s in rows" :key="s.id">
          <NuxtLink :to="`/history/${s.id}`"
                    class="block rounded-xl border border-slate-200 p-4 transition hover:border-blue-400 hover:shadow-sm">
            <div class="flex flex-wrap items-start justify-between gap-2">
              <div class="min-w-0">
                <p class="truncate text-sm font-medium text-slate-800">
                  {{ MODE_LABEL[s.mode] ?? s.mode }}
                  <span v-if="s.targetName" class="text-slate-500">· {{ s.targetName }}</span>
                </p>
                <p class="mt-1 text-xs text-slate-400">
                  {{ fmtTime(s.startedAt) }} · 用时 {{ fmtDur(s.elapsedSec) }}
                </p>
              </div>
              <span class="shrink-0 rounded-full px-2 py-0.5 text-xs"
                    :class="s.finishedAt ? 'bg-green-50 text-green-700' : 'bg-amber-50 text-amber-700'">
                {{ s.finishedAt ? '已完成' : '进行中' }}
              </span>
            </div>
            <div class="mt-3 flex flex-wrap gap-x-5 gap-y-1 text-xs text-slate-500">
              <span>作答 {{ s.answeredCount }} / {{ s.questionCount }}</span>
              <span v-if="s.answeredCount">答对 {{ s.correctCount }} 题</span>
              <span v-if="s.finishedAt">得分 {{ s.score }} / {{ s.totalScore }}</span>
            </div>
          </NuxtLink>
        </li>
      </ul>

      <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
        <button v-if="page > 1" class="rounded border px-3 py-1" @click="load(page - 1)">上一页</button>
        <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
        <button v-if="page < totalPages" class="rounded border px-3 py-1" @click="load(page + 1)">下一页</button>
      </div>
    </template>
  </section>
</template>
