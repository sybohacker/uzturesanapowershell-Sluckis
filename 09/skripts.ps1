$processes = Get-CimInstance -ClassName Win32_Process

foreach ($process in $processes) {
    $owner = Invoke-CimMethod -InputObject $process -MethodName GetOwner -ErrorAction Continue

    if ($owner.ReturnValue -eq 0) {
        Write-Output "Process: $($process.Name); Id: $($process.ProcessId); User: $($owner.Domain)\$($owner.User)"
    }
    else {
        Write-Output "Process: $($process.Name); Id: $($process.ProcessId); User: nav pieejams; ReturnValue: $($owner.ReturnValue)"
    }
}
