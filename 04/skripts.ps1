$services = Get-CimInstance -ClassName Win32_Service |
    Where-Object {
        $_.StartMode -eq 'Auto' -and $_.State -eq 'Stopped'
    }

if (@($services).Count -eq 0) {
    Write-Output "Nav atrasts neviens apturēts automātiskais serviss. Skaits: 0"
}
else {
    foreach ($service in $services) {
        Write-Output "Serviss: $($service.Name) - $($service.DisplayName)"

        if ($PSCmdlet.ShouldProcess($service.Name, 'Start service')) {
            Start-Service -Name $service.Name
        }
    }
}
