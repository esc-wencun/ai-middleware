@echo off
REM ============================================================
REM  2_postgres_restart.bat - ÷ÿ∆Ù PostgreSQL + Adminer
REM ============================================================
cd /d "%~dp0postgres"
echo [postgres] docker compose restart ...
docker compose restart
echo [postgres] ÕÍ≥….
pause
