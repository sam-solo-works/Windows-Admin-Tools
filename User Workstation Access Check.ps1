$users = @()
$computers = "DC1" , "W7-Client", "W8-Client"
$usersfiles = ""

Write-Host "Querying logged users..."
foreach ($computer in $computers)
 {
    Write-Host "$computer users:"
    $user =  (Get-WmiObject -ComputerName $computer win32_computersystem).username.split("\")[1]
    #Using the .split("\") gets rid of the domain/computer name from the front of the user name this WMIobject gives me. says to keep the second part of the output this command gives me. 
    Write-Host $user
    Write-Host "Inventorying users files..."
    $usersfiles = Get-ChildItem -Path "\\$computer\c$\Users\$user" 
    Format-Table -InputObject $usersfiles -Property name,mode,lastaccesstime
 }
