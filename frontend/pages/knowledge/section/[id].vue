<script setup lang="ts">
// 节阅读器：一节内连续阅读全部知识点，支持锚点、上一节/下一节
import { ALL_COURSES } from '~/utils/constants'
import { renderMarkdown } from '~/utils/markdown'
import { courseOf, flattenSections, type KNode, type SectionRef } from '~/utils/knowledge'

definePageMeta({ layout: 'immersive' })

const route = useRoute()
const id = computed(() => Number(route.params.id))
const part = computed(() => Math.max(1, Number(route.query.part) || 1))
const size = 60
const tocOpen = ref(false)
const progress = ref(0)

const { data: tree } = await useFetch<KNode[]>('/api/knowledge/tree')
const { data: payload, error: loadError } = await useFetch<any>(() => `/api/knowledge/section/${id.value}`, {
  query: { page: part, size },
})

const section = computed<any>(() => payload.value?.section ?? null)
const kps = computed<any[]>(() => payload.value?.kps ?? [])
const total = computed(() => payload.value?.total ?? 0)
const totalPages = computed(() => Math.max(1, Math.ceil(total.value / size)))
const flat = computed(() => flattenSections(tree.value ?? []))
const index = computed(() => flat.value.findIndex(item => item.id === id.value))
const prev = computed<SectionRef | null>(() => index.value > 0 ? flat.value[index.value - 1] : null)
const next = computed<SectionRef | null>(() =>
  index.value >= 0 && index.value < flat.value.length - 1 ? flat.value[index.value + 1] : null)

const courseCode = computed(() => courseOf(section.value?.courseCode ?? null) ?? '')
const courseInfo = computed(() => ALL_COURSES.find(item => item.code === courseCode.value) ?? null)
const courseSections = computed(() => flat.value.filter(item => item.course === courseCode.value))
const chapters = computed(() => {
  const groups = new Map<string, { code: string | null; name: string; items: SectionRef[] }>()
  for (const item of courseSections.value) {
    const key = item.chapterCode ?? `chapter-${item.chapterId}`
    if (!groups.has(key)) groups.set(key, { code: item.chapterCode, name: item.chapterName, items: [] })
    groups.get(key)!.items.push(item)
  }
  return [...groups.values()]
})

useHead(() => ({ title: section.value?.name ? `${section.value.name} · 知识点` : '知识点阅读' }))

/** 只显示有信息量的重要性标签，过滤“待确认/普通/一般”等占位值 */
function importanceLabel(value: any): string {
  const label = String(value ?? '').trim()
  if (!label) return ''
  if (['待确认', '普通', '一般', '无', 'normal'].includes(label)) return ''
  return label
}

function partLink(target: number) {
  return {
    path: `/knowledge/section/${id.value}`,
    query: target > 1 ? { part: target } : {},
  }
}

watch(part, async () => {
  await nextTick()
  if (typeof window !== 'undefined') window.scrollTo({ top: 0 })
})

function onScroll() {
  const el = document.documentElement
  const max = el.scrollHeight - el.clientHeight
  progress.value = max > 0 ? Math.min(100, Math.round((window.scrollY / max) * 100)) : 0
}

onMounted(() => {
  window.addEventListener('scroll', onScroll, { passive: true })
  onScroll()
})
onUnmounted(() => window.removeEventListener('scroll', onScroll))

watch(section, (value) => {
  if (!value) return
  try {
    localStorage.setItem('quiz_last_section', JSON.stringify({
      id: value.id, name: value.name, courseName: courseInfo.value?.name ?? value.courseName ?? '',
    }))
  } catch { /* 忽略 */ }
}, { immediate: true })
</script>

