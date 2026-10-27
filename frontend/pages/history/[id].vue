<script setup lang="ts">
// 做题历史详情：某次练习的作答明细
import { TYPE_LABEL, MODE_LABEL, fmtTime, fmtDur } from '~/utils/constants'

definePageMeta({ middleware: 'auth' })
useHead({ title: '做题历史详情' })
const api = useApi()
const route = useRoute()
const sessionId = Number(route.params.id)
const session = ref<any>(null)
const rows = ref<any[]>([])
const total = ref(0)
const page = ref(1)
const size = 50
const loading = ref(true)
const error = ref('')

const totalPages = computed(() => Math.max(1, Math.ceil(total.value / size)))

function imgs(a: any): string[] {
  const raw = a?.imageUrls || a?.imageUrl || ''
  return String(raw).split(',').map(s => s.trim()).filter(Boolean)
}

const lightboxOpen = ref(false)
const lightboxImages = ref<string[]>([])
const lightboxIndex = ref(0)

function openLightbox(a: any, i: number) {
  lightboxImages.value = imgs(a)
  lightboxIndex.value = i
  lightboxOpen.value = true
}

async function load(p = page.value) {
  loading.value = true
  error.value = ''
  try {
    const r = await api.get<any>(`/api/practice/history/${sessionId}?page=${p}&size=${size}`)
    session.value = r.session
    // 预计算图片数组，避免模板里每行重复 split
    rows.value = (r.rows ?? []).map((row: any) => ({ ...row, images: imgs(row) }))
    total.value = r.total ?? 0
    page.value = r.page ?? p
  } catch (e: any) {
    error.value = e.message ?? '加载失败'
  } finally {
    loading.value = false
  }
}

onMounted(() => load(1))
</script>

<template>
  <section class="space-y-4">
    <NuxtLink to="/history" class="text-sm text-blue-600 hover:underline">← 返回做题历史</NuxtLink>

    <p v-if="error" class="text-sm text-red-600">{{ error }}</p>
    <p v-if="loading" class="text-sm text-slate-500">加载中…</p>

    <template v-if="session">
      <div class="rounded-xl border border-slate-200 p-5">
        <h1 class="text-lg font-bold text-slate-900">
          {{ MODE_LABEL[session.mode] ?? session.mode }}
          <span v-if="session.targetName" class="text-slate-500">· {{ session.targetName }}</span>
        </h1>
        <p class="mt-1 text-xs text-slate-400">
          {{ fmtTime(session.startedAt) }} · 用时 {{ fmtDur(session.elapsedSec) }}
          · 作答 {{ total }} / {{ session.questionCount }} 题
        </p>
        <p v-if="session.finishedAt" class="mt-2 text-sm text-slate-700">
          得分 <b class="text-blue-600">{{ session.score }}</b> / {{ session.totalScore }}
        </p>
        <p v-if="session.paperScore != null" class="mt-1 text-xs text-amber-700">
          可练满分 {{ session.totalScore }} 分；原卷 {{ session.paperScore }} 分，
          {{ Math.max(0, (session.paperQuestionCount ?? session.questionCount) - session.questionCount) }} 题暂不可练、不计入总分。
        </p>
        <div v-if="!session.finishedAt" class="mt-2 flex items-center gap-3">
          <p class="text-sm text-amber-600">本次练习尚未结束</p>
          <NuxtLink :to="`/practice?session=${session.id}`"
                    class="rounded-lg bg-blue-600 px-3 py-1 text-xs font-medium text-white">
            继续练习
          </NuxtLink>
        </div>
      </div>

      <ul v-if="rows.length" class="space-y-3">
        <li v-for="a in rows" :key="a.questionId" class="rounded-xl border border-slate-200 p-4">
          <div class="flex flex-wrap items-center gap-2 text-xs">
            <span class="rounded bg-slate-100 px-1.5 py-0.5 text-slate-600">
              {{ TYPE_LABEL[a.questionType] ?? a.questionType }}
            </span>
            <span class="rounded px-1.5 py-0.5"
                  :class="a.isCorrect ? 'bg-green-50 text-green-700' : 'bg-red-50 text-red-600'">
              {{ a.isCorrect ? '✓ 答对' : '✗ 答错' }}
            </span>
            <span class="text-slate-400">{{ fmtTime(a.answeredAt) }}</span>
            <span class="text-slate-400">得分 {{ a.scoreGot }} / {{ a.score }}</span>
          </div>

          <p class="mt-2 whitespace-pre-wrap text-sm leading-6 text-slate-800">{{ formatText(a.stem) }}</p>
          <div v-if="a.images.length" class="mt-2 flex flex-wrap items-start gap-2">
            <button v-for="(src, i) in a.images" :key="i" type="button"
                    class="cursor-zoom-in" :aria-label="`放大第 ${i + 1} 张题目配图`"
                    @click="openLightbox(a, i)">
              <img :src="src" alt="题目配图"
                   class="max-h-60 w-auto rounded-lg border border-slate-200 object-contain" />
            </button>
          </div>

          <div class="mt-3 grid gap-2 text-sm sm:grid-cols-2">
            <p class="rounded-lg bg-slate-50 px-3 py-2 text-slate-600">
              <span class="text-xs text-slate-400">你的答案：</span>
              <span :class="a.isCorrect ? 'text-green-700' : 'text-red-600'">
                {{ formatText(a.userAnswer || '未作答') }}
              </span>
            </p>
            <p class="rounded-lg bg-green-50 px-3 py-2 text-slate-600">
              <span class="text-xs text-slate-400">正确答案：</span>
              {{ formatText(a.correct) }}
            </p>
          </div>

          <p v-if="a.qcGrade === 'error'"
             class="mt-2 rounded-lg border border-amber-200 bg-amber-50 px-3 py-2 text-xs text-amber-800">
            本题解析可能不准确，建议结合 AI 讲解或提交报错。
          </p>
          <details v-if="a.analysis" class="mt-2 text-sm">
            <summary class="cursor-pointer text-xs text-slate-500">查看解析</summary>
            <p class="mt-2 whitespace-pre-wrap leading-6 text-slate-600">{{ formatText(a.analysis) }}</p>
          </details>
        </li>
      </ul>

      <p v-else class="rounded-xl border border-slate-200 px-5 py-8 text-center text-sm text-slate-500">
        本次练习还没有作答记录。
      </p>

      <div v-if="totalPages > 1" class="flex items-center justify-center gap-2 text-sm">
        <button v-if="page > 1" class="rounded border px-3 py-1" @click="load(page - 1)">上一页</button>
        <span class="text-slate-500">{{ page }} / {{ totalPages }}</span>
        <button v-if="page < totalPages" class="rounded border px-3 py-1" @click="load(page + 1)">下一页</button>
      </div>
    </template>

    <UiImageLightbox v-model="lightboxOpen" :images="lightboxImages" :start-index="lightboxIndex" />
  </section>
</template>
