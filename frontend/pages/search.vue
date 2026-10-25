<script setup lang="ts">
// 题库搜索（题干关键词）
const route = useRoute()
const router = useRouter()
const api = useApi()

const q = ref(String(route.query.q || ''))
const kp = ref(Number(route.query.kp) || 0)
const kpTitle = ref('')
const page = ref(Number(route.query.page) || 1)
const data = ref<any>(null)
const loading = ref(false)

async function run() {
  if (!kp.value && q.value.trim().length < 2) { data.value = { total: 0, rows: [] }; return }
  loading.value = true
  try {
    const params = new URLSearchParams({ q: q.value.trim(), page: String(page.value), size: '20' })
    if (kp.value) params.set('kp', String(kp.value))
    data.value = await api.get(`/api/questions/search?${params.toString()}`)
  } finally {
    loading.value = false
  }
}

function submit() {
  page.value = 1
  router.replace({ query: { q: q.value.trim(), ...(kp.value ? { kp: String(kp.value) } : {}) } })
  run()
}

function go(p: number) {
  page.value = p
  router.replace({ query: { q: q.value.trim(), ...(kp.value ? { kp: String(kp.value) } : {}), page: String(p) } })
  run()
}

function clearKp() {
  kp.value = 0
  kpTitle.value = ''
  page.value = 1
  router.replace({ query: { q: q.value.trim() } })
  run()
}

onMounted(async () => {
  if (kp.value) {
    try {
      const k = await api.get<any>(`/api/knowledge/${kp.value}`)
      kpTitle.value = k?.title ?? ''
    } catch { /* 忽略 */ }
  }
  run()
})

const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
const totalPages = computed(() => Math.max(1, Math.ceil((data.value?.total ?? 0) / 20)))
</script>

<template>
  <section class="space-y-4">
    <UiPageHeader title="题库搜索" subtitle="按题干关键词或知识点定位题目，直接开练" />

    <form class="flex gap-2" @submit.prevent="submit">
      <input v-model="q" type="search"
             :placeholder="kp ? '可留空，直接搜该知识点的题' : '输入题干关键词（至少 2 个字）'"
             class="min-h-11 flex-1 rounded-lg border border-line-strong bg-surface-card px-3 text-sm text-fg-primary outline-none focus:border-brand" />
      <button class="min-h-11 rounded-lg bg-brand px-5 text-sm font-medium text-white hover:bg-brand-hover">搜索</button>
    </form>

    <div v-if="kp" class="flex items-center gap-2 text-sm">
      <span class="rounded bg-blue-50 px-2 py-1 text-xs text-blue-700">知识点：{{ kpTitle || ('#' + kp) }}</span>
      <button class="text-xs text-slate-400 hover:text-red-600" @click="clearKp">清除</button>
    </div>

    <p v-if="data" class="text-sm text-slate-500">找到 {{ data.total }} 题</p>

    <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
      <li v-for="r in data?.rows ?? []" :key="r.id" class="flex items-start gap-3 px-5 py-3">
        <span class="mt-0.5 shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">
          {{ TYPE_LABEL[r.questionType] ?? r.questionType }}
        </span>
        <span class="min-w-0 flex-1 text-sm leading-6 text-slate-800">{{ formatText(r.stem) }}</span>
        <NuxtLink :to="`/practice?mode=single&target=${r.id}&from=/search`"
                  class="shrink-0 text-xs font-medium text-blue-600 hover:underline">练这题 →</NuxtLink>
      </li>
      <li v-if="data && !data.rows.length" class="px-5 py-6 text-sm text-slate-500">
        {{ !kp && q.trim().length < 2 ? '请输入至少 2 个字' : (kp ? '该知识点下没有匹配题目' : '没有匹配的题目') }}
      </li>
    </ul>

    <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
      <button v-if="page > 1" class="rounded border px-3 py-1" @click="go(page - 1)">上一页</button>
      <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
      <button v-if="page < totalPages" class="rounded border px-3 py-1" @click="go(page + 1)">下一页</button>
    </div>
  </section>
</template>
