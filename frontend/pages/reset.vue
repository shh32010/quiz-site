<script setup lang="ts">
// 重置密码：从邮件链接进入，?token=xxx
useHead({ title: '重置密码' })
const api = useApi()
const route = useRoute()
const token = computed(() => String(route.query.token ?? ''))
const password = ref('')
const confirm = ref('')
const msg = ref('')
const error = ref('')
const loading = ref(false)
const done = ref(false)

async function submit() {
  msg.value = ''
  error.value = ''
  if (!token.value) {
    error.value = '链接缺少令牌，请重新申请'
    return
  }
  if (password.value.length < 6) {
    error.value = '新密码至少 6 位'
    return
  }
  if (password.value !== confirm.value) {
    error.value = '两次输入的密码不一致'
    return
  }
  loading.value = true
  try {
    await api.post('/api/auth/reset', { token: token.value, password: password.value })
    done.value = true
    msg.value = '密码已重置，其他设备已退出登录，请用新密码登录。'
  } catch (e: any) {
    error.value = e.message ?? '重置失败'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <section class="mx-auto max-w-md space-y-4">
    <h1 class="text-2xl font-bold text-fg-primary">重置密码</h1>
    <p v-if="!token" class="rounded-lg border border-danger-border bg-danger-bg px-3 py-2 text-sm text-danger-fg">
      链接无效：缺少重置令牌。请回到「找回密码」重新申请。
    </p>

    <form v-else class="space-y-3" @submit.prevent="submit">
      <input v-model="password" type="password" placeholder="新密码（至少 6 位）" autocomplete="new-password"
             class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
      <input v-model="confirm" type="password" placeholder="再次输入新密码" autocomplete="new-password"
             class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
      <p v-if="error" class="text-sm text-danger-fg">{{ error }}</p>
      <p v-if="msg" class="rounded-lg border border-success-border bg-success-bg px-3 py-2 text-sm text-success-fg">{{ msg }}</p>
      <button v-if="!done" type="submit" :disabled="loading"
              class="w-full rounded-lg bg-brand py-2 text-sm font-medium text-white disabled:opacity-50">
        {{ loading ? '提交中…' : '设置新密码' }}
      </button>
      <NuxtLink v-else to="/login" class="block w-full rounded-lg bg-brand py-2 text-center text-sm font-medium text-white">
        去登录
      </NuxtLink>
    </form>

    <NuxtLink to="/login" class="text-sm text-brand hover:underline">← 返回登录</NuxtLink>
  </section>
</template>
