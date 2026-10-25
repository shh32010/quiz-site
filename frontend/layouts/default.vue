<script setup lang="ts">
// 默认布局：桌面 5 组导航 + 搜索框 + 用户菜单；移动端 4 Tab
const { loggedIn, logout } = useAuth()
const api = useApi()
const route = useRoute()
const router = useRouter()

const q = ref('')
const user = ref<any>(null)

watch(loggedIn, async (v) => {
  if (!v) { user.value = null; return }
  try { user.value = await api.get('/api/auth/me') } catch { user.value = null }
}, { immediate: true })

function search() {
  const text = q.value.trim()
  if (text) router.push({ path: '/search', query: { q: text } })
}

function active(paths: string[]) {
  return paths.some(p => route.path === p || route.path.startsWith(p + '/'))
}
const practiceActive = computed(() => active(['/chapters', '/papers', '/compose', '/practice']))
const knowledgeActive = computed(() => active(['/knowledge']))
const mobilePracticeActive = computed(() => practiceActive.value || knowledgeActive.value)
const reviewActive = computed(() => active(['/wrong', '/favorites', '/history']))
const reportActive = computed(() => active(['/report']))
const homeActive = computed(() => route.path === '/')
const meActive = computed(() => active(['/me', '/account', '/admin']))
</script>

<template>
  <div class="min-h-screen bg-slate-50 text-slate-800">
    <header class="sticky top-0 z-40 border-b border-slate-200 bg-white/95 backdrop-blur">
      <div class="mx-auto flex h-14 max-w-6xl items-center gap-3 px-3 sm:px-4">
        <NuxtLink to="/" class="shrink-0 text-base font-semibold text-blue-600 sm:text-lg">专转本刷题</NuxtLink>

        <nav class="hidden items-center gap-1 text-sm lg:flex">
          <NuxtLink to="/" class="rounded-lg px-2.5 py-1.5 hover:bg-slate-100"
                    :class="homeActive ? 'bg-blue-50 text-blue-700' : 'text-slate-600'">首页</NuxtLink>

          <details class="group relative">
            <summary class="flex cursor-pointer list-none items-center gap-1 rounded-lg px-2.5 py-1.5 hover:bg-slate-100"
                     :class="practiceActive ? 'bg-blue-50 text-blue-700' : 'text-slate-600'">
              练习 <span class="text-[10px] text-slate-400">▾</span>
            </summary>
            <div class="absolute left-0 top-full z-50 mt-1 w-36 rounded-xl border border-slate-200 bg-white p-1 shadow-lg">
              <NuxtLink to="/chapters" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">章节练习</NuxtLink>
              <NuxtLink to="/papers" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">历年真题</NuxtLink>
              <NuxtLink to="/compose" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">随机组卷</NuxtLink>
            </div>
          </details>

          <NuxtLink to="/knowledge" class="rounded-lg px-2.5 py-1.5 hover:bg-slate-100"
                    :class="knowledgeActive ? 'bg-blue-50 text-blue-700' : 'text-slate-600'">知识点</NuxtLink>

          <details class="group relative">
            <summary class="flex cursor-pointer list-none items-center gap-1 rounded-lg px-2.5 py-1.5 hover:bg-slate-100"
                     :class="reviewActive ? 'bg-blue-50 text-blue-700' : 'text-slate-600'">
              复习 <span class="text-[10px] text-slate-400">▾</span>
            </summary>
            <div class="absolute left-0 top-full z-50 mt-1 w-36 rounded-xl border border-slate-200 bg-white p-1 shadow-lg">
              <NuxtLink to="/wrong" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">错题本</NuxtLink>
              <NuxtLink to="/favorites" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">收藏夹</NuxtLink>
              <NuxtLink to="/history" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">做题历史</NuxtLink>
            </div>
          </details>

          <NuxtLink to="/report" class="rounded-lg px-2.5 py-1.5 hover:bg-slate-100"
                    :class="reportActive ? 'bg-blue-50 text-blue-700' : 'text-slate-600'">报告</NuxtLink>
        </nav>

        <form class="ml-auto hidden w-56 items-center md:flex" @submit.prevent="search">
          <input v-model="q" type="search" placeholder="搜题干关键词"
                 class="h-9 w-full rounded-lg border border-slate-300 px-3 text-sm outline-none focus:border-blue-500" />
        </form>

        <div class="ml-auto flex items-center gap-1 md:ml-0">
          <UiThemeToggle />
          <NuxtLink to="/search" class="rounded-lg p-2 text-sm text-slate-500 hover:bg-slate-100 md:hidden"
                    aria-label="搜索">🔍</NuxtLink>

          <div v-if="!loggedIn" class="hidden lg:block">
            <NuxtLink to="/login" class="rounded-lg bg-blue-600 px-3 py-1.5 text-sm text-white">登录</NuxtLink>
          </div>
          <details v-else class="relative hidden lg:block">
            <summary class="flex cursor-pointer list-none items-center gap-1 rounded-lg px-2.5 py-1.5 text-sm text-slate-600 hover:bg-slate-100">
              {{ user?.username || '账号' }} <span class="text-[10px] text-slate-400">▾</span>
            </summary>
            <div class="absolute right-0 top-full z-50 mt-1 w-40 rounded-xl border border-slate-200 bg-white p-1 shadow-lg">
              <NuxtLink to="/account" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">账号设置</NuxtLink>
              <NuxtLink to="/report" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">学习报告</NuxtLink>
              <NuxtLink v-if="user?.role === 'admin'" to="/admin" class="block rounded-lg px-3 py-2 text-sm text-slate-600 hover:bg-slate-50">管理后台</NuxtLink>
              <button type="button" class="block w-full rounded-lg px-3 py-2 text-left text-sm text-red-600 hover:bg-red-50" @click="logout">退出登录</button>
            </div>
          </details>
        </div>
      </div>
    </header>

    <main class="mx-auto max-w-6xl px-3 py-5 pb-24 sm:px-4 lg:pb-8">
      <slot />
    </main>

    <nav class="fixed inset-x-0 bottom-0 z-40 border-t border-slate-200 bg-white/95 backdrop-blur lg:hidden">
      <div class="grid grid-cols-4 pb-[env(safe-area-inset-bottom)]">
        <NuxtLink to="/" class="flex flex-col items-center gap-0.5 py-2 text-[11px]"
                  :class="homeActive ? 'text-blue-600' : 'text-slate-500'">
          <span class="text-lg leading-none">⌂</span>首页
        </NuxtLink>
        <NuxtLink to="/chapters" class="flex flex-col items-center gap-0.5 py-2 text-[11px]"
                  :class="mobilePracticeActive ? 'text-blue-600' : 'text-slate-500'">
          <span class="text-lg leading-none">✎</span>练习
        </NuxtLink>
        <NuxtLink to="/wrong" class="flex flex-col items-center gap-0.5 py-2 text-[11px]"
                  :class="reviewActive ? 'text-blue-600' : 'text-slate-500'">
          <span class="text-lg leading-none">↻</span>复习
        </NuxtLink>
        <NuxtLink to="/me" class="flex flex-col items-center gap-0.5 py-2 text-[11px]"
                  :class="meActive ? 'text-blue-600' : 'text-slate-500'">
          <span class="text-lg leading-none">◯</span>我的
        </NuxtLink>
      </div>
    </nav>
  </div>
</template>
