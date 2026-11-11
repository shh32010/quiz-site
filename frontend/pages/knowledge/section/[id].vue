<script setup lang="ts">
// 节阅读器：新版结构化讲义（kb_entry + kb_revision）阅读、三色标记与图例、只看必记、搜索高亮及跨端进度同步
import { ALL_COURSES } from '~/utils/constants'
import {
  courseOf,
  flattenSections,
  shortNodeCode,
  stripLeadingNumber,
  type KbEntry,
  type KNode,
  type SectionRef,
} from '~/utils/knowledge'

definePageMeta({ layout: 'immersive' })

const route = useRoute()
const router = useRouter()
const api = useApi()
const id = computed(() => Number(route.params.id))
const part = computed(() => Math.max(1, Number(route.query.part) || 1))
const size = 100
const tocOpen = ref(false)
const progress = ref(0)
const readerFont = ref(17)
const fontOptions = [15, 17, 19]
const learnedSections = ref<number[]>([])
const activeEntryNode = ref<number | null>(null)
const coreOnly = ref(false)
const learned = computed(() => learnedSections.value.includes(id.value))
const highlightKeyword = computed(() => String(route.query.hl ?? '').trim())
let lastProgressSave = 0
let lastRemoteSync = 0

const { data: tree } = await useFetch<KNode[]>('/api/knowledge/tree')
const { data: payload, error: loadError } = await useFetch<any>(() => `/api/knowledge/section/${id.value}`, {
  query: { page: part, size },
})

const section = computed<any>(() => payload.value?.section ?? null)
const entries = computed<KbEntry[]>(() => payload.value?.entries ?? [])
const kps = computed<any[]>(() => payload.value?.kps ?? [])

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

useHead(() => ({ title: section.value?.name ? `${section.value.name} · 知识点讲义` : '知识点阅读' }))

let isClickScrolling = false
let clickScrollTimer: ReturnType<typeof setTimeout> | null = null

function jumpToGroup(nodeId?: number) {
  if (!nodeId) return
  tocOpen.value = false
  activeEntryNode.value = nodeId
  isClickScrolling = true
  if (clickScrollTimer) clearTimeout(clickScrollTimer)
  clickScrollTimer = setTimeout(() => {
    isClickScrolling = false
  }, 800)

  nextTick(() => {
    const el = document.getElementById(`group-${nodeId}`)
    if (!el) return
    const top = el.getBoundingClientRect().top + window.scrollY - 85
    window.scrollTo({ top, behavior: 'smooth' })
  })
}

function clearHighlight() {
  const nextQuery = { ...route.query }
  delete nextQuery.hl
  router.replace({ path: route.path, query: nextQuery, hash: route.hash })
}

interface TocRow {
  kind: 'group'
  key: string
  nodeId: number
  count: number
  code: string | null
  name: string
}

const tocRows = computed<TocRow[]>(() => {
  return entries.value.map(entry => ({
    kind: 'group',
    key: `group-${entry.nodeId}`,
    nodeId: entry.nodeId,
    count: entry.blocks?.length ?? 0,
    code: shortNodeCode(entry.nodeCode ?? section.value?.code ?? ''),
    name: stripLeadingNumber(entry.nodeName ?? ''),
  }))
})

const activeGroupId = computed(() => {
  if (activeEntryNode.value && tocRows.value.some(r => r.nodeId === activeEntryNode.value)) {
    return activeEntryNode.value
  }
  return tocRows.value[0]?.nodeId ?? null
})

function readerPath(nodeId?: number) {
  return `/knowledge/section/${id.value}${nodeId ? `#group-${nodeId}` : ''}`
}

function practiceReturn(nodeId?: number) {
  return `/practice?mode=${nodeId ? 'kp' : 'chapter'}&target=${nodeId ?? id.value}&return=${encodeURIComponent(readerPath(nodeId))}`
}

function setFont(fontSize: number) {
  readerFont.value = fontSize
  try { localStorage.setItem('quiz_reader_font', String(fontSize)) } catch { /* 忽略 */ }
}

function cycleFont() {
  const idx = fontOptions.indexOf(readerFont.value)
  setFont(fontOptions[(idx + 1) % fontOptions.length] ?? fontOptions[0]!)
}

function isLearned(sectionId: number) {
  return learnedSections.value.includes(sectionId)
}

