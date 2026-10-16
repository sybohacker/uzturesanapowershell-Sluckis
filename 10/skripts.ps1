$processes = Get-Process
$services = Get-Service

$running = 0
$stopped = 0

foreach ($service in $services) {
    if ($service.Status -eq 'Running') {
        $running++
    }
    elseif ($service.Status -eq 'Stopped') {
        $stopped++
    }
}

$startTime = (Get-Date).AddHours(-48)

$errors = @(
    Get-WinEvent -FilterHashtable @{
        LogName = 'System'
        Level = 2
        StartTime = $startTime
    } -ErrorAction SilentlyContinue
)

$disks = Get-CimInstance -ClassName Win32_LogicalDisk -Filter "DriveType = 3"

Write-Output "Procesu skaits: $($processes.Count)"
Write-Output "Darbojošos servisu skaits: $running"
Write-Output "Apturēto servisu skaits: $stopped"
Write-Output "Kļūdu ierakstu skaits pēdējās 48 stundās: $($errors.Count)"

foreach ($disk in $disks) {
    $freeGB = [math]::Round($disk.FreeSpace / 1GB, 2)
    Write-Output "Disks $($disk.DeviceID), brīvā vieta (GB): $freeGB"
}
