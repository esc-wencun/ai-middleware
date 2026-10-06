@echo off
REM ============================================================
REM  6_mysql_restart.bat - ÷ÿ∆Ù MySQL
REM ============================================================
cd /d "%~dp0mysql"
echo [mysql] docker compose restart ...
docker compose restart
echo [mysql] ÕÍ≥….
pause
