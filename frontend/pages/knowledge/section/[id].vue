<script setup lang="ts">
// 节阅读器：一节内连续阅读全部知识点，支持锚点、上一节/下一节
import { ALL_COURSES } from '~/utils/constants'
import { formatText } from '~/composables/format'
import { normalizeKnowledgeContent, renderMarkdown } from '~/utils/markdown'
import { courseOf, flattenSections, hasOwnNumbering, kpOrdinal, type KNode, type SectionRef } from '~/utils/knowledge'

definePageMeta({ layout: 'immersive' })

const route = useRoute()
const router = useRouter()
const id = computed(() => Number(route.params.id))
const part = computed(() => Math.max(1, Number(route.query.part) || 1))
// 后端单次上限 100；100 条以内整节一次读完，不再分“第 1/2 部分”
const size = 100
const tocOpen = ref(false)
const progress = ref(0)
const readerFont = ref(17)
const fontOptions = [15, 17, 19]
const learnedSections = ref<number[]>([])
const activeKp = ref<number | null>(null)
const learned = computed(() => learnedSections.value.includes(id.value))
let spy: IntersectionObserver | null = null
let lastProgressSave = 0

const { data: tree } = await useFetch<KNode[]>('/api/knowledge/tree')
const { data: payload, error: loadError } = await useFetch<any>(() => `/api/knowledge/section/${id.value}`, {
  query: { page: part, size },
})

const section = computed<any>(() => payload.value?.section ?? null)
const kps = computed<any[]>(() => payload.value?.kps ?? [])
const contentByKp = computed(() => {
  const map = new Map<number, string>()
  for (const kp of kps.value) {
    map.set(Number(kp.id), normalizeKnowledgeContent(kp.content ?? '', kp.title ?? '').trim())
  }
  return map
})
function contentOf(kp: any): string {
  return contentByKp.value.get(Number(kp.id)) ?? ''
}
const questionsByKp = computed(() => {
  const map = new Map<number, any[]>()
  for (const question of payload.value?.questions ?? []) {
    const kpId = Number(question.kpId)
    if (!map.has(kpId)) map.set(kpId, [])
    map.get(kpId)!.push(question)
  }
  return map
})
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

/** 历史标题里可能有 &lt; 等实体，展示前还原 */
function displayTitle(kp: any): string {
  return formatText(String(kp.title ?? ''))
}

/** 标题已有“3.3”“10.4.1”等编号时不再加阅读器序号 */
function kpPrefix(kp: any, index: number): string {
  return hasOwnNumbering(displayTitle(kp)) ? '' : `${kpOrdinal(part.value, index, size)}. `
}

/** 来源里的 section 常与标题完全相同，重复时不再显示 */
function sectionLabel(kp: any): string {
  const label = formatText(String(kp.section ?? '')).trim()
  const title = displayTitle(kp).trim()
  return label && label !== title ? label : ''
}

function partLink(target: number) {
  return {
    path: `/knowledge/section/${id.value}`,
    query: target > 1 ? { part: target } : {},
  }
}

function readerPath(kpId?: number) {
  return `/knowledge/section/${id.value}${part.value > 1 ? `?part=${part.value}` : ''}${kpId ? `#kp-${kpId}` : ''}`
}

function practiceReturn(kpId?: number) {
  return `/practice?mode=${kpId ? 'kp' : 'chapter'}&target=${kpId ?? id.value}&return=${encodeURIComponent(readerPath(kpId))}`
}

function setFont(size: number) {
  readerFont.value = size
  try { localStorage.setItem('quiz_reader_font', String(size)) } catch { /* 忽略 */ }
}

function cycleFont() {
  const index = fontOptions.indexOf(readerFont.value)
  setFont(fontOptions[(index + 1) % fontOptions.length] ?? fontOptions[0]!)
}

function isLearned(sectionId: number) {
  return learnedSections.value.includes(sectionId)
}

function toggleLearned() {
  const set = new Set(learnedSections.value)
  if (set.has(id.value)) set.delete(id.value)
  else set.add(id.value)
  learnedSections.value = [...set]
  try { localStorage.setItem('quiz_learned', JSON.stringify(learnedSections.value)) } catch { /* 忽略 */ }
}

function loadPreferences() {
  try {
    const font = Number(localStorage.getItem('quiz_reader_font'))
    if (fontOptions.includes(font)) readerFont.value = font
    const raw = JSON.parse(localStorage.getItem('quiz_learned') ?? '[]')
    if (Array.isArray(raw)) learnedSections.value = raw.map(Number).filter(Number.isFinite)
  } catch { /* 忽略 */ }
}

