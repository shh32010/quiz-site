<script setup lang="ts">
// 章节下的题目列表（含子孙章节）
import { TYPE_LABEL, TYPE_TABS } from '~/utils/constants'

const route = useRoute()
const router = useRouter()
const api = useApi()
const toast = useToast()
const { loggedIn } = useAuth()
const { wrongMap, favMap, refreshMarks } = useUserMarks()
const markFilter = ref<'all' | 'wrong' | 'fav'>('all')
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
const chapterLevel = computed(() => Number(chapterInfo.value?.level))
const isPractical = computed(() => Number(chapterInfo.value?.subjectId) === 5)
const canCompose = computed(() => chapterLevel.value === 1 || chapterLevel.value === 2)
const composeCount = computed(() =>
  chapterLevel.value === 1 ? (isPractical.value ? 40 : 80) : 40)
const composePlan = computed(() => {
  if (isPractical.value) return '判断 8 · 单选 20 · 填空 10 · 综合 2'
  return chapterLevel.value === 1
    ? '判断 10 · 单选 50 · 多选 10 · 填空 10'
    : '判断 5 · 单选 25 · 多选 5 · 填空 5'
})
const composeScore = computed(() =>
  isPractical.value ? 80 : (chapterLevel.value === 1 ? 150 : 75))

const totalPages = computed(() => Math.max(1, Math.ceil((data.value?.total ?? 0) / 50)))
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

/** 组卷前提示：总题量不足或某题型不足（仍会补足到目标题量） */
const composeWarning = computed(() => {
  if (!canCompose.value) return ''
  const total = allCount.value
  if (total > 0 && total < composeCount.value) {
    return `本章共 ${total} 题，不足 ${composeCount.value} 题，将全部加入`
  }
  const need: Record<number, number> = isPractical.value
    ? { 1: 20, 3: 8, 4: 10, 5: 2 }
    : (chapterLevel.value === 1
        ? { 1: 50, 2: 10, 3: 10, 4: 10 }
        : { 1: 25, 2: 5, 3: 5, 4: 5 })
  const missing = Object.entries(need)
    .filter(([t, n]) => (typeMap.value[Number(t)] ?? 0) < n)
    .map(([t]) => TYPE_LABEL[Number(t)])
  return missing.length ? `本章${missing.join('、')}不足，差额已用其他题型补足（实际分值可能略低）` : ''
})
const chapterTitle = computed(() =>
  data.value?.rows?.[0]?.chapterName || '章节题目')
const chapterPath = computed(() =>
  data.value?.rows?.[0]?.chapterPath || '')

const pageRows = computed<any[]>(() => data.value?.rows ?? [])
const pageWrongCount = computed(() => pageRows.value.filter(q => Boolean(wrongMap.value[q.id])).length)
const pageFavCount = computed(() => pageRows.value.filter(q => Boolean(favMap.value[q.id])).length)
const displayRows = computed(() => {
  if (markFilter.value === 'wrong') return pageRows.value.filter(q => Boolean(wrongMap.value[q.id]))
  if (markFilter.value === 'fav') return pageRows.value.filter(q => Boolean(favMap.value[q.id]))
  return pageRows.value
})

onMounted(() => {
  refreshMarks()
})

function switchType(value: number | string) {
  const next = Number(value) || 0
  router.push({ query: { ...route.query, type: next || undefined, page: undefined } })
}

