Write-Host "Укажите, где сохранить файл"
$path = Read-Host
Get-Disk | Out-File -filePath $path