function Read-Configuration()
{
    param(
        [Parameter(Mandatory=$true)]
        [string] $Path
    )

    $configuration = Get-Content -Path $Path -Raw | ConvertFrom-Json
    return $configuration
} 

function Confirm-ConfigurationValid()
{
    param(
        [Parameter(Mandatory=$true)]
        [PSCustomObject] $Configuration
    )

    if ([string]::IsNullOrWhiteSpace($Configuration.DatabaseName))
    {
        throw "Invalid configuration: database name could not be empty."
    }

    if ([string]::IsNullOrWhiteSpace($Configuration.DatabaseConnectionString))
    {
        throw "Invalid configuration: database connection string could not be empty"
    }

    if ($Configuration.Size -gt 1000)
    {
        throw "Invalid configuration: databse size could not be greater than 1000 Gb"
    }

    if ($Configuration.Tables.Count -eq 0)
    {
        throw "Invalid configuration: database should contain at least one table"
    }
}

function Start-DatabaseServer()
{
    param(
        [Parameter(Mandatory=$true)]
        [PSCustomObject] $Configuration
    )

    $argumentList = @($Configuration.DatabaseName, $Configuration.DatabaseConnectionString, $Configuration.Size, $Configuration.Tables -Split ",")
    Start-Process -FilePath .\Bin\DBServer.exe -ArgumentList ($argumentList)
} 