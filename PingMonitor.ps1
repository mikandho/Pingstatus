param(
    [string]$Target
)

if ([string]::IsNullOrWhiteSpace($Target)) {
    Write-Host "Fel: Target måste anges."
    Write-Host "Exempel: .\PingMonitor.ps1 -Target 192.168.1.100"
    exit 1
}

$LastStatus = $null
Write-Host "Ctrl+C för att avbryta."
while ($true) {
    $CurrentStatus = if (Test-Connection -ComputerName $Target -Count 1 -Quiet) {
        "UP"
    }
    else {
        "DOWN"
    }

    if ($CurrentStatus -ne $LastStatus) {
        Write-Host "$(Get-Date -Format 'yyyy-MM-dd HH:mm:ss') - $Target - $CurrentStatus"
        $LastStatus = $CurrentStatus
    }

    Start-Sleep -Seconds 1
}
