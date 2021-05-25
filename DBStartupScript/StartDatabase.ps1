param (
    [Parameter(Mandatory=$true)]
    [string] $ConfigFileName
)

. .\Utils.ps1

$configFolder = ".\Configs"
$configFile = Join-Path $configFolder $ConfigFileName
$configuration = Read-Configuration $configFile
Confirm-ConfigurationValid $configuration
Start-DatabaseServer $configuration