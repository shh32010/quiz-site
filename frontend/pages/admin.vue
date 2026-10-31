<script setup lang="ts">
// 管理后台（仅 admin 可见数据）
definePageMeta({ middleware: 'auth' })
const api = useApi()
const ask = useConfirm()
const stats = ref<any>(null)
const feedback = ref<any[]>([])
const resets = ref<any[]>([])
const users = ref<any[]>([])
const resetUser = ref('')
const resetResult = ref<any>(null)
const resetError = ref('')
const error = ref('')
const note = ref<Record<number, string>>({})

function roleLabel(role: string) {
  if (role === 'admin') return '管理员'
  if (role === 'unlimited') return '免限用户'
  return '普通用户'
}

const visits = ref<any>(null)
const visitDays = ref(7)
const visitError = ref('')
const maxDailyPv = computed(() =>
  Math.max(1, ...(visits.value?.daily ?? []).map((d: any) => Number(d.pv) || 0)))

async function loadVisits() {
  visitError.value = ''
  try {
    visits.value = await api.get(`/api/admin/visits?days=${visitDays.value}`)
  } catch (e: any) {
    visitError.value = e.message
  }
}

function fmtTime(v: string | null) {
  if (!v) return '—'
  return new Date(v).toLocaleString('zh-CN', {
    month: '2-digit', day: '2-digit', hour: '2-digit', minute: '2-digit',
  })
}

async function load() {
  try {
    stats.value = await api.get('/api/admin/stats')
    const f = await api.get<{ rows: any[] }>('/api/admin/feedback')
    feedback.value = f.rows
    const r = await api.get<{ rows: any[] }>('/api/admin/password-resets')
    resets.value = r.rows
    const u = await api.get<{ rows: any[] }>('/api/admin/users')
    users.value = u.rows
    await loadVisits()
  } catch (e: any) {
    error.value = e.message
  }
}

async function resetByName() {
  resetError.value = ''
  resetResult.value = null
  const name = resetUser.value.trim()
  if (!name) { resetError.value = '请输入用户名'; return }
  if (!(await ask({
    title: '重置密码',
    message: `确定为「${name}」生成临时密码？该用户所有设备会被踢下线。`,
    confirmText: '生成临时密码',
    danger: true,
  }))) return
  try {
    resetResult.value = await api.post('/api/admin/password-resets/reset', { username: name })
    await load()
  } catch (e: any) {
    resetError.value = e.message
  }
}

async function resetRequest(id: number) {
  resetError.value = ''
  resetResult.value = null
  if (!(await ask({
    title: '重置密码',
    message: '确定为该找回密码申请生成临时密码？该用户所有设备会被踢下线。',
    confirmText: '生成临时密码',
    danger: true,
  }))) return
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

    <div v-if="stats" class="grid grid-cols-2 gap-3 sm:grid-cols-5">
      <div v-for="(v, k) in stats" :key="k" class="rounded-xl border border-slate-200 p-4">
        <p class="text-xs text-slate-500">{{ k }}</p>
        <p class="mt-1 text-xl font-bold text-slate-800">{{ v }}</p>
      </div>
    </div>

    <div class="rounded-xl border border-slate-200 p-4">
      <div class="flex flex-wrap items-center justify-between gap-2">
        <div>
          <h2 class="text-sm font-semibold text-slate-700">访问统计</h2>
          <p class="mt-0.5 text-xs text-slate-400">匿名 PV / UV，不记录 IP 与原始 UA</p>
        </div>
        <select v-model.number="visitDays"
                class="rounded-lg border border-slate-300 px-2 py-1.5 text-xs"
                @change="loadVisits">
          <option :value="7">近 7 天</option>
          <option :value="30">近 30 天</option>
          <option :value="90">近 90 天</option>
        </select>
      </div>

      <p v-if="visitError" class="mt-2 text-sm text-red-600">{{ visitError }}</p>

      <template v-if="visits">
        <div class="mt-3 grid grid-cols-3 gap-3">
          <div class="rounded-lg border border-slate-200 p-3">
            <p class="text-xs text-slate-500">PV</p>
            <p class="mt-1 text-xl font-bold tabular-nums text-slate-800">{{ visits.summary.pv }}</p>
          </div>
          <div class="rounded-lg border border-slate-200 p-3">
            <p class="text-xs text-slate-500">UV</p>
            <p class="mt-1 text-xl font-bold tabular-nums text-slate-800">{{ visits.summary.uv }}</p>
          </div>
          <div class="rounded-lg border border-slate-200 p-3">
            <p class="text-xs text-slate-500">移动端 PV</p>
            <p class="mt-1 text-xl font-bold tabular-nums text-slate-800">{{ visits.summary.mobilePv }}</p>
          </div>
        </div>

        <div class="mt-4 grid gap-4 lg:grid-cols-2">
          <div>
            <p class="text-xs text-slate-400">每日 PV / UV</p>
            <div class="mt-2 overflow-x-auto">
              <div class="flex h-32 min-w-[520px] items-end gap-1">
                <div v-for="d in visits.daily" :key="d.day" class="flex h-full min-w-0 flex-1 flex-col items-center gap-1">
                  <div class="flex w-full flex-1 items-end">
                    <div class="w-full rounded-t bg-blue-500/70"
                         :style="{ height: `${Number(d.pv) ? Math.max(2, Math.round(Number(d.pv) / maxDailyPv * 100)) : 0}%` }"
                         :title="`${d.day}：PV ${d.pv} / UV ${d.uv}`" />
                  </div>
                  <span class="text-[10px] text-slate-400">{{ d.day }}</span>
                </div>
              </div>
            </div>
          </div>
          <div>
            <p class="text-xs text-slate-400">热门页面</p>
            <ul class="mt-2 space-y-1 text-xs">
              <li v-for="p in visits.top" :key="p.path" class="flex items-center justify-between gap-2">
                <span class="truncate font-mono text-slate-600">{{ p.path }}</span>
                <span class="shrink-0 tabular-nums text-slate-400">{{ p.pv }} PV / {{ p.uv }} UV</span>
              </li>
              <li v-if="!visits.top.length" class="text-slate-400">暂无访问数据。</li>
            </ul>
          </div>
        </div>
      </template>
    </div>

    <div class="rounded-xl border border-slate-200 p-4">
      <h2 class="text-sm font-semibold text-slate-700">用户（{{ users.length }}）</h2>

      <!-- 移动端用户卡片 -->
      <div class="mt-2 space-y-2 sm:hidden">
        <div v-for="u in users" :key="u.id" class="rounded-lg border border-slate-200 p-3 text-xs">
          <div class="flex items-center justify-between gap-2">
            <b class="truncate text-slate-800">{{ u.username }}</b>
            <span class="shrink-0 rounded bg-slate-100 px-1.5 py-0.5 text-slate-600">{{ roleLabel(u.role) }}</span>
          </div>
          <p class="mt-1 truncate text-slate-500">{{ u.email || '未绑定邮箱' }}</p>
          <p class="mt-1 text-slate-400">注册 {{ fmtTime(u.createdAt) }} · 最近 {{ fmtTime(u.lastLoginAt) }}</p>
          <p class="mt-1 text-slate-400">练习 {{ u.sessions }} / 作答 {{ u.answers }}</p>
        </div>
      </div>

      <div class="mt-2 hidden overflow-x-auto sm:block">
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
              <td class="pr-4">{{ roleLabel(u.role) }}</td>
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
