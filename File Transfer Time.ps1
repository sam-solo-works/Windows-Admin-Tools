$item = get-childitem 'D:\MEDSQL01' -Verbose
$d = "E:\MEDSQL01"
$CopyCmd = foreach ($i in $item) {"Copy-Item -literalpath '$i' '$d'"}
$time = Measure-Command -Expression {$CopyCmd} 
$TransferRate = ($item.length/1024/1024) / $time.TotalSeconds
write-host "$TransferRate MB/Sec"

#$item = get-childitem 'D:\SQL01' -Recurse
#$d = "E:\SQL01"
#$results = @()
#
#$results = Foreach ($i in $item) {
#Measure-Command -Expression {
#Copy-Item -literalpath $i $d
#    }
#}
#
#($results | Measure-Object -Property TotalSeconds -Sum).Sum
#
#
#$results -f "c"

#$result = @()
#$result = foreach ($i in $item) 
#                {New-Object -TypeName psobject -Property @{
#                    Source           = $item.fullname
#                    TimeTaken        = $time.TotalSeconds
#                    TransferRateMBs  = $TransferRate
#                    }
#                }

$result|Export-Csv 'C:\temp\result.csv' -Force -Append -NoTypeInformation
