<script setup lang="ts">
// 登录 / 注册（同一个页面切换）
// 登录支持用户名或邮箱；注册时邮箱选填，但会提醒绑定
import { validateRegisterPassword } from '~/utils/auth'

const api = useApi()
const auth = useAuth()
const router = useRouter()
const route = useRoute()
useHead({ title: '登录 / 注册' })
const mode = ref<'login' | 'register'>('login')
const username = ref('')
const email = ref('')
const password = ref('')
const confirmPassword = ref('')
const error = ref('')
const loading = ref(false)
const insecure = ref(false)
const warnNoEmail = ref(false)

onMounted(() => {
  // IP 直连没有 HTTPS，提示用户不要用常用密码
  insecure.value = location.protocol === 'http:'
})

watch(mode, () => {
  warnNoEmail.value = false
  confirmPassword.value = ''
  error.value = ''
})
watch(email, () => { if (email.value.trim()) warnNoEmail.value = false })

/** 只接受站内路径，防止 redirect 被用来跳外站 */
function safeRedirect(raw: unknown): string {
  const s = String(raw ?? '')
  if (!s.startsWith('/') || s.startsWith('//') || s.includes('\\')) return '/'
  if (s === '/login' || s.startsWith('/login?')) return '/'
  return s
}
const redirect = computed(() => safeRedirect(route.query.redirect))

async function submit() {
  error.value = ''
  if (mode.value === 'register') {
    const message = validateRegisterPassword(password.value, confirmPassword.value)
    if (message) {
      error.value = message
      return
    }
  }
  // 注册没填邮箱：先提醒一次，再点一次才继续
  if (mode.value === 'register' && !email.value.trim() && !warnNoEmail.value) {
    warnNoEmail.value = true
    return
  }
  loading.value = true
  try {
    const body: Record<string, string> = { username: username.value, password: password.value }
    if (mode.value === 'register' && email.value.trim()) body.email = email.value.trim()
    const data = await api.post<{ token: string; username: string; role: string }>(
      mode.value === 'login' ? '/api/auth/login' : '/api/auth/register',
      body,
    )
    auth.saveToken(data.token)
    // 注册后去账号页：填了邮箱提示查收验证邮件，没填则提醒补绑
    const target = mode.value === 'register'
      ? (email.value.trim() ? '/account?verify=1' : '/account?bind=1')
      : redirect.value
    router.push(target)
  } catch (e: any) {
    error.value = e.message ?? '操作失败'
  } finally {
    loading.value = false
  }
}
</script>

<template>
  <section class="mx-auto max-w-sm space-y-5">
    <h1 class="text-2xl font-bold text-fg-primary">{{ mode === 'login' ? '登录' : '注册' }}</h1>

    <p v-if="insecure"
       class="rounded-lg border border-warn-border bg-warn-bg px-4 py-2 text-xs text-warn-fg">
       HTTP 明文传输，请不要使用常用密码。
    </p>

    <form class="space-y-3" @submit.prevent="submit">
      <input v-model="username" :placeholder="mode === 'login' ? '用户名或邮箱' : '用户名（3-32 位字母数字下划线）'"
             autocomplete="username"
             class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />

      <div v-if="mode === 'register'">
        <input v-model="email" type="email" placeholder="邮箱（建议填写，用于找回密码）"
               autocomplete="email"
               class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
        <p class="mt-1 text-xs text-fg-muted">
          绑定邮箱后，忘记密码可自助重置；也可以稍后在「账号」页绑定。
        </p>
      </div>

      <input v-model="password" type="password" placeholder="密码（至少 6 位）"
             :autocomplete="mode === 'login' ? 'current-password' : 'new-password'"
             class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />

      <input v-if="mode === 'register'" v-model="confirmPassword" type="password" placeholder="确认密码"
             autocomplete="new-password"
             class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />

      <p v-if="warnNoEmail"
         class="rounded-lg border border-warn-border bg-warn-bg px-3 py-2 text-xs text-warn-fg">
        未填写邮箱：忘记密码将无法自助找回，只能联系管理员。确定继续注册吗？
      </p>
      <p v-if="error" class="text-sm text-danger-fg">{{ error }}</p>

      <button type="submit" :disabled="loading"
              class="w-full rounded-lg bg-brand py-2 text-sm font-medium text-white disabled:opacity-50">
        {{ loading ? '处理中…' : mode === 'login' ? '登录' : (warnNoEmail ? '不填邮箱，继续注册' : '注册') }}
      </button>
    </form>

    <div class="flex items-center justify-between text-sm">
      <NuxtLink v-if="mode === 'login'" to="/forgot" class="text-fg-secondary hover:text-brand">忘记密码？</NuxtLink>
      <span v-else></span>
      <button class="text-brand hover:underline" @click="mode = mode === 'login' ? 'register' : 'login'">
        {{ mode === 'login' ? '没有账号？去注册' : '已有账号？去登录' }}
      </button>
    </div>
  </section>
</template>
