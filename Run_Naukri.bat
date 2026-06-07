@echo off
setlocal

cd /d "%~dp0"

if exist ".venv\Scripts\python.exe" (
    ".venv\Scripts\python.exe" "naukri_agent.py" %*
) else (
    python "naukri_agent.py" %*
)

endlocal