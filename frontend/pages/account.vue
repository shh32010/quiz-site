<script setup lang="ts">
// 账号设置：绑定/修改邮箱（用于登录和找回密码）
definePageMeta({ middleware: 'auth' })
useHead({ title: '账号设置' })
const api = useApi()
const auth = useAuth()
const ask = useConfirm()
const route = useRoute()
const me = ref<any>(null)
const email = ref('')
const password = ref('')
const msg = ref('')
const error = ref('')
const loading = ref(false)
const remind = computed(() => String(route.query.bind ?? '') === '1')

// 修改密码
const oldPwd = ref('')
const newPwd = ref('')
const newPwd2 = ref('')
const pwdMsg = ref('')
const pwdError = ref('')
const pwdLoading = ref(false)

async function load() {
  try {
    me.value = await api.get('/api/auth/me')
    email.value = me.value.email ?? ''
  } catch (e: any) {
    error.value = e.message
  }
}

async function save() {
  msg.value = ''
  error.value = ''
  const value = email.value.trim()
  if (value && !/^[^@\s]+@[^@\s]+\.[^@\s]+$/.test(value)) {
    error.value = '邮箱格式不正确'
    return
  }
  if (!password.value) {
    error.value = '请输入当前密码确认'
    return
  }
  if (!value && !(await ask({
    title: '解绑邮箱',
    message: '解绑后将无法自助找回密码，确定继续？',
    confirmText: '解绑',
    danger: true,
  }))) {
    return
  }
  loading.value = true
  try {
    const r = await api.post<{ email: string }>('/api/auth/email', { email: value, password: password.value })
    me.value.email = r.email
    email.value = r.email
    password.value = ''
    msg.value = r.email ? '邮箱已绑定，之后可用邮箱登录和找回密码。' : '邮箱已解绑。'
  } catch (e: any) {
    error.value = e.message ?? '保存失败'
  } finally {
    loading.value = false
  }
}

async function changePassword() {
  pwdMsg.value = ''
  pwdError.value = ''
  if (!oldPwd.value) { pwdError.value = '请输入当前密码'; return }
  if (newPwd.value.length < 6) { pwdError.value = '新密码至少 6 位'; return }
  if (newPwd.value !== newPwd2.value) { pwdError.value = '两次输入的新密码不一致'; return }
  pwdLoading.value = true
  try {
    const r = await api.post<{ token?: string }>('/api/auth/password',
      { oldPassword: oldPwd.value, newPassword: newPwd.value })
    // 当前会话换发新 token，其他设备的旧 token 已失效
    if (r.token) auth.saveToken(r.token)
    pwdMsg.value = '密码已修改，其他设备已退出登录。'
    oldPwd.value = ''
    newPwd.value = ''
    newPwd2.value = ''
  } catch (e: any) {
    pwdError.value = e.message ?? '修改失败'
  } finally {
    pwdLoading.value = false
  }
}

onMounted(load)
</script>

<template>
  <section class="mx-auto max-w-md space-y-4">
    <h1 class="text-2xl font-bold text-slate-900">账号设置</h1>

    <p v-if="error && !me" class="text-sm text-red-600">
      {{ error }} <NuxtLink to="/login" class="ml-2 text-blue-600 hover:underline">去登录</NuxtLink>
    </p>

    <template v-if="me">
      <p v-if="remind && !me.email"
         class="rounded-lg border border-amber-300 bg-amber-50 px-3 py-2 text-sm text-amber-800">
        注册成功！建议现在绑定邮箱：忘记密码时可以自助重置，否则只能联系管理员。
      </p>

      <div class="rounded-xl border border-slate-200 p-4 text-sm">
        <p class="text-slate-500">用户名</p>
        <p class="mt-0.5 font-medium text-slate-800">{{ me.username }}</p>
      </div>

      <form class="space-y-3" @submit.prevent="save">
        <div>
          <label class="text-sm text-slate-600">绑定邮箱</label>
          <input v-model="email" type="email" placeholder="name@example.com" autocomplete="email"
                 class="mt-1 w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
          <p class="mt-1 text-xs text-slate-400">
            绑定后可用邮箱登录，忘记密码时接收重置链接。
          </p>
        </div>
        <input v-model="password" type="password" placeholder="当前密码（确认修改）" autocomplete="current-password"
               class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
        <p v-if="error" class="text-sm text-red-600">{{ error }}</p>
        <p v-if="msg" class="rounded-lg border border-green-300 bg-green-50 px-3 py-2 text-sm text-green-700">{{ msg }}</p>
        <button type="submit" :disabled="loading"
                class="w-full rounded-lg bg-blue-600 py-2 text-sm font-medium text-white disabled:opacity-50">
          {{ loading ? '保存中…' : '保存' }}
        </button>
      </form>

      <div class="rounded-xl border border-slate-200 p-4">
        <h2 class="text-sm font-semibold text-slate-700">修改密码</h2>
        <form class="mt-2 space-y-3" @submit.prevent="changePassword">
          <input v-model="oldPwd" type="password" placeholder="当前密码" autocomplete="current-password"
                 class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
          <input v-model="newPwd" type="password" placeholder="新密码（至少 6 位）" autocomplete="new-password"
                 class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
          <input v-model="newPwd2" type="password" placeholder="再次输入新密码" autocomplete="new-password"
                 class="w-full rounded-lg border border-slate-300 px-3 py-2 text-sm" />
          <p v-if="pwdError" class="text-sm text-red-600">{{ pwdError }}</p>
          <p v-if="pwdMsg" class="rounded-lg border border-green-300 bg-green-50 px-3 py-2 text-sm text-green-700">{{ pwdMsg }}</p>
          <button type="submit" :disabled="pwdLoading"
                  class="w-full rounded-lg bg-slate-800 py-2 text-sm font-medium text-white disabled:opacity-50">
            {{ pwdLoading ? '提交中…' : '修改密码' }}
          </button>
        </form>
      </div>
    </template>
  </section>
</template>
