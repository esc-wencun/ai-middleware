@echo off
REM ============================================================
REM  5_es_status.bat - ²é¿´ Elasticsearch ÈÝÆ÷×´Ì¬
REM ============================================================
cd /d "%~dp0elasticsearch"
docker compose ps
echo.
pause
