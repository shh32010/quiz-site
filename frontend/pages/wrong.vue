<script setup lang="ts">
// 错题本
definePageMeta({ middleware: 'auth' })
const api = useApi()
const data = ref<any>(null)
const loading = ref(true)
const error = ref('')

async function load() {
  loading.value = true
  error.value = ''
  try {
    data.value = await api.get('/api/wrong')
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}
onMounted(load)

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
const typeTabs = computed(() => TYPE_TABS.map(t => ({
  ...t,
  count: t.value === 0 ? (data.value?.total ?? 0) : (typeCounts.value[t.value] ?? 0),
})))

/** 浏览器的原生打印（配 Tailwind 的 print: 变体） */
function printPage() {
  if (typeof window !== 'undefined') window.print()
}
</script>

<template>
  <section class="space-y-4">
    <UiPageHeader title="错题本" subtitle="按间隔复习；已下架题不可进入">
      <template #actions>
        <NuxtLink v-if="data && (data.total - (data.unavailable ?? 0)) > 0"
                  :to="`/practice?mode=wrong${selectedType ? `&type=${selectedType}` : ''}`"
                  class="print:hidden inline-flex min-h-11 items-center rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
          {{ selectedType ? '复习该题型错题' : '复习全部错题' }}
        </NuxtLink>
        <UiButton v-if="data" class="print:hidden" variant="secondary" size="md" @click="printPage">打印错题</UiButton>
      </template>
    </UiPageHeader>

    <UiState :loading="loading" :error="error" @retry="load">
      <template v-if="data">
        <UiCard padded="sm" class="print:hidden">
          <div class="flex flex-wrap items-center gap-3">
            <div>
              <p class="text-2xl font-bold tabular-nums text-fg-primary">{{ data.pending }}</p>
              <p class="text-xs text-fg-muted">待复习</p>
            </div>
            <div class="h-8 w-px bg-line-subtle" />
            <div>
              <p class="text-2xl font-bold tabular-nums text-fg-primary">{{ data.total }}</p>
              <p class="text-xs text-fg-muted">全部错题</p>
            </div>
            <UiBadge v-if="data.unavailable" tone="slate" class="ml-auto">
              {{ data.unavailable }} 题已下架
            </UiBadge>
          </div>
        </UiCard>

        <div class="print:hidden">
          <UiTabs v-model="selectedType" :items="typeTabs" />
        </div>

        <p v-if="!filteredRows.length" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-muted">
          {{ selectedType ? '该题型暂无错题。' : '还没有错题。' }}
        </p>

        <ul v-else class="divide-y divide-line-subtle overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
          <li v-for="q in filteredRows" :key="q.questionId">
            <NuxtLink :to="q.available === false ? '/wrong' : `/practice?mode=single&target=${q.questionId}`"
                      :title="q.available === false ? '题目已下架，暂不可复习' : '点击复习这道错题'"
                      class="flex min-h-14 items-start gap-3 px-4 py-3 hover:bg-surface-muted"
                      :class="q.available === false ? 'pointer-events-none opacity-60' : ''">
              <UiBadge class="mt-0.5 shrink-0">{{ TYPE_LABEL[q.questionType] ?? q.questionType }}</UiBadge>
              <div class="min-w-0 flex-1">
                <span class="text-sm leading-6 text-fg-primary">{{ formatText(q.stem) }}</span>
                <p class="mt-1 flex flex-wrap items-center gap-2 text-xs text-fg-muted">
                  <UiBadge tone="red">错 {{ q.wrongCount }} 次</UiBadge>
                  <span v-if="q.kps">· {{ q.kps }}</span>
                </p>
              </div>
              <UiBadge v-if="q.available === false" tone="slate" class="shrink-0">已下架</UiBadge>
              <template v-else>
                <UiBadge :tone="q.resolved ? 'green' : 'amber'" class="shrink-0">
                  {{ q.resolved ? '已掌握' : '待复习' }}
                </UiBadge>
                <span class="shrink-0 text-xs font-medium text-brand">复习 →</span>
              </template>
            </NuxtLink>
          </li>
        </ul>
      </template>
    </UiState>
  </section>
</template>
