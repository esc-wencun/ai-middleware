@echo off
REM ============================================================
REM  4_qdrant_stop.bat - 停止 Qdrant (数据保留)
REM ============================================================
cd /d "%~dp0qdrant"
echo [qdrant] docker compose stop ...
docker compose stop
echo [qdrant] 完成, 数据已保留.
pause
