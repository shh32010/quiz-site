<script setup lang="ts">
// S1-1「C 语言程序的结构」大纲颗粒度试点预览（只读，不改库）
import { formatText } from '~/composables/format'
import { normalizeKnowledgeContent, renderMarkdown } from '~/utils/markdown'
import type { KNode } from '~/utils/knowledge'

definePageMeta({ layout: 'immersive' })
useHead({
  title: 'S1-1 大纲版预览 · 知识点',
  meta: [{ name: 'robots', content: 'noindex, nofollow', key: 'robots' }],
})

const SECTION_ID = 238
const { data: tree } = await useFetch<KNode[]>('/api/knowledge/tree')
const { data: payload, error } = await useFetch<any>(`/api/knowledge/section/${SECTION_ID}`, {
  query: { page: 1, size: 100 },
})

const section = computed<any>(() => payload.value?.section ?? null)
const kps = computed<any[]>(() => payload.value?.kps ?? [])

function findNode(nodes: KNode[], target: number): KNode | null {
  for (const node of nodes) {
    if (node.id === target) return node
    const hit = findNode(node.children ?? [], target)
    if (hit) return hit
  }
  return null
}

const items = computed<KNode[]>(() =>
  (findNode(tree.value ?? [], SECTION_ID)?.children ?? []).filter(node => node.level === 3))

// 人工预归类：先按 S1-1 三个大纲条目重排，再移出明显不属于本节的内容
const ITEM2_IDS = new Set([
  30314, 30333, 30518, 30532, 30630, 31331, 31332, 31798, 31876,
  31924, 32070, 32076, 32080, 32114, 32211, 32212, 32258, 32259,
])
const ITEM3_IDS = new Set([31335, 31881, 32111])
const OUT_IDS = new Set([
  30432, 30446, 30472, 30584, 30888, 31305, 31605, 31619, 31620,
  31657, 31659, 31665, 31666, 31667, 31729, 31742, 31743, 31878,
  31879, 31893, 31938, 32103, 32105, 32220, 32221, 32614, 27750,
])

interface PreviewGroup {
  key: string
  code: string
  name: string
  kps: any[]
}

const outKps = computed(() => kps.value.filter(kp => OUT_IDS.has(Number(kp.id))))

const groups = computed<PreviewGroup[]>(() => {
  const buckets: Record<string, any[]> = { item1: [], item2: [], item3: [] }
  for (const kp of kps.value) {
    const id = Number(kp.id)
    if (OUT_IDS.has(id)) continue
    if (ITEM2_IDS.has(id)) buckets.item2.push(kp)
    else if (ITEM3_IDS.has(id)) buckets.item3.push(kp)
    else buckets.item1.push(kp)
  }
  const ids = ['item1', 'item2', 'item3'] as const
  return ids.flatMap((key, index) => {
    const node = items.value[index]
    if (!node) return []
    return [{ key, code: node.code, name: node.name, kps: buckets[key] }]
  })
})

const mappedCount = computed(() => groups.value.reduce((sum, group) => sum + group.kps.length, 0))
const outCount = computed(() => outKps.value.length)

function contentOf(kp: any): string {
  return normalizeKnowledgeContent(kp.content ?? '', kp.title ?? '').trim()
}

function itemNumber(index: number): string {
  return `1.${index + 1}`
}

function kpNumber(groupIndex: number, kpIndex: number): string {
  return `1.${groupIndex + 1}.${kpIndex + 1}`
}

function anchorOf(group: PreviewGroup): string {
  return `preview-${group.key}`
}
</script>

