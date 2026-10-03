@echo off
REM ============================================================
REM  1_redis_restart.bat - ÷ÿ∆Ù Redis
REM ============================================================
cd /d "%~dp0redis"
echo [redis] docker compose restart ...
docker compose restart
echo [redis] ÕÍ≥….
pause
