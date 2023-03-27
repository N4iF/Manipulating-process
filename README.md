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

---

### batch code that will list all running processes and give the user the option to select a process to kill by name:

```
@echo off

REM List all running processes
tasklist

REM Prompt the user to enter the name of the process to kill
set /p processName=Enter the name of the process to kill:

REM Find the process by name and kill it
taskkill /f /im %processName%

REM Check if the process was successfully killed
tasklist | findstr /i /c:"%processName%" >nul
if %errorlevel% equ 0 (
  echo Failed to kill the process %processName%.
) else (
  echo The process %processName% was successfully killed.
)
```

In this code, the tasklist command is used to list all running processes. The user is then prompted to enter the name of the process they want to kill. The taskkill command is used to kill the process by name. The findstr command is used to search the output of the tasklist command for the process name to check if it was successfully killed. If the process is found, the code will print a message indicating that the process could not be killed. If the process is not found, the code will print a message confirming that the process was successfully killed.