<template>
  <div class="min-h-screen bg-page text-fg-primary">
    <header class="sticky top-0 z-20 border-b border-line-subtle bg-surface-glass backdrop-blur">
      <div class="mx-auto flex max-w-5xl items-center gap-3 px-3 py-2.5 sm:px-5">
        <NuxtLink to="/knowledge/section/238"
                  class="grid h-10 w-10 shrink-0 place-items-center rounded-lg text-fg-secondary hover:bg-surface-muted"
                  aria-label="返回正式阅读器">←</NuxtLink>
        <div class="min-w-0 flex-1">
          <p class="truncate text-xs text-fg-muted">知识点 · 大纲颗粒度试点</p>
          <p class="truncate text-sm font-semibold text-fg-primary">S1-1 C 语言程序的结构</p>
        </div>
        <NuxtLink to="/knowledge/section/238"
                  class="shrink-0 rounded-lg border border-line-strong px-2.5 py-1.5 text-xs text-fg-secondary hover:border-brand hover:text-brand">
          当前阅读器
        </NuxtLink>
      </div>
    </header>

    <main class="mx-auto max-w-5xl px-3 pb-20 pt-5 sm:px-5">
      <div class="rounded-2xl border border-brand/20 bg-gradient-to-br from-brand-soft via-surface-card to-amber-50 p-5 sm:p-6">
        <span class="inline-flex rounded-full border border-brand/20 bg-surface-card/80 px-2 py-0.5 text-[11px] font-medium text-brand">
          试点预览 · 人工预归类
        </span>
        <h1 class="mt-2 text-2xl font-bold tracking-tight text-fg-primary">S1-1 C 语言程序的结构</h1>
        <p class="mt-1 text-sm leading-6 text-fg-secondary">
          把这一节的 {{ kps.length }} 条内容按大纲的 {{ items.length }} 个三级条目重排，只保留本节相关内容；
          明显超出本节范围的内容先移出，不进入阅读结构。
        </p>
        <div class="mt-3 flex flex-wrap gap-2 text-xs">
          <span class="rounded-full bg-success-bg px-2.5 py-1 text-success-fg">保留 {{ mappedCount }} 条</span>
          <span class="rounded-full bg-warn-bg px-2.5 py-1 text-warn-fg">移出 {{ outCount }} 条</span>
          <span class="rounded-full bg-surface-muted px-2.5 py-1 text-fg-muted">共 {{ items.length }} 个三级条目</span>
        </div>
      </div>

      <p v-if="error" class="mt-4 rounded-lg border border-danger-border bg-danger-bg px-3 py-2 text-sm text-danger-fg">
        数据加载失败，请稍后重试。
      </p>

      <nav class="mt-4 grid gap-2 sm:grid-cols-3">
        <a v-for="(group, groupIndex) in groups" :key="group.key" :href="`#${anchorOf(group)}`"
           class="rounded-xl border border-line-subtle bg-surface-card p-3 transition hover:border-brand">
          <div class="flex items-center justify-between gap-2">
            <span class="font-mono text-[11px] text-fg-muted">{{ group.code }}</span>
            <span class="text-[11px] text-fg-muted">{{ group.kps.length }} 条</span>
          </div>
          <p class="mt-1 text-sm font-medium text-fg-primary">{{ itemNumber(groupIndex) }} · {{ group.name }}</p>
        </a>
      </nav>

      <section v-for="(group, groupIndex) in groups" :id="anchorOf(group)" :key="group.key"
               class="mt-6 scroll-mt-20">
        <div class="flex flex-wrap items-end justify-between gap-2 border-b border-line-subtle pb-2">
          <div>
            <p class="font-mono text-xs text-brand">{{ group.code }}</p>
            <h2 class="mt-0.5 text-xl font-bold text-fg-primary">{{ group.name }}</h2>
          </div>
          <span class="text-xs text-fg-muted">{{ group.kps.length }} 条内容</span>
        </div>

        <div class="mt-3 space-y-2">
          <details v-for="(kp, kpIndex) in group.kps" :key="kp.id"
                   class="group overflow-hidden rounded-xl border border-line-subtle bg-surface-card"
                   :open="group.key === 'item1' && kpIndex < 2">
            <summary class="flex min-h-11 cursor-pointer list-none items-start gap-2 px-3 py-2.5 [&::-webkit-details-marker]:hidden">
              <span class="mt-0.5 shrink-0 font-mono text-[11px] text-fg-muted">{{ kpNumber(groupIndex, kpIndex) }}</span>
              <span class="min-w-0 flex-1 text-sm font-medium text-fg-primary">{{ formatText(kp.title) }}</span>
              <span class="mt-0.5 shrink-0 text-[11px] text-fg-muted">{{ kp.questionCount }} 题</span>
              <span class="mt-0.5 shrink-0 text-fg-muted transition-transform group-open:rotate-180">⌄</span>
            </summary>
            <div class="border-t border-line-subtle px-3 py-3">
              <div v-if="contentOf(kp)" class="reader-content" v-html="renderMarkdown(contentOf(kp))" />
              <p v-else class="text-xs text-fg-muted">暂无展开讲解。</p>
              <NuxtLink :to="`/knowledge/section/238#kp-${kp.id}`"
                        class="mt-2 inline-flex text-[11px] text-brand hover:underline">
                在正式阅读器中查看 →
              </NuxtLink>
            </div>
          </details>
        </div>
      </section>

      <details class="mt-8 rounded-xl border border-line-subtle bg-surface-card">
        <summary class="cursor-pointer list-none px-3 py-2.5 text-xs text-fg-muted [&::-webkit-details-marker]:hidden">
          审核用：查看已移出的 {{ outCount }} 条（不会出现在本节）
        </summary>
        <ul class="space-y-1.5 border-t border-line-subtle px-3 py-3 text-xs leading-5 text-fg-secondary">
          <li v-for="kp in outKps" :key="kp.id">· {{ formatText(kp.title) }}</li>
        </ul>
      </details>

      <p class="mt-4 text-center text-xs text-fg-muted">
        移出只影响本节预览展示，暂不修改数据库；正式版会把这些内容迁移到对应章节或删除。
      </p>
    </main>
  </div>
</template>

<style scoped>
.reader-content {
  font-size: 0.9rem;
  line-height: 1.75;
  color: rgb(var(--fg-secondary));
  overflow-wrap: anywhere;
}
.reader-content :deep(h1),
.reader-content :deep(h2),
.reader-content :deep(h3) {
  margin: 0.75rem 0 0.35rem;
  font-weight: 600;
  color: rgb(var(--fg-primary));
}
.reader-content :deep(p) { margin: 0.4rem 0; }
.reader-content :deep(pre) {
  margin: 0.6rem 0;
  overflow-x: auto;
  border-radius: 0.65rem;
  background: rgb(var(--surface-muted));
  padding: 0.75rem;
  font-size: 0.8rem;
  line-height: 1.6;
}
.reader-content :deep(code) {
  border-radius: 0.25rem;
  background: rgb(var(--surface-muted));
  padding: 0.1rem 0.25rem;
  font-size: 0.85em;
}
.reader-content :deep(pre code) { background: transparent; padding: 0; }
.reader-content :deep(ul),
.reader-content :deep(ol) { margin: 0.4rem 0; padding-left: 1.2rem; }
.reader-content :deep(li) { margin: 0.2rem 0; }
</style>
