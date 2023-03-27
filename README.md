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

---

### C++ code that will kill a process by name:

```
#include <iostream>
#include <windows.h>
#include <tlhelp32.h>
#include <string>

using namespace std;

int main() {
    // Prompt the user to enter the name of the process to kill
    string processName;
    cout << "Enter the name of the process to kill: ";
    getline(cin, processName);

    // Get a snapshot of the system's processes
    HANDLE snapshot = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    PROCESSENTRY32 processEntry;
    processEntry.dwSize = sizeof(processEntry);

    // Find the process by name and kill it
    if (Process32First(snapshot, &processEntry)) {
        do {
            if (string(processEntry.szExeFile) == processName) {
                HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, FALSE, processEntry.th32ProcessID);
                if (hProcess != NULL) {
                    TerminateProcess(hProcess, 0);
                    CloseHandle(hProcess);
                    cout << "The process " << processName << " was successfully killed." << endl;
                    return 0;
                }
            }
        } while (Process32Next(snapshot, &processEntry));
    }

    // Close the snapshot handle
    CloseHandle(snapshot);

    cout << "The process " << processName << " could not be found." << endl;
    return 0;
}

```

In this code, the user is prompted to enter the name of the process they want to kill. The CreateToolhelp32Snapshot function is used to get a snapshot of the system's processes, and the Process32First and Process32Next functions are used to iterate through the list of processes. If a process with the given name is found, the OpenProcess function is used to get a handle to the process, and the TerminateProcess function is used to kill the process. If the process is successfully killed, a message is printed indicating that the process was successfully killed. If the process could not be found, a message is printed indicating that the process could not be found.

---

### PowerShell code that lists all running processes and prompts the user to enter a process name to `freeze`:

```
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

```

The Get-Process cmdlet is used to list all running processes, and the Read-Host cmdlet is used to prompt the user for the name of the process to freeze. The Get-Process cmdlet is used again to retrieve the process object by name.

Next, the script checks if the process exists and has at least one thread that is not already frozen. If the process meets these conditions, the script uses the Suspend() method to freeze all threads in the process, and displays a message confirming that the process has been frozen.

If the process does not exist or is already frozen, the script displays an appropriate message to the user.
