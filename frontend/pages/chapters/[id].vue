<script setup lang="ts">
// 章节下的题目列表（含子孙章节）
const route = useRoute()
const router = useRouter()
const api = useApi()
const toast = useToast()
const composing = ref(false)
const composeError = ref('')
const page = computed(() => Number(route.query.page) || 1)
const type = computed(() => Number(route.query.type) || 0)
const chapterId = computed(() => Number(route.params.id))

const { data } = await useFetch<any>('/api/questions', {
  query: {
    chapter: chapterId,
    page,
    size: 50,
    type: computed(() => type.value || undefined),
  },
})
const { data: chapterInfo } = await useFetch<any>(() => `/api/chapters/${chapterId.value}`)
const isTopChapter = computed(() => Number(chapterInfo.value?.level) === 1)
const isPractical = computed(() => Number(chapterInfo.value?.subjectId) === 5)
const composeCount = computed(() => (isPractical.value ? 40 : 80))
const composePlan = computed(() => (isPractical.value
  ? '判断 8 · 单选 20 · 填空 10 · 综合 2'
  : '判断 10 · 单选 50 · 多选 10 · 填空 10'))

const totalPages = computed(() => Math.max(1, Math.ceil((data.value?.total ?? 0) / 50)))
const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
const TYPE_TABS = [
  { value: 0, label: '全部' },
  { value: 1, label: '单选' },
  { value: 2, label: '多选' },
  { value: 3, label: '判断' },
  { value: 4, label: '填空' },
  { value: 5, label: '综合' },
]
const typeMap = computed<Record<number, number>>(() =>
  Object.fromEntries((data.value?.typeCounts ?? []).map((x: any) => [Number(x.type), Number(x.count)])))
const allCount = computed(() =>
  Object.values(typeMap.value).reduce((s, n) => s + n, 0))
const practiceLink = computed(() =>
  `/practice?mode=chapter&target=${chapterId.value}${type.value ? `&type=${type.value}` : ''}`)
const typeTabs = computed(() => TYPE_TABS.map(t => ({
  ...t,
  count: t.value === 0 ? allCount.value : (typeMap.value[t.value] ?? 0),
})))
const chapterTitle = computed(() =>
  data.value?.rows?.[0]?.chapterName || '章节题目')
const chapterPath = computed(() =>
  data.value?.rows?.[0]?.chapterPath || '')

function switchType(value: number | string) {
  const next = Number(value) || 0
  router.push({ query: { ...route.query, type: next || undefined, page: undefined } })
}

/** 一级章随机组卷：理论 80 题、实操 40 题，按大纲整卷配比；不受当前题型筛选影响 */
async function composeChapter() {
  if (composing.value || !isTopChapter.value) return
  composeError.value = ''
  if (!api.hasToken()) {
    router.push({ path: '/login', query: { redirect: route.fullPath } })
    return
  }
  composing.value = true
  try {
    const r = await api.post<{ sessionId: number; count: number; shortfall?: number }>(
      '/api/compose/chapter', { chapterId: chapterId.value, count: composeCount.value })
    if ((r.shortfall ?? 0) > 0) {
      toast.show(`本章共 ${r.count} 题，不足 ${composeCount.value} 题，已全部加入`, 'warn')
    }
    router.push(`/practice?session=${r.sessionId}`)
  } catch (e: any) {
    composeError.value = e.message ?? '组卷失败，请重试'
  } finally {
    composing.value = false
  }
}
</script>

<template>
  <section class="space-y-4">
    <UiPageHeader :title="chapterTitle" :subtitle="chapterPath || `共 ${data?.total ?? 0} 题`"
                  back-to="/chapters" back-label="返回章节">
      <template #actions>
        <UiButton v-if="isTopChapter" variant="secondary" size="md"
                  :loading="composing" :disabled="!(data?.total ?? 0)"
                  :title="`按大纲整卷配比抽 ${composeCount} 题，不受当前题型筛选影响；优先未做过的题`"
                  @click="composeChapter">
          随机组卷 · {{ composeCount }} 题
        </UiButton>
        <NuxtLink :to="practiceLink"
                  class="inline-flex min-h-11 items-center rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
          开始练习{{ type ? `（${TYPE_LABEL[type]}）` : '' }}
        </NuxtLink>
      </template>
    </UiPageHeader>

    <p v-if="isTopChapter" class="text-xs text-fg-muted">
      随机组卷按大纲整卷配比：{{ composePlan }}（共 {{ composeCount }} 题）
    </p>
    <p v-if="composeError" class="text-sm text-danger-fg">{{ composeError }}</p>

    <div class="sticky top-14 z-20 -mx-3 border-y border-line-subtle bg-page/95 px-3 py-2 backdrop-blur sm:-mx-4 sm:px-4">
      <UiTabs :model-value="type" :items="typeTabs" @update:model-value="switchType" />
    </div>

    <ul class="divide-y divide-line-subtle overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
      <li v-for="q in data?.rows ?? []" :key="q.id">
        <NuxtLink :to="`/practice?mode=single&target=${q.id}`" title="点击做这道题"
                  class="flex min-h-14 items-start gap-3 px-4 py-3 hover:bg-surface-muted">
          <UiBadge class="mt-0.5 shrink-0">{{ TYPE_LABEL[q.questionType] ?? q.questionType }}</UiBadge>
          <span class="min-w-0 flex-1 text-sm leading-6 text-fg-primary">{{ formatText(q.stem) }}</span>
          <span v-if="q.hasImage" class="shrink-0 text-xs text-fg-muted">含图</span>
          <span class="shrink-0 text-xs font-medium text-brand">做这题 →</span>
        </NuxtLink>
      </li>
      <li v-if="!(data?.rows ?? []).length" class="px-5 py-8 text-center text-sm text-fg-muted">
        {{ type ? '本章该题型暂无题目。' : '本章暂无题目。' }}
      </li>
    </ul>

    <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
      <NuxtLink v-if="page > 1" :to="{ query: { ...route.query, page: page - 1 } }"
                class="inline-flex min-h-11 items-center rounded-lg border border-line-strong px-4">上一页</NuxtLink>
      <span class="tabular-nums text-fg-muted">{{ page }} / {{ totalPages }}</span>
      <NuxtLink v-if="page < totalPages" :to="{ query: { ...route.query, page: page + 1 } }"
                class="inline-flex min-h-11 items-center rounded-lg border border-line-strong px-4">下一页</NuxtLink>
    </div>
  </section>
</template>
