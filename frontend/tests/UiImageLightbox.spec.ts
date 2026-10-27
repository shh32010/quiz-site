import { afterEach, describe, expect, it } from 'vitest'
import { nextTick } from 'vue'
import { mount, type VueWrapper } from '@vue/test-utils'
import UiImageLightbox from '../components/ui/UiImageLightbox.vue'

function mountLightbox(props: Record<string, unknown>) {
  return mount(UiImageLightbox, {
    props,
    global: { stubs: { teleport: true } },
  })
}

describe('UiImageLightbox', () => {
  let wrapper: VueWrapper | null = null

  afterEach(() => {
    wrapper?.unmount()
    wrapper = null
    document.body.style.overflow = ''
  })

  it('打开时显示弹层并锁滚动，关闭后恢复', async () => {
    wrapper = mountLightbox({ modelValue: false, images: ['/a.jpg', '/b.jpg'], startIndex: 1 })
    await wrapper.setProps({ modelValue: true })
    await nextTick()

    expect(wrapper.find('[role="dialog"]').exists()).toBe(true)
    expect(document.body.style.overflow).toBe('hidden')

    await wrapper.setProps({ modelValue: false })
    await nextTick()
    expect(document.body.style.overflow).toBe('')
  })

  it('图片清空时自动请求关闭', async () => {
    wrapper = mountLightbox({ modelValue: true, images: ['/a.jpg'] })
    await nextTick()

    await wrapper.setProps({ images: [] })
    await nextTick()
    expect(wrapper.emitted('update:modelValue')?.at(-1)).toEqual([false])
  })

  it('放大按钮改变比例', async () => {
    wrapper = mountLightbox({ modelValue: true, images: ['/a.jpg'] })
    await nextTick()

    const zoom = wrapper.findAll('button').find(button => button.attributes('aria-label') === '放大')
    expect(zoom).toBeTruthy()
    await zoom!.trigger('click')
    expect(wrapper.text()).toContain('150%')
  })
})
