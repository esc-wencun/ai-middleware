@echo off
REM ============================================================
REM  6_mysql_logs.bat - 查看 MySQL 日志
REM  用法: 6_mysql_logs.bat       查看全部日志
REM        6_mysql_logs.bat -f    持续跟踪日志 (Ctrl+C 退出)
REM ============================================================
cd /d "%~dp0mysql"
docker compose logs %1
echo.
pause
