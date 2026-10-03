@echo off
REM ============================================================
REM  2_postgres_status.bat - ²é¿´ PostgreSQL / Adminer ÈÝÆ÷×´Ì¬
REM ============================================================
cd /d "%~dp0postgres"
docker compose ps
echo.
pause
