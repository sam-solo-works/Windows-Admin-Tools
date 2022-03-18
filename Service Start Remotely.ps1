$computer = ''
$admin = ''

Invoke-Command -ComputerName $computer -ScriptBlock {start-Service -Name 'LANDesk Targeted Multicast'} -Credential $admin
