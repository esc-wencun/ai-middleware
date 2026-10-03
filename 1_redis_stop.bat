@echo off
REM ============================================================
REM  1_redis_stop.bat - 停止 Redis (数据保留)
REM ============================================================
cd /d "%~dp0redis"
echo [redis] docker compose stop ...
docker compose stop
echo [redis] 完成, 数据已保留.
pause
