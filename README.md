# Manipulating-process

`PowerShell` code that can kill task with provide only the name
```
$processName = Read-Host "Enter the name of the process to kill"

$process = Get-Process $processName -ErrorAction SilentlyContinue

if ($process) {
  Stop-Process -Id $process.Id
  Write-Host "The process $processName was successfully killed."
} else {
  Write-Host "The process $processName could not be found."
}
```
