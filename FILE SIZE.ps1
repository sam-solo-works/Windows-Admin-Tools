$size = 0
foreach ($file in (get-childitem D:\MEDSQL01 -Recurse )) {$size += $file.length/1024/1024/1024}
$size