<script setup lang="ts">
// 题库搜索（题干关键词）
const route = useRoute()
const router = useRouter()
const api = useApi()

const q = ref(String(route.query.q || ''))
const page = ref(Number(route.query.page) || 1)
const data = ref<any>(null)
const loading = ref(false)

async function run() {
  if (q.value.trim().length < 2) { data.value = { total: 0, rows: [] }; return }
  loading.value = true
  try {
    data.value = await api.get(`/api/questions/search?q=${encodeURIComponent(q.value.trim())}&page=${page.value}&size=20`)
  } finally {
    loading.value = false
  }
}

function submit() {
  page.value = 1
  router.replace({ query: { q: q.value.trim() } })
  run()
}

function go(p: number) {
  page.value = p
  router.replace({ query: { q: q.value.trim(), page: p } })
  run()
}

onMounted(run)

const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
const totalPages = computed(() => Math.max(1, Math.ceil((data.value?.total ?? 0) / 20)))
</script>

<template>
  <section class="space-y-4">
    <h1 class="text-2xl font-bold text-slate-900">题库搜索</h1>

    <form class="flex gap-2" @submit.prevent="submit">
      <input v-model="q" placeholder="输入题干关键词（至少 2 个字）"
             class="flex-1 rounded-lg border border-slate-300 px-3 py-2 text-sm" />
      <button class="rounded-lg bg-blue-600 px-5 py-2 text-sm font-medium text-white">搜索</button>
    </form>

    <p v-if="data" class="text-sm text-slate-500">找到 {{ data.total }} 题</p>

    <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
      <li v-for="r in data?.rows ?? []" :key="r.id" class="flex items-start gap-3 px-5 py-3">
        <span class="mt-0.5 shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">
          {{ TYPE_LABEL[r.questionType] ?? r.questionType }}
        </span>
        <span class="min-w-0 flex-1 text-sm leading-6 text-slate-800">{{ r.stem }}</span>
        <span class="shrink-0 text-xs text-slate-400">#{{ r.id }}</span>
      </li>
      <li v-if="data && !data.rows.length" class="px-5 py-6 text-sm text-slate-500">
        {{ q.trim().length < 2 ? '请输入至少 2 个字' : '没有匹配的题目' }}
      </li>
    </ul>

    <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
      <button v-if="page > 1" class="rounded border px-3 py-1" @click="go(page - 1)">上一页</button>
      <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
      <button v-if="page < totalPages" class="rounded border px-3 py-1" @click="go(page + 1)">下一页</button>
    </div>
  </section>
</template>
