<script setup lang="ts">
// 首页：入口导航 + 题库概况
useHead({ title: '专转本计算机刷题' })

const api = useApi()
const loggedIn = ref(false)

const { data: courses } = await useFetch<any[]>('/api/courses')
const { data: papers } = await useFetch<any[]>('/api/papers')

const totalQuestions = computed(() =>
  (courses.value ?? []).reduce((s, c) => s + (c.cnt ?? 0), 0))
const paperCount = computed(() => (papers.value?.length ?? 0))

onMounted(() => { loggedIn.value = api.hasToken() })

const entries = [
  { to: '/chapters', title: '按章节刷题', desc: '理论 A/B、实操技能一~六，逐章推进', tone: 'blue' },
  { to: '/papers',   title: '历年真题',   desc: '27 套真题，按卷面分节练习',      tone: 'indigo' },
  { to: '/compose',  title: '随机组卷',   desc: '按大纲配比与难度生成一套卷',    tone: 'violet' },
  { to: '/search',   title: '题库搜索',   desc: '按题干关键词快速定位',          tone: 'slate' },
  { to: '/wrong',    title: '错题本',     desc: '自动收录，按间隔复习',          tone: 'amber' },
  { to: '/report',   title: '学习报告',   desc: '正确率、章节掌握度、错题周报',  tone: 'emerald' },
]
</script>

<template>
  <section class="space-y-8">
    <div class="rounded-2xl bg-gradient-to-r from-blue-600 to-indigo-600 px-6 py-10 text-white">
      <h1 class="text-3xl font-bold">专转本计算机刷题</h1>
      <p class="mt-2 text-blue-50">章节练习 · 真题模考 · 错题复习 · AI 答疑</p>
      <div class="mt-6 flex flex-wrap gap-6 text-sm">
        <div>
          <span class="text-2xl font-bold">{{ totalQuestions.toLocaleString() }}</span>
          <span class="ml-1 text-blue-100">道可练习题</span>
        </div>
        <div>
          <span class="text-2xl font-bold">{{ paperCount }}</span>
          <span class="ml-1 text-blue-100">套历年真题</span>
        </div>
        <div>
          <span class="text-2xl font-bold">8</span>
          <span class="ml-1 text-blue-100">个课程 / 技能</span>
        </div>
      </div>
      <div class="mt-6 flex gap-3">
        <NuxtLink to="/chapters"
                  class="rounded-lg bg-white px-5 py-2 text-sm font-medium text-blue-700">
          开始刷题
        </NuxtLink>
        <NuxtLink v-if="!loggedIn" to="/login"
                  class="rounded-lg border border-white/60 px-5 py-2 text-sm text-white">
          登录 / 注册
        </NuxtLink>
        <NuxtLink v-else to="/report"
                  class="rounded-lg border border-white/60 px-5 py-2 text-sm text-white">
          我的学习报告
        </NuxtLink>
      </div>
    </div>

    <div class="grid gap-4 sm:grid-cols-2 lg:grid-cols-3">
      <NuxtLink v-for="e in entries" :key="e.to" :to="e.to"
                class="group rounded-xl border border-slate-200 p-5 transition hover:border-blue-400 hover:shadow-sm">
        <p class="text-base font-semibold text-slate-800 group-hover:text-blue-600">{{ e.title }}</p>
        <p class="mt-1 text-sm text-slate-500">{{ e.desc }}</p>
      </NuxtLink>
    </div>

    <div class="rounded-xl border border-slate-200 p-5">
      <h2 class="text-sm font-semibold text-slate-700">课程题量</h2>
      <div class="mt-3 flex flex-wrap gap-2">
        <NuxtLink v-for="c in courses ?? []" :key="c.course" :to="`/practice?mode=course&target=${c.course}`"
                  class="rounded-lg border border-slate-200 px-3 py-1.5 text-xs text-slate-600 hover:border-blue-400">
          {{ c.course }} · {{ c.cnt.toLocaleString() }} 题
        </NuxtLink>
      </div>
    </div>
  </section>
</template>
