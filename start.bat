@echo off
cd /d "%~dp0"
title Milky Meadow Adventure - local server

set PORT=8000

echo ============================================
echo   Milky Meadow Adventure - local server
echo ============================================
echo.

rem If the port is already serving, just open the browser.
curl -s -o nul --max-time 1 http://127.0.0.1:%PORT%/ >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Server already running on port %PORT%.
    goto open
)

echo Starting python http.server on port %PORT% ...
start "milky-meadow-server" /min python -m http.server %PORT% --bind 127.0.0.1
timeout /t 2 /nobreak >nul

:open
echo Opening http://127.0.0.1:%PORT%/
start "" "http://127.0.0.1:%PORT%/"
echo.
echo Done. Keep the minimized "milky-meadow-server" window alive while playing.
echo Close that window to stop the server.
timeout /t 4 >nul
exit
