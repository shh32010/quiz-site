/** 注册时校验两次输入的密码；返回空字符串表示通过 */
export function validateRegisterPassword(password: string, confirmPassword: string): string {
  if (!confirmPassword) return '请再次输入密码'
  if (password !== confirmPassword) return '两次输入的密码不一致'
  return ''
}
