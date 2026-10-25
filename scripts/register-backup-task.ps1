# 注册每日离机备份计划任务（当前用户，每天 04:00）
# 数据库 dump 每天拉取；图片包只在本地没有新增文件时拉取
$ErrorActionPreference = 'Stop'
$script = 'D:\Users\002\Desktop\quiz-v2\scripts\pull-backup.ps1'
$action = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$script`""
$trigger = New-ScheduledTaskTrigger -Daily -At 04:00
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -RunOnlyIfNetworkAvailable
Register-ScheduledTask -TaskName 'QuizBackupPull' -Action $action -Trigger $trigger `
    -Settings $settings -Description '每天从阿里云拉取题库备份（数据库每日，图片仅新增时）' -Force | Out-Null
Get-ScheduledTask -TaskName 'QuizBackupPull' | Select-Object TaskName, State
Get-ScheduledTaskInfo -TaskName 'QuizBackupPull' | Select-Object NextRunTime, LastTaskResult
