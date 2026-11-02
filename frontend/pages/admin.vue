<script setup lang="ts">
// 管理后台（仅 admin 可见数据）
import { localDateKey, nextAnnouncementVersion, type Announcement } from '~/utils/announcement'

definePageMeta({ middleware: 'auth' })
const api = useApi()
const ask = useConfirm()
const { announcement, load: reloadAnnouncement } = useAnnouncement()
const stats = ref<any>(null)
const feedback = ref<any[]>([])
const resets = ref<any[]>([])
const users = ref<any[]>([])
const resetUser = ref('')
const resetResult = ref<any>(null)
const resetError = ref('')
const error = ref('')
const note = ref<Record<number, string>>({})
const feedbackFilter = ref<'pending' | 'all'>('pending')

// 站内公告在线编辑
const annForm = ref<Announcement>({
  version: '',
  title: '',
  subtitle: '',
  date: '',
  footnote: '',
  items: [],
  history: [],
})
const annSaving = ref(false)
const annMessage = ref('')
const annError = ref('')

function syncAnnForm(src: Announcement) {
  annForm.value = {
    version: src.version,
    title: src.title,
    subtitle: src.subtitle,
    date: src.date,
    footnote: src.footnote ?? '',
    items: (src.items ?? []).map(i => ({ ...i })),
    history: (src.history ?? []).map(h => ({ ...h })),
  }
}

function bumpAnnVersion() {
  annForm.value.version = nextAnnouncementVersion(annForm.value.version)
  const d = new Date()
  annForm.value.date = `${d.getFullYear()} 年 ${d.getMonth() + 1} 月 ${d.getDate()} 日`
}

function addAnnHistory() {
  annForm.value.history = [
    { date: localDateKey(), text: '' },
    ...(annForm.value.history ?? []),
  ]
}

function removeAnnHistory(idx: number) {
  annForm.value.history = (annForm.value.history ?? []).filter((_, i) => i !== idx)
}

async function saveAnnouncement() {
  annError.value = ''
  annMessage.value = ''
  annSaving.value = true
  try {
    const cleaned = {
      ...annForm.value,
      history: (annForm.value.history ?? []).filter(h => h.text.trim().length > 0),
    }
    const saved = await api.put<Announcement>('/api/admin/announcement', cleaned)
    syncAnnForm(saved)
    await reloadAnnouncement(true)
    annMessage.value = `已保存并生效（版本 ${saved.version}）`
  } catch (e: any) {
    annError.value = e.message || '保存公告失败'
  } finally {
    annSaving.value = false
  }
}

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

async function loadFeedback() {
  const f = await api.get<{ rows: any[] }>(`/api/admin/feedback?status=${feedbackFilter.value}`)
  feedback.value = f.rows
}

