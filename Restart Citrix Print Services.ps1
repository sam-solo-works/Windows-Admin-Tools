$cpsvc = Get-Service -DisplayName 'Citrix Print Manager Service'

if ($cpsvc | where {$_.Status -eq 'Stopped'}) {
    $cpsvc | Set-Service -Status Running
}
