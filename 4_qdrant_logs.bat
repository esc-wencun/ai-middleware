@echo off
REM ============================================================
REM  4_qdrant_logs.bat - 查看 Qdrant 日志
REM  用法: 4_qdrant_logs.bat       查看全部日志
REM        4_qdrant_logs.bat -f    持续跟踪日志 (Ctrl+C 退出)
REM ============================================================
cd /d "%~dp0qdrant"
docker compose logs %1
echo.
pause
