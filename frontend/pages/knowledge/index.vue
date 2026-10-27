<script setup lang="ts">
// 知识点学习页：左侧大纲树（课程→章→节），右侧知识点列表
import { marked } from 'marked'

useHead({ title: '知识点学习' })

/** 先转义 HTML，再按 Markdown 渲染，避免内容里的原始标签被执行 */
function render(text: string) {
  const safe = (text ?? '')
    .replace(/&/g, '&amp;')
    .replace(/</g, '&lt;')
    .replace(/>/g, '&gt;')
  const html = marked.parse(safe, { async: false, gfm: true, breaks: true }) as string
  // 兜底拦截 Markdown 生成的 javascript:/data:/vbscript: 链接
  return html.replace(/\s(href|src)=["'](?:javascript|data|vbscript):[^"']*["']/gi, ' $1="#"')
}

interface KNode {
  id: number
  subjectId: number
  code: string | null
  name: string
  level: number
  kpCount: number
  children: KNode[]
}
interface KP {
  id: number
  title: string
  section: string | null
  content: string
  importance: string | null
  nodeCode: string | null
  nodeName: string | null
  questionCount: number
}

const route = useRoute()
const { data: tree } = await useFetch<KNode[]>('/api/knowledge/tree')

const COURSES = [
  { code: 'A', name: '计算机应用基础' },
  { code: 'B', name: '信息技术导论' },
  { code: 'S1', name: 'C 语言程序设计', label: '技能一' },
  { code: 'S2', name: '数据库（MySQL）', label: '技能二' },
  { code: 'S3', name: 'UML 建模', label: '技能三' },
  { code: 'S4', name: '局域网组建', label: '技能四' },
  { code: 'S5', name: 'Windows 10 管理', label: '技能五' },
  { code: 'S6', name: 'CentOS 7 管理', label: '技能六' },
]

/** 课程 → 章（理论 A/B 各含多个章；实操 S1~S6 各一章） */
const groups = computed(() => COURSES.map(c => {
  const roots = (tree.value ?? []).filter(n => {
    if (c.code === 'A') return n.subjectId === 4 && /^A\d/.test(n.code ?? '')
    if (c.code === 'B') return n.subjectId === 4 && /^B\d/.test(n.code ?? '')
    return n.subjectId === 5 && n.code === c.code
  })
  return {
    ...c,
    chapters: roots,
    total: roots.reduce((s, n) => s + n.kpCount, 0),
  }
}))

const selected = ref<KNode | null>(null)
const allMode = ref(false)
const sidebarOpen = ref(false)
const rows = ref<KP[]>([])
const total = ref(0)
const page = ref(1)
const q = ref('')
const loading = ref(false)
const error = ref('')
const size = 50

const totalPages = computed(() => Math.max(1, Math.ceil(total.value / size)))

async function load() {
  if (!allMode.value && !selected.value) return
  loading.value = true
  error.value = ''
  try {
    const r = allMode.value
      ? await $fetch<any>('/api/knowledge/search', {
          query: { q: q.value, page: page.value, size },
        })
      : await $fetch<any>('/api/knowledge', {
          query: { chapter: selected.value!.id, q: q.value, page: page.value, size },
        })
    rows.value = r.rows ?? []
    total.value = r.total ?? 0
  } catch (e: any) {
    error.value = e.message ?? '加载失败'
  } finally {
    loading.value = false
  }
}

async function select(node: KNode) {
  allMode.value = false
  selected.value = node
  sidebarOpen.value = false
  page.value = 1
  await load()
}

async function search() {
  page.value = 1
  await load()
}

async function searchAll() {
  allMode.value = true
  selected.value = null
  page.value = 1
  await load()
}

function findNode(nodes: KNode[], id: number): KNode | null {
  for (const n of nodes) {
    if (n.id === id) return n
    const hit = findNode(n.children ?? [], id)
    if (hit) return hit
  }
  return null
}

function go(p: number) {
  page.value = p
  load()
}

/** 移动端目录抽屉：打开时锁页面滚动，Esc 关闭；切到桌面宽度自动收起 */
const sidebarToggle = ref<HTMLButtonElement | null>(null)
const sidebarClose = ref<HTMLButtonElement | null>(null)
const isDesktop = ref(false)

function onKeydown(e: KeyboardEvent) {
  if (e.key === 'Escape' && sidebarOpen.value) sidebarOpen.value = false
}
function onDesktop(e: MediaQueryListEvent) {
  isDesktop.value = e.matches
  if (e.matches) sidebarOpen.value = false
}
let desktopQuery: MediaQueryList | null = null
watch(sidebarOpen, async (open) => {
  if (typeof document === 'undefined') return
  document.body.style.overflow = open && !isDesktop.value ? 'hidden' : ''
  if (open) {
    await nextTick()
    sidebarClose.value?.focus()
  } else if (!isDesktop.value) {
    sidebarToggle.value?.focus()
  }
})
onUnmounted(() => {
  window.removeEventListener('keydown', onKeydown)
  desktopQuery?.removeEventListener('change', onDesktop)
  if (typeof document !== 'undefined') document.body.style.overflow = ''
})

