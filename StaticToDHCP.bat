REM StaticToDHCP.bat
REM Script to convert a static client to a dhcp client.
netsh interface ip set dns "Local Area Connection" dhcp
netsh interface ip set wins "Local Area Connection" dhcp
netsh interface ip set address "Local Area Connection" dhcp
ipconfig /renew