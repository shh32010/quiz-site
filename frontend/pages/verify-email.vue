<script setup lang="ts">
// 邮箱归属验证落地页：/verify-email?token=...
useHead({ title: '邮箱验证' })

const route = useRoute()
const api = useApi()
const status = ref<'loading' | 'ok' | 'error'>('loading')
const message = ref('')

onMounted(async () => {
  const token = String(route.query.token ?? '').trim()
  if (!token) {
    status.value = 'error'
    message.value = '验证链接缺少令牌，请从邮件中重新打开。'
    return
  }
  try {
    const r = await api.post<{ email: string }>('/api/auth/email/verify', { token })
    status.value = 'ok'
    message.value = `邮箱 ${r.email} 验证成功。`
  } catch (e: any) {
    status.value = 'error'
    message.value = e.message ?? '验证失败，链接可能已过期。'
  }
})
</script>

<template>
  <section class="mx-auto max-w-md space-y-4">
    <UiPageHeader title="邮箱验证" subtitle="验证后该邮箱可用于登录和找回密码" />

    <p v-if="status === 'loading'" class="rounded-xl border border-line-subtle bg-surface-card px-4 py-6 text-sm text-fg-secondary">
      正在验证…
    </p>

    <div v-else-if="status === 'ok'" class="space-y-3 rounded-xl border border-success-border bg-success-bg px-4 py-5 text-sm text-success-fg">
      <p class="font-medium">{{ message }}</p>
      <p>现在可以使用该邮箱登录，也可以在忘记密码时接收重置链接。</p>
      <div class="flex flex-wrap gap-2">
        <NuxtLink to="/account" class="inline-flex min-h-11 items-center rounded-lg bg-brand px-4 text-white">
          返回账号设置
        </NuxtLink>
        <NuxtLink to="/login" class="inline-flex min-h-11 items-center rounded-lg border border-success-border px-4">
          去登录
        </NuxtLink>
      </div>
    </div>

    <div v-else class="space-y-3 rounded-xl border border-danger-border bg-danger-bg px-4 py-5 text-sm text-danger-fg">
      <p class="font-medium">{{ message }}</p>
      <p>如果链接已过期，请到账号设置页重新发送验证邮件。</p>
      <NuxtLink to="/account" class="inline-flex min-h-11 items-center rounded-lg border border-danger-border px-4">
        返回账号设置
      </NuxtLink>
    </div>
  </section>
</template>
