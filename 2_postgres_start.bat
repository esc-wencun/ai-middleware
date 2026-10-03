@echo off
REM ============================================================
REM  2_postgres_start.bat - Æô¶¯ PostgreSQL + Adminer
REM ============================================================
cd /d "%~dp0postgres"
echo [postgres] docker compose up -d ...
docker compose up -d
echo [postgres] Íê³É.
pause
