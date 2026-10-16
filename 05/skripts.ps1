$startTime = (Get-Date).AddHours(-48)

$errors = @(
    Get-WinEvent -FilterHashtable @{
        LogName = 'System'
        Level = 2
        StartTime = $startTime
    } -ErrorAction SilentlyContinue
)

Write-Output "Kļūdu ierakstu skaits pēdējās 48 stundās: $($errors.Count)"

if ($errors.Count -gt 0) {
    $topSource = $errors |
        Group-Object -Property ProviderName |
        Sort-Object -Property Count -Descending |
        Select-Object -First 1

    Write-Output "Biežākais kļūdu avots: $($topSource.Name)"
    Write-Output "Šī avota kļūdu skaits: $($topSource.Count)"
}
else {
    Write-Output "Biežākais kļūdu avots: nav kļūdu ierakstu"
    Write-Output "Šī avota kļūdu skaits: 0"
}
