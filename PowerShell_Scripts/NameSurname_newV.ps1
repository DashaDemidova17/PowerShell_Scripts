Clear-Host
$name = Read-Host 'What is your name?'
$surName = Read-Host 'What is your surname?'
Write-Host 'Indicate the file, where we need to save it'
$path = Read-Host
$getArray = Get-Content -Path $path -Raw | Out-String | ConvertFrom-Json 
if ($getArray = "null"){
    $NameSurname = $name, $surName}
    else {$NameSurname = $name, $surName, $getArray}

ConvertTo-Json $NameSurname | Add-Content $path <#C:\Users\Daria\Desktop\Tasks\PowerShell_Scripting\NameSurname.json#>

#Проблема1: на первый запуск выходит ошибка Get-Content : Не удается найти путь, так как он не существует, но файл создается.
#Проблема2: на третий запуск и далее выходит ошибка ConvertFrom-Json : Недопустимый примитив JSON, но при этом в файл все добавляется. 