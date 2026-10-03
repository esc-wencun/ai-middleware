@echo off
REM ============================================================
REM  0_all_status.bat - 查看全部中间件容器状态
REM ============================================================
docker ps -a --filter "name=middle-" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
echo.
pause
