# List all running processes
Get-Process

# Prompt user to enter process name to freeze
$processName = Read-Host 'Enter the name of the process to freeze'

# Get the process object by name
$process = Get-Process -Name $processName

# Check if process exists and is not already frozen
if ($process -and $process.Threads.Count -gt 0 -and !$process.Threads[0].WaitReason) {
    # Suspend the process by freezing all threads
    $process.Threads | ForEach-Object { $_.Suspend() }
    Write-Host "Process '$processName' has been frozen."
} else {
    Write-Host "Process '$processName' does not exist or is already frozen."
}
