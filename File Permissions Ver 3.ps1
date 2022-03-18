$filelocationscsv = "C:\Documents\File Share migration_Mednax to NAPA.csv"
$filelocationcsvcontents = Get-Content -LiteralPath $filelocationscsv
$usercheck = Get-ADUser -Filter * | where Name -Like $_.split('\')[2,-1]

$AllFolders = foreach ($location in $filelocationcsvcontents) {
    Get-Item -Path $location -ErrorAction SilentlyContinue
}

$outputfilelocation = "C:\Documents\allfilepermissions $(get-date -f dd-MMM_hh_mm_ss).csv"

$Results = @()
Foreach ($_ in $AllFolders) {
    if (Test-Path $_){
    Write-Host "$_ working"
    $Acl = Get-Acl $_ -ErrorAction SilentlyContinue -Filter *
    foreach ($Access in $acl.Access) {
    if ($Access.IdentityReference -notlike "BUILTIN\Administrators" -and $Access.IdentityReference -notlike "test\Admins" -and $Access.IdentityReference -notlike "CREATOR OWNER" -and $access.IdentityReference -notlike "NT AUTHORITY\SYSTEM" -and $access.IdentityReference -notlike "Everyone" -and $access.IdentityReference -notlike "BUILTIN\Users" -and $access.IdentityReference -notlike "s-1*") {
    [string]$perm = $Access.IdentityReference
    [string]$domain, [string]$groupname = $perm.split('\')
      if ($checkgroup = Get-ADGroup $groupname){
            $Properties = [ordered]@{'FolderName'=$_.FullName;'AD Group'=$Access.IdentityReference;'Permissions'=$Access.FileSystemRights;'Inherited'=$Access.IsInherited}
            $Results += New-Object -TypeName PSObject -Property $Properties
                }
            }

        }
    }
    else {
    Write-Host "$_ is not accessible"
    }
}


$Results | Export-Csv $outputfilelocation -NoTypeInformation
