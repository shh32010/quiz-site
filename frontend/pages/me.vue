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
  <section class="space-y-5">
    <UiCard padded="lg">
      <template v-if="user">
        <p class="text-xl font-bold text-slate-900">{{ user.nickname || user.username }}</p>
        <p class="mt-1 text-sm text-slate-500">
          {{ user.username }}
          <span v-if="user.email" class="ml-2">{{ user.email }}</span>
          <UiBadge v-if="user.role === 'admin'" tone="amber" class="ml-2">管理员</UiBadge>
        </p>
      </template>
      <p v-else-if="error" class="text-sm text-red-600">{{ error }}</p>
      <p v-else class="text-sm text-slate-500">加载中…</p>
    </UiCard>

    <div class="grid gap-3 sm:grid-cols-2">
      <NuxtLink v-for="l in links" :key="l.to" :to="l.to"
                class="rounded-xl border border-slate-200 bg-white p-4 transition hover:border-blue-400 hover:shadow-sm">
        <p class="font-medium text-slate-900">{{ l.title }}</p>
        <p class="mt-1 text-sm text-slate-500">{{ l.desc }}</p>
      </NuxtLink>
      <NuxtLink v-if="user?.role === 'admin'" to="/admin"
                class="rounded-xl border border-amber-200 bg-amber-50 p-4 transition hover:border-amber-400">
        <p class="font-medium text-amber-900">管理后台</p>
        <p class="mt-1 text-sm text-amber-700">用户、反馈、重置申请</p>
      </NuxtLink>
    </div>

    <button type="button" class="w-full rounded-xl border border-red-200 bg-white py-3 text-sm text-red-600 hover:bg-red-50"
            @click="auth.logout()">退出登录</button>
  </section>
</template>