async function syncProgressToServer(learnedVal: boolean, progressPctVal: number) {
  if (!api.hasToken() || !id.value) return
  try {
    await api.put(`/api/knowledge/progress/${id.value}`, {
      learned: learnedVal,
      progressPct: progressPctVal,
      lastKpId: activeEntryNode.value ?? null,
    })
  } catch { /* 网络或鉴权异常时静默降级为本地存储 */ }
}

function toggleLearned() {
  const set = new Set(learnedSections.value)
  if (set.has(id.value)) set.delete(id.value)
  else set.add(id.value)
  learnedSections.value = [...set]
  try { localStorage.setItem('quiz_learned', JSON.stringify(learnedSections.value)) } catch { /* 忽略 */ }
  syncProgressToServer(set.has(id.value), progress.value)
}

async function loadPreferences() {
  try {
    const font = Number(localStorage.getItem('quiz_reader_font'))
    if (fontOptions.includes(font)) readerFont.value = font
    const raw = JSON.parse(localStorage.getItem('quiz_learned') ?? '[]')
    if (Array.isArray(raw)) learnedSections.value = raw.map(Number).filter(Number.isFinite)
  } catch { /* 忽略 */ }

  if (api.hasToken()) {
    try {
      const remote = await api.get<any>('/api/knowledge/progress')
      const rows = Array.isArray(remote?.rows) ? remote.rows : []
      if (rows.length > 0) {
        const merged = new Set(learnedSections.value)
        for (const r of rows) {
          if (r.learned && Number.isFinite(Number(r.sectionId))) {
            merged.add(Number(r.sectionId))
          }
        }
        learnedSections.value = [...merged]
        try { localStorage.setItem('quiz_learned', JSON.stringify(learnedSections.value)) } catch { /* 忽略 */ }
      }
    } catch { /* 忽略 */ }
  }
}

function updateActiveSection() {
  if (isClickScrolling) return
  if (typeof window === 'undefined') return
  const elements = [...document.querySelectorAll<HTMLElement>('section[id^="group-"]')]
  if (!elements.length) return

  const scrollY = window.scrollY
  const maxScroll = document.documentElement.scrollHeight - window.innerHeight

  // 1. 靠近页面顶端 (< 90px)，锁定首个考点
  if (scrollY < 90) {
    activeEntryNode.value = Number(elements[0]!.id.slice(6)) || null
    return
  }

  // 2. 到达页面底端 (< 80px)，锁定最后一个考点
  if (maxScroll > 0 && scrollY >= maxScroll - 80) {
    const lastEl = elements[elements.length - 1]!
    activeEntryNode.value = Number(lastEl.id.slice(6)) || null
    return
  }

  // 3. 常规滚动：以视口黄金阅读线 (scrollY + 130px) 检测当前正处于阅读视口的考点
  const readingLine = scrollY + 130
  let currentId: number | null = null
  for (const el of elements) {
    if (el.offsetTop <= readingLine) {
      currentId = Number(el.id.slice(6)) || null
    } else {
      break
    }
  }

  if (currentId) {
    activeEntryNode.value = currentId
  } else {
    activeEntryNode.value = Number(elements[0]!.id.slice(6)) || null
  }
}

/** 兼容旧版 #kp-123 锚点：自动定位到所属考纲讲义条目 #group-{nodeId} */
function resolveLegacyHashInStructuredMode() {
  if (typeof window === 'undefined') return
  const hash = window.location.hash
  if (hash.startsWith('#group-')) {
    const el = document.getElementById(hash.slice(1))
    if (el) nextTick(() => el.scrollIntoView({ behavior: 'smooth', block: 'start' }))
    return
  }
  if (!hash.startsWith('#kp-')) return
  const kpId = Number(hash.slice(4))
  const hitKp = kps.value.find(item => Number(item.id) === kpId)
  const targetNodeId = hitKp?.nodeId ?? kpId
  nextTick(() => {
    document.getElementById(`group-${targetNodeId}`)?.scrollIntoView({ behavior: 'smooth', block: 'start' })
  })
}

watch(id, () => {
  activeEntryNode.value = null
})

watch(entries, async () => {
  await nextTick()
  updateActiveSection()
  resolveLegacyHashInStructuredMode()
}, { immediate: true })

function onScroll() {
  const el = document.documentElement
  const max = el.scrollHeight - el.clientHeight
  progress.value = max > 0 ? Math.min(100, Math.round((window.scrollY / max) * 100)) : 0
  updateActiveSection()
  const now = Date.now()
  if (now - lastProgressSave > 800) {
    lastProgressSave = now
    try {
      const raw = JSON.parse(localStorage.getItem('quiz_reader_progress') ?? '{}')
      const map = raw && typeof raw === 'object' ? raw : {}
      map[id.value] = progress.value
      localStorage.setItem('quiz_reader_progress', JSON.stringify(map))
    } catch { /* 忽略 */ }
  }
  if (now - lastRemoteSync > 6000) {
    lastRemoteSync = now
    syncProgressToServer(learned.value, progress.value)
  }
}

onMounted(() => {
  window.addEventListener('scroll', onScroll, { passive: true })
  window.addEventListener('resize', updateActiveSection, { passive: true })
  loadPreferences()
  onScroll()
})
onUnmounted(() => {
  window.removeEventListener('scroll', onScroll)
  window.removeEventListener('resize', updateActiveSection)
  if (clickScrollTimer) clearTimeout(clickScrollTimer)
})

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
        <button type="button" class="min-h-11 rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-2 text-xs text-fg-secondary"
                aria-label="调整字号" @click="cycleFont">Aa {{ readerFont }}</button>
        <button type="button" class="min-h-11 rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 text-xs text-fg-secondary"
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
              <span v-if="isLearned(item.id)" class="mr-1 text-success-fg">●</span><span v-if="shortNodeCode(item.code)" class="mr-1 font-mono">{{ shortNodeCode(item.code) }}</span>{{ item.name }}
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
            <div class="flex flex-wrap items-center gap-2">
              <h1 class="text-2xl font-bold tracking-tight text-fg-primary">{{ section.name }}</h1>
              <UiBadge tone="blue">结构化讲义</UiBadge>
            </div>
            <p class="mt-1 text-sm text-fg-secondary">
              {{ shortNodeCode(section.code) }} · {{ entries.length }} 个大纲考点讲义 · 已精编
            </p>

            <!-- 搜索高亮提示条 -->
            <div v-if="highlightKeyword"
                 class="mt-2.5 inline-flex items-center gap-2 rounded-lg border border-warn-border bg-warn-bg/60 px-3 py-1.5 text-xs text-warn-fg">
              <span>已高亮搜索词：「<b>{{ highlightKeyword }}</b>」</span>
              <button type="button" class="underline hover:text-fg-primary" @click="clearHighlight">清除高亮</button>
            </div>

            <!-- 工具栏按钮 -->
            <div class="mt-3 flex flex-wrap items-center gap-2 text-xs">
              <button type="button"
                      class="inline-flex min-h-11 items-center rounded-lg border px-3"
                      :class="learned ? 'border-success-border bg-success-bg text-success-fg' : 'border-line-strong text-fg-secondary hover:border-brand hover:text-brand'"
                      @click="toggleLearned">
                {{ learned ? '✓ 已学' : '标记本节已学' }}
              </button>
              <button type="button"
                      class="inline-flex min-h-11 items-center rounded-lg border px-3 transition"
                      :class="coreOnly ? 'border-danger-border bg-danger-bg text-danger-fg font-medium' : 'border-line-strong text-fg-secondary hover:border-brand hover:text-brand'"
                      :aria-pressed="coreOnly"
                      @click="coreOnly = !coreOnly">
                {{ coreOnly ? '★ 只看必记（已开启）' : '☆ 只看必记' }}
              </button>
              <NuxtLink :to="practiceReturn()"
                        class="inline-flex min-h-11 items-center rounded-lg border border-brand/30 px-3 text-brand hover:bg-brand-soft">
                练本节题目
              </NuxtLink>
              <span class="hidden items-center gap-0.5 rounded-lg border border-line-subtle bg-surface-card p-0.5 lg:inline-flex"
                    role="group" aria-label="正文字号">
                <span class="px-1.5 text-[11px] text-fg-muted">Aa</span>
                <button v-for="fontSize in fontOptions" :key="fontSize" type="button"
                        class="inline-flex h-8 min-w-8 items-center justify-center rounded-md px-1 text-xs"
                        :class="readerFont === fontSize ? 'bg-brand text-white' : 'text-fg-muted hover:bg-surface-muted hover:text-fg-primary'"
                        :aria-label="`字号 ${fontSize}px`" :aria-pressed="readerFont === fontSize"
                        :title="`字号 ${fontSize}px`" @click="setFont(fontSize)">
                  {{ fontSize }}
                </button>
              </span>
            </div>

            <!-- 四色图例说明条 -->
            <div class="mt-3 flex flex-wrap items-center gap-x-3 gap-y-1.5 rounded-lg border border-line-subtle bg-surface-muted/50 px-3 py-1.5 text-xs">
              <span class="font-medium text-fg-muted">图例：</span>
              <span class="inline-flex items-center gap-1">
                <mark class="rounded bg-danger-bg px-1.5 py-0.5 text-[11px] font-semibold text-danger-fg">必记</mark>
                <span class="text-fg-muted">（核心高频）</span>
              </span>
              <span class="inline-flex items-center gap-1">
                <mark class="rounded bg-success-bg px-1.5 py-0.5 text-[11px] font-semibold text-success-fg underline decoration-success-fg">重点</mark>
                <span class="text-fg-muted">（必需熟悉）</span>
              </span>
              <span class="inline-flex items-center gap-1">
                <mark class="rounded bg-warn-bg px-1.5 py-0.5 text-[11px] font-semibold text-warn-fg">难点</mark>
                <span class="text-fg-muted">（尽量掌握）</span>
              </span>
              <span class="inline-flex items-center gap-1">
                <span class="rounded bg-surface-muted px-1.5 py-0.5 text-[11px] text-fg-secondary">常规</span>
                <span class="text-fg-muted">（必需了解）</span>
              </span>
            </div>
          </header>

          <!-- 结构化讲义阅读器 -->
          <article v-if="entries.length" class="mt-4 space-y-8" :style="{ '--reader-fs': `${readerFont}px` }">
            <section v-for="entry in entries" :id="`group-${entry.nodeId}`" :key="entry.nodeId"
                     class="scroll-mt-28 rounded-2xl border border-line-subtle bg-surface-card/60 p-4 sm:p-6">
              <div class="flex flex-wrap items-start justify-between gap-2 border-b border-line-subtle pb-3">
                <div class="min-w-0">
                  <p v-if="entry.nodeCode" class="font-mono text-xs font-semibold text-brand">{{ shortNodeCode(entry.nodeCode) }}</p>
                  <h2 class="mt-0.5 text-lg font-bold text-fg-primary sm:text-xl">{{ entry.nodeName }}</h2>
                </div>
                <div class="flex shrink-0 items-center gap-1.5">
                  <UiBadge tone="blue">精编讲义 v{{ entry.revNo }}</UiBadge>
                  <a :href="`#group-${entry.nodeId}`"
                     class="flex h-9 w-9 items-center justify-center rounded-lg text-fg-muted hover:bg-surface-muted hover:text-brand"
                     :aria-label="`定位到考点：${entry.nodeName}`">#</a>
                </div>
              </div>

              <div class="mt-4">
                <KnowledgeBlockRenderer
                  :blocks="entry.blocks ?? []"
                  :core-only="coreOnly"
                  :highlight-keyword="highlightKeyword"
                />
              </div>

              <details v-if="entry.questions?.length"
                       class="mt-4 overflow-hidden rounded-xl border border-line-subtle bg-surface-card">
                <summary class="flex min-h-11 cursor-pointer items-center justify-between gap-2 px-3.5 text-xs font-medium text-fg-secondary">
                  <span>随堂自测（{{ entry.questions.length }} 题 · 共 {{ entry.questionCount || entry.questions.length }} 道关联题）</span>
                  <span class="text-brand">展开作答</span>
                </summary>
                <div class="space-y-2.5 border-t border-line-subtle p-3.5">
                  <KnowledgeQuestion v-for="q in entry.questions" :key="q.id" :question="q" />
                </div>
              </details>
            </section>
          </article>

          <div v-else class="mt-6 rounded-xl border border-line-subtle bg-surface-card px-5 py-8 text-center text-sm text-fg-secondary">
            <template v-if="coreOnly">
              本节暂未标记“必记”块。
              <button type="button" class="ml-1 text-brand hover:underline" @click="coreOnly = false">显示全部内容</button>
            </template>
            <template v-else>
              本节讲义整理中。
              <NuxtLink :to="`/practice?mode=chapter&target=${section.id}`" class="ml-1 text-brand hover:underline">
                直接练本节题目
              </NuxtLink>
            </template>
          </div>

          <nav class="mt-8 grid gap-3 border-t border-line-subtle pt-5 sm:grid-cols-2">
            <NuxtLink v-if="prev" :to="`/knowledge/section/${prev.id}`"
                      class="rounded-xl border border-line-subtle bg-surface-card px-4 py-3 hover:border-brand">
              <span class="text-xs text-fg-muted">← 上一节</span>
              <span class="mt-0.5 block truncate text-sm font-medium text-fg-primary">{{ shortNodeCode(prev.code) }} {{ prev.name }}</span>
            </NuxtLink>
            <NuxtLink v-if="next" :to="`/knowledge/section/${next.id}`"
                      class="rounded-xl border border-line-subtle bg-surface-card px-4 py-3 text-right hover:border-brand sm:col-start-2">
              <span class="text-xs text-fg-muted">下一节 →</span>
              <span class="mt-0.5 block truncate text-sm font-medium text-fg-primary">{{ shortNodeCode(next.code) }} {{ next.name }}</span>
            </NuxtLink>
          </nav>
        </template>
      </main>

      <!-- 桌面右侧本部分目录 -->
      <aside class="hidden min-[1200px]:block">
        <div class="sticky top-8 max-h-[calc(100vh-4rem)] overflow-auto pl-2">
          <p class="mb-2 text-xs font-medium text-fg-muted">本节目录</p>
          <template v-for="row in tocRows" :key="row.key">
            <a :href="`#group-${row.nodeId}`"
               class="block border-l-2 py-1.5 pl-2 transition-all duration-150"
               :class="activeGroupId === row.nodeId
                 ? 'border-brand font-semibold text-brand bg-brand-soft/20 rounded-r'
                 : 'border-line-subtle text-fg-muted hover:border-line-strong hover:text-fg-secondary'"
               @click.prevent="jumpToGroup(row.nodeId)">
              <span v-if="row.code" class="block font-mono text-[10px]">{{ row.code }}</span>
              <span class="block text-xs leading-5">{{ row.name }}</span>
            </a>
          </template>
          <p v-if="!entries.length" class="text-xs text-fg-muted">暂无考点讲义</p>
        </div>
      </aside>
    </div>

    <!-- 移动端上一节/下一节 -->
    <nav class="fixed inset-x-0 bottom-0 z-30 border-t border-line-subtle bg-surface-glass backdrop-blur lg:hidden">
      <div class="mx-auto flex max-w-3xl items-center gap-2 px-3 py-2 pb-[max(0.5rem,env(safe-area-inset-bottom))]">
        <NuxtLink v-if="prev" :to="`/knowledge/section/${prev.id}`"
                  class="flex min-h-11 items-center rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 text-xs text-fg-secondary">
          ← 上一节
        </NuxtLink>
        <span v-else class="w-20" />
        <span class="flex-1 text-center text-xs tabular-nums text-fg-muted">阅读 {{ progress }}%</span>
        <NuxtLink v-if="next" :to="`/knowledge/section/${next.id}`"
                  class="flex min-h-11 items-center rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 text-xs text-fg-secondary">
          下一节 →
        </NuxtLink>
        <span v-else class="w-20" />
      </div>
    </nav>

    <!-- 移动端目录模态 -->
    <UiModal v-model="tocOpen" title="本节目录" size="lg">
      <div class="space-y-0.5">
        <template v-for="row in tocRows" :key="row.key">
          <a :href="`#group-${row.nodeId}`"
             class="flex min-h-11 items-start gap-2 rounded-lg px-2 py-2"
             :class="activeGroupId === row.nodeId ? 'bg-brand-soft text-brand-on-soft' : 'text-fg-secondary hover:bg-surface-muted'"
             @click.prevent="jumpToGroup(row.nodeId)">
            <span class="min-w-0">
              <span v-if="row.code" class="block font-mono text-[10px] text-fg-muted">{{ row.code }}</span>
              <span class="block text-sm font-medium">{{ row.name }}</span>
            </span>
          </a>
        </template>
      </div>
      <p v-if="!entries.length" class="py-6 text-center text-sm text-fg-muted">暂无考点讲义</p>
      <NuxtLink :to="`/knowledge/course/${courseCode}`"
                class="mt-3 inline-flex text-xs text-brand hover:underline"
                @click="tocOpen = false">查看课程全部章节 →</NuxtLink>
    </UiModal>
  </div>
</template>
