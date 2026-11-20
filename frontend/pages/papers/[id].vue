<script setup lang="ts">
// 真题卷详情：卷面分节
import { buildPaperDetailJsonLd } from '~/utils/seo'

const route = useRoute()
const id = computed(() => Number(route.params.id))
const { data } = await useFetch<any>(() => `/api/papers/${id.value}`)

useHead(() => ({
  title: data.value?.paper?.name ? `${data.value.paper.name} · 历年真题` : '真题详情',
  script: data.value?.paper
    ? [{ type: 'application/ld+json', innerHTML: JSON.stringify(buildPaperDetailJsonLd(data.value.paper)).replace(/</g, '\\u003c') }]
    : [],
}))
</script>

<template>
  <section class="space-y-4">
    <NuxtLink to="/papers" class="inline-flex min-h-11 items-center text-sm text-brand hover:underline">← 返回真题列表</NuxtLink>

    <template v-if="data?.paper">
      <h1 class="text-2xl font-bold text-fg-primary">{{ data.paper.name }}</h1>
      <p class="text-sm text-fg-secondary">
        <template v-if="(data.paper.availableCount ?? data.paper.questionCount) < data.paper.questionCount">
          原卷 {{ data.paper.questionCount }} 题 / {{ data.paper.score }} 分 ·
          <b class="text-fg-primary">可练 {{ data.paper.availableCount }} 题 / {{ data.paper.availableScore }} 分</b>
        </template>
        <template v-else>{{ data.paper.questionCount }} 题 · {{ data.paper.score }} 分</template>
        <template v-if="data.paper.suggestTime">
          · 建议 {{ Math.round(data.paper.suggestTime / 60) }} 分钟
        </template>
      </p>
      <p v-if="(data.paper.availableCount ?? data.paper.questionCount) < data.paper.questionCount"
         class="rounded-lg border border-warn-border bg-warn-bg px-3 py-2 text-xs text-warn-fg">
        原卷有 {{ data.paper.questionCount - data.paper.availableCount }} 题暂不可练，进入练习后按可练题数计分；答题卡会显示实际题位。
      </p>
      <NuxtLink v-if="data.paper.availableCount !== 0" :to="`/practice?mode=paper&target=${id}`"
                class="inline-flex min-h-11 items-center rounded-lg bg-brand px-4 py-2 text-sm font-medium text-white hover:bg-brand-hover">
        开始刷这套卷
      </NuxtLink>

      <ul class="divide-y divide-line-subtle rounded-xl border border-line-subtle bg-surface-card">
        <li v-for="s in data.sections" :key="s.sectionNo"
            class="flex items-center justify-between px-5 py-3">
          <span class="text-sm text-fg-primary">{{ s.sectionName }}</span>
          <span class="text-xs text-fg-secondary">
            可练 {{ s.available ?? (s.items - s.missing) }} / {{ s.items }} 题 · {{ s.score }} 分
            <span v-if="s.missing" class="ml-2 text-warn-fg">（{{ s.missing }} 题暂不可练）</span>
          </span>
        </li>
      </ul>
    </template>
    <p v-else class="text-sm text-fg-secondary">试卷不存在。</p>
  </section>
</template>
