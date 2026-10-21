# 每周从阿里云 ECS 拉取题库备份到本机 D:\Backups\quiz-aliyun
# 由 Windows 计划任务 QuizBackupPull 调用
$ErrorActionPreference = 'Stop'
$dest = 'D:\Backups\quiz-aliyun'
$log = Join-Path $dest 'pull.log'
$scp = 'C:\Windows\System32\OpenSSH\scp.exe'
New-Item -ItemType Directory -Force -Path $dest | Out-Null
$ts = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
try {
    & $scp -q aliyun:/opt/quiz-backups/quiz-*.dump $dest
    if ($LASTEXITCODE -ne 0) { throw "scp dump 失败，exit $LASTEXITCODE" }

    # 图片包每周日才生成；没有时 scp 返回非 0，不视为整体失败
    & $scp -q aliyun:/opt/quiz-backups/assets-*.tar.gz $dest
    $assetCode = $LASTEXITCODE

    # 本地保留：数据库 30 天，图片包 56 天
    Get-ChildItem $dest -Filter 'quiz-*.dump' |
        Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-30) } |
        Remove-Item -Force
    Get-ChildItem $dest -Filter 'assets-*.tar.gz' |
        Where-Object { $_.LastWriteTime -lt (Get-Date).AddDays(-56) } |
        Remove-Item -Force

    $dumps = (Get-ChildItem $dest -Filter 'quiz-*.dump' | Measure-Object).Count
    $assets = (Get-ChildItem $dest -Filter 'assets-*.tar.gz' | Measure-Object).Count
    "$ts OK dumps=$dumps assets=$assets asset_scp_exit=$assetCode" |
        Out-File -Append -Encoding utf8 $log
} catch {
    "$ts FAIL: $($_.Exception.Message)" | Out-File -Append -Encoding utf8 $log
    exit 1
}
