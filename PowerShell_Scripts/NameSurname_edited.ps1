$NameSurname = @()
$name = Read-Host 'What is your name?'
$surName = Read-Host 'What is your surname?'
$NameSurname = @($name) + @($surName) + $NameSurname
Write-Host 'Indicate the file, where we need to save it'
$path = Read-Host
ConvertTo-Json $NameSurname | Add-Content -Path $path #C:\Users\Daria\Desktop\Tasks\POwerShell_Scripting\NameSurname.json#