<script setup lang="ts">
// 我的：移动端第 4 个 Tab；账号、报告、复习入口、我的反馈与退出
import { FEEDBACK_TYPE_LABEL, fmtTime } from '~/utils/constants'

definePageMeta({ middleware: 'auth' })
useHead({ title: '我的' })

const api = useApi()
const auth = useAuth()
const user = ref<any>(null)
const myFeedback = ref<any[]>([])
const error = ref('')

onMounted(async () => {
  try {
    const [u, fb] = await Promise.all([
      api.get('/api/auth/me'),
      api.get<{ rows?: any[] }>('/api/feedback/mine').catch(() => ({ rows: [] })),
    ])
    user.value = u
    myFeedback.value = fb.rows ?? []
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
          <UiBadge v-else-if="user.role === 'unlimited'" tone="blue" class="ml-2">免限用户</UiBadge>
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
                class="rounded-xl border border-warn-border bg-warn-bg p-4 transition hover:border-brand">
        <p class="font-medium text-warn-fg">管理后台</p>
        <p class="mt-1 text-sm text-fg-secondary">用户、反馈、重置申请</p>
      </NuxtLink>
    </div>

    <UiCard v-if="myFeedback.length" padded="md">
      <div class="flex items-center justify-between">
        <h2 class="text-sm font-semibold text-fg-primary">我的反馈（{{ myFeedback.length }}）</h2>
        <span class="text-xs text-fg-muted">展示最近提交与作者处理结果</span>
      </div>
      <ul class="mt-3 divide-y divide-line-subtle">
        <li v-for="f in myFeedback" :key="f.id" class="space-y-1.5 py-3 first:pt-0 last:pb-0 text-sm">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <div class="flex flex-wrap items-center gap-1.5 text-xs">
              <UiBadge :tone="f.status === 'handled' ? 'green' : 'amber'">
                {{ f.status === 'handled' ? '已处理' : '待处理' }}
              </UiBadge>
              <span class="text-fg-secondary">{{ f.questionId ? (FEEDBACK_TYPE_LABEL[f.type] ?? f.type) : '联系作者' }}</span>
              <NuxtLink v-if="f.questionId" :to="`/practice?mode=single&target=${f.questionId}&from=/me`"
                        class="text-brand hover:underline">
                题目 #{{ f.questionId }} →
              </NuxtLink>
            </div>
            <span class="text-xs tabular-nums text-fg-muted">{{ fmtTime(f.createdAt) }}</span>
          </div>
          <p v-if="f.stemPreview" class="truncate text-xs text-fg-muted">题干：{{ formatText(f.stemPreview) }}</p>
          <p class="whitespace-pre-wrap break-words text-xs leading-5 text-fg-secondary">{{ f.content }}</p>
          <p v-if="f.adminNote" class="rounded-lg bg-surface-muted px-2.5 py-1.5 text-xs leading-5 text-fg-primary">
            <b class="text-brand">处理结果：</b>{{ f.adminNote }}
          </p>
        </li>
      </ul>
    </UiCard>

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
