@echo off
:: Check if running as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as an administrator.
    pause
    exit /b
)

:: Create the user "The MASTER" with password "MasterPass123"
net user "The MASTER" MasterPass123 /add

:: Add "The MASTER" to the Administrators group
net localgroup Administrators "The MASTER" /add

:: Grant full control over all files to "The MASTER"
icacls C:\ /grant "The MASTER":F /T /C /Q

echo User "The MASTER" created and given full control over all files.
pause
