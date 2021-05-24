Clear-Host
$name = Read-Host 'What is your name?'
$surName = Read-Host 'What is your surname?'
Write-Host 'Indicate the file, where we need to save it'
$path = Read-Host

$getArray = Get-Content -Path $path -Raw -ErrorAction SilentlyContinue | ConvertFrom-Json 
$NameSurname = @($name, $surName) + @($getArray) | ConvertTo-Json | Out-File $path <#C:\Users\Daria\Desktop\Tasks\PowerShell_Scripting\NameSurname.json#>