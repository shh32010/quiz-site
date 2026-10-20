<script setup lang="ts">
// 学习报告
const api = useApi()
const data = ref<any>(null)
const error = ref('')

onMounted(async () => {
  if (!api.hasToken()) { error.value = '请先登录'; return }
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
