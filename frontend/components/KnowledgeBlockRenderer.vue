<script setup lang="ts">
// 结构化讲义块渲染器：支持列表、段落、自适应表格、代码卡片、可折叠树图与易错提示框
import { filterKbBlocks, importanceBadgeMeta, renderInlineMarkup, type KbBlock } from '~/utils/knowledge'

const props = withDefaults(defineProps<{
  blocks: KbBlock[]
  coreOnly?: boolean
  highlightKeyword?: string
}>(), {
  coreOnly: false,
  highlightKeyword: '',
})

const copiedId = ref<string | null>(null)

const visibleBlocks = computed(() => filterKbBlocks(props.blocks ?? [], props.coreOnly))

function inlineHtml(text?: string): string {
  return renderInlineMarkup(text ?? '', props.highlightKeyword)
}

function calloutLabel(kind?: string): string {
  if (kind === 'trap') return '易错陷阱'
  if (kind === 'warn') return '注意事项'
  return '复习提示'
}

function calloutClass(kind?: string): string {
  if (kind === 'trap') return 'border-danger-border bg-danger-bg/60 text-danger-fg'
  if (kind === 'warn') return 'border-warn-border bg-warn-bg/60 text-warn-fg'
  return 'border-brand/30 bg-brand-soft/60 text-brand-on-soft'
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
    <div v-for="block in visibleBlocks" :key="block.id"
         :id="block.id"
         class="kb-block rounded-xl border border-line-subtle border-l-4 bg-surface-card p-3.5 sm:p-4"
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
        <li v-for="(item, idx) in block.items ?? []" :key="idx" v-html="inlineHtml(item)" />
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

      <!-- 5. 树状思维导图块 (tree)：可折叠树形组件，取代易折行错位的 ASCII 树 -->
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
                  <li v-for="(leaf, lIdx) in branch.children" :key="lIdx"
                      class="leading-6"
                      v-html="inlineHtml(leaf.label)" />
                </ul>
              </details>
              <p v-else class="text-xs leading-6 text-fg-secondary sm:text-sm" v-html="inlineHtml(branch.label)" />
            </li>
          </ul>
        </details>
      </div>

      <!-- 6. 易错/注意提示框 (callout) -->
      <div v-else-if="block.t === 'callout'"
           class="rounded-lg border px-3.5 py-2.5 text-xs leading-6 sm:text-sm"
           :class="calloutClass(block.kind)">
        <p class="font-semibold">{{ calloutLabel(block.kind) }}</p>
        <p class="mt-1 text-fg-secondary" v-html="inlineHtml(block.text)" />
      </div>
    </div>
  </div>
</template>

<style scoped>
.kb-prose {
  font-size: var(--reader-fs, 1rem);
  line-height: 1.75;
  overflow-wrap: anywhere;
}
.kb-block :deep(code) {
  border-radius: 0.25rem;
  background: rgb(var(--surface-muted));
  padding: 0.05rem 0.3rem;
  font-family: ui-monospace, SFMono-Regular, Menlo, Monaco, Consolas, monospace;
  font-size: 0.88em;
  color: rgb(var(--fg-primary));
}
.kb-block :deep(mark.kb-mark) {
  border-radius: 0.25rem;
  background: rgb(var(--warn-bg));
  padding: 0.05rem 0.3rem;
  font-weight: 600;
  color: rgb(var(--warn-fg));
}
.kb-block :deep(mark.kb-hl) {
  border-radius: 0.2rem;
  background: rgb(var(--brand) / 0.22);
  padding: 0 0.2rem;
  color: inherit;
  box-shadow: 0 0 0 1px rgb(var(--brand) / 0.4);
}
</style>
