Clear-Host

Write-Host "We will ask you to indicate the path for folder 1 and folder 2"
function Path($TestFolderPath) {
    Write-Host "Please, specify the path"
    $TestFolderPath = Read-Host

    return $TestFolderPath
}

$TestFolder1Path = Path #'C:\Users\Daria\Desktop\TestFolder1'
$TestFolder2Path = Path #'C:\Users\Daria\Desktop\TestFolder2'

$Folder1Content = Get-ChildItem $TestFolder1Path -Recurse
$Folder2Content = Get-ChildItem $TestFolder2Path -Recurse

$Difference1 = Compare-Object -ReferenceObject $Folder1Content -DifferenceObject $Folder2Content `
-Property Name, Length -PassThru | Where-Object {$_.SideIndicator -eq "<="}
$Difference1 | ForEach-Object {
    Copy-Item $Folder1Content -Destination $TestFolder2Path -Force
}

$Difference2 = Compare-Object -ReferenceObject $Folder2Content -DifferenceObject $Folder1Content `
-Property Name, Length -PassThru | Where-Object {$_.SideIndicator -eq "<="}
$Difference2 | ForEach-Object {
    Copy-Item $Folder2Content -Destination $TestFolder1Path -Force
}