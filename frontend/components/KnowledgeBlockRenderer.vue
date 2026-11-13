<script setup lang="ts">
// 结构化讲义块渲染器：支持列表、段落、自适应表格、代码卡片、可折叠树图、配图与全新现代质感易错/复习提示卡片
import { computed, ref } from 'vue'
import { filterKbBlocks, importanceBadgeMeta, renderInlineMarkup, type KbBlock } from '~/utils/knowledge'
import UiBadge from '~/components/ui/UiBadge.vue'
import UiImageLightbox from '~/components/ui/UiImageLightbox.vue'

const props = withDefaults(defineProps<{
  blocks: KbBlock[]
  coreOnly?: boolean
  highlightKeyword?: string
}>(), {
  coreOnly: false,
  highlightKeyword: '',
})

const copiedId = ref<string | null>(null)
const lightboxOpen = ref(false)
const lightboxImages = ref<string[]>([])
const lightboxStartIndex = ref(0)

const visibleBlocks = computed(() => filterKbBlocks(props.blocks ?? [], props.coreOnly))

function inlineHtml(text?: string): string {
  return renderInlineMarkup(text ?? '', props.highlightKeyword)
}

/** 顶层编号缓存：把“1、”与正文拆开，便于只加粗序号 */
const itemNoCache = new Map<string, { no: string; rest: string } | null>()

/** 拆分顶层“1、”序号；子项（（1）、①、）返回 null */
function itemParts(item: string): { no: string; rest: string } | null {
  const key = item ?? ''
  if (itemNoCache.has(key)) return itemNoCache.get(key) ?? null
  const m = /^(\d+、)\s*/.exec(key)
  const parts = m ? { no: m[1], rest: key.slice(m[0].length) } : null
  itemNoCache.set(key, parts)
  return parts
}

function openImage(src?: string) {
  if (!src) return
  lightboxImages.value = [src]
  lightboxStartIndex.value = 0
  lightboxOpen.value = true
}

/** 提取 callout 核心标题，避免与右侧胶囊徽标前缀重复 */
function calloutCleanTitle(title?: string, kind?: string): string {
  if (!title) {
    return kind === 'trap' ? '核心避坑要点' : '核心提分考向'
  }
  const cleaned = title.replace(/^(考向复习提示|复习提示|高频易错陷阱|易错陷阱|重点注意事项|注意事项)[：:]\s*/, '')
  return cleaned.trim() || (kind === 'trap' ? '核心避坑要点' : '核心提分考向')
}

/** 胶囊徽标文案 */
function calloutBadgeText(kind?: string): string {
  if (kind === 'trap') return '高频易错陷阱'
  if (kind === 'warn') return '重点注意事项'
  return '考向复习提示'
}

async function copyCode(blockId: string, code?: string) {
  if (!code || typeof navigator === 'undefined' || !navigator.clipboard) return
  try {
    await navigator.clipboard.writeText(code)
    copiedId.value = blockId
    setTimeout(() => {
      if (copiedId.value === blockId) copiedId.value = null
    }, 1800)
  } catch { /* 忽略复制失败 */ }
}
</script>

