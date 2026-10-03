@echo off
REM ============================================================
REM  1_redis_status.bat - ²é¿´ Redis ÈÝÆ÷×´Ì¬
REM ============================================================
cd /d "%~dp0redis"
docker compose ps
echo.
pause
