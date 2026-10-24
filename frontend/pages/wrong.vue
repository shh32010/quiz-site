<script setup lang="ts">
// 错题本
const api = useApi()
const data = ref<any>(null)
const error = ref('')

onMounted(async () => {
  if (!api.hasToken()) { error.value = '请先登录'; return }
  try {
    data.value = await api.get('/api/wrong')
  } catch (e: any) {
    error.value = e.message
  }
})

const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
const TYPE_TABS = [
  { value: 0, label: '全部' },
  { value: 1, label: '单选' },
  { value: 2, label: '多选' },
  { value: 3, label: '判断' },
  { value: 4, label: '填空' },
  { value: 5, label: '综合' },
]
const selectedType = ref(0)
const typeCounts = computed<Record<number, number>>(() => {
  const m: Record<number, number> = {}
  for (const q of data.value?.rows ?? []) {
    const t = Number(q.questionType)
    m[t] = (m[t] ?? 0) + 1
  }
  return m
})
const filteredRows = computed(() => {
  const rows = data.value?.rows ?? []
  return selectedType.value ? rows.filter((q: any) => Number(q.questionType) === selectedType.value) : rows
})

/** 浏览器的原生打印（配 Tailwind 的 print: 变体） */
function printPage() {
  if (typeof window !== 'undefined') window.print()
}
</script>

<template>
  <section class="space-y-4">
    <h1 class="text-2xl font-bold text-slate-900">错题本</h1>

    <p v-if="error" class="text-sm text-red-600">
      {{ error }}
      <NuxtLink to="/login" class="ml-2 text-blue-600 hover:underline">去登录</NuxtLink>
    </p>

    <template v-else-if="data">
      <div class="flex flex-wrap items-center gap-3">
        <p class="text-sm text-slate-500">
          共 {{ data.total }} 题，待复习 {{ data.pending }} 题
        </p>
        <NuxtLink v-if="data.rows.length"
                  :to="`/practice?mode=wrong${selectedType ? `&type=${selectedType}` : ''}`"
                  class="print:hidden rounded-lg bg-blue-600 px-3 py-1 text-xs font-medium text-white">
          {{ selectedType ? '复习该题型错题' : '复习全部错题' }}
        </NuxtLink>
        <button class="print:hidden rounded-lg border border-slate-300 px-3 py-1 text-xs"
                @click="printPage">打印错题</button>
      </div>

      <div class="print:hidden flex flex-wrap gap-2">
        <button v-for="t in TYPE_TABS" :key="t.value"
                class="rounded-full border px-3 py-1 text-xs"
                :class="selectedType === t.value
                  ? 'border-blue-600 bg-blue-600 text-white'
                  : 'border-slate-300 text-slate-600 hover:border-blue-400'"
                @click="selectedType = t.value">
          {{ t.label }}
          <span :class="selectedType === t.value ? 'text-blue-100' : 'text-slate-400'">
            {{ t.value === 0 ? data.total : (typeCounts[t.value] ?? 0) }}
          </span>
        </button>
      </div>

      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="q in filteredRows" :key="q.questionId">
          <NuxtLink :to="`/practice?mode=single&target=${q.questionId}`" title="点击复习这道错题"
                    class="flex items-start gap-3 px-5 py-3 hover:bg-blue-50/60">
            <span class="mt-0.5 shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">
              {{ TYPE_LABEL[q.questionType] ?? q.questionType }}
            </span>
            <div class="min-w-0 flex-1">
              <span class="text-sm leading-6 text-slate-800">{{ formatText(q.stem) }}</span>
              <p class="mt-0.5 text-[11px] text-slate-400">
                错 {{ q.wrongCount }} 次
                <span v-if="q.kps"> · 知识点：{{ q.kps }}</span>
              </p>
            </div>
            <span class="shrink-0 text-xs" :class="q.resolved ? 'text-green-600' : 'text-amber-600'">
              {{ q.resolved ? '已掌握' : '待复习' }}
            </span>
            <span class="shrink-0 text-xs font-medium text-blue-600">复习这题 →</span>
          </NuxtLink>
        </li>
        <li v-if="!filteredRows.length" class="px-5 py-6 text-sm text-slate-500">
          {{ selectedType ? '该题型暂无错题。' : '还没有错题。' }}
        </li>
      </ul>
    </template>

    <p v-else class="text-sm text-slate-500">加载中…</p>
  </section>
</template>
