<script setup lang="ts">
// 真题卷列表
interface Paper {
  id: number
  name: string
  subjectId: number
  score: number
  questionCount: number
  suggestTime: number | null
  availableCount?: number
  availableScore?: number
}

const { data } = await useFetch<Paper[]>('/api/papers')
</script>

<template>
  <section class="space-y-5">
    <h1 class="text-2xl font-bold text-slate-900">历年真题</h1>
    <p class="text-slate-600">共 {{ data?.length ?? 0 }} 套（2005–2025），按卷面分节出题。</p>

    <ul class="grid gap-3 sm:grid-cols-2 lg:grid-cols-3">
      <li v-for="p in data ?? []" :key="p.id">
        <NuxtLink :to="`/papers/${p.id}`"
                  class="flex flex-col gap-1 rounded-xl border border-slate-200 p-4 transition hover:border-blue-400 hover:shadow-sm">
          <span class="text-base font-semibold text-slate-800">{{ p.name }}</span>
          <span class="text-xs text-slate-500">
            <template v-if="(p.availableCount ?? p.questionCount) < p.questionCount">
              可练 {{ p.availableCount }} / 原卷 {{ p.questionCount }} 题 · 可练 {{ p.availableScore }} / {{ p.score }} 分
            </template>
            <template v-else>{{ p.questionCount }} 题 · {{ p.score }} 分</template>
            <template v-if="p.suggestTime"> · 建议 {{ Math.round(p.suggestTime / 60) }} 分钟</template>
          </span>
        </NuxtLink>
      </li>
    </ul>
  </section>
</template>
