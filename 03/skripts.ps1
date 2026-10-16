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

$total = $running + $stopped

Write-Output "Darbojošos servisu skaits: $running"
Write-Output "Apturēto servisu skaits: $stopped"
Write-Output "Abu grupu summa: $total"
Write-Output "Kopējais atrasto servisu skaits: $($services.Count)"
