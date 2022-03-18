$logs = "\\172.16.147.58\c$\test\log.txt"
$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration -computername $env:COMPUTERNAME|where{$_.IPEnabled -eq “TRUE”}
Foreach($NIC in $NICs) {
   Write-Output $env:COMPUTERNAME >> $logs
   Write-Output  "DNS Servers before  change:" >> $logs
   Write-Output $NIC.DNSServerSearchOrder >> $logs
   $NIC.DNSServerSearchOrder
   $DNSServers = “10.70.10.34",”10.70.10.35"
   $NIC.SetDNSServerSearchOrder($DNSServers)
   $NIC.SetDynamicDNSRegistration(“TRUE”)
}

$NICs = Get-WMIObject Win32_NetworkAdapterConfiguration -computername $env:COMPUTERNAME |where{$_.IPEnabled -eq “TRUE”}
Write-Output "DNS Servers after change:" >> $logs
Write-Output $NICs.DNSServerSearchOrder >> $logs
