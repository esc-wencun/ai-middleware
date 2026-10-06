@echo off
REM ============================================================
REM  6_mysql_status.bat - ²é¿´ MySQL ÈÝÆ÷×´Ì¬
REM ============================================================
cd /d "%~dp0mysql"
docker compose ps
echo.
pause
