@echo off
REM ============================================================
REM  3_milvus_restart.bat - 重启 Milvus 全部容器
REM ============================================================
cd /d "%~dp0milvus"
echo [milvus] docker compose restart ...
docker compose restart
echo [milvus] 完成.
pause
