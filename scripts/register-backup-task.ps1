# 注册每周离机备份计划任务（当前用户，周日 04:00）
$ErrorActionPreference = 'Stop'
$script = 'D:\Users\002\Desktop\quiz-v2\scripts\pull-backup.ps1'
$action = New-ScheduledTaskAction -Execute 'powershell.exe' `
    -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$script`""
$trigger = New-ScheduledTaskTrigger -Weekly -DaysOfWeek Sunday -At 04:00
$settings = New-ScheduledTaskSettingsSet -StartWhenAvailable -RunOnlyIfNetworkAvailable
Register-ScheduledTask -TaskName 'QuizBackupPull' -Action $action -Trigger $trigger `
    -Settings $settings -Description '每周从阿里云拉取题库备份' -Force | Out-Null
Get-ScheduledTask -TaskName 'QuizBackupPull' | Select-Object TaskName, State
Get-ScheduledTaskInfo -TaskName 'QuizBackupPull' | Select-Object NextRunTime, LastTaskResult