<template>
  <div class="kb-blocks space-y-4">
    <template v-for="block in visibleBlocks" :key="block.id">
      <!-- 1. 专门的提示/陷阱卡片 (callout) - 方案 A 现代质感徽章卡片风 -->
      <div v-if="block.t === 'callout'"
           :id="block.id"
           class="kb-callout relative overflow-hidden rounded-2xl border p-4 sm:p-5 shadow-xs transition-all"
           :class="[
             block.kind === 'trap'
               ? 'border-red-200/90 bg-gradient-to-br from-red-50/80 via-surface-card to-danger-bg/25 border-l-[5px] border-l-red-500 dark:border-red-900/60 dark:border-l-red-400 dark:from-red-950/25 dark:via-surface-card dark:to-surface-card'
               : 'border-blue-200/90 bg-gradient-to-br from-blue-50/80 via-surface-card to-brand-soft/25 border-l-[5px] border-l-brand dark:border-blue-900/60 dark:border-l-blue-400 dark:from-blue-950/25 dark:via-surface-card dark:to-surface-card'
           ]">
        <!-- 头部 Header -->
        <div class="mb-3 flex flex-wrap items-center justify-between gap-2.5 border-b pb-2.5"
             :class="block.kind === 'trap' ? 'border-red-100/90 dark:border-red-950/60' : 'border-blue-100/90 dark:border-blue-950/60'">
          <div class="flex items-center gap-2 min-w-0">
            <!-- 独立微底托图标 -->
            <span class="flex h-7 w-7 shrink-0 items-center justify-center rounded-lg shadow-2xs text-sm"
                  :class="block.kind === 'trap' ? 'bg-red-100/90 text-red-600 dark:bg-red-900/60 dark:text-red-300' : 'bg-blue-100/90 text-blue-600 dark:bg-blue-900/60 dark:text-blue-300'">
              {{ block.kind === 'trap' ? '⚠️' : '💡' }}
            </span>
            <!-- 提炼后的纯净主题标题 -->
            <h4 class="text-sm font-bold tracking-tight sm:text-base truncate"
                :class="block.kind === 'trap' ? 'text-danger-fg' : 'text-fg-primary'">
              {{ calloutCleanTitle(block.title, block.kind) }}
            </h4>
          </div>

          <!-- 右侧专属胶囊徽标 -->
          <span class="inline-flex items-center gap-1 rounded-full px-2.5 py-0.5 text-xs font-semibold shadow-2xs shrink-0"
                :class="block.kind === 'trap'
                  ? 'bg-red-100/90 text-red-700 border border-red-200/80 dark:bg-red-900/50 dark:text-red-300 dark:border-red-800/60'
                  : 'bg-blue-100/90 text-blue-700 border border-blue-200/80 dark:bg-blue-900/50 dark:text-blue-300 dark:border-blue-800/60'">
            {{ calloutBadgeText(block.kind) }}
          </span>
        </div>

        <!-- 正文内容区 -->
        <div class="kb-prose text-sm sm:text-[15px] leading-relaxed text-fg-secondary">
          <p v-html="inlineHtml(block.text)" />
        </div>
      </div>

      <!-- 2. 其余普通教学块 (p, list, table, code, tree, img) -->
      <div v-else
           :id="block.id"
           class="kb-block rounded-xl border border-line-subtle border-l-4 bg-surface-card p-3.5 sm:p-4 transition-all"
           :class="importanceBadgeMeta(block.imp).borderClass">
        <!-- 块头部：标题与重要度徽标 -->
        <div v-if="block.title || importanceBadgeMeta(block.imp).label"
             class="mb-2.5 flex flex-wrap items-center justify-between gap-2">
          <h4 v-if="block.title" class="text-sm font-semibold text-fg-primary" v-html="inlineHtml(block.title)" />
          <span v-else />
          <UiBadge v-if="importanceBadgeMeta(block.imp).label" :tone="importanceBadgeMeta(block.imp).tone">
            {{ importanceBadgeMeta(block.imp).label }}
          </UiBadge>
        </div>

        <!-- 1. 段落块 (p) -->
        <p v-if="block.t === 'p'" class="kb-prose text-fg-secondary" v-html="inlineHtml(block.text)" />

        <!-- 2. 列表块 (list) -->
        <component :is="block.ordered ? 'ol' : 'ul'"
                   v-else-if="block.t === 'list'"
                   class="kb-prose space-y-1.5 pl-5 text-fg-secondary"
                   :class="block.ordered ? 'list-decimal' : 'list-disc'">
          <li v-for="(item, idx) in block.items ?? []" :key="idx">
            <!-- 顶层“1、”序号统一加粗，其余内容按原有行内标记渲染 -->
            <template v-if="itemParts(item)">
              <strong class="kb-item-no">{{ itemParts(item)!.no }}</strong><span v-html="inlineHtml(itemParts(item)!.rest)" />
            </template>
            <span v-else v-html="inlineHtml(item)" />
          </li>
        </component>

        <!-- 3. 表格块 (table)：宽表在 <640px 自动转为纵向堆叠卡片，消除横向滚动 -->
        <div v-else-if="block.t === 'table'">
          <!-- 移动端宽表卡片 (<640px 且列数 > 3) -->
          <div v-if="(block.headers?.length ?? 0) > 3" class="space-y-2.5 sm:hidden">
            <div v-for="(row, rIdx) in block.rows ?? []" :key="rIdx"
                 class="rounded-lg border border-line-subtle bg-surface-muted/40 p-3 text-xs leading-5">
              <p class="font-semibold text-fg-primary" v-html="inlineHtml(row[0])" />
              <dl class="mt-1.5 space-y-1">
                <div v-for="(cell, cIdx) in row.slice(1)" :key="cIdx" class="flex gap-2">
                  <dt class="w-20 shrink-0 text-fg-muted" v-html="inlineHtml(block.headers?.[cIdx + 1] ?? '')" />
                  <dd class="min-w-0 flex-1 text-fg-secondary" v-html="inlineHtml(cell)" />
                </div>
              </dl>
            </div>
          </div>

          <!-- 桌面端或窄表（<=3 列）标准表格 -->
          <div class="overflow-x-auto" :class="(block.headers?.length ?? 0) > 3 ? 'hidden sm:block' : ''">
            <table class="w-full border-collapse text-left text-xs leading-5 sm:text-sm">
              <thead v-if="block.headers?.length">
                <tr class="bg-surface-muted text-fg-primary">
                  <th v-for="(h, hIdx) in block.headers" :key="hIdx"
                      class="border border-line-subtle px-3 py-2 font-semibold"
                      v-html="inlineHtml(h)" />
                </tr>
              </thead>
              <tbody>
                <tr v-for="(row, rIdx) in block.rows ?? []" :key="rIdx" class="even:bg-surface-muted/30">
                  <td v-for="(cell, cIdx) in row" :key="cIdx"
                      class="border border-line-subtle px-3 py-2 align-top text-fg-secondary"
                      v-html="inlineHtml(cell)" />
                </tr>
              </tbody>
            </table>
          </div>
        </div>

        <!-- 4. 代码块 (code) -->
        <div v-else-if="block.t === 'code'" class="overflow-hidden rounded-lg border border-line-subtle bg-surface-muted">
          <div class="flex items-center justify-between border-b border-line-subtle px-3 py-1.5 text-xs text-fg-muted">
            <span class="font-mono uppercase">{{ block.lang || 'code' }}</span>
            <button type="button"
                    class="rounded px-2 py-0.5 text-xs text-fg-secondary hover:bg-surface-card hover:text-brand"
                    @click="copyCode(block.id, block.code)">
              {{ copiedId === block.id ? '✓ 已复制' : '复制代码' }}
            </button>
          </div>
          <pre class="overflow-x-auto p-3 font-mono text-xs leading-6 text-fg-primary sm:text-sm"><code>{{ block.code }}</code></pre>
        </div>

        <!-- 5. 树状思维导图块 (tree)：可折叠树形组件，支持 4 层结构 -->
        <div v-else-if="block.t === 'tree' && block.root" class="rounded-lg border border-line-subtle bg-surface-muted/40 p-3">
          <details open class="kb-tree">
            <summary class="cursor-pointer select-none text-sm font-semibold text-fg-primary">
              <span v-html="inlineHtml(block.root.label)" />
            </summary>
            <ul v-if="block.root.children?.length" class="mt-2 space-y-2 border-l-2 border-brand/30 pl-4">
              <li v-for="(branch, bIdx) in block.root.children" :key="bIdx">
                <details v-if="branch.children?.length" open>
                  <summary class="cursor-pointer select-none text-xs font-semibold text-fg-primary sm:text-sm">
                    <span v-html="inlineHtml(branch.label)" />
                  </summary>
                  <ul class="mt-1.5 space-y-1 border-l border-line-strong pl-3.5 text-xs text-fg-secondary sm:text-sm">
                    <li v-for="(leaf, lIdx) in branch.children" :key="lIdx" class="leading-6">
                      <details v-if="leaf.children?.length" open>
                        <summary class="cursor-pointer select-none font-medium text-fg-primary">
                          <span v-html="inlineHtml(leaf.label)" />
                        </summary>
                        <ul class="mt-1 space-y-1 border-l border-line-subtle pl-3 text-xs text-fg-secondary">
                          <li v-for="(sub, sIdx) in leaf.children" :key="sIdx"
                              class="leading-6"
                              v-html="inlineHtml(sub.label)" />
                        </ul>
                      </details>
                      <span v-else v-html="inlineHtml(leaf.label)" />
                    </li>
                  </ul>
                </details>
                <p v-else class="text-xs leading-6 text-fg-secondary sm:text-sm" v-html="inlineHtml(branch.label)" />
              </li>
            </ul>
          </details>
        </div>

        <!-- 7. 配图块 (img) -->
        <figure v-else-if="block.t === 'img' && block.src" class="my-2 flex flex-col items-center">
          <img :src="block.src"
               :alt="block.alt || block.title || '讲义配图'"
               loading="lazy"
               class="max-h-96 max-w-full cursor-zoom-in rounded-lg border border-line-subtle bg-white object-contain p-1"
               @click="openImage(block.src)" />
          <figcaption v-if="block.caption" class="mt-1.5 text-center text-xs text-fg-muted" v-html="inlineHtml(block.caption)" />
        </figure>
      </div>
    </template>

    <!-- 图片灯箱放大查看 -->
    <UiImageLightbox v-model="lightboxOpen" :images="lightboxImages" :start-index="lightboxStartIndex" />
  </div>
