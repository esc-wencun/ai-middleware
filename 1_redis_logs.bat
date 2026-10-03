@echo off
REM ============================================================
REM  1_redis_logs.bat - 查看 Redis 日志
REM  用法: 1_redis_logs.bat       查看全部日志
REM        1_redis_logs.bat -f    持续跟踪日志 (Ctrl+C 退出)
REM ============================================================
cd /d "%~dp0redis"
docker compose logs %1
echo.
pause
