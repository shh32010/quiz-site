/** 全局确认框，替代原生 confirm */
export interface ConfirmOptions {
  title?: string
  message: string
  confirmText?: string
  cancelText?: string
  danger?: boolean
}
interface ConfirmState extends ConfirmOptions {
  resolve: (value: boolean) => void
}

export function useConfirm() {
  const state = useState<ConfirmState | null>('confirm_state', () => null)
  return (options: ConfirmOptions) => new Promise<boolean>((resolve) => {
    state.value = {
      title: '请确认',
      confirmText: '确定',
      cancelText: '取消',
      danger: false,
      ...options,
      resolve,
    }
  })
}

export function useConfirmHost() {
  const state = useState<ConfirmState | null>('confirm_state', () => null)
  function answer(value: boolean) {
    const current = state.value
    state.value = null
    current?.resolve(value)
  }
  return { state, answer }
}
