function Path {
    Write-Host "Please, specify the path"
}

Path
$TestFolder1Path = Read-Host #'C:\Users\Daria\Desktop\TestFolder1'#
Path
$TestFolder2Path = Read-Host #'C:\Users\Daria\Desktop\TestFolder2'#
Get-ChildItem $TestFolder1Path -Recurse | Copy-Item -Destination $TestFolder2Path -Force
Get-ChildItem $TestFolder2Path -Recurse | Copy-Item -Destination $TestFolder1Path -Force