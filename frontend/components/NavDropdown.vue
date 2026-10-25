<script setup lang="ts">
/** 桌面导航下拉：鼠标进入或键盘 focus 打开，同一时间只开一个 */
interface NavItem {
  to: string
  label: string
}

const props = defineProps<{
  id: string
  label: string
  to: string
  active?: boolean
  items: NavItem[]
}>()

const openId = useState<string | null>('nav_dropdown_open', () => null)
const route = useRoute()
const root = ref<HTMLElement | null>(null)
const hasFocus = ref(false)

const open = computed(() => openId.value === props.id)

function show() {
  openId.value = props.id
}
function close() {
  if (openId.value === props.id) openId.value = null
}
function onFocusIn() {
  hasFocus.value = true
  show()
}
function onFocusOut(e: FocusEvent) {
  if (!root.value?.contains(e.relatedTarget as Node | null)) {
    hasFocus.value = false
    close()
  }
}
function onMouseLeave() {
  if (!hasFocus.value) close()
}

watch(() => route.fullPath, close)
</script>

<template>
  <div ref="root" class="relative"
       @mouseenter="show"
       @mouseleave="onMouseLeave"
       @focusin="onFocusIn"
       @focusout="onFocusOut"
       @keydown.esc="close">
    <NuxtLink :to="to" :aria-expanded="open" aria-haspopup="true"
              class="flex min-h-9 items-center gap-1 rounded-lg px-2.5 py-1.5 hover:bg-surface-muted"
              :class="active || open ? 'bg-brand-soft text-brand-on-soft' : 'text-fg-secondary'">
      {{ label }} <span class="text-xs text-fg-muted">▾</span>
    </NuxtLink>

    <div v-if="open"
         class="absolute left-0 top-full z-50 mt-1 w-40 rounded-xl border border-line-subtle bg-surface-elevated p-1 shadow-lg">
      <NuxtLink v-for="item in items" :key="item.to" :to="item.to"
                class="block min-h-10 rounded-lg px-3 py-2 text-sm text-fg-secondary hover:bg-surface-muted hover:text-fg-primary"
                @click="close">
        {{ item.label }}
      </NuxtLink>
    </div>
  </div>
</template>
