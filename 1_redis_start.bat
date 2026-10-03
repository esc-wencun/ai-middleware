@echo off
REM ============================================================
REM  1_redis_start.bat - Æô¶¯ Redis
REM ============================================================
cd /d "%~dp0redis"
echo [redis] docker compose up -d ...
docker compose up -d
echo [redis] Íê³É.
pause