</template>

<style scoped>
.kb-prose {
  font-size: var(--reader-fs, 1rem);
  line-height: 1.75;
  white-space: pre-line;
  overflow-wrap: anywhere;
}
.kb-block :deep(code),
.kb-callout :deep(code) {
  border-radius: 0.25rem;
  background: rgb(var(--surface-muted));
  padding: 0.05rem 0.3rem;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 0.88em;
  color: rgb(var(--fg-primary));
}
.kb-callout :deep(code) {
  background: rgb(var(--surface-card) / 0.9);
  border: 1px solid rgb(var(--line-subtle));
}
.kb-block :deep(.kb-math),
.kb-callout :deep(.kb-math) {
  font-family: "Cambria Math", "Times New Roman", "Noto Serif", Georgia, serif;
  font-size: 1.06em;
  letter-spacing: 0.01em;
  padding: 0 0.12em;
  white-space: nowrap;
}
.kb-block :deep(.kb-math var),
.kb-callout :deep(.kb-math var) {
  font-style: italic;
}
.kb-block :deep(.kb-math .kb-math-op),
.kb-callout :deep(.kb-math .kb-math-op),
.kb-block :deep(.kb-math .kb-math-text),
.kb-callout :deep(.kb-math .kb-math-text) {
  font-style: normal;
}
.kb-block :deep(.kb-math .kb-math-text),
.kb-callout :deep(.kb-math .kb-math-text) {
  font-family: inherit;
  font-size: 0.92em;
}
.kb-block :deep(.kb-math sub),
.kb-callout :deep(.kb-math sub),
.kb-block :deep(.kb-math sup),
.kb-callout :deep(.kb-math sup) {
  font-size: 0.72em;
  line-height: 0;
  position: relative;
  vertical-align: baseline;
  margin-left: 0.03em;
}
.kb-block :deep(.kb-math sub),
.kb-callout :deep(.kb-math sub) {
  bottom: -0.24em;
}
.kb-block :deep(.kb-math sup),
.kb-callout :deep(.kb-math sup) {
  top: -0.44em;
}
.kb-block :deep(.kb-math sub + var),
.kb-callout :deep(.kb-math sub + var),
.kb-block :deep(.kb-math sub + .kb-math-num),
.kb-callout :deep(.kb-math sub + .kb-math-num),
.kb-block :deep(.kb-math sup + var),
.kb-callout :deep(.kb-math sup + var),
.kb-block :deep(.kb-math sup + .kb-math-num),
.kb-callout :deep(.kb-math sup + .kb-math-num),
.kb-block :deep(.kb-math .kb-math-op + var),
.kb-callout :deep(.kb-math .kb-math-op + var),
.kb-block :deep(.kb-math .kb-math-op + .kb-math-num),
.kb-callout :deep(.kb-math .kb-math-op + .kb-math-num),
.kb-block :deep(.kb-math var + .kb-math-op),
.kb-callout :deep(.kb-math var + .kb-math-op),
.kb-block :deep(.kb-math .kb-math-num + .kb-math-op),
.kb-callout :deep(.kb-math .kb-math-num + .kb-math-op) {
  margin-left: 0.16em;
}
.kb-block :deep(.kb-math .kb-math-bin),
.kb-callout :deep(.kb-math .kb-math-bin) {
  padding: 0 0.18em;
}
.kb-block :deep(.kb-math sub .kb-math-bin),
.kb-callout :deep(.kb-math sub .kb-math-bin),
.kb-block :deep(.kb-math sup .kb-math-bin),
.kb-callout :deep(.kb-math sup .kb-math-bin) {
  padding: 0 0.06em;
}
.kb-block :deep(.kb-math .kb-math-delim),
.kb-callout :deep(.kb-math .kb-math-delim) {
  padding: 0 0.03em;
}
.kb-block :deep(.kb-math .kb-math-punct),
.kb-callout :deep(.kb-math .kb-math-punct) {
  padding-right: 0.16em;
}
.kb-block :deep(.kb-math .kb-math-gap),
.kb-callout :deep(.kb-math .kb-math-gap) {
  display: inline-block;
  width: 0.18em;
}
.kb-block :deep(.kb-math .kb-math-frac),
.kb-callout :deep(.kb-math .kb-math-frac) {
  display: inline-flex;
  flex-direction: column;
  align-items: center;
  vertical-align: middle;
  font-size: 0.84em;
  line-height: 1.1;
  margin: 0 0.16em;
}
.kb-block :deep(.kb-math .kb-math-frac-num),
.kb-callout :deep(.kb-math .kb-math-frac-num) {
  border-bottom: 1px solid currentColor;
  padding: 0 0.2em 1px;
}
.kb-block :deep(.kb-math .kb-math-frac-den),
.kb-callout :deep(.kb-math .kb-math-frac-den) {
  padding: 1px 0.2em 0;
}
.kb-block :deep(.kb-math .kb-math-sqrt-body),
.kb-callout :deep(.kb-math .kb-math-sqrt-body) {
  border-top: 1px solid currentColor;
  padding: 0 0.12em;
}
.kb-block :deep(.kb-math .kb-math-subsup),
.kb-callout :deep(.kb-math .kb-math-subsup) {
  display: inline-flex;
  flex-direction: column;
  line-height: 0.9;
  vertical-align: middle;
  margin-left: 0.04em;
}
.kb-block :deep(.kb-math .kb-math-subsup sup),
.kb-callout :deep(.kb-math .kb-math-subsup sup),
.kb-block :deep(.kb-math .kb-math-subsup sub),
.kb-callout :deep(.kb-math .kb-math-subsup sub) {
  position: static;
  line-height: 1;
}
.kb-block :deep(mark.kb-mark),
.kb-callout :deep(mark.kb-mark) {
  border-radius: 0.25rem;
  background: rgb(var(--danger-bg));
  padding: 0.05rem 0.3rem;
  font-weight: 600;
  color: rgb(var(--danger-fg));
}
.kb-callout :deep(mark.kb-mark) {
  box-shadow: 0 0 0 1px rgb(var(--danger-border) / 0.45);
}
.kb-block :deep(mark.kb-imp),
.kb-callout :deep(mark.kb-imp) {
  border-radius: 0.25rem;
  background: rgb(var(--success-bg));
  padding: 0.05rem 0.3rem;
  font-weight: 600;
  color: rgb(var(--success-fg));
  text-decoration: underline;
  text-decoration-color: rgb(var(--success-fg));
  text-underline-offset: 3px;
}
.kb-callout :deep(mark.kb-imp) {
  box-shadow: 0 0 0 1px rgb(var(--success-border) / 0.45);
}
.kb-block :deep(mark.kb-hard),
.kb-callout :deep(mark.kb-hard) {
  border-radius: 0.25rem;
  background: rgb(var(--warn-bg));
  padding: 0.05rem 0.3rem;
  font-weight: 600;
  color: rgb(var(--warn-fg));
}
.kb-callout :deep(mark.kb-hard) {
  box-shadow: 0 0 0 1px rgb(var(--warn-border) / 0.45);
}
.kb-block :deep(mark.kb-hl),
.kb-callout :deep(mark.kb-hl) {
  border-radius: 0.2rem;
  background: rgb(var(--brand) / 0.22);
  padding: 0 0.2rem;
  color: inherit;
  box-shadow: 0 0 0 1px rgb(var(--brand) / 0.4);
}
</style>
