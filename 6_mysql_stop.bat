@echo off
REM ============================================================
REM  6_mysql_stop.bat - 停止 MySQL (数据保留)
REM ============================================================
cd /d "%~dp0mysql"
echo [mysql] docker compose stop ...
docker compose stop
echo [mysql] 完成, 数据已保留.
pause
