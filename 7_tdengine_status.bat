@echo off
REM ============================================================
REM  7_tdengine_status.bat - ²é¿´ TDengine ÈÝÆ÷×´Ì¬
REM ============================================================
cd /d "%~dp0tdengine"
docker compose ps
echo.
pause