<template>
  <div class="min-h-screen text-fg-primary">
    <div class="sticky top-0 z-30 h-0.5 bg-line-subtle">
      <div class="h-full bg-brand transition-all" :style="{ width: `${progress}%` }" />
    </div>

    <!-- 移动端顶部栏 -->
    <header class="sticky top-0 z-20 border-b border-line-subtle bg-surface-glass backdrop-blur lg:hidden">
      <div class="flex items-center gap-2 px-3 py-2">
        <NuxtLink :to="`/knowledge/course/${courseCode}`"
                  class="flex min-h-11 min-w-11 items-center justify-center rounded-lg text-sm text-fg-secondary hover:bg-surface-muted"
                  aria-label="返回目录">←</NuxtLink>
        <div class="min-w-0 flex-1">
          <p class="truncate text-xs text-fg-muted">{{ courseInfo?.name }} · {{ section?.chapterName }}</p>
          <p class="truncate text-sm font-semibold text-fg-primary">{{ section?.name ?? '知识点阅读' }}</p>
        </div>
        <button type="button" class="min-h-11 rounded-lg border border-line-strong px-3 text-xs text-fg-secondary"
                @click="tocOpen = true">目录</button>
      </div>
    </header>

    <div class="mx-auto max-w-6xl px-3 py-5 sm:px-4 lg:grid lg:grid-cols-[240px_minmax(0,1fr)] lg:gap-8">
      <!-- 桌面左侧目录 -->
      <aside class="hidden lg:block">
        <div class="sticky top-20 max-h-[calc(100vh-6rem)] overflow-auto pr-2">
          <NuxtLink :to="`/knowledge/course/${courseCode}`"
                    class="mb-3 inline-flex text-xs text-brand hover:underline">← {{ courseInfo?.name }}目录</NuxtLink>
          <div v-for="chapter in chapters" :key="chapter.code ?? chapter.name" class="mb-4">
            <p class="mb-1 flex items-center gap-1.5 text-xs font-medium text-fg-muted">
              <span v-if="chapter.code" class="rounded bg-surface-muted px-1 py-0.5 font-mono">{{ chapter.code }}</span>
              {{ chapter.name }}
            </p>
            <NuxtLink v-for="item in chapter.items" :key="item.id" :to="`/knowledge/section/${item.id}`"
                      class="block rounded-lg px-2 py-1.5 text-xs leading-5"
                      :class="item.id === id ? 'bg-brand-soft font-medium text-brand-on-soft' : 'text-fg-secondary hover:bg-surface-muted'">
              {{ item.name }}
            </NuxtLink>
          </div>
        </div>
      </aside>

      <main class="min-w-0 lg:max-w-3xl">
        <div v-if="loadError || !section" class="rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-sm text-fg-secondary">
          没有找到这一节。<NuxtLink :to="`/knowledge/course/${courseCode}`" class="text-brand hover:underline">返回目录</NuxtLink>
        </div>

        <template v-else>
          <nav class="flex flex-wrap items-center gap-1 text-xs text-fg-muted">
            <NuxtLink to="/knowledge" class="hover:text-brand">知识点</NuxtLink>
            <span>/</span>
            <NuxtLink :to="`/knowledge/course/${courseCode}`" class="hover:text-brand">{{ courseInfo?.name }}</NuxtLink>
            <span>/</span>
            <span class="truncate text-fg-secondary">{{ section.chapterName }}</span>
          </nav>

          <header class="mt-3 border-b border-line-subtle pb-4">
            <h1 class="text-2xl font-bold tracking-tight text-fg-primary">{{ section.name }}</h1>
            <p class="mt-1 text-sm text-fg-secondary">
              {{ section.code }} · 共 {{ total }} 条知识点
              <span v-if="totalPages > 1">· 第 {{ part }} / {{ totalPages }} 部分</span>
            </p>
          </header>

          <article v-if="kps.length" class="mt-2">
            <section v-for="(kp, kpIndex) in kps" :id="`kp-${kp.id}`" :key="kp.id" class="scroll-mt-28 border-b border-line-subtle py-6 last:border-b-0">
              <div class="flex flex-wrap items-start justify-between gap-2">
                <h2 class="min-w-0 text-lg font-semibold leading-7 text-fg-primary">
                  {{ kpIndex + 1 }}. {{ kp.title }}
                </h2>
                <div class="flex shrink-0 items-center gap-1.5">
                  <UiBadge v-if="importanceLabel(kp.importance)" tone="amber">{{ importanceLabel(kp.importance) }}</UiBadge>
                  <a :href="`#kp-${kp.id}`" class="flex h-9 w-9 items-center justify-center rounded-lg text-fg-muted hover:bg-surface-muted hover:text-brand"
                     :aria-label="`跳转到该知识点：${kp.title}`">#</a>
                </div>
              </div>
              <p v-if="kp.section" class="mt-1 text-xs text-fg-muted">{{ kp.section }}</p>
              <div class="reader-content mt-3" v-html="renderMarkdown(kp.content)" />
              <div class="mt-3 flex flex-wrap items-center gap-3 text-xs">
                <NuxtLink v-if="kp.questionCount" :to="`/practice?mode=kp&target=${kp.id}`"
                          class="inline-flex min-h-11 items-center rounded-lg border border-brand/30 px-3 text-brand hover:bg-brand-soft">
                  练相关题（{{ kp.questionCount }}）
                </NuxtLink>
                <span v-else class="text-fg-muted">暂无关联题</span>
              </div>
            </section>
          </article>

          <div v-else class="mt-6 rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-secondary">
            <template v-if="total > 0 && part > 1">
              这一部分没有内容。
              <NuxtLink :to="partLink(1)" class="text-brand hover:underline">回到第 1 部分</NuxtLink>
            </template>
            <template v-else>
              本节暂未整理知识点。
              <NuxtLink :to="`/practice?mode=chapter&target=${section.id}`" class="ml-1 text-brand hover:underline">
                直接练本节题目
              </NuxtLink>
            </template>
          </div>

          <nav v-if="totalPages > 1" class="mt-6 flex flex-wrap items-center justify-between gap-2 rounded-xl border border-line-subtle bg-surface-card px-4 py-3 text-sm">
            <NuxtLink v-if="part > 1" :to="partLink(part - 1)" class="text-brand hover:underline">← 上一部分</NuxtLink>
            <span v-else></span>
            <span class="text-xs text-fg-muted">第 {{ part }} / {{ totalPages }} 部分</span>
            <NuxtLink v-if="part < totalPages" :to="partLink(part + 1)" class="text-brand hover:underline">下一部分 →</NuxtLink>
          </nav>

          <nav class="mt-8 grid gap-3 border-t border-line-subtle pt-5 sm:grid-cols-2">
            <NuxtLink v-if="prev" :to="`/knowledge/section/${prev.id}`"
                      class="rounded-xl border border-line-subtle bg-surface-card px-4 py-3 hover:border-brand">
              <span class="text-xs text-fg-muted">← 上一节</span>
              <span class="mt-0.5 block truncate text-sm font-medium text-fg-primary">{{ prev.name }}</span>
            </NuxtLink>
            <NuxtLink v-if="next" :to="`/knowledge/section/${next.id}`"
                      class="rounded-xl border border-line-subtle bg-surface-card px-4 py-3 text-right hover:border-brand sm:col-start-2">
              <span class="text-xs text-fg-muted">下一节 →</span>
              <span class="mt-0.5 block truncate text-sm font-medium text-fg-primary">{{ next.name }}</span>
            </NuxtLink>
          </nav>
        </template>
      </main>
    </div>

    <!-- 移动端目录 -->
    <UiModal v-model="tocOpen" title="本节目录" size="lg">
      <div v-for="chapter in chapters" :key="chapter.code ?? chapter.name" class="mb-4">
        <p class="mb-1 flex items-center gap-1.5 text-xs font-medium text-fg-muted">
          <span v-if="chapter.code" class="rounded bg-surface-muted px-1 py-0.5 font-mono">{{ chapter.code }}</span>
          {{ chapter.name }}
        </p>
        <NuxtLink v-for="item in chapter.items" :key="item.id" :to="`/knowledge/section/${item.id}`"
                  class="flex min-h-11 items-center rounded-lg px-2 text-sm"
                  :class="item.id === id ? 'bg-brand-soft font-medium text-brand-on-soft' : 'text-fg-secondary hover:bg-surface-muted'"
                  @click="tocOpen = false">
          {{ item.name }}
        </NuxtLink>
      </div>
    </UiModal>
  </div>
