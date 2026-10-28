<script setup lang="ts">
// 课程/技能目录：章 → 节，进入节阅读器
import { ALL_COURSES } from '~/utils/constants'
import { rootsFor, type KNode } from '~/utils/knowledge'

const route = useRoute()
const course = computed(() => String(route.params.course ?? '').toUpperCase())
const courseInfo = computed(() => ALL_COURSES.find(item => item.code === course.value) ?? null)
const { data: tree, error } = await useFetch<KNode[]>('/api/knowledge/tree')

useHead(() => ({ title: courseInfo.value ? `${courseInfo.value.name} · 知识点` : '知识点目录' }))

const roots = computed(() => rootsFor(tree.value ?? [], course.value))
const chapters = computed(() => roots.value.map(root => {
  const sections = (root.children ?? []).filter(child => child.level === 2)
  return {
    ...root,
    sections: sections.length
      ? sections
      : (root.kpCount > 0 ? [{ ...root, level: root.level }] : []),
  }
}))
const total = computed(() => roots.value.reduce((sum, node) => sum + node.kpCount, 0))

const learned = ref<number[]>([])
const progressMap = ref<Record<string, number>>({})

onMounted(() => {
  try {
    const rawLearned = JSON.parse(localStorage.getItem('quiz_learned') ?? '[]')
    if (Array.isArray(rawLearned)) learned.value = rawLearned.map(Number).filter(Number.isFinite)
    const rawProgress = JSON.parse(localStorage.getItem('quiz_reader_progress') ?? '{}')
    if (rawProgress && typeof rawProgress === 'object') progressMap.value = rawProgress
  } catch { /* 忽略 */ }
})

function isLearned(sectionId: number) {
  return learned.value.includes(sectionId)
}

function progressOf(sectionId: number) {
  return Number(progressMap.value[String(sectionId)] ?? 0)
}
</script>

<template>
  <section class="space-y-5">
    <nav class="flex flex-wrap items-center gap-1 text-xs text-fg-muted">
      <NuxtLink to="/knowledge" class="hover:text-brand">知识点</NuxtLink>
      <span>/</span>
      <span class="text-fg-secondary">{{ courseInfo?.name ?? course }}</span>
    </nav>

    <div v-if="!courseInfo" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-sm text-fg-secondary">
      未找到该课程。<NuxtLink to="/knowledge" class="text-brand hover:underline">返回知识点首页</NuxtLink>
    </div>

    <template v-else>
      <div>
        <h1 class="text-2xl font-bold tracking-tight text-fg-primary">{{ courseInfo.name }}</h1>
        <p class="mt-1 text-sm text-fg-secondary">
          {{ courseInfo.label ? courseInfo.label + ' · ' : '' }}{{ chapters.length }} {{ course === 'A' || course === 'B' ? '章' : '节' }} ·
          {{ total.toLocaleString() }} 条知识点。点节名进入连续阅读。
        </p>
      </div>

      <p v-if="error" class="rounded-lg border border-danger-border bg-danger-bg px-3 py-2 text-sm text-danger-fg">
        目录加载失败，请稍后重试。
      </p>

      <div v-for="chapter in chapters" :key="chapter.id" class="overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
        <div class="flex flex-wrap items-center justify-between gap-2 border-b border-line-subtle px-4 py-3">
          <div class="flex min-w-0 items-center gap-2">
            <span class="shrink-0 rounded bg-surface-muted px-1.5 py-0.5 font-mono text-xs text-fg-secondary">{{ chapter.code }}</span>
            <h2 class="truncate text-sm font-semibold text-fg-primary">{{ chapter.name }}</h2>
          </div>
          <span class="shrink-0 text-xs text-fg-muted">{{ chapter.kpCount.toLocaleString() }} 条</span>
        </div>
        <ul v-if="chapter.sections.length" class="divide-y divide-line-subtle">
          <li v-for="section in chapter.sections" :key="section.id">
            <NuxtLink :to="`/knowledge/section/${section.id}`"
                      class="flex min-h-12 items-center justify-between gap-3 px-4 py-2.5 hover:bg-surface-muted">
              <span class="flex min-w-0 items-center gap-2">
                <span class="w-16 shrink-0 font-mono text-xs text-fg-muted">{{ section.code?.split('-').pop() ?? section.code }}</span>
                <span class="truncate text-sm text-fg-secondary">{{ section.name }}</span>
              </span>
              <span class="flex shrink-0 items-center gap-2 text-xs">
                <span v-if="isLearned(section.id)" class="text-success-fg">已学</span>
                <span v-else-if="progressOf(section.id) > 0" class="text-fg-muted">已读 {{ progressOf(section.id) }}%</span>
                <span class="text-fg-muted">{{ section.kpCount }} 条 ›</span>
              </span>
            </NuxtLink>
          </li>
        </ul>
        <p v-else class="px-4 py-4 text-xs text-fg-muted">本节暂未整理知识点。</p>
      </div>

      <div class="flex flex-wrap gap-3 text-sm">
        <NuxtLink to="/knowledge" class="text-brand hover:underline">← 返回知识点首页</NuxtLink>
        <NuxtLink to="/knowledge/search" class="text-fg-secondary hover:text-brand">搜索知识点</NuxtLink>
      </div>
    </template>
  </section>
</template>
