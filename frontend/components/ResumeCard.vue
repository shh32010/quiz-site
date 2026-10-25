<script setup lang="ts">
/** 首页/历史页的「继续上次练习」卡片 */
const props = defineProps<{ session: any }>()

const MODE_LABEL: Record<string, string> = {
  chapter: '章节练习', paper: '真题练习', course: '课程练习', kp: '知识点练习',
  wrong: '错题复习', random: '随机组卷', exam: '模拟考试', random_exam: '随机模考',
}
const percent = computed(() => {
  const total = Number(props.session?.questionCount ?? 0)
  const answered = Number(props.session?.answeredCount ?? 0)
  return total > 0 ? Math.min(100, Math.round(answered / total * 100)) : 0
})
</script>

<template>
  <NuxtLink :to="{ path: '/practice', query: { session: session.id } }"
            class="block rounded-2xl border border-blue-200 bg-blue-50/70 p-4 transition hover:border-blue-400 hover:bg-blue-50">
    <div class="flex flex-wrap items-center justify-between gap-2">
      <div class="flex items-center gap-2">
        <span class="rounded-full bg-blue-600 px-2 py-0.5 text-[11px] font-medium text-white">继续上次</span>
        <span class="text-sm font-semibold text-slate-900">{{ MODE_LABEL[session.mode] ?? session.mode }}</span>
      </div>
      <span class="text-xs text-blue-700">继续 →</span>
    </div>
    <p class="mt-2 truncate text-sm text-slate-700">{{ session.targetName || '上次练习' }}</p>
    <div class="mt-2 flex items-center gap-2">
      <div class="h-1.5 flex-1 overflow-hidden rounded-full bg-blue-100">
        <div class="h-full rounded-full bg-blue-600" :style="{ width: `${percent}%` }" />
      </div>
      <span class="shrink-0 text-xs tabular-nums text-slate-500">
        已答 {{ session.answeredCount }}/{{ session.questionCount }}
        <template v-if="session.remainingCount > 0"> · 剩 {{ session.remainingCount }} 题</template>
      </span>
    </div>
  </NuxtLink>
</template>
