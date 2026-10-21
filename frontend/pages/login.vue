<script setup lang="ts">
// 登录 / 注册（同一个页面切换）
const api = useApi()
const router = useRouter()
const mode = ref<'login' | 'register'>('login')
const username = ref('')
const password = ref('')
const error = ref('')
const loading = ref(false)
const insecure = ref(false)

onMounted(() => {
  // IP 直连没有 HTTPS，提示用户不要用常用密码
  insecure.value = location.protocol === 'http:'
})

async function submit() {
  error.value = ''
  loading.value = true
  try {
    const data = await api.post<{ token: string; username: string; role: string }>(
      mode.value === 'login' ? '/api/auth/login' : '/api/auth/register',
      { username: username.value, password: password.value },
    )
    api.setToken(data.token)
    router.push('/')
  } catch (e: any) {
    error.value = e.message ?? '操作失败'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <section class="mx-auto max-w-sm space-y-5">
    <h1 class="text-2xl font-bold text-slate-900">{{ mode === 'login' ? '登录' : '注册' }}</h1>

    <p v-if="insecure"
       class="rounded-lg border border-amber-300 bg-amber-50 px-4 py-2 text-xs text-amber-800">
      当前为 HTTP 明文传输，请不要使用常用密码。
    </p>

    <form class="space-y-3" @submit.prevent="submit">
      <input v-model="username" placeholder="用户名（3-32 位字母数字下划线）" autocomplete="username"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
      <input v-model="password" type="password" placeholder="密码（至少 6 位）"
             :autocomplete="mode === 'login' ? 'current-password' : 'new-password'"
             class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />

      <p v-if="error" class="text-sm text-red-600">{{ error }}</p>

      <button type="submit" :disabled="loading"
              class="w-full rounded-lg bg-blue-600 py-2 text-sm font-medium text-white disabled:opacity-50">
        {{ loading ? '处理中…' : mode === 'login' ? '登录' : '注册' }}
      </button>
    </form>

    <button class="text-sm text-blue-600 hover:underline" @click="mode = mode === 'login' ? 'register' : 'login'">
      {{ mode === 'login' ? '没有账号？去注册' : '已有账号？去登录' }}
    </button>
  </section>
</template>
