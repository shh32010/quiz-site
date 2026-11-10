<script setup lang="ts">
// 错题本
import { TYPE_LABEL, TYPE_TABS } from '~/utils/constants'
import { WRONG_STATUS_TABS, buildWrongPracticeUrl, filterWrongRows, fmtReviewDue, type WrongStatusFilter } from '~/utils/wrong'

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

const selectedType = ref(0)
const statusFilter = ref<WrongStatusFilter>('all')
const typeCounts = computed<Record<number, number>>(() => {
  const m: Record<number, number> = {}
  for (const q of data.value?.rows ?? []) {
    const t = Number(q.questionType)
    m[t] = (m[t] ?? 0) + 1
  }
  return m
})
const statusTabs = computed(() => {
  const rows = data.value?.rows ?? []
  return WRONG_STATUS_TABS.map(tab => ({
    ...tab,
    count: filterWrongRows(rows, selectedType.value, tab.value).length,
  }))
})
const filteredRows = computed(() => {
  const rows = data.value?.rows ?? []
  return filterWrongRows(rows, selectedType.value, statusFilter.value)
})
const typeTabs = computed(() => TYPE_TABS.map(t => ({
  ...t,
  count: t.value === 0 ? (data.value?.total ?? 0) : (typeCounts.value[t.value] ?? 0),
})))

const printing = ref(false)
const printRows = ref<any[]>([])
const filteredPrintRows = computed(() => {
  const allowedIds = new Set(filteredRows.value.map((r: any) => Number(r.questionId)))
  return printRows.value.filter(row => allowedIds.has(Number(row.questionId)))
})

/** 解析选项 JSON，按 A/B/C/D 排序 */
function options(row: any): [string, string][] {
  try {
    const raw = row.optionJson
    if (!raw) return []
    const obj = typeof raw === 'string' ? JSON.parse(raw) : raw
    return Object.entries(obj as Record<string, string>)
      .sort(([a], [b]) => a.localeCompare(b))
  } catch {
    return []
  }
}

/** 加载完整题目后调用浏览器打印；打印区只在 print 媒体下显示 */
async function printPage() {
  if (typeof window === 'undefined') return
  if (!printRows.value.length) {
    printing.value = true
    try {
      const r = await api.get<{ rows: any[] }>('/api/wrong/print')
      printRows.value = r.rows ?? []
    } catch (e: any) {
      error.value = e.message ?? '打印数据加载失败'
      return
    } finally {
      printing.value = false
    }
  }
  await nextTick()
  if (!filteredPrintRows.value.length) {
    error.value = '当前题型暂无可打印错题'
    return
  }
  window.print()
}
</script>

<template>
  <section class="space-y-4">
    <UiPageHeader title="错题本" subtitle="按间隔复习；已下架题不可进入" class="print:hidden">
      <template #actions>
        <NuxtLink v-if="data && (data.total - (data.unavailable ?? 0)) > 0"
                  :to="buildWrongPracticeUrl(selectedType, statusFilter)"
                  class="print:hidden inline-flex min-h-11 items-center rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
          {{ selectedType || statusFilter !== 'all' ? '复习当前筛选错题' : '复习全部错题' }}
        </NuxtLink>
        <NuxtLink v-if="data && (data.total - (data.unavailable ?? 0)) > 0"
                  :to="buildWrongPracticeUrl(selectedType, statusFilter, 20)"
                  class="print:hidden inline-flex min-h-11 items-center rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-4 text-sm font-medium text-fg-secondary hover:border-brand hover:text-brand">
          抽测 20 题
        </NuxtLink>
        <UiButton v-if="data" class="print:hidden" variant="secondary" size="md"
                  :loading="printing" @click="printPage">
          {{ printing ? '准备中…' : '打印错题' }}
        </UiButton>
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

        <div class="space-y-2 print:hidden">
          <UiTabs v-model="selectedType" :items="typeTabs" />
          <UiTabs v-model="statusFilter" :items="statusTabs" />
        </div>

        <p v-if="!filteredRows.length" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-muted">
          {{ selectedType || statusFilter !== 'all' ? '当前筛选条件下暂无错题。' : '还没有错题。' }}
        </p>

        <ul v-else class="divide-y divide-line-subtle overflow-hidden rounded-xl border border-line-subtle bg-surface-card print:hidden">
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
                  <span>· {{ fmtReviewDue(q.nextReviewAt, q.resolved) }}</span>
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

    <!-- 打印视图：只在浏览器打印/导出 PDF 时显示 -->
    <div v-if="filteredPrintRows.length" class="hidden print:block">
      <h1 class="text-lg font-bold">错题本</h1>
      <p class="mt-1 text-xs text-fg-secondary">共 {{ filteredPrintRows.length }} 题</p>
      <ol class="mt-4 space-y-4">
        <li v-for="(row, i) in filteredPrintRows" :key="row.questionId" class="break-inside-avoid">
          <p class="whitespace-pre-wrap text-sm font-medium">{{ i + 1 }}. {{ formatText(row.stem) }}</p>
          <p v-for="[k, v] in options(row)" :key="k" class="ml-4 whitespace-pre-wrap text-sm">
            {{ k }}. {{ formatText(v) }}
          </p>
          <p class="mt-1 text-sm"><b>正确答案：</b>{{ formatText(row.correct) }}</p>
          <p v-if="row.analysis" class="mt-1 whitespace-pre-wrap text-sm text-fg-secondary">
            <b>解析：</b>{{ formatText(row.analysis) }}
          </p>
        </li>
      </ol>
    </div>
  </section>
</template>
