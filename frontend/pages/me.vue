<script setup lang="ts">
// 我的：移动端第 4 个 Tab；账号、报告、复习入口和退出
definePageMeta({ middleware: 'auth' })
useHead({ title: '我的' })

const api = useApi()
const auth = useAuth()
const user = ref<any>(null)
const error = ref('')

onMounted(async () => {
  try {
    user.value = await api.get('/api/auth/me')
  } catch (e: any) {
    error.value = e.message
  }
})

const links = [
  { to: '/report', title: '学习报告', desc: '正确率、章节掌握度、错题周报' },
  { to: '/history', title: '做题历史', desc: '查看每次练习和答题明细' },
  { to: '/favorites', title: '收藏夹', desc: '收藏的题目，可直接开练' },
  { to: '/account', title: '账号设置', desc: '邮箱、密码与登录安全' },
]
</script>

<template>
  <section class="space-y-5 pb-16">
    <UiCard padded="lg">
      <template v-if="user">
        <p class="text-xl font-bold text-fg-primary">{{ user.nickname || user.username }}</p>
        <p class="mt-1 text-sm text-fg-secondary">
          {{ user.username }}
          <span v-if="user.email" class="ml-2">{{ user.email }}</span>
          <UiBadge v-if="user.role === 'admin'" tone="amber" class="ml-2">管理员</UiBadge>
        </p>
      </template>
      <p v-else-if="error" class="text-sm text-danger-fg">{{ error }}</p>
      <p v-else class="text-sm text-fg-muted">加载中…</p>
    </UiCard>

    <UiCard padded="md">
      <div class="flex flex-wrap items-center justify-between gap-3">
        <div>
          <p class="text-sm font-medium text-fg-primary">外观模式</p>
          <p class="mt-0.5 text-xs text-fg-muted">跟随系统会在手机切换深色时自动变化</p>
        </div>
        <UiThemeToggle mode="segmented" class="w-full sm:w-auto" />
      </div>
    </UiCard>

    <div class="grid gap-3 sm:grid-cols-2">
      <NuxtLink v-for="l in links" :key="l.to" :to="l.to"
                class="rounded-xl border border-line-subtle bg-surface-card p-4 transition hover:border-brand hover:shadow-sm">
        <p class="font-medium text-fg-primary">{{ l.title }}</p>
        <p class="mt-1 text-sm text-fg-secondary">{{ l.desc }}</p>
      </NuxtLink>
      <NuxtLink v-if="user?.role === 'admin'" to="/admin"
                class="rounded-xl border border-amber-200 bg-amber-50 p-4 transition hover:border-amber-400">
        <p class="font-medium text-amber-900">管理后台</p>
        <p class="mt-1 text-sm text-amber-700">用户、反馈、重置申请</p>
      </NuxtLink>
    </div>

    <div class="flex items-center gap-3 rounded-2xl border border-line-subtle bg-surface-card py-3.5 pl-4 pr-16 sm:pr-4">
      <span class="grid h-10 w-10 shrink-0 place-items-center rounded-full bg-brand-soft text-lg text-brand">💬</span>
      <div class="min-w-0 flex-1">
        <p class="text-sm font-medium text-fg-primary">有话想对作者说？</p>
        <p class="mt-0.5 text-xs leading-5 text-fg-muted">点右下角「联系作者」，纠错、建议和使用问题都可以直接提。</p>
      </div>
    </div>

    <button type="button" class="w-full rounded-xl border border-danger-border bg-surface-card py-3 text-sm text-danger-fg hover:bg-danger-bg"
            @click="auth.logout()">退出登录</button>

    <FloatingFeedback />
  </section>
</template>
