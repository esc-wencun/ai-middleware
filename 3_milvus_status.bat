@echo off
REM ============================================================
REM  3_milvus_status.bat - 查看 Milvus 全部容器状态
REM ============================================================
cd /d "%~dp0milvus"
docker compose ps
echo.
pause
