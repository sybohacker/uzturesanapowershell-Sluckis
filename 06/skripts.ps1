$drivers = @(
    Get-CimInstance -ClassName Win32_PnPSignedDriver |
        Where-Object {
            $_.DriverProviderName -and
            $_.DriverProviderName -ne 'Microsoft'
        } |
        Select-Object -Property DeviceName, DriverProviderName,
            DriverVersion, InfName, DeviceID
)

$drivers | Export-Csv -Path .\draiveri.csv -NoTypeInformation -Encoding UTF8

Write-Output "CSV datu rindu skaits: $($drivers.Count)"
Write-Output "CSV faila nosaukums: draiveri.csv"
