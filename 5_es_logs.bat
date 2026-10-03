@echo off
REM ============================================================
REM  5_es_logs.bat - 查看 Elasticsearch 日志
REM  用法: 5_es_logs.bat       查看全部日志
REM        5_es_logs.bat -f    持续跟踪日志 (Ctrl+C 退出)
REM ============================================================
cd /d "%~dp0elasticsearch"
docker compose logs %1
echo.
pause
