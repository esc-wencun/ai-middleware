@echo off
REM ============================================================
REM  4_qdrant_status.bat - ²é¿´ Qdrant ÈÝÆ÷×´Ì¬
REM ============================================================
cd /d "%~dp0qdrant"
docker compose ps
echo.
pause
