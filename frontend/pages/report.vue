<script setup lang="ts">
// 学习报告
definePageMeta({ middleware: 'auth' })
const api = useApi()
const data = ref<any>(null)
const error = ref('')

onMounted(async () => {
  try {
    data.value = await api.get('/api/report')
  } catch (e: any) {
    error.value = e.message
  }
})

const rate = computed(() => {
  const s = data.value?.summary
  if (!s || !s.answered) return 0
  return Math.round((s.correct / s.answered) * 100)
})

const weekly = ref<{ loading: boolean; content: string; err: string }>({ loading: false, content: '', err: '' })
async function loadWeekly() {
  weekly.value = { loading: true, content: '', err: '' }
  try {
    const r = await api.get<{ content: string }>('/api/ai/weekly')
    weekly.value = { loading: false, content: r.content, err: '' }
  } catch (e: any) {
    weekly.value = { loading: false, content: '', err: e.message }
  }
}
</script>

<template>
  <section class="space-y-5">
    <h1 class="text-2xl font-bold text-slate-900">学习报告</h1>

    <p v-if="error" class="text-sm text-red-600">
      {{ error }} <NuxtLink to="/login" class="ml-2 text-blue-600 hover:underline">去登录</NuxtLink>
    </p>

    <template v-else-if="data">
      <div class="grid gap-3 sm:grid-cols-4">
        <div class="rounded-xl border border-slate-200 p-4">
          <p class="text-xs text-slate-500">已答题</p>
          <p class="mt-1 text-2xl font-bold text-slate-800">{{ data.summary.answered }}</p>
        </div>
        <div class="rounded-xl border border-slate-200 p-4">
          <p class="text-xs text-slate-500">正确率</p>
          <p class="mt-1 text-2xl font-bold text-blue-600">{{ rate }}%</p>
        </div>
        <div class="rounded-xl border border-slate-200 p-4">
          <p class="text-xs text-slate-500">活跃天数</p>
          <p class="mt-1 text-2xl font-bold text-slate-800">{{ data.summary.activeDays }}</p>
        </div>
        <div class="rounded-xl border border-slate-200 p-4">
          <p class="text-xs text-slate-500">待复习错题</p>
          <p class="mt-1 text-2xl font-bold text-amber-600">{{ data.wrong.pending }}</p>
        </div>
      </div>

      <div>
        <div class="mb-2 flex items-center gap-3">
          <h2 class="text-sm font-semibold text-slate-700">错题周报</h2>
          <button class="rounded-lg border border-slate-300 px-3 py-1 text-xs"
                  :disabled="weekly.loading" @click="loadWeekly">
            {{ weekly.loading ? '生成中…' : '生成近 7 天分析' }}
          </button>
        </div>
        <p v-if="weekly.err" class="text-xs text-red-600">{{ weekly.err }}</p>
        <div v-if="weekly.content"
             class="whitespace-pre-wrap rounded-xl border border-slate-200 bg-slate-50 p-4 text-sm text-slate-700">
          {{ weekly.content }}
        </div>
      </div>

      <div v-if="data.mastery?.length">
        <h2 class="mb-2 text-sm font-semibold text-slate-700">章节掌握度</h2>
        <ul class="space-y-2 rounded-xl border border-slate-200 p-4">
          <li v-for="m in data.mastery" :key="m.code" class="text-sm">
            <div class="flex items-center justify-between text-xs">
              <span class="text-slate-700">{{ m.code }} {{ m.name }}</span>
              <span class="text-slate-500">{{ m.correct }}/{{ m.total }}（{{ m.rate }}%）</span>
            </div>
            <div class="mt-1 h-2 w-full rounded bg-slate-100">
              <div class="h-2 rounded"
                   :class="m.rate >= 80 ? 'bg-green-500' : m.rate >= 60 ? 'bg-amber-500' : 'bg-red-500'"
                   :style="{ width: (m.rate || 0) + '%' }" />
            </div>
          </li>
        </ul>
      </div>

      <div v-if="data.kps?.length">
        <h2 class="mb-2 text-sm font-semibold text-slate-700">知识点掌握度</h2>
        <ul class="space-y-2 rounded-xl border border-slate-200 p-4">
          <li v-for="k in data.kps" :key="k.id" class="text-sm">
            <div class="flex items-center justify-between gap-2 text-xs">
              <NuxtLink :to="`/knowledge?kp=${k.id}`" class="truncate text-slate-700 hover:text-blue-600">
                {{ k.title }}
              </NuxtLink>
              <span class="shrink-0 text-slate-500">{{ k.correct }}/{{ k.total }}（{{ k.rate }}%）</span>
            </div>
            <div class="mt-1 h-2 w-full rounded bg-slate-100">
              <div class="h-2 rounded"
                   :class="k.rate >= 80 ? 'bg-green-500' : k.rate >= 60 ? 'bg-amber-500' : 'bg-red-500'"
                   :style="{ width: (k.rate || 0) + '%' }" />
            </div>
          </li>
        </ul>
      </div>

      <div>
        <h2 class="mb-2 text-sm font-semibold text-slate-700">最近练习</h2>
        <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
          <li v-for="s in data.recent" :key="s.id" class="flex items-center justify-between px-5 py-3 text-sm">
            <span class="text-slate-700">
              {{ s.mode }}
              <span class="ml-2 text-xs text-slate-400">{{ (s.startedAt || '').slice(0, 16).replace('T', ' ') }}</span>
            </span>
            <span class="text-xs text-slate-500">
              {{ s.questionCount ?? 0 }} 题 · {{ s.score ?? 0 }}/{{ s.totalScore ?? 0 }} 分
            </span>
          </li>
          <li v-if="!data.recent.length" class="px-5 py-6 text-sm text-slate-500">还没有练习记录。</li>
        </ul>
      </div>
    </template>

    <p v-else class="text-sm text-slate-500">加载中…</p>
  </section>
</template>