function setupSpy() {
  if (typeof window === 'undefined') return
  spy?.disconnect()
  const elements = [...document.querySelectorAll<HTMLElement>('section[id^="kp-"]')]
  if (!elements.length) return
  activeKp.value = Number(elements[0]!.id.slice(3)) || null
  spy = new IntersectionObserver((entries) => {
    const visible = entries
      .filter(entry => entry.isIntersecting)
      .sort((a, b) => a.boundingClientRect.top - b.boundingClientRect.top)
    if (visible[0]) activeKp.value = Number(visible[0].target.id.slice(3)) || null
  }, { rootMargin: '-100px 0px -60% 0px', threshold: [0, 1] })
  elements.forEach(element => spy!.observe(element))
}

watch(part, async () => {
  await nextTick()
  if (typeof window !== 'undefined') window.scrollTo({ top: 0 })
})
watch(kps, async () => {
  await nextTick()
  setupSpy()
}, { immediate: true })

function onScroll() {
  const el = document.documentElement
  const max = el.scrollHeight - el.clientHeight
  progress.value = max > 0 ? Math.min(100, Math.round((window.scrollY / max) * 100)) : 0
  if (Date.now() - lastProgressSave > 800) {
    lastProgressSave = Date.now()
    try {
      const raw = JSON.parse(localStorage.getItem('quiz_reader_progress') ?? '{}')
      const map = raw && typeof raw === 'object' ? raw : {}
      map[id.value] = progress.value
      localStorage.setItem('quiz_reader_progress', JSON.stringify(map))
    } catch { /* 忽略 */ }
  }
}

onMounted(() => {
  window.addEventListener('scroll', onScroll, { passive: true })
  loadPreferences()
  onScroll()
})
onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
  spy?.disconnect()
})

