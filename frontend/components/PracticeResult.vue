<script setup lang="ts">
// 刷题结果卡：分数、真题双口径说明、后续入口
defineProps<{ finished: any }>()
const emit = defineEmits<{ exit: [] }>()
const route = useRoute()
</script>

<template>
  <div class="rounded-2xl border border-line-subtle bg-surface-card p-6 text-center shadow-sm">
    <p class="text-lg font-semibold text-fg-primary">练习完成</p>
    <template v-if="finished.guest">
      <p class="mt-2 text-sm text-fg-secondary">游客模式未记录本次成绩</p>
      <NuxtLink :to="{ path: '/login', query: { redirect: route.fullPath } }"
                class="mt-4 inline-block rounded-lg bg-brand px-5 py-2 text-sm text-white">登录后正式练习</NuxtLink>
    </template>
    <template v-else>
      <p class="mt-2 text-3xl font-bold text-brand tabular-nums">{{ finished.score }} / {{ finished.total_score }}</p>
      <p class="mt-1 text-sm text-fg-secondary">共 {{ finished.question_count }} 题，答对 {{ finished.correct_count }} 题</p>
      <p v-if="finished.paperScore != null"
         class="mt-2 rounded-lg border border-warn-border bg-warn-bg px-3 py-2 text-xs text-warn-fg">
        可练满分 {{ finished.total_score }} 分；原卷 {{ finished.paperScore }} 分，
        {{ Math.max(0, (finished.paperQuestionCount ?? finished.question_count) - finished.question_count) }} 题暂不可练、不计入总分。
      </p>
      <div class="mt-5 flex flex-wrap justify-center gap-2">
        <NuxtLink to="/history" class="rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-4 py-2 text-sm">查看记录</NuxtLink>
        <NuxtLink to="/wrong" class="rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-4 py-2 text-sm">复习错题</NuxtLink>
        <button type="button" class="rounded-lg bg-brand px-4 py-2 text-sm text-white" @click="emit('exit')">返回</button>
      </div>
    </template>
  </div>
</template>