</template>

<style scoped>
.reader-content {
  font-size: 1rem;
  line-height: 1.75;
  color: rgb(var(--fg-secondary));
  overflow-wrap: anywhere;
}
@media (min-width: 1024px) {
  .reader-content { font-size: 1.0625rem; }
}
.reader-content :deep(h1),
.reader-content :deep(h2),
.reader-content :deep(h3),
.reader-content :deep(h4) {
  margin: 1rem 0 0.4rem;
  font-weight: 600;
  color: rgb(var(--fg-primary));
}
.reader-content :deep(h1) { font-size: 1.15rem; }
.reader-content :deep(h2) { font-size: 1.05rem; }
.reader-content :deep(h3) { font-size: 1rem; }
.reader-content :deep(p) { margin: 0.5rem 0; }
.reader-content :deep(ul),
.reader-content :deep(ol) { margin: 0.5rem 0; padding-left: 1.3rem; }
.reader-content :deep(ul) { list-style: disc; }
.reader-content :deep(ol) { list-style: decimal; }
.reader-content :deep(.table-wrap) {
  margin: 0.75rem 0;
  overflow-x: auto;
  -webkit-overflow-scrolling: touch;
}
.reader-content :deep(table) {
  width: 100%;
  min-width: 420px;
  border-collapse: collapse;
  font-size: 0.85rem;
}
.reader-content :deep(th),
.reader-content :deep(td) {
  border: 1px solid rgb(var(--line-subtle));
  padding: 0.35rem 0.5rem;
  vertical-align: top;
}
.reader-content :deep(th) { background: rgb(var(--surface-muted)); }
.reader-content :deep(pre) {
  overflow-x: auto;
  margin: 0.75rem 0;
  border-radius: 0.5rem;
  background: rgb(var(--surface-muted));
  padding: 0.75rem;
  font-size: 0.85rem;
}
.reader-content :deep(code) {
  border-radius: 0.25rem;
  background: rgb(var(--surface-muted));
  padding: 0 0.25rem;
  font-size: 0.9em;
}
.reader-content :deep(img) {
  max-width: 100%;
  height: auto;
  border-radius: 0.5rem;
}
.reader-content :deep(blockquote) {
  margin: 0.75rem 0;
  border-left: 3px solid rgb(var(--brand));
  padding-left: 0.75rem;
  color: rgb(var(--fg-muted));
}
.reader-content :deep(a) {
  color: rgb(var(--brand));
  text-decoration: underline;
  text-underline-offset: 2px;
}
</style>
