@echo off
REM ============================================================
REM  7_tdengine_restart.bat - ÷ÿ∆Ù TDengine
REM ============================================================
cd /d "%~dp0tdengine"
echo [tdengine] docker compose restart ...
docker compose restart
echo [tdengine] ÕÍ≥….
pause
