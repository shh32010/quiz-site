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

const OFF_TOPIC = /Windows|Word|UML|业务逻辑|机器语言|高级语言|考试范围|考试说明|快捷方式|资源管理器|域代码|实型常量|关系运算符|逻辑运算符|自由软件|程序设计语言的.*成分|程序设计语言基本成分|程序设计语言发展简史|高级程序设计语言|算法的/
const HEADER_COMMENT = /注释|头文件|include|文件包含|库函数|预处理|宏|C99|数据说明|编译预处理|条件编译/
const FORMAT = /书写|格式|缩进|程序暂停|源程序的组成|扩展名/
const PROGRAM = /程序|main|函数|结构|执行|编译|运行|代码|语句|阅读|设计|C 语言|printf|scanf|计算|求|输出|输入/

interface PreviewGroup {
  key: string
  code: string
  name: string
  kps: any[]
}

function classify(kp: any): 'item1' | 'item2' | 'item3' | 'other' {
  const title = formatText(String(kp.title ?? ''))
  if (OFF_TOPIC.test(title)) return 'other'
  if (HEADER_COMMENT.test(title)) return 'item2'
  if (FORMAT.test(title)) return 'item3'
  if (PROGRAM.test(title)) return 'item1'
  return 'other'
}

const groups = computed<PreviewGroup[]>(() => {
  const buckets: Record<string, any[]> = { item1: [], item2: [], item3: [], other: [] }
  for (const kp of kps.value) buckets[classify(kp)].push(kp)
  const result: PreviewGroup[] = []
  const ids = ['item1', 'item2', 'item3'] as const
  ids.forEach((key, index) => {
    const node = items.value[index]
    if (!node) return
    result.push({
      key,
      code: node.code,
      name: node.name,
      kps: buckets[key],
    })
  })
  if (buckets.other.length) {
    result.push({ key: 'other', code: '待迁移', name: '不属于本节三个大纲条目的内容', kps: buckets.other })
  }
  return result
})

const mappedCount = computed(() =>
  groups.value.filter(group => group.key !== 'other').reduce((sum, group) => sum + group.kps.length, 0))
const otherCount = computed(() => groups.value.find(group => group.key === 'other')?.kps.length ?? 0)

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
          试点预览 · 规则预归类
        </span>
        <h1 class="mt-2 text-2xl font-bold tracking-tight text-fg-primary">S1-1 C 语言程序的结构</h1>
        <p class="mt-1 text-sm leading-6 text-fg-secondary">
          把这一节的 {{ kps.length }} 条内容块，按大纲的 {{ items.length }} 个三级条目重新归组。
          下面是预归类效果，正式版会经过人工/模型复核。
        </p>
        <div class="mt-3 flex flex-wrap gap-2 text-xs">
          <span class="rounded-full bg-success-bg px-2.5 py-1 text-success-fg">已归入大纲 {{ mappedCount }} 条</span>
          <span class="rounded-full bg-warn-bg px-2.5 py-1 text-warn-fg">待迁移 {{ otherCount }} 条</span>
          <span class="rounded-full bg-surface-muted px-2.5 py-1 text-fg-muted">共 {{ items.length }} 个三级条目</span>
        </div>
      </div>

      <p v-if="error" class="mt-4 rounded-lg border border-danger-border bg-danger-bg px-3 py-2 text-sm text-danger-fg">
        数据加载失败，请稍后重试。
      </p>

      <nav class="mt-4 grid gap-2 sm:grid-cols-2">
        <a v-for="(group, groupIndex) in groups" :key="group.key" :href="`#${anchorOf(group)}`"
           class="rounded-xl border border-line-subtle bg-surface-card p-3 transition hover:border-brand">
          <div class="flex items-center justify-between gap-2">
            <span class="font-mono text-[11px] text-fg-muted">{{ group.code }}</span>
            <span class="text-[11px] text-fg-muted">{{ group.kps.length }} 条</span>
          </div>
          <p class="mt-1 text-sm font-medium text-fg-primary">
            <template v-if="group.key === 'other'">待迁移 · {{ group.name }}</template>
            <template v-else>{{ itemNumber(groupIndex) }} · {{ group.name }}</template>
          </p>
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

        <div v-if="group.key === 'other'"
             class="mt-3 rounded-xl border border-warn-border bg-warn-bg px-3 py-2 text-xs leading-5 text-warn-fg">
          这些内容暂未匹配到 S1-1 的三个大纲条目，正式版会迁移到其他章节或重新归类。
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

      <p class="mt-8 text-center text-xs text-fg-muted">
        这是只读预览，不修改知识点数据；正式上线前会完成映射复核和公告同步。
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
