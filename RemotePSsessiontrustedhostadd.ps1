#Set terminals to the trusted hosts list so you can remote to the terminals powershell session

Set-item WSMan:\localhost\Client\TrustedHosts -Value #use hostname or IP here
Restart-Service WinRM
Test-WSMan -ComputerName #use hostname or IP here