/** 一级/二级章随机组卷：一级理论 80、一级实操 40、二级统一 40；不受当前题型筛选影响 */
async function composeChapter() {
  if (composing.value || !canCompose.value) return
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
        <UiButton v-if="canCompose" variant="secondary" size="md"
                  :loading="composing" :disabled="!(data?.total ?? 0)"
                  :title="`按大纲配比抽 ${composeCount} 题，不受当前题型筛选影响；优先未做过的题`"
                  @click="composeChapter">
          随机组卷 · {{ composeCount }} 题
        </UiButton>
        <NuxtLink :to="practiceLink"
                  class="inline-flex min-h-11 items-center rounded-lg bg-brand px-4 text-sm font-medium text-white hover:bg-brand-hover">
          开始练习{{ type ? `（${TYPE_LABEL[type]}）` : '' }}
        </NuxtLink>
      </template>
    </UiPageHeader>

    <p v-if="canCompose" class="text-xs text-fg-muted">
      随机组卷按大纲配比：{{ composePlan }}（共 {{ composeCount }} 题 · {{ composeScore }} 分）
    </p>
    <p v-if="composeWarning" class="text-xs text-warn-fg">{{ composeWarning }}</p>
    <p v-if="composeError" class="text-sm text-danger-fg">{{ composeError }}</p>

    <div class="sticky top-14 z-20 -mx-3 space-y-2 border-y border-line-subtle bg-page/95 px-3 py-2 backdrop-blur sm:-mx-4 sm:px-4">
      <UiTabs :model-value="type" :items="typeTabs" @update:model-value="switchType" />
      <div v-if="loggedIn && (pageWrongCount > 0 || pageFavCount > 0)" class="flex flex-wrap items-center gap-1.5 text-xs">
        <button type="button" class="min-h-9 rounded-full border px-3 transition"
                :class="markFilter === 'all' ? 'border-brand bg-brand-soft font-medium text-brand-on-soft' : 'border-line-subtle bg-surface-card text-fg-secondary'"
                @click="markFilter = 'all'">本页全部</button>
        <button v-if="pageWrongCount > 0" type="button" class="min-h-9 rounded-full border px-3 transition"
                :class="markFilter === 'wrong' ? 'border-brand bg-brand-soft font-medium text-brand-on-soft' : 'border-line-subtle bg-surface-card text-fg-secondary'"
                @click="markFilter = 'wrong'">本页错题 {{ pageWrongCount }}</button>
        <button v-if="pageFavCount > 0" type="button" class="min-h-9 rounded-full border px-3 transition"
                :class="markFilter === 'fav' ? 'border-brand bg-brand-soft font-medium text-brand-on-soft' : 'border-line-subtle bg-surface-card text-fg-secondary'"
                @click="markFilter = 'fav'">本页收藏 {{ pageFavCount }}</button>
      </div>
    </div>

    <ul class="divide-y divide-line-subtle overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
      <li v-for="q in displayRows" :key="q.id">
        <NuxtLink :to="`/practice?mode=single&target=${q.id}&from=${encodeURIComponent(route.fullPath)}`" title="点击做这道题"
                  class="flex min-h-14 items-start gap-3 px-4 py-3 hover:bg-surface-muted">
          <UiBadge class="mt-0.5 shrink-0">{{ TYPE_LABEL[q.questionType] ?? q.questionType }}</UiBadge>
          <span class="min-w-0 flex-1 text-sm leading-6 text-fg-primary">{{ formatText(q.stem) }}</span>
          <UiBadge v-if="wrongMap[q.id]" :tone="wrongMap[q.id].resolved ? 'green' : 'red'" class="shrink-0">
            {{ wrongMap[q.id].resolved ? '错题已掌握' : `错 ${wrongMap[q.id].wrongCount} 次` }}
          </UiBadge>
          <span v-if="favMap[q.id]" class="shrink-0 text-xs font-medium text-amber-500" title="已收藏">★</span>
          <span v-if="q.hasImage" class="shrink-0 text-xs text-fg-muted">含图</span>
          <span class="shrink-0 text-xs font-medium text-brand">做这题 →</span>
        </NuxtLink>
      </li>
      <li v-if="!displayRows.length" class="px-5 py-8 text-center text-sm text-fg-muted">
        {{ markFilter !== 'all' ? '本页暂无符合该标记的题目。' : (type ? '本章该题型暂无题目。' : '本章暂无题目。') }}
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
