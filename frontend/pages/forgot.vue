<script setup lang="ts">
// 忘记密码：输入绑定邮箱，发送一次性重置链接（30 分钟有效）
useHead({ title: '找回密码' })
const api = useApi()
const email = ref('')
const msg = ref('')
const error = ref('')
const loading = ref(false)

async function submit() {
  msg.value = ''
  error.value = ''
  const value = email.value.trim()
  if (!/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(value)) {
    error.value = '请输入正确的邮箱'
    return
  }
  loading.value = true
  try {
    await api.post('/api/auth/forgot', { email: value })
    // 不暴露邮箱是否已注册
    msg.value = '如果该邮箱已绑定账号，重置链接会发送到邮箱，请查收（30 分钟内有效）。没收到请检查垃圾邮件，或联系管理员。'
  } catch (e: any) {
    error.value = e.message ?? '提交失败'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <section class="mx-auto max-w-md space-y-4">
    <h1 class="text-2xl font-bold text-fg-primary">找回密码</h1>
    <p class="text-sm text-fg-secondary">
      输入注册时绑定的邮箱，我们会发送重置链接。还没有绑定邮箱的账号，请联系管理员重置。
    </p>

    <form class="space-y-3" @submit.prevent="submit">
      <input v-model="email" type="email" placeholder="注册邮箱" autocomplete="email"
             class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
      <p v-if="error" class="text-sm text-danger-fg">{{ error }}</p>
      <p v-if="msg" class="rounded-lg border border-success-border bg-success-bg px-3 py-2 text-sm text-success-fg">{{ msg }}</p>
      <button type="submit" :disabled="loading"
              class="w-full rounded-lg bg-brand py-2 text-sm font-medium text-white disabled:opacity-50">
        {{ loading ? '发送中…' : '发送重置链接' }}
      </button>
    </form>

    <NuxtLink to="/login" class="text-sm text-brand hover:underline">← 返回登录</NuxtLink>
  </section>
</template>
