Get-Service -ComputerName $env:COMPUTERNAME | Where {$_.Status -eq 'running'} | Select DisplayName
