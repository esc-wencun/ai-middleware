@echo off
REM ============================================================
REM  6_mysql_start.bat - 启动 MySQL
REM ============================================================
cd /d "%~dp0mysql"
echo [mysql] docker compose up -d ...
docker compose up -d
echo [mysql] 完成. 首次初始化约需半分钟.
pause
