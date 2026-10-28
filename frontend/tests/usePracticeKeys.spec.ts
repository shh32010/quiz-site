import { afterEach, describe, expect, it, vi } from 'vitest'
import { defineComponent, h } from 'vue'
import { mount, type VueWrapper } from '@vue/test-utils'
import { usePracticeKeys, type PracticeKeyHandlers } from '../composables/usePracticeKeys'

function setup(overrides: Partial<PracticeKeyHandlers> = {}) {
  const handlers: PracticeKeyHandlers = {
    isEnabled: () => true,
    onSelect: vi.fn(),
    onSubmit: vi.fn(),
    onNext: vi.fn(),
    onPrev: vi.fn(),
    onHelp: vi.fn(),
    onCancelAdvance: vi.fn(),
    ...overrides,
  }
  const Comp = defineComponent({
    setup() {
      usePracticeKeys(handlers)
      return () => h('div')
    },
  })
  const wrapper = mount(Comp, { attachTo: document.body })
  return { handlers, wrapper }
}

function keydown(target: EventTarget, init: KeyboardEventInit) {
  target.dispatchEvent(new KeyboardEvent('keydown', { bubbles: true, cancelable: true, ...init }))
}

describe('usePracticeKeys', () => {
  let wrapper: VueWrapper | null = null

  afterEach(() => {
    wrapper?.unmount()
    wrapper = null
  })

  it('选择题按键触发 onSelect', () => {
    const ctx = setup()
    wrapper = ctx.wrapper
    keydown(window, { key: 'A' })
    expect(ctx.handlers.onSelect).toHaveBeenCalledWith('A')
  })

  it('isEnabled 为 false 时不响应', () => {
    const ctx = setup({ isEnabled: () => false })
    wrapper = ctx.wrapper
    keydown(window, { key: 'Enter' })
    expect(ctx.handlers.onSubmit).not.toHaveBeenCalled()
  })

  it('主作答文本域普通 Enter 不提交，Ctrl+Enter 提交', () => {
    const ctx = setup()
    wrapper = ctx.wrapper
    const textarea = document.createElement('textarea')
    textarea.setAttribute('data-practice-answer', 'true')
    document.body.appendChild(textarea)

    keydown(textarea, { key: 'Enter' })
    expect(ctx.handlers.onSubmit).not.toHaveBeenCalled()

    keydown(textarea, { key: 'Enter', ctrlKey: true })
    expect(ctx.handlers.onSubmit).toHaveBeenCalledTimes(1)

    textarea.remove()
  })

  it('反馈等附属文本域的 Ctrl+Enter 不会提交本题', () => {
    const ctx = setup()
    wrapper = ctx.wrapper
    const textarea = document.createElement('textarea')
    document.body.appendChild(textarea)

    keydown(textarea, { key: 'Enter', ctrlKey: true })
    expect(ctx.handlers.onSubmit).not.toHaveBeenCalled()

    textarea.remove()
  })

  it('按钮上的 Enter 交给原生点击，不提交本题', () => {
    const ctx = setup()
    wrapper = ctx.wrapper
    const button = document.createElement('button')
    document.body.appendChild(button)

    keydown(button, { key: 'Enter' })
    expect(ctx.handlers.onSubmit).not.toHaveBeenCalled()

    button.remove()
  })
})
