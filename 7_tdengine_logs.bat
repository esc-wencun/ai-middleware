@echo off
REM ============================================================
REM  7_tdengine_logs.bat - 查看 TDengine 日志
REM  用法: 7_tdengine_logs.bat       查看全部日志
REM        7_tdengine_logs.bat -f    持续跟踪日志 (Ctrl+C 退出)
REM ============================================================
cd /d "%~dp0tdengine"
docker compose logs %1
echo.
pause
