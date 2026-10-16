$computer = Get-CimInstance -ClassName Win32_OperatingSystem
$processes = Get-Process

Write-Output "Datora nosaukums: $env:COMPUTERNAME"
Write-Output "Operētājsistēma: $($computer.Caption)"
Write-Output "Operētājsistēmas būvējuma numurs: $($computer.BuildNumber)"
Write-Output "PowerShell versija: $($PSVersionTable.PSVersion)"
Write-Output "Pašreizējais datums un laiks: $(Get-Date -Format 'dd.MM.yyyy HH:mm:ss')"
Write-Output "Darbojošos procesu skaits: $($processes.Count)"
