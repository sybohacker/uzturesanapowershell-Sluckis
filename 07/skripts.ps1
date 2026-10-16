$limitGB = 10

$disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType = 3"

foreach ($disk in $disks) {
    $sizeGB = [math]::Round($disk.Size / 1GB, 2)
    $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)

    Write-Output "Disks: $($disk.DeviceID)"
    Write-Output "Kopējais izmērs (GB): $sizeGB"
    Write-Output "Brīvā vieta (GB): $freeGB"

    if (($disk.FreeSpace / 1GB) -lt $limitGB) {
        Write-Output "BRĪDINĀJUMS: brīvās vietas ir mazāk par $limitGB GB!"
    }

    Write-Output "------------------------------"
}