onMounted(async () => {
  window.addEventListener('keydown', onKeydown)
  desktopQuery = window.matchMedia('(min-width: 1024px)')
  isDesktop.value = desktopQuery.matches
  desktopQuery.addEventListener('change', onDesktop)
  const kpId = Number(route.query.kp)
  if (kpId) {
    try {
      const kp = await $fetch<any>(`/api/knowledge/${kpId}`)
      const node = findNode(tree.value ?? [], kp?.nodeId)
      if (node) {
        selected.value = node
        allMode.value = false
        q.value = kp.title ?? ''
        page.value = 1
        await load()
        return
      }
    } catch { /* 回退到默认章 */ }
  }
  const first = groups.value.find(g => g.chapters.length)?.chapters[0]
  if (first) select(first)
})
</script>

<template>
  <section class="space-y-4">
    <div>
      <h1 class="text-2xl font-bold text-slate-900">知识点学习</h1>
      <p class="mt-1 text-slate-600">按大纲树浏览课程、章、节的知识点；数字为知识点条数。没有关联题的知识点也可以正常阅读学习；题目关联由历史匹配生成，供辅助练习。</p>
    </div>

    <button ref="sidebarToggle"
            class="flex w-full items-center justify-between rounded-lg border border-slate-200 px-4 py-2 text-sm lg:hidden"
            aria-controls="knowledge-sidebar" :aria-expanded="sidebarOpen"
            @click="sidebarOpen = !sidebarOpen">
      <span>目录：{{ selected ? selected.name : '选择章节' }}</span>
      <span class="text-xs text-slate-400">{{ sidebarOpen ? '收起' : '展开' }}</span>
    </button>

    <!-- 移动端目录遮罩（高于 header / 底部导航的 z-40） -->
    <div v-if="sidebarOpen" class="fixed inset-0 z-50 bg-black/50 lg:hidden"
         @click="sidebarOpen = false" />

    <div class="grid gap-4 lg:grid-cols-[300px_1fr]">
      <!-- 左侧大纲树：桌面常驻，移动端左侧抽屉 -->
      <aside id="knowledge-sidebar" aria-label="章节目录"
             :inert="!isDesktop && !sidebarOpen ? true : undefined"
             :aria-hidden="!isDesktop && !sidebarOpen ? 'true' : undefined"
             class="fixed inset-y-0 left-0 z-[60] w-[85vw] max-w-xs overflow-auto border-r border-slate-200 bg-surface-card shadow-xl transition-transform duration-200 ease-out lg:static lg:z-auto lg:max-h-[75vh] lg:w-auto lg:max-w-none lg:translate-x-0 lg:rounded-xl lg:border lg:shadow-none"
             :class="sidebarOpen ? 'translate-x-0' : '-translate-x-full lg:translate-x-0'">
        <div class="flex items-center justify-between border-b border-slate-200 px-4 py-2.5 lg:hidden">
          <span class="text-sm font-semibold text-slate-800">章节目录</span>
          <button ref="sidebarClose" type="button"
                  class="flex h-11 w-11 items-center justify-center rounded-lg text-slate-500 hover:bg-slate-100"
                  aria-label="关闭目录" @click="sidebarOpen = false">✕</button>
        </div>
        <div v-for="g in groups" :key="g.code" class="border-b border-slate-100 last:border-b-0">
          <div class="flex items-center justify-between bg-slate-50 px-4 py-2.5">
            <div class="flex items-center gap-2">
              <span class="rounded bg-white px-1.5 py-0.5 text-xs text-slate-500">{{ g.label ?? ('课程 ' + g.code) }}</span>
              <span class="text-sm font-semibold text-slate-800">{{ g.name }}</span>
            </div>
            <span class="text-xs text-slate-400">{{ g.total }}</span>
          </div>
          <div v-for="ch in g.chapters" :key="ch.id">
            <button class="flex w-full items-center justify-between px-4 py-2 text-left hover:bg-blue-50"
                    :class="selected?.id === ch.id ? 'bg-blue-50 text-blue-700' : ''"
                    @click="select(ch)">
              <span class="flex min-w-0 items-center gap-2">
                <span class="shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">{{ ch.code }}</span>
                <span class="truncate text-sm">{{ ch.name }}</span>
              </span>
              <span class="shrink-0 text-xs text-slate-400">{{ ch.kpCount }}</span>
            </button>
            <div v-if="ch.children.length" class="pb-1">
              <button v-for="sec in ch.children" :key="sec.id"
                      class="flex w-full items-center justify-between py-1.5 pl-10 pr-4 text-left text-xs hover:bg-blue-50"
                      :class="selected?.id === sec.id ? 'bg-blue-50 text-blue-700' : 'text-slate-600'"
                      @click="select(sec)">
                <span class="truncate">{{ sec.name }}</span>
                <span class="ml-2 shrink-0 text-slate-400">{{ sec.kpCount }}</span>
              </button>
            </div>
          </div>
        </div>
      </aside>

      <!-- 右侧知识点 -->
      <div class="rounded-xl border border-slate-200">
        <div class="flex flex-wrap items-center justify-between gap-2 border-b border-slate-200 px-4 py-3">
          <div class="min-w-0">
            <p class="truncate text-sm font-semibold text-slate-800">
              {{ allMode ? '全库搜索' : (selected ? (selected.code + ' ' + selected.name) : '选择左侧章节') }}
            </p>
            <p class="text-xs text-slate-400">共 {{ total }} 条知识点</p>
          </div>
          <form class="flex w-full flex-wrap gap-2 sm:w-auto" @submit.prevent="search">
            <input v-model="q" placeholder="搜索标题或内容"
                   class="min-w-0 flex-1 rounded-lg border border-slate-300 px-3 py-1.5 text-xs sm:w-44 sm:flex-none" />
            <button class="rounded-lg bg-blue-600 px-3 py-1.5 text-xs text-white">搜索</button>
            <button type="button" class="rounded-lg border border-slate-300 px-3 py-1.5 text-xs text-slate-600"
                    @click="searchAll">全库</button>
          </form>
        </div>

        <p v-if="error" class="px-4 py-3 text-sm text-red-600">{{ error }}</p>
        <p v-else-if="loading" class="px-4 py-6 text-sm text-slate-500">加载中…</p>
        <p v-else-if="!rows.length" class="px-4 py-6 text-sm text-slate-500">本章暂无知识点。</p>

        <ul v-else class="divide-y divide-slate-100">
          <li v-for="kp in rows" :key="kp.id">
            <details class="group px-4 py-2">
              <summary class="flex cursor-pointer list-none items-start gap-2">
                <span class="mt-1 shrink-0 text-slate-400 group-open:rotate-90">›</span>
                <span class="min-w-0 flex-1 text-sm font-medium text-slate-800">{{ kp.title }}</span>
                <span v-if="kp.nodeName && kp.nodeCode !== selected?.code"
                      class="max-w-[35%] shrink-0 truncate rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-400"
                      :title="kp.nodeName">
                  {{ kp.nodeName }}
                </span>
                <span v-if="kp.questionCount" class="shrink-0 text-xs text-slate-400">{{ kp.questionCount }} 题</span>
                <span v-else class="shrink-0 rounded bg-slate-50 px-1.5 py-0.5 text-xs text-slate-400">暂无关联题</span>
                <NuxtLink v-if="kp.questionCount" :to="`/practice?mode=kp&target=${kp.id}`"
                          class="shrink-0 rounded border border-blue-200 px-1.5 py-0.5 text-xs text-blue-600 hover:bg-blue-50"
                          @click.stop>
                  练相关题
                </NuxtLink>
                <NuxtLink :to="`/search?kp=${kp.id}`"
                          class="shrink-0 text-xs text-slate-400 hover:text-blue-600" @click.stop>搜题</NuxtLink>
              </summary>
              <div class="kp-content mt-2 border-l-2 border-blue-100 pl-3 text-sm leading-6 text-slate-600"
                   v-html="render(kp.content)" />
            </details>
          </li>
        </ul>

        <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 border-t border-slate-100 py-3 text-xs">
          <button :disabled="page <= 1" class="rounded border px-2 py-1 disabled:opacity-40" @click="go(page - 1)">上一页</button>
          <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
          <button :disabled="page >= totalPages" class="rounded border px-2 py-1 disabled:opacity-40" @click="go(page + 1)">下一页</button>
        </div>
      </div>
    </div>
  </section>
