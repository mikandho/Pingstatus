# Pingstatus

A simple PowerShell script that continuously monitors the availability of a target host by sending ICMP ping requests. It prints a timestamped status message only when the host changes state between UP and DOWN.

## What it does

The script:
- accepts a target host or IP address as input
- sends a single ping every second
- reports the current status when it changes
- continues running until you stop it with Ctrl+C

## Requirements

- PowerShell 5.1 or later
- Network access to the target host
- ICMP ping enabled on the target and the local network path

## Usage

Run the script from PowerShell:

```powershell
./PingMonitor.ps1 -Target 192.168.1.100
```

You can also use a hostname instead of an IP address:

```powershell
./PingMonitor.ps1 -Target example.com
```

## Example output

```text
Ctrl+C för att avbryta.
2026-07-01 10:00:00 - 192.168.1.100 - UP
2026-07-01 10:00:15 - 192.168.1.100 - DOWN
2026-07-01 10:00:30 - 192.168.1.100 - UP
```

## Parameters

- `-Target` (required): The host name or IP address to monitor.

## Notes

- The script uses `Test-Connection` with a single ping per cycle.
- It only prints a line when the state changes from UP to DOWN or DOWN to UP.
- If no target is provided, the script exits with an error message.

## Troubleshooting

- If you see an error saying the target must be provided, make sure you pass `-Target`.
- If the host never appears as UP, verify that the target is reachable and that ICMP traffic is allowed.
- If you are running from Windows PowerShell, ensure the script execution policy allows local scripts to run.

