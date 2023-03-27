# Manipulating-process

### `PowerShell` code that can kill task with provide only the name
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
In this code, the user will be prompted to enter the name of the process they want to kill. The code then uses the Get-Process cmdlet to retrieve information about the process by name, and the Stop-Process cmdlet to kill the process by ID. If the process is found and killed, the code will print a message confirming that the process was killed. If the process could not be found, the code will print a message indicating that the process could not be found.

---

### PowerShell code that will list all running processes and give the user the option to select a process to kill by name:
```
# List all running processes
Get-Process

# Prompt the user to enter the name of the process to kill
$processName = Read-Host "Enter the name of the process to kill"

# Find the process by name and kill it
$process = Get-Process $processName -ErrorAction SilentlyContinue

if ($process) {
  Stop-Process -Id $process.Id
  Write-Host "The process $processName was successfully killed."
} else {
  Write-Host "The process $processName could not be found."
}
```
In this code, the Get-Process cmdlet is used to list all running processes. The user is then prompted to enter the name of the process they want to kill. The code then uses the Get-Process cmdlet again to retrieve information about the process by name, and the Stop-Process cmdlet to kill the process by ID. If the process is found and killed, the code will print a message confirming that the process was killed. If the process could not be found, the code will print a message indicating that the process could not be found.