</template>

<style scoped>
.kp-content :deep(h1),
.kp-content :deep(h2),
.kp-content :deep(h3),
.kp-content :deep(h4) {
  margin: 0.7rem 0 0.3rem;
  font-weight: 600;
  color: #1e293b;
}
.kp-content :deep(h1) { font-size: 1.05rem; }
.kp-content :deep(h2) { font-size: 1rem; }
.kp-content :deep(h3) { font-size: 0.95rem; }
.kp-content :deep(p) { margin: 0.35rem 0; }
.kp-content :deep(table) {
  width: 100%;
  margin: 0.5rem 0;
  border-collapse: collapse;
  font-size: 0.78rem;
}
.kp-content :deep(th),
.kp-content :deep(td) {
  border: 1px solid #e2e8f0;
  padding: 0.25rem 0.45rem;
  vertical-align: top;
}
.kp-content :deep(th) { background: #f8fafc; }
.kp-content :deep(code) {
  border-radius: 0.25rem;
  background: #f1f5f9;
  padding: 0 0.25rem;
  font-size: 0.8em;
}
.kp-content :deep(pre) {
  overflow: auto;
  border-radius: 0.375rem;
  background: #f8fafc;
  padding: 0.5rem;
}
.kp-content :deep(ul) { margin: 0.35rem 0; padding-left: 1.2rem; list-style: disc; }
.kp-content :deep(ol) { margin: 0.35rem 0; padding-left: 1.2rem; list-style: decimal; }
</style>
