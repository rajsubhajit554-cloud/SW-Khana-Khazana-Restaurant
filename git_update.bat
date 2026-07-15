@echo off
cls
echo ===================================================
echo             Khana Khazana Git Auto-Updater         
echo ===================================================
echo.

:: Check if git is installed
where git >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Git is not installed or not in your PATH.
    echo Please install Git from https://git-scm.com/
    pause
    exit /b
)

echo [1/4] Checking current repository status...
git status
echo.

echo [2/4] Staging all files...
git add .
echo.

set "commit_msg="
set /p commit_msg="Enter commit message (leave blank for 'Website update'): "

if "%commit_msg%"=="" (
    set "commit_msg=Website update"
)

echo.
echo [3/4] Committing changes with message: "%commit_msg%"
git commit -m "%commit_msg%"
echo.

echo [4/4] Pushing changes to GitHub (origin/main)...
git push origin main
echo.

if %errorlevel% equ 0 (
    echo ===================================================
    echo      SUCCESS: Changes pushed to GitHub successfully!
    echo ===================================================
) else (
    echo ===================================================
    echo      ERROR: Failed to push changes to GitHub.
    echo ===================================================
)

echo.
pause
