<script setup lang="ts">
// 章节下的题目列表（含子孙章节）
const route = useRoute()
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
</script>

<template>
  <section class="space-y-4">
    <NuxtLink to="/chapters" class="text-sm text-blue-600 hover:underline">← 返回章节</NuxtLink>
    <h1 class="text-xl font-bold text-slate-900">章节题目</h1>
    <div class="flex flex-wrap items-center gap-3">
      <p class="text-sm text-slate-500">共 {{ data?.total ?? 0 }} 题</p>
      <NuxtLink :to="practiceLink"
                class="rounded-lg bg-blue-600 px-4 py-1.5 text-sm font-medium text-white">
        开始练习{{ type ? `（${TYPE_LABEL[type]}）` : '' }}
      </NuxtLink>
      <span class="text-xs text-slate-400">点击任意题目可直接做这一题</span>
    </div>

    <div class="flex flex-wrap gap-2">
      <NuxtLink v-for="t in TYPE_TABS" :key="t.value"
                :to="{ query: { type: t.value || undefined } }"
                class="rounded-full border px-3 py-1 text-xs"
                :class="type === t.value
                  ? 'border-blue-600 bg-blue-600 text-white'
                  : 'border-slate-300 text-slate-600 hover:border-blue-400'">
        {{ t.label }}
        <span :class="type === t.value ? 'text-blue-100' : 'text-slate-400'">
          {{ t.value === 0 ? allCount : (typeMap[t.value] ?? 0) }}
        </span>
      </NuxtLink>
    </div>

    <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
      <li v-for="q in data?.rows ?? []" :key="q.id">
        <NuxtLink :to="`/practice?mode=single&target=${q.id}`" title="点击做这道题"
                  class="flex items-start gap-3 px-5 py-3 hover:bg-blue-50/60">
          <span class="mt-0.5 shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">
            {{ TYPE_LABEL[q.questionType] ?? q.questionType }}
          </span>
          <span class="min-w-0 flex-1 text-sm leading-6 text-slate-800">{{ formatText(q.stem) }}</span>
          <span v-if="q.hasImage" class="shrink-0 text-xs text-slate-400">含图</span>
          <span class="shrink-0 text-xs font-medium text-blue-600">做这题 →</span>
        </NuxtLink>
      </li>
      <li v-if="!(data?.rows ?? []).length" class="px-5 py-6 text-sm text-slate-500">
        {{ type ? '本章该题型暂无题目。' : '本章暂无题目。' }}
      </li>
    </ul>

    <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
      <NuxtLink v-if="page > 1" :to="{ query: { ...route.query, page: page - 1 } }" class="rounded border px-3 py-1">上一页</NuxtLink>
      <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
      <NuxtLink v-if="page < totalPages" :to="{ query: { ...route.query, page: page + 1 } }" class="rounded border px-3 py-1">下一页</NuxtLink>
    </div>
  </section>
</template>
