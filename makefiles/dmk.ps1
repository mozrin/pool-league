#!/usr/bin/env pwsh

Write-Host "Dynamic Makefile v1 (PowerShell wrapper)"
Write-Host ""

# Check if a Makefile exists in the current directory
if (-Not (Test-Path -Path "./Makefile")) {
    Write-Host "Error: Makefile not found in the current directory."
    exit 1
}

# Check if at least one argument is provided
if ($Args.Count -lt 1) {
    Write-Host "Usage: dmk <target> [arguments...]"
    exit 1
}

# Extract the target
$target = $Args[0]
$remainingArgs = $Args[1..($Args.Count - 1)] -join ' '

# Pass the rest of the arguments as args to make
Invoke-Expression "make -f Makefile $target args='$remainingArgs'"