async function load() {
  try {
    stats.value = await api.get('/api/admin/stats')
    await loadFeedback()
    const r = await api.get<{ rows: any[] }>('/api/admin/password-resets')
    resets.value = r.rows
    const u = await api.get<{ rows: any[] }>('/api/admin/users')
    users.value = u.rows
    await loadVisits()
    const currentAnn = await reloadAnnouncement(true)
    syncAnnForm(currentAnn)
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

    <details class="group rounded-xl border border-slate-200 p-4">
      <summary class="flex cursor-pointer list-none items-center justify-between gap-2 [&::-webkit-details-marker]:hidden">
        <div>
          <h2 class="text-sm font-semibold text-slate-700">站内公告配置（免发版热更新）</h2>
          <p class="mt-0.5 text-xs text-slate-400">当前生效版本：{{ announcement.version }} · 修改版本号后用户当天会重新弹出一次</p>
        </div>
        <span class="rounded-lg border border-slate-200 px-2.5 py-1 text-xs text-slate-600 group-open:bg-slate-100">
          展开编辑
        </span>
      </summary>

      <div class="mt-4 space-y-3 border-t border-slate-100 pt-4 text-xs">
        <div class="grid gap-3 sm:grid-cols-3">
          <label class="block">
            <span class="text-slate-500">版本号（version）</span>
            <div class="mt-1 flex gap-1.5">
              <input v-model="annForm.version" class="min-w-0 flex-1 rounded-lg border border-slate-300 px-2.5 py-1.5" />
              <button type="button" class="shrink-0 rounded-lg border border-slate-300 px-2.5 py-1.5 text-slate-700 hover:border-blue-600 hover:text-blue-600"
                      @click="bumpAnnVersion">递增今日号</button>
            </div>
          </label>
          <label class="block">
            <span class="text-slate-500">展示日期</span>
            <input v-model="annForm.date" class="mt-1 w-full rounded-lg border border-slate-300 px-2.5 py-1.5" />
          </label>
          <label class="block">
            <span class="text-slate-500">主标题</span>
            <input v-model="annForm.title" class="mt-1 w-full rounded-lg border border-slate-300 px-2.5 py-1.5" />
          </label>
        </div>

        <div class="grid gap-3 sm:grid-cols-2">
          <label class="block">
            <span class="text-slate-500">副标题</span>
            <input v-model="annForm.subtitle" class="mt-1 w-full rounded-lg border border-slate-300 px-2.5 py-1.5" />
          </label>
          <label class="block">
            <span class="text-slate-500">底部说明（footnote）</span>
            <input v-model="annForm.footnote" class="mt-1 w-full rounded-lg border border-slate-300 px-2.5 py-1.5" />
          </label>
        </div>

        <div>
          <div class="flex items-center justify-between">
            <span class="font-medium text-slate-600">更新历史（{{ annForm.history?.length ?? 0 }} 条）</span>
            <button type="button" class="rounded border border-slate-300 px-2 py-1 text-slate-700 hover:border-blue-600 hover:text-blue-600"
                    @click="addAnnHistory">+ 新增一条更新记录</button>
          </div>
          <div class="mt-2 max-h-56 space-y-1.5 overflow-y-auto pr-1">
            <div v-for="(h, idx) in annForm.history" :key="idx" class="flex items-center gap-1.5">
              <input v-model="h.date" placeholder="YYYY-MM-DD" class="w-28 shrink-0 rounded border border-slate-300 px-2 py-1 font-mono" />
              <input v-model="h.text" placeholder="一句话说明本次对用户有感知的更新" class="min-w-0 flex-1 rounded border border-slate-300 px-2 py-1" />
              <button type="button" class="shrink-0 rounded border border-slate-200 px-2 py-1 text-slate-400 hover:text-red-600"
                      @click="removeAnnHistory(idx)">删除</button>
            </div>
          </div>
        </div>

        <div class="flex flex-wrap items-center gap-3 pt-1">
          <button type="button" :disabled="annSaving"
                  class="rounded-lg bg-blue-600 px-4 py-1.5 text-sm font-medium text-white hover:bg-blue-700 disabled:opacity-50"
                  @click="saveAnnouncement">
            {{ annSaving ? '保存中…' : '保存并立即生效' }}
          </button>
          <span v-if="annMessage" class="text-green-700">{{ annMessage }}</span>
          <span v-if="annError" class="text-red-600">{{ annError }}</span>
        </div>
      </div>
    </details>

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
      <div class="mb-2 flex items-center justify-between gap-2">
        <h2 class="text-sm font-semibold text-slate-700">
          {{ feedbackFilter === 'pending' ? '待处理反馈' : '全部反馈' }}（{{ feedback.length }}）
        </h2>
        <div class="flex gap-1 text-xs">
          <button type="button" class="rounded-lg border px-2.5 py-1"
                  :class="feedbackFilter === 'pending' ? 'border-blue-600 bg-blue-50 text-blue-700' : 'border-slate-200 text-slate-600'"
                  @click="feedbackFilter = 'pending'; loadFeedback()">待处理</button>
          <button type="button" class="rounded-lg border px-2.5 py-1"
                  :class="feedbackFilter === 'all' ? 'border-blue-600 bg-blue-50 text-blue-700' : 'border-slate-200 text-slate-600'"
                  @click="feedbackFilter = 'all'; loadFeedback()">全部</button>
        </div>
      </div>
      <ul class="divide-y divide-slate-100 rounded-xl border border-slate-200">
        <li v-for="f in feedback" :key="f.id" class="space-y-2 px-5 py-3 text-sm">
          <div class="flex flex-wrap items-center justify-between gap-2">
            <span class="flex flex-wrap items-center gap-1.5 text-slate-700">
              <b v-if="f.questionId">#{{ f.questionId }}</b>
              <b v-else class="text-blue-700">联系作者</b>
              <span>· {{ f.type }} · {{ f.username ?? '匿名' }}</span>
              <span v-if="f.questionId && Number(f.questionFeedbackCount) > 1"
                    class="rounded bg-amber-50 px-1.5 py-0.5 text-xs text-amber-700">
                同题 {{ f.questionFeedbackCount }} 条
              </span>
              <span v-if="f.status === 'handled'" class="rounded bg-green-50 px-1.5 py-0.5 text-xs text-green-700">
                已处理
              </span>
            </span>
            <span class="text-xs text-slate-400">{{ (f.createdAt || '').slice(0, 16).replace('T', ' ') }}</span>
          </div>
          <p class="whitespace-pre-wrap text-slate-600">{{ f.content }}</p>
          <p v-if="f.stemPreview" class="text-xs text-slate-400">题干：{{ formatText(f.stemPreview) }}</p>
          <p v-if="f.adminNote && f.status === 'handled'" class="text-xs text-slate-500">处理备注：{{ f.adminNote }}</p>
          <div v-if="f.status !== 'handled'" class="flex gap-2">
            <input v-model="note[f.id]" placeholder="处理备注（用户可在「我的反馈」中看到）" class="flex-1 rounded border px-2 py-1 text-xs" />
            <button class="rounded bg-slate-700 px-3 py-1 text-xs text-white" @click="resolve(f.id)">标记已处理</button>
          </div>
        </li>
        <li v-if="!feedback.length" class="px-5 py-6 text-sm text-slate-500">
          {{ feedbackFilter === 'pending' ? '暂无待处理反馈。' : '暂无反馈记录。' }}
        </li>
      </ul>
    </div>
  </section>
</template>
