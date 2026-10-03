@echo off
REM ============================================================
REM  2_postgres_logs.bat - 查看 PostgreSQL 日志
REM  用法: 2_postgres_logs.bat       查看全部日志
REM        2_postgres_logs.bat -f    持续跟踪日志 (Ctrl+C 退出)
REM ============================================================
cd /d "%~dp0postgres"
docker compose logs %1
echo.
pause
