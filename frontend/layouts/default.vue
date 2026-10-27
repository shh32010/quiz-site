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

const practiceItems = [
  { to: '/chapters', label: '章节练习' },
  { to: '/papers', label: '历年真题' },
  { to: '/compose', label: '随机组卷' },
]
const reviewItems = [
  { to: '/wrong', label: '错题本' },
  { to: '/favorites', label: '收藏夹' },
  { to: '/history', label: '做题历史' },
]
</script>

<template>
  <div class="min-h-screen bg-page text-fg-primary">
    <header class="sticky top-0 z-40 border-b border-line-subtle bg-surface-glass backdrop-blur">
      <div class="mx-auto flex h-14 max-w-6xl items-center gap-3 px-3 sm:px-4">
        <NuxtLink to="/" class="shrink-0 text-base font-semibold text-brand sm:text-lg">专转本刷题</NuxtLink>

        <nav class="hidden items-center gap-1 text-sm lg:flex">
          <NuxtLink to="/" class="flex min-h-9 items-center rounded-lg px-2.5 py-1.5 hover:bg-surface-muted"
                    :class="homeActive ? 'bg-brand-soft text-brand-on-soft' : 'text-fg-secondary'">首页</NuxtLink>

          <NavDropdown id="practice" label="练习" to="/chapters" :active="practiceActive" :items="practiceItems" />

          <NuxtLink to="/knowledge" class="flex min-h-9 items-center rounded-lg px-2.5 py-1.5 hover:bg-surface-muted"
                    :class="knowledgeActive ? 'bg-brand-soft text-brand-on-soft' : 'text-fg-secondary'">知识点</NuxtLink>

          <NavDropdown id="review" label="复习" to="/wrong" :active="reviewActive" :items="reviewItems" />

          <NuxtLink to="/report" class="flex min-h-9 items-center rounded-lg px-2.5 py-1.5 hover:bg-surface-muted"
                    :class="reportActive ? 'bg-brand-soft text-brand-on-soft' : 'text-fg-secondary'">报告</NuxtLink>
        </nav>

        <form class="ml-auto hidden w-56 items-center md:flex" @submit.prevent="search">
          <input v-model="q" type="search" placeholder="搜题干关键词"
                 class="h-9 w-full rounded-lg border border-line-strong bg-surface-card px-3 text-sm text-fg-primary outline-none focus:border-brand" />
        </form>

        <div class="ml-auto flex items-center gap-1 md:ml-0">
          <UiThemeToggle />
          <NuxtLink to="/search" class="rounded-lg p-2 text-sm text-fg-secondary hover:bg-surface-muted md:hidden"
                    aria-label="搜索">🔍</NuxtLink>

          <div v-if="!loggedIn" class="hidden lg:block">
            <NuxtLink to="/login" class="inline-flex min-h-9 items-center rounded-lg bg-brand px-3 text-sm text-white hover:bg-brand-hover">登录</NuxtLink>
          </div>
          <div v-else class="group relative hidden lg:block">
            <button type="button" aria-haspopup="true"
                    class="flex min-h-9 items-center gap-1 rounded-lg px-2.5 py-1.5 text-sm text-fg-secondary hover:bg-surface-muted">
              {{ user?.username || '账号' }} <span class="text-xs text-fg-muted">▾</span>
            </button>
            <div class="invisible absolute right-0 top-full z-50 mt-1 w-40 translate-y-1 rounded-xl border border-line-subtle bg-surface-elevated p-1 opacity-0 shadow-lg transition group-hover:visible group-hover:translate-y-0 group-hover:opacity-100 group-focus-within:visible group-focus-within:translate-y-0 group-focus-within:opacity-100">
              <NuxtLink to="/account" class="block min-h-10 rounded-lg px-3 py-2 text-sm text-fg-secondary hover:bg-surface-muted hover:text-fg-primary">账号设置</NuxtLink>
              <NuxtLink to="/report" class="block min-h-10 rounded-lg px-3 py-2 text-sm text-fg-secondary hover:bg-surface-muted hover:text-fg-primary">学习报告</NuxtLink>
              <NuxtLink v-if="user?.role === 'admin'" to="/admin" class="block min-h-10 rounded-lg px-3 py-2 text-sm text-fg-secondary hover:bg-surface-muted hover:text-fg-primary">管理后台</NuxtLink>
              <button type="button" class="block min-h-10 w-full rounded-lg px-3 py-2 text-left text-sm text-danger-fg hover:bg-danger-bg" @click="logout">退出登录</button>
            </div>
          </div>
        </div>
      </div>
    </header>

    <main class="mx-auto max-w-6xl px-3 py-5 pb-24 sm:px-4 lg:pb-8">
      <slot />
      <AppFooter />
    </main>

    <nav class="fixed inset-x-0 bottom-0 z-40 border-t border-line-subtle bg-surface-glass backdrop-blur lg:hidden">
      <div class="grid grid-cols-4 pb-[env(safe-area-inset-bottom)]">
        <NuxtLink to="/" class="flex flex-col items-center gap-0.5 py-2 text-xs"
                  :class="homeActive ? 'text-brand' : 'text-fg-muted'">
          <span class="text-lg leading-none">⌂</span>首页
        </NuxtLink>
        <NuxtLink to="/chapters" class="flex flex-col items-center gap-0.5 py-2 text-xs"
                  :class="mobilePracticeActive ? 'text-brand' : 'text-fg-muted'">
          <span class="text-lg leading-none">✎</span>练习
        </NuxtLink>
        <NuxtLink to="/wrong" class="flex flex-col items-center gap-0.5 py-2 text-xs"
                  :class="reviewActive ? 'text-brand' : 'text-fg-muted'">
          <span class="text-lg leading-none">↻</span>复习
        </NuxtLink>
        <NuxtLink to="/me" class="flex flex-col items-center gap-0.5 py-2 text-xs"
                  :class="meActive ? 'text-brand' : 'text-fg-muted'">
          <span class="text-lg leading-none">◯</span>我的
        </NuxtLink>
      </div>
    </nav>
  </div>
</template>
