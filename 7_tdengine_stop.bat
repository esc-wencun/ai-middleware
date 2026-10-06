@echo off
REM ============================================================
REM  7_tdengine_stop.bat - 停止 TDengine (数据保留)
REM ============================================================
cd /d "%~dp0tdengine"
echo [tdengine] docker compose stop ...
docker compose stop
echo [tdengine] 完成, 数据已保留.
pause
