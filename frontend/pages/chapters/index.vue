<script setup lang="ts">
// 章节树：课程 → 章 → 节 → 目
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

/** 从 code 取标题序号：A1-1.1 → 1.1；A1-1.1.3 → 1.1.3 */
function num(code: string | null): string {
  if (!code) return ''
  const i = code.indexOf('-')
  return i >= 0 ? code.slice(i + 1) : ''
}
</script>

<template>
  <section class="space-y-6">
    <h1 class="text-2xl font-bold text-slate-900">按章节刷题</h1>
    <p class="text-slate-600">理论按课程 A/B 分组，实操按技能一~六；数字为可练习题数。</p>

    <div v-for="group in [
      { title: '理论题库', nodes: theory ?? [] },
      { title: '实操题库', nodes: practical ?? [] },
    ]" :key="group.title" class="rounded-xl border border-slate-200">
      <h2 class="border-b border-slate-200 px-5 py-3 text-sm font-semibold text-slate-700">
        {{ group.title }}
      </h2>
      <ul class="divide-y divide-slate-100">
        <li v-for="node in group.nodes" :key="node.id">
          <div class="flex items-center justify-between px-5 py-3">
            <button class="flex items-center gap-2 text-left" @click="toggle(node.id)">
              <span class="w-4 text-slate-400">{{ node.children.length ? (open[node.id] ? '−' : '+') : '' }}</span>
              <span class="rounded bg-slate-100 px-1.5 py-0.5 text-xs text-slate-600">{{ node.code }}</span>
              <span class="text-sm text-slate-800">{{ node.name }}</span>
            </button>
            <NuxtLink :to="`/chapters/${node.id}`" class="shrink-0 text-xs text-blue-600 hover:underline">
              {{ node.questionCount }} 题 ›
            </NuxtLink>
          </div>
          <ul v-if="open[node.id]" class="bg-slate-50/60 pb-2">
            <li v-for="sec in node.children" :key="sec.id" class="border-t border-slate-100">
              <div class="flex items-center justify-between py-2 pl-12 pr-5">
                <button class="flex items-center gap-2 text-left" @click="toggle(sec.id)">
                  <span class="w-4 text-slate-400">{{ sec.children.length ? (open[sec.id] ? '−' : '+') : '' }}</span>
                  <span v-if="num(sec.code)" class="font-mono text-xs text-slate-400">{{ num(sec.code) }}</span>
                  <span class="text-xs text-slate-600">{{ sec.name }}</span>
                </button>
                <NuxtLink :to="`/chapters/${sec.id}`" class="shrink-0 text-xs text-blue-600 hover:underline">
                  {{ sec.questionCount }} 题 ›
                </NuxtLink>
              </div>
              <ul v-if="open[sec.id]">
                <li v-for="leaf in sec.children" :key="leaf.id"
                    class="flex items-center justify-between py-1.5 pl-20 pr-5">
                  <span v-if="num(leaf.code)" class="font-mono text-xs text-slate-400">{{ num(leaf.code) }}</span>
                  <span class="text-xs text-slate-500">{{ leaf.name }}</span>
                  <NuxtLink :to="`/chapters/${leaf.id}`" class="shrink-0 text-xs text-blue-600 hover:underline">
                    {{ leaf.questionCount }} 题 ›
                  </NuxtLink>
                </li>
              </ul>
            </li>
          </ul>
        </li>
      </ul>
    </div>
  </section>
</template>
