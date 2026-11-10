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
const resending = ref(false)
const remind = computed(() =>
  String(route.query.bind ?? '') === '1' || String(route.query.verify ?? '') === '1')

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
    email.value = me.value.pendingEmail || me.value.email || ''
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
    const r = await api.post<{
      email: string; emailVerified?: boolean; pendingEmail?: string; mailSent?: boolean
    }>('/api/auth/email', { email: value, password: password.value })
    password.value = ''
    if (r.pendingEmail) {
      // 新邮箱先进入待验证状态，点击邮件里的链接后才生效
      me.value.pendingEmail = r.pendingEmail
      me.value.email = r.email
      me.value.emailVerified = Boolean(r.emailVerified)
      email.value = r.pendingEmail
      msg.value = r.mailSent
        ? `验证邮件已发送到 ${r.pendingEmail}，请查收并在 24 小时内完成验证。`
        : '验证邮件发送失败或发送过于频繁，请稍后点击“重新发送验证邮件”。'
    } else {
      me.value.email = r.email
      me.value.emailVerified = Boolean(r.emailVerified)
      me.value.pendingEmail = ''
      email.value = r.email
      if (!r.email) {
        msg.value = '邮箱已解绑。'
      } else if (r.emailVerified) {
        msg.value = '邮箱已验证，无需重复绑定。'
      } else {
        msg.value = '邮箱已绑定。'
      }
    }
  } catch (e: any) {
    error.value = e.message ?? '保存失败'
  } finally {
    loading.value = false
  }
}

/** 重新发送验证邮件（待验证邮箱或未验证的历史邮箱） */
async function resend() {
  msg.value = ''
  error.value = ''
  resending.value = true
  try {
    const r = await api.post<{ sent: boolean }>('/api/auth/email/resend', {})
    if (r.sent) {
      msg.value = '验证邮件已重新发送，请查收。'
    } else {
      error.value = '验证邮件发送失败，请稍后重试或联系管理员。'
    }
  } catch (e: any) {
    error.value = e.message ?? '发送失败'
  } finally {
    resending.value = false
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
    <h1 class="text-2xl font-bold text-fg-primary">账号设置</h1>

    <p v-if="error && !me" class="text-sm text-danger-fg">
      {{ error }} <NuxtLink to="/login" class="ml-2 text-brand hover:underline">去登录</NuxtLink>
    </p>

    <template v-if="me">
      <p v-if="remind && (me.pendingEmail || (me.email && !me.emailVerified))"
         class="rounded-lg border border-warn-border bg-warn-bg px-3 py-2 text-sm text-warn-fg">
        验证邮件已发送到 {{ me.pendingEmail || me.email }}，请查收并点击链接完成验证。
      </p>
      <p v-else-if="remind && !me.email"
         class="rounded-lg border border-warn-border bg-warn-bg px-3 py-2 text-sm text-warn-fg">
        注册成功！建议现在绑定邮箱：忘记密码时可以自助重置，否则只能联系管理员。
      </p>

      <div class="rounded-xl border border-line-subtle bg-surface-card p-4 text-sm">
        <p class="text-fg-secondary">用户名</p>
        <p class="mt-0.5 font-medium text-fg-primary">{{ me.username }}</p>
        <p class="mt-3 text-fg-secondary">邮箱</p>
        <p v-if="me.email" class="mt-0.5 font-medium text-fg-primary">
          {{ me.email }}
          <span class="ml-2 rounded px-1.5 py-0.5 text-xs"
                :class="me.emailVerified ? 'bg-success-bg text-success-fg' : 'bg-warn-bg text-warn-fg'">
            {{ me.emailVerified ? '已验证' : '未验证' }}
          </span>
        </p>
        <p v-else class="mt-0.5 text-fg-secondary">未绑定</p>
        <p v-if="me.pendingEmail" class="mt-1 text-xs text-warn-fg">
          待验证新邮箱：{{ me.pendingEmail }}
        </p>
        <button v-if="me.pendingEmail || (me.email && !me.emailVerified)" type="button"
                class="mt-2 min-h-11 rounded-lg border border-warn-border px-3 text-xs text-warn-fg hover:bg-warn-bg disabled:opacity-50"
                :disabled="resending" @click="resend">
          {{ resending ? '发送中…' : '重新发送验证邮件' }}
        </button>
      </div>

      <form class="space-y-3" @submit.prevent="save">
        <div>
          <label class="text-sm text-fg-secondary">绑定 / 修改邮箱</label>
          <input v-model="email" type="email" placeholder="name@example.com" autocomplete="email"
                 class="mt-1 w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
          <p class="mt-1 text-xs text-fg-muted">
            新邮箱需点击验证邮件中的链接后生效；验证前仍可使用用户名登录。
          </p>
        </div>
        <input v-model="password" type="password" placeholder="当前密码（确认修改）" autocomplete="current-password"
               class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
        <p v-if="error" class="text-sm text-danger-fg">{{ error }}</p>
        <p v-if="msg" class="rounded-lg border border-success-border bg-success-bg px-3 py-2 text-sm text-success-fg">{{ msg }}</p>
        <button type="submit" :disabled="loading"
                class="w-full rounded-lg bg-brand py-2 text-sm font-medium text-white disabled:opacity-50">
          {{ loading ? '保存中…' : '保存' }}
        </button>
      </form>

      <div class="rounded-xl border border-line-subtle bg-surface-card p-4">
        <h2 class="text-sm font-semibold text-fg-primary">修改密码</h2>
        <form class="mt-2 space-y-3" @submit.prevent="changePassword">
          <input v-model="oldPwd" type="password" placeholder="当前密码" autocomplete="current-password"
                 class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
          <input v-model="newPwd" type="password" placeholder="新密码（至少 6 位）" autocomplete="new-password"
                 class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
          <input v-model="newPwd2" type="password" placeholder="再次输入新密码" autocomplete="new-password"
                 class="w-full rounded-lg border border-line-strong bg-surface-card text-fg-primary outline-none focus:border-brand px-3 py-2 text-sm" />
          <p v-if="pwdError" class="text-sm text-danger-fg">{{ pwdError }}</p>
          <p v-if="pwdMsg" class="rounded-lg border border-success-border bg-success-bg px-3 py-2 text-sm text-success-fg">{{ pwdMsg }}</p>
          <button type="submit" :disabled="pwdLoading"
                  class="w-full rounded-lg bg-brand hover:bg-brand-hover py-2 text-sm font-medium text-white disabled:opacity-50">
            {{ pwdLoading ? '提交中…' : '修改密码' }}
          </button>
        </form>
      </div>
    </template>
  </section>
</template>
