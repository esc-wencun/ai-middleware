@echo off
REM ============================================================
REM  2_postgres_stop.bat - 停止 PostgreSQL + Adminer (数据保留)
REM ============================================================
cd /d "%~dp0postgres"
echo [postgres] docker compose stop ...
docker compose stop
echo [postgres] 完成, 数据已保留.
pause
