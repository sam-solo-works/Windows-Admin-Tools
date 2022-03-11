$filelocationscsv = "C:\Documents\test.csv"
$filelocationcsvcontents = Get-Content -LiteralPath $filelocationscsv
$outputfilelocation = "C:\Documents\allfilepermissions.csv"

$results = foreach ($location in $filelocationcsvcontents){
    if (Test-Path $location){
    Get-Item -LiteralPath $location -Force | % {Get-acl -path $_.fullname | Select-Object Owner,AccessToString -ExcludeProperty Mode,LastWriteTime,Length,Name -ExpandProperty AccessToString }
    }
    else{
    Write-Output "$location permissions could not be accessed." 
    }
} 

$results | Export-CSV $outputfilelocation
