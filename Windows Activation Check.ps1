Param
(
    [Parameter(Mandatory=$false,ValueFromPipelineByPropertyName=$true)]
    [String[]]$ComputerName = $env:COMPUTERNAME
)

#defined initial data
$LicenseStatus = @("Unlicensed","Licensed","OOB Grace",
"OOT Grace","Non-Genuine Grace","Notification","Extended Grace")

Foreach($CN in $ComputerName)
{
    Get-CimInstance -ClassName SoftwareLicensingProduct -ComputerName $ComputerName |`
    Where{$_.PartialProductKey -and $_.Name -like "*Windows*"} | Select `
    @{Expression={$_.PSComputerName};Name="ComputerName"},`
    @{Expression={$_.Name};Name="WindowsName"} ,ApplicationID,`
    @{Expression={$LicenseStatus[$($_.LicenseStatus)]};Name="LicenseStatus"}
}
