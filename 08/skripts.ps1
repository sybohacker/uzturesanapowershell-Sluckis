$time1 = Measure-Command {
    $service1 = Get-Service -Name Spooler
}

$time2 = Measure-Command {
    $service2 = Get-CimInstance -ClassName Win32_Service -Filter "Name = 'Spooler'"
}

Write-Output "Pirma metode: Get-Service"
$service1 | Select-Object -Property Name, DisplayName, Status | Format-List
Write-Output "Pirmās metodes laiks (ms): $($time1.TotalMilliseconds)"

Write-Output "Otrā metode: Get-CimInstance"
$service2 | Select-Object -Property Name, DisplayName, State | Format-List
Write-Output "Otrās metodes laiks (ms): $($time2.TotalMilliseconds)"

if ($time1.TotalMilliseconds -lt $time2.TotalMilliseconds) {
    Write-Output "Ātrāka bija pirmā metode."
}
elseif ($time2.TotalMilliseconds -lt $time1.TotalMilliseconds) {
    Write-Output "Ātrāka bija otrā metode."
}
else {
    Write-Output "Abu metožu izmērītais laiks bija vienāds."
}
