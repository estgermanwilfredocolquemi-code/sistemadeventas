$ErrorActionPreference = "Stop"
$root = Split-Path -Parent $PSScriptRoot
Push-Location $root
try {
    dotnet build NexCodeSales.slnx --configuration Release
} finally {
    Pop-Location
}
