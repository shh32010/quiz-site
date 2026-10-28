<script setup lang="ts">
// 学习报告
import { MODE_LABEL } from '~/utils/constants'

definePageMeta({ middleware: 'auth' })
useHead({ title: '学习报告' })
const api = useApi()
const data = ref<any>(null)
const loading = ref(true)
const error = ref('')

async function load() {
  loading.value = true
  error.value = ''
  try {
    data.value = await api.get('/api/report')
  } catch (e: any) {
    error.value = e.message
  } finally {
    loading.value = false
  }
}
onMounted(load)

const rate = computed(() => {
  const s = data.value?.summary
  if (!s || !s.answered) return 0
  return Math.round((s.correct / s.answered) * 100)
})
const sortMode = ref<'weak' | 'volume'>('weak')
function sortRows(rows: any[]): any[] {
  return [...rows].sort((a, b) => sortMode.value === 'volume'
    ? (b.total ?? 0) - (a.total ?? 0)
    : (a.rate ?? 0) - (b.rate ?? 0))
}
const masterySorted = computed(() => sortRows(data.value?.mastery ?? []))
const sectionsSorted = computed(() => sortRows(data.value?.sections ?? []))
const kpsSorted = computed(() => sortRows(data.value?.kps ?? []))

function barClass(value: number) {
  if (value >= 80) return 'bg-success-fg'
  if (value >= 60) return 'bg-warn-fg'
  return 'bg-danger-fg'
}

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
    <UiPageHeader title="学习报告" subtitle="正确率、章节掌握度、知识点掌握度和最近练习" />

    <UiState :loading="loading" :error="error" @retry="load">
      <template v-if="data">
        <div class="grid grid-cols-2 gap-3 lg:grid-cols-4">
          <UiStatCard label="已答题" :value="data.summary.answered" />
          <UiStatCard label="正确率" :value="rate" suffix="%" tone="brand" />
          <UiStatCard label="活跃天数" :value="data.summary.activeDays" />
          <UiStatCard label="待复习错题" :value="data.wrong.pending" tone="warn" />
        </div>

        <UiCard padded="md">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <div>
              <h2 class="text-sm font-semibold text-fg-primary">错题周报</h2>
              <p class="mt-0.5 text-xs text-fg-muted">根据近 7 天错题生成</p>
            </div>
            <UiButton size="sm" variant="secondary" :loading="weekly.loading" @click="loadWeekly">
              {{ weekly.loading ? '生成中…' : '生成近 7 天分析' }}
            </UiButton>
          </div>
          <p v-if="weekly.err" class="mt-3 text-xs text-danger-fg">{{ weekly.err }}</p>
          <p v-if="weekly.content"
             class="mt-3 whitespace-pre-wrap rounded-xl bg-surface-muted p-4 text-sm leading-6 text-fg-secondary">
            {{ weekly.content }}
          </p>
        </UiCard>

        <UiCard v-if="masterySorted.length" padded="md">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <div>
              <h2 class="text-sm font-semibold text-fg-primary">章节掌握度</h2>
              <p class="mt-0.5 text-xs text-fg-muted">按一级章/技能统计正确率</p>
            </div>
            <ReportSortToggle v-model="sortMode" />
          </div>
          <ul class="mt-3 space-y-3">
            <li v-for="m in masterySorted" :key="m.code">
              <div class="flex items-center justify-between gap-2 text-xs">
                <span class="min-w-0 truncate text-fg-secondary">{{ m.code }} {{ m.name }}</span>
                <span class="shrink-0 tabular-nums text-fg-muted">{{ m.correct }}/{{ m.total }}（{{ m.rate }}%）</span>
              </div>
              <div class="mt-1 h-2 w-full overflow-hidden rounded-full bg-surface-muted">
                <div class="h-full rounded-full" :class="barClass(m.rate)" :style="{ width: (m.rate || 0) + '%' }" />
              </div>
            </li>
          </ul>
        </UiCard>

        <UiCard v-if="sectionsSorted.length" padded="md">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <div>
              <h2 class="text-sm font-semibold text-fg-primary">节级掌握度</h2>
              <p class="mt-0.5 text-xs text-fg-muted">按二级节统计正确率；章直属题不计入</p>
            </div>
            <ReportSortToggle v-model="sortMode" />
          </div>
          <ul class="mt-3 max-h-[420px] space-y-3 overflow-auto pr-1">
            <li v-for="s in sectionsSorted" :key="s.sectionCode">
              <div class="flex items-center justify-between gap-2 text-xs">
                <span class="min-w-0 truncate text-fg-secondary">
                  <span class="mr-1 rounded bg-surface-muted px-1 py-0.5 text-fg-muted">{{ s.chapterCode }}</span>
                  {{ s.sectionCode }} {{ s.sectionName }}
                </span>
                <span class="shrink-0 tabular-nums text-fg-muted">{{ s.correct }}/{{ s.total }}（{{ s.rate }}%）</span>
              </div>
              <div class="mt-1 h-2 w-full overflow-hidden rounded-full bg-surface-muted">
                <div class="h-full rounded-full" :class="barClass(s.rate)" :style="{ width: (s.rate || 0) + '%' }" />
              </div>
            </li>
          </ul>
        </UiCard>

        <UiCard v-if="kpsSorted.length" padded="md">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <div>
              <h2 class="text-sm font-semibold text-fg-primary">知识点掌握度</h2>
              <p class="mt-0.5 text-xs text-fg-muted">至少作答 2 次；按关联知识点统计</p>
            </div>
            <ReportSortToggle v-model="sortMode" />
          </div>
          <ul class="mt-3 space-y-3">
            <li v-for="k in kpsSorted" :key="k.id">
              <div class="flex items-center justify-between gap-2 text-xs">
                <NuxtLink :to="`/knowledge?kp=${k.id}`" class="min-w-0 truncate text-fg-secondary hover:text-brand">
                  {{ k.title }}
                </NuxtLink>
                <span class="shrink-0 tabular-nums text-fg-muted">{{ k.correct }}/{{ k.total }}（{{ k.rate }}%）</span>
              </div>
              <div class="mt-1 h-2 w-full overflow-hidden rounded-full bg-surface-muted">
                <div class="h-full rounded-full" :class="barClass(k.rate)" :style="{ width: (k.rate || 0) + '%' }" />
              </div>
            </li>
          </ul>
        </UiCard>

        <UiCard :padded="'none'">
          <div class="flex items-center justify-between px-4 py-3">
            <h2 class="text-sm font-semibold text-fg-primary">最近练习</h2>
            <NuxtLink to="/history" class="text-xs text-brand hover:underline">全部历史 →</NuxtLink>
          </div>
          <ul class="divide-y divide-line-subtle border-t border-line-subtle">
            <li v-for="s in data.recent" :key="s.id">
              <NuxtLink :to="`/history/${s.id}`"
                        class="flex min-h-12 flex-col items-start justify-between gap-1 px-4 py-3 hover:bg-surface-muted sm:flex-row sm:items-center sm:gap-2">
                <span class="min-w-0 max-w-full truncate text-sm text-fg-secondary">
                  {{ MODE_LABEL[s.mode] ?? s.mode }}
                  <span class="ml-2 text-xs text-fg-muted">{{ (s.startedAt || '').slice(0, 16).replace('T', ' ') }}</span>
                </span>
                <span class="shrink-0 text-xs tabular-nums text-fg-muted">
                  {{ s.questionCount ?? 0 }} 题 · {{ s.score ?? 0 }}/{{ s.totalScore ?? 0 }} 分
                </span>
              </NuxtLink>
            </li>
            <li v-if="!data.recent.length" class="px-4 py-6 text-sm text-fg-muted">还没有练习记录。</li>
          </ul>
        </UiCard>
      </template>
    </UiState>
  </section>
</template>
