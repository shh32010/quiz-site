<script setup lang="ts">
// 管理后台（仅 admin 可见数据）
const api = useApi()
const stats = ref<any>(null)
const feedback = ref<any[]>([])
const resets = ref<any[]>([])
const users = ref<any[]>([])
const resetUser = ref('')
const resetResult = ref<any>(null)
const resetError = ref('')
const error = ref('')
const note = ref<Record<number, string>>({})

function fmtTime(v: string | null) {
  if (!v) return '—'
  return new Date(v).toLocaleString('zh-CN', {
    month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

async function load() {
  if (!api.hasToken()) { error.value = '请先登录'; return }
  try {
    stats.value = await api.get('/api/admin/stats')
    const f = await api.get<{ rows: any[] }>('/api/admin/feedback')
    feedback.value = f.rows
    const r = await api.get<{ rows: any[] }>('/api/admin/password-resets')
    resets.value = r.rows
    const u = await api.get<{ rows: any[] }>('/api/admin/users')
    users.value = u.rows
  } catch (e: any) {
    error.value = e.message
  }
}

async function resetByName() {
  resetError.value = ''
  resetResult.value = null
  try {
    resetResult.value = await api.post('/api/admin/password-resets/reset', { username: resetUser.value.trim() })
    await load()
  } catch (e: any) {
    resetError.value = e.message
  }
}

async function resetRequest(id: number) {
  resetError.value = ''
  resetResult.value = null
  try {
    resetResult.value = await api.post(`/api/admin/password-resets/${id}/reset`, {})
    await load()
  } catch (e: any) {
    resetError.value = e.message
  }
}

async function resolve(id: number) {
  try {
    await api.post(`/api/admin/feedback/${id}/resolve`, { note: note.value[id] ?? '' })
    await load()
  } catch (e: any) {
    error.value = e.message
  }
}

onMounted(load)
</script>

<template>
  <section class="space-y-5">
    <h1 class="text-2xl font-bold text-slate-900">管理后台</h1>
    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>

    <div v-if="stats" class="grid gap-3 sm:grid-cols-5">
      <div v-for="(v, k) in stats" :key="k" class="rounded-xl border border-slate-200 p-4">
        <p class="text-xs text-slate-500">{{ k }}</p>
        <p class="mt-1 text-xl font-bold text-slate-800">{{ v }}</p>
      </div>
    </div>

    <div class="rounded-xl border border-slate-200 p-4">
      <h2 class="text-sm font-semibold text-slate-700">用户（{{ users.length }}）</h2>
      <div class="mt-2 overflow-x-auto">
        <table class="min-w-full whitespace-nowrap text-left text-xs">
          <thead class="text-slate-400">
            <tr>
              <th class="py-1 pr-4 font-normal">账号</th>
              <th class="pr-4 font-normal">角色</th>
              <th class="pr-4 font-normal">邮箱</th>
              <th class="pr-4 font-normal">注册</th>
              <th class="pr-4 font-normal">最近登录</th>
              <th class="pr-4 font-normal">IP</th>
              <th class="font-normal">练习 / 作答</th>
            </tr>
          </thead>
          <tbody class="divide-y divide-slate-100 text-slate-600">
            <tr v-for="u in users" :key="u.id">
              <td class="py-1.5 pr-4 font-medium text-slate-800">{{ u.username }}</td>
              <td class="pr-4">{{ u.role }}</td>
              <td class="pr-4">{{ u.email || '—' }}</td>
              <td class="pr-4">{{ fmtTime(u.createdAt) }}</td>
              <td class="pr-4">{{ fmtTime(u.lastLoginAt) }}</td>
              <td class="pr-4 font-mono">{{ u.lastIp || '—' }}</td>
              <td>{{ u.sessions }} / {{ u.answers }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <div class="rounded-xl border border-slate-200 p-4">
      <h2 class="text-sm font-semibold text-slate-700">密码重置</h2>
      <p class="mt-0.5 text-xs text-slate-400">生成临时密码，只显示一次；请通过用户留下的联系方式发送。</p>
      <div class="mt-2 flex flex-wrap gap-2">
        <input v-model="resetUser" placeholder="用户名"
               class="min-w-0 flex-1 rounded-lg border border-slate-300 px-3 py-1.5 text-sm sm:max-w-xs" />
        <button class="rounded-lg bg-slate-800 px-4 py-1.5 text-sm text-white" @click="resetByName">
          生成临时密码
        </button>
      </div>
      <p v-if="resetError" class="mt-2 text-sm text-red-600">{{ resetError }}</p>
      <p v-if="resetResult" class="mt-2 rounded-lg border border-green-300 bg-green-50 px-3 py-2 text-sm text-green-700">
        用户 <b>{{ resetResult.username }}</b> 的临时密码：
        <code class="rounded bg-white px-1.5 py-0.5 font-mono">{{ resetResult.password }}</code>
        （只显示这一次）
      </p>
    </div>

    <div v-if="resets.length">
      <h2 class="mb-2 text-sm font-semibold text-slate-700">找回密码申请</h2>
      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="r in resets" :key="r.id" class="space-y-2 px-5 py-3 text-sm">
          <div class="flex items-center justify-between">
            <span class="text-slate-700"><b>{{ r.username }}</b> · {{ r.contact }}</span>
            <span class="text-xs text-slate-400">{{ (r.createdAt || '').slice(0, 16).replace('T', ' ') }}</span>
          </div>
          <p v-if="r.note" class="text-xs text-slate-500">{{ r.note }}</p>
          <button class="rounded bg-slate-700 px-3 py-1 text-xs text-white" @click="resetRequest(r.id)">
            重置并生成临时密码
          </button>
        </li>
      </ul>
    </div>

    <div>
      <h2 class="mb-2 text-sm font-semibold text-slate-700">待处理反馈</h2>
      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="f in feedback" :key="f.id" class="space-y-2 px-5 py-3 text-sm">
          <div class="flex items-center justify-between">
            <span class="text-slate-700">
              <b>#{{ f.questionId }}</b> · {{ f.type }} · {{ f.username ?? '匿名' }}
            </span>
            <span class="text-xs text-slate-400">{{ (f.createdAt || '').slice(0, 16).replace('T', ' ') }}</span>
          </div>
          <p class="text-slate-600">{{ f.content }}</p>
          <p class="text-xs text-slate-400">题干：{{ formatText(f.stemPreview) }}</p>
          <div class="flex gap-2">
            <input v-model="note[f.id]" placeholder="处理备注" class="flex-1 rounded border px-2 py-1 text-xs" />
            <button class="rounded bg-slate-700 px-3 py-1 text-xs text-white" @click="resolve(f.id)">标记已处理</button>
          </div>
        </li>
        <li v-if="!feedback.length" class="px-5 py-6 text-sm text-slate-500">暂无待处理反馈。</li>
      </ul>
    </div>
  </section>
</template>
