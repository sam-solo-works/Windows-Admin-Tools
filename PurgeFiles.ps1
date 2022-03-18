$path = "\\172.16.146.168\z$\2"
$date = get-date -format M.d.yyyy 
$logFile = "deletefiles.log" 
$logdir = "\\172.16.146.168\z$\logs\$logFile"
$Files = Get-Childitem $path -Recurse -ErrorAction SilentlyContinue


foreach($File in $Files){
Add-Content -Path $logdir -Value $File.FullName 
}
foreach($File in $Files){
Remove-Item -LiteralPath $File.FullName -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item -LiteralPath $path -Recurse -Force -ErrorAction SilentlyContinue
}
if((Get-ChildItem $path -ErrorAction SilentlyContinue) -eq $null){
Add-Content -Path $logdir -Value "All files removed from $path on $date" 
}
