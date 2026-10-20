<script setup lang="ts">
// 章节树：理论按课程 A/B 分组，实操按技能一~六；未归类节点单独折叠
interface Node {
  id: number
  subjectId: number
  code: string | null
  name: string
  level: number
  questionCount: number
  children: Node[]
}

const { data: theory } = await useFetch<Node[]>('/api/chapters/tree', {
  query: { subject: 4 },
})
const { data: practical } = await useFetch<Node[]>('/api/chapters/tree', {
  query: { subject: 5 },
})

const open = ref<Record<number, boolean>>({})
function toggle(id: number) {
  open.value[id] = !open.value[id]
}

/** 课程/技能定义与展示顺序 */
const COURSES = [
  { code: 'A', name: '计算机应用基础' },
  { code: 'B', name: '信息技术导论' },
]
const SKILLS = [
  { code: 'S1', name: 'C 语言程序设计', label: '技能一' },
  { code: 'S2', name: '数据库（MySQL）', label: '技能二' },
  { code: 'S3', name: 'UML 建模', label: '技能三' },
  { code: 'S4', name: '局域网组建', label: '技能四' },
  { code: 'S5', name: 'Windows 10 管理', label: '技能五' },
  { code: 'S6', name: 'CentOS 7 管理', label: '技能六' },
]

function sortByCode(nodes: Node[]): Node[] {
  return [...nodes].sort((a, b) =>
    (a.code ?? '').localeCompare(b.code ?? '', 'en', { numeric: true }))
}

/** 理论课程 A/B：各自名下的章 */
const theoryCourses = computed(() => COURSES.map(c => {
  const nodes = sortByCode((theory.value ?? []).filter(n =>
    n.code != null && /^[AB]\d/.test(n.code) && n.code.startsWith(c.code) && n.questionCount > 0))
  return { ...c, nodes, total: nodes.reduce((s, n) => s + n.questionCount, 0) }
}))

/** 实操技能 S1~S6 */
const skills = computed(() => SKILLS.map(s => ({
  ...s,
  node: (practical.value ?? []).find(n => n.code === s.code) ?? null,
})))

/** 未归入课程 A/B 或技能一~六的节点（保留原有分类与入口） */
const otherNodes = computed(() => {
  const t = (theory.value ?? [])
    .filter(n => n.questionCount > 0 && !(n.code != null && /^[AB]\d/.test(n.code)))
    .map(n => ({ ...n, bank: '理论' }))
  const p = (practical.value ?? [])
    .filter(n => n.questionCount > 0 && !(n.code != null && /^S[1-6]$/.test(n.code)))
    .map(n => ({ ...n, bank: '实操' }))
  return [...sortByCode(t), ...sortByCode(p)]
})
const otherTotal = computed(() => otherNodes.value.reduce((s, n) => s + n.questionCount, 0))
</script>

<template>
  <section class="space-y-6">
    <div>
      <h1 class="text-2xl font-bold text-slate-900">按章节刷题</h1>
      <p class="mt-1 text-slate-600">理论按课程 A/B 分组，实操按技能一~六；数字为可练习题数。</p>
    </div>

    <div class="overflow-hidden rounded-xl border border-slate-200">
      <h2 class="border-b border-slate-200 px-5 py-3 text-sm font-semibold text-slate-700">理论题库</h2>
      <div v-for="course in theoryCourses" :key="course.code" class="border-b border-slate-100 last:border-b-0">
        <div class="flex items-center justify-between bg-slate-50 px-5 py-2.5">
          <div class="flex items-center gap-2">
            <span class="rounded bg-white px-1.5 py-0.5 text-xs text-slate-500">课程 {{ course.code }}</span>
            <span class="text-sm font-semibold text-slate-800">{{ course.name }}</span>
          </div>
          <span class="text-xs text-slate-400">{{ course.total.toLocaleString() }} 题</span>
        </div>
        <ul class="divide-y divide-slate-100">
          <ChapterTreeItem v-for="node in course.nodes" :key="node.id"
                           :node="node" :open="open" :depth="0" @toggle="toggle" />
        </ul>
      </div>
    </div>

    <div class="overflow-hidden rounded-xl border border-slate-200">
      <h2 class="border-b border-slate-200 px-5 py-3 text-sm font-semibold text-slate-700">实操题库</h2>
      <ul class="divide-y divide-slate-100">
        <template v-for="s in skills" :key="s.code">
          <ChapterTreeItem v-if="s.node" :node="s.node" :open="open" :depth="0"
                           :label="s.label" :display-name="s.name" @toggle="toggle" />
        </template>
      </ul>
    </div>

    <details v-if="otherTotal > 0" class="overflow-hidden rounded-xl border border-slate-200">
      <summary class="cursor-pointer px-5 py-3 text-sm font-semibold text-slate-700">
        其他题目（未归入课程 A/B 或技能一~六）
        <span class="ml-1 font-normal text-slate-400">共 {{ otherTotal.toLocaleString() }} 题</span>
      </summary>
      <p class="border-t border-slate-100 px-5 py-2 text-xs text-slate-400">
        这些题目暂未归入标准章节，按原有分类保留，可正常练习。
      </p>
      <ul class="divide-y divide-slate-100 border-t border-slate-100">
        <ChapterTreeItem v-for="n in otherNodes" :key="`${n.bank}-${n.id}`"
                         :node="n" :open="open" :depth="0" :label="n.bank" @toggle="toggle" />
      </ul>
    </details>
  </section>
</template>
