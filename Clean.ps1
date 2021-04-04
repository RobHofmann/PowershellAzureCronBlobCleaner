[CmdletBinding()]
param (
    [Parameter(Mandatory = $true)]
    [string] $storageAccountName,

    [Parameter(Mandatory = $true)]
    [string] $storageAccountKey,

    [Parameter(Mandatory = $true)]
    [string] $containerName,

    [Parameter(Mandatory = $false)]
    [int] $gracePeriodInSeconds = 0
)

function CleanDirectory($storageContext, $containerName, $filesOlderThan) {
    Write-Host "Removing blobs older than $filesOlderThan"
    Get-AzStorageBlob -Container $containerName -Context $storageContext | Where-Object {$_.LastModified -lt $filesOlderThan} | Remove-AzStorageBlob
    Write-Host "Removed blobs older than $filesOlderThan"
}


$cutOffDate = (Get-date).AddSeconds($gracePeriodInSeconds * -1)
$storageContext = New-AzStorageContext -storageAccountName $storageAccountName -storageAccountKey $storageAccountKey
CleanDirectory -storageContext $storageContext -containerName $containerName -filesOlderThan $cutOffDate
