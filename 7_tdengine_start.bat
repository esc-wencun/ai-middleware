@echo off
REM ============================================================
REM  7_tdengine_start.bat - Æô¶¯ TDengine
REM ============================================================
cd /d "%~dp0tdengine"
echo [tdengine] docker compose up -d ...
docker compose up -d
echo [tdengine] Íê³É.
pause
