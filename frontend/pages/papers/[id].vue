<script setup lang="ts">
// 真题卷详情：卷面分节
const route = useRoute()
const id = computed(() => Number(route.params.id))
const { data } = await useFetch<any>(() => `/api/papers/${id.value}`)
</script>

<template>
  <section class="space-y-4">
    <NuxtLink to="/papers" class="text-sm text-blue-600 hover:underline">← 返回真题列表</NuxtLink>

    <template v-if="data?.paper">
      <h1 class="text-2xl font-bold text-slate-900">{{ data.paper.name }}</h1>
      <p class="text-sm text-slate-500">
        <template v-if="(data.paper.availableCount ?? data.paper.questionCount) < data.paper.questionCount">
          原卷 {{ data.paper.questionCount }} 题 / {{ data.paper.score }} 分 ·
          <b class="text-slate-700">可练 {{ data.paper.availableCount }} 题 / {{ data.paper.availableScore }} 分</b>
        </template>
        <template v-else>{{ data.paper.questionCount }} 题 · {{ data.paper.score }} 分</template>
        <template v-if="data.paper.suggestTime">
          · 建议 {{ Math.round(data.paper.suggestTime / 60) }} 分钟
        </template>
      </p>
      <p v-if="(data.paper.availableCount ?? data.paper.questionCount) < data.paper.questionCount"
         class="rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
        原卷有 {{ data.paper.questionCount - data.paper.availableCount }} 题暂不可练，进入练习后按可练题数计分；答题卡会显示实际题位。
      </p>
      <NuxtLink v-if="data.paper.availableCount !== 0" :to="`/practice?mode=paper&target=${id}`"
                class="inline-block rounded-lg bg-blue-600 px-4 py-2 text-sm font-medium text-white">
        开始刷这套卷
      </NuxtLink>

      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="s in data.sections" :key="s.sectionNo"
            class="flex items-center justify-between px-5 py-3">
          <span class="text-sm text-slate-800">{{ s.sectionName }}</span>
          <span class="text-xs text-slate-500">
            可练 {{ s.available ?? (s.items - s.missing) }} / {{ s.items }} 题 · {{ s.score }} 分
            <span v-if="s.missing" class="ml-2 text-amber-600">（{{ s.missing }} 题暂不可练）</span>
          </span>
        </li>
      </ul>
    </template>
    <p v-else class="text-sm text-slate-500">试卷不存在。</p>
  </section>
</template>
