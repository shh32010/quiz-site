<script setup lang="ts">
// 章节下的题目列表（含子孙章节）
const route = useRoute()
const page = computed(() => Number(route.query.page) || 1)
const chapterId = computed(() => Number(route.params.id))

const { data } = await useFetch<any>('/api/questions', {
  query: { chapter: chapterId, page, size: 50 },
})

const totalPages = computed(() => Math.max(1, Math.ceil((data.value?.total ?? 0) / 50)))
const TYPE_LABEL: Record<number, string> = { 1: '单选', 2: '多选', 3: '判断', 4: '填空', 5: '综合' }
</script>

<template>
  <section class="space-y-4">
    <NuxtLink to="/chapters" class="text-sm text-blue-600 hover:underline">← 返回章节</NuxtLink>
    <h1 class="text-xl font-bold text-slate-900">章节题目</h1>
    <p class="text-sm text-slate-500">共 {{ data?.total ?? 0 }} 题</p>

    <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
      <li v-for="q in data?.rows ?? []" :key="q.id" class="flex items-start gap-3 px-5 py-3">
        <span class="mt-0.5 shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">
          {{ TYPE_LABEL[q.questionType] ?? q.questionType }}
        </span>
        <span class="min-w-0 flex-1 text-sm leading-6 text-slate-800">{{ q.stem }}</span>
        <span v-if="q.hasImage" class="shrink-0 text-xs text-slate-400">含图</span>
        <span class="shrink-0 text-xs text-slate-400">#{{ q.id }}</span>
      </li>
      <li v-if="!(data?.rows ?? []).length" class="px-5 py-6 text-sm text-slate-500">本章暂无题目。</li>
    </ul>

    <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
      <NuxtLink v-if="page > 1" :to="{ query: { page: page - 1 } }" class="rounded border px-3 py-1">上一页</NuxtLink>
      <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
      <NuxtLink v-if="page < totalPages" :to="{ query: { page: page + 1 } }" class="rounded border px-3 py-1">下一页</NuxtLink>
    </div>
  </section>
</template>