// 旧链接可能是 ?part=2，但整节已一页加载；自动回第 1 部分
watch([payload, part], () => {
  if (import.meta.client && payload.value && total.value > 0 && part.value > totalPages.value) {
    router.replace(partLink(1))
  }
}, { immediate: true })

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
          <p class="truncate text-sm font-semibold text-fg-primary">
            {{ section?.name ?? '知识点阅读' }}
            <span v-if="learned" class="text-success-fg">· 已学</span>
          </p>
        </div>
        <button type="button" class="min-h-11 rounded-lg border border-line-strong px-2 text-xs text-fg-secondary"
                aria-label="调整字号" @click="cycleFont">Aa {{ readerFont }}</button>
        <button type="button" class="min-h-11 rounded-lg border border-line-strong px-3 text-xs text-fg-secondary"
                @click="tocOpen = true">目录</button>
      </div>
    </header>

    <div class="mx-auto max-w-6xl px-3 pb-24 pt-5 sm:px-4 lg:grid lg:grid-cols-[220px_minmax(0,1fr)] lg:gap-8 lg:pb-5 min-[1200px]:max-w-7xl min-[1200px]:grid-cols-[220px_minmax(0,1fr)_180px] xl:max-w-7xl xl:grid-cols-[220px_minmax(0,1fr)_180px] 2xl:max-w-[1760px] 2xl:grid-cols-[240px_minmax(0,1fr)_220px] 2xl:gap-10">
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
              <span v-if="isLearned(item.id)" class="mr-1 text-success-fg">●</span>{{ item.name }}
            </NuxtLink>
          </div>
        </div>
      </aside>

      <main class="min-w-0 lg:max-w-3xl 2xl:max-w-4xl 2xl:justify-self-center">
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
            <div class="mt-3 flex flex-wrap items-center gap-2 text-xs">
              <button type="button"
                      class="inline-flex min-h-11 items-center rounded-lg border px-3"
                      :class="learned ? 'border-success-border bg-success-bg text-success-fg' : 'border-line-strong text-fg-secondary hover:border-brand hover:text-brand'"
                      @click="toggleLearned">
                {{ learned ? '✓ 已学' : '标记本节已学' }}
              </button>
              <NuxtLink :to="practiceReturn()"
                        class="inline-flex min-h-11 items-center rounded-lg border border-brand/30 px-3 text-brand hover:bg-brand-soft">
                练本节题目
              </NuxtLink>
              <span class="hidden items-center gap-0.5 rounded-lg border border-line-subtle bg-surface-card p-0.5 lg:inline-flex"
                    role="group" aria-label="正文字号">
                <span class="px-1.5 text-[11px] text-fg-muted">Aa</span>
                <button v-for="size in fontOptions" :key="size" type="button"
                        class="inline-flex h-8 min-w-8 items-center justify-center rounded-md px-1 text-xs"
                        :class="readerFont === size ? 'bg-brand text-white' : 'text-fg-muted hover:bg-surface-muted hover:text-fg-primary'"
                        :aria-label="`字号 ${size}px`" :aria-pressed="readerFont === size"
                        :title="`字号 ${size}px`" @click="setFont(size)">
                  {{ size }}
                </button>
              </span>
            </div>
          </header>

          <article v-if="kps.length" class="mt-2" :style="{ '--reader-fs': `${readerFont}px` }">
            <section v-for="(kp, kpIndex) in kps" :id="`kp-${kp.id}`" :key="kp.id" class="scroll-mt-28 border-b border-line-subtle py-6 last:border-b-0">
              <div class="flex flex-wrap items-start justify-between gap-2">
                <h2 class="min-w-0 text-lg font-semibold leading-7 text-fg-primary">
                  {{ kpPrefix(kp, kpIndex) }}{{ displayTitle(kp) }}
                </h2>
                <div class="flex shrink-0 items-center gap-1.5">
                  <UiBadge v-if="importanceLabel(kp.importance)" tone="amber">{{ importanceLabel(kp.importance) }}</UiBadge>
                  <a :href="`#kp-${kp.id}`" class="flex h-9 w-9 items-center justify-center rounded-lg text-fg-muted hover:bg-surface-muted hover:text-brand"
                     :aria-label="`跳转到该知识点：${displayTitle(kp)}`">#</a>
                </div>
              </div>
              <p v-if="sectionLabel(kp)" class="mt-1 text-xs text-fg-muted">{{ sectionLabel(kp) }}</p>
              <div v-if="contentOf(kp)" class="reader-content mt-3" v-html="renderMarkdown(contentOf(kp))" />
              <p v-else class="mt-3 rounded-lg border border-dashed border-line-strong px-3 py-2 text-sm leading-6 text-fg-muted">
                本知识点暂无展开讲解，建议直接练习相关题目或结合教材阅读。
              </p>
              <p v-if="contentOf(kp) && contentOf(kp).length < 20" class="mt-2 text-xs text-warn-fg">
                内容较短，建议结合教材核对。
              </p>

              <details v-if="questionsByKp.get(kp.id)?.length"
                       class="mt-3 overflow-hidden rounded-lg border border-line-subtle bg-surface-card">
                <summary class="flex min-h-11 cursor-pointer items-center justify-between gap-2 px-3 text-xs text-fg-secondary">
                  <span>自测（{{ questionsByKp.get(kp.id)?.length }}）</span>
                  <span class="text-fg-muted">展开作答</span>
                </summary>
                <div class="space-y-2 border-t border-line-subtle p-3">
                  <KnowledgeQuestion v-for="q in questionsByKp.get(kp.id)" :key="q.id" :question="q" />
                  <p class="text-xs text-fg-muted">
                    想记录进度？
                    <NuxtLink :to="practiceReturn(kp.id)" class="text-brand hover:underline">进入完整练习</NuxtLink>
                  </p>
                </div>
              </details>

              <div class="mt-3 flex flex-wrap items-center gap-3 text-xs">
                <NuxtLink v-if="kp.questionCount" :to="practiceReturn(kp.id)"
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

      <!-- 桌面右侧本部分目录 -->
      <aside class="hidden min-[1200px]:block">
        <div class="sticky top-8 max-h-[calc(100vh-4rem)] overflow-auto pl-2">
          <p class="mb-2 text-xs font-medium text-fg-muted">本部分目录</p>
          <a v-for="kp in kps" :key="kp.id" :href="`#kp-${kp.id}`"
             class="block border-l-2 py-1 pl-2 text-xs leading-5"
             :class="activeKp === kp.id
               ? 'border-brand font-medium text-brand'
               : 'border-line-subtle text-fg-muted hover:text-fg-secondary'">
            {{ displayTitle(kp) }}
          </a>
          <p v-if="!kps.length" class="text-xs text-fg-muted">暂无知识点</p>
        </div>
      </aside>
    </div>

    <!-- 移动端上一节/下一节 -->
    <nav class="fixed inset-x-0 bottom-0 z-30 border-t border-line-subtle bg-surface-glass backdrop-blur lg:hidden">
      <div class="mx-auto flex max-w-3xl items-center gap-2 px-3 py-2 pb-[max(0.5rem,env(safe-area-inset-bottom))]">
        <NuxtLink v-if="prev" :to="`/knowledge/section/${prev.id}`"
                  class="flex min-h-11 items-center rounded-lg border border-line-strong px-3 text-xs text-fg-secondary">
          ← 上一节
        </NuxtLink>
        <span v-else class="w-20" />
        <span class="flex-1 text-center text-xs tabular-nums text-fg-muted">阅读 {{ progress }}%</span>
        <NuxtLink v-if="next" :to="`/knowledge/section/${next.id}`"
                  class="flex min-h-11 items-center rounded-lg border border-line-strong px-3 text-xs text-fg-secondary">
          下一节 →
        </NuxtLink>
        <span v-else class="w-20" />
      </div>
    </nav>

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
          <span v-if="isLearned(item.id)" class="mr-1 text-success-fg">●</span>{{ item.name }}
        </NuxtLink>
      </div>
    </UiModal>
  </div>
</template>

<style scoped>
.reader-content {
  font-size: var(--reader-fs, 1rem);
  line-height: 1.75;
  color: rgb(var(--fg-secondary));
  overflow-wrap: anywhere;
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
