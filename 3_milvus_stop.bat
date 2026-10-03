@echo off
REM ============================================================
REM  3_milvus_stop.bat - 停止 Milvus 全部容器 (数据保留)
REM ============================================================
cd /d "%~dp0milvus"
echo [milvus] docker compose stop ...
docker compose stop
echo [milvus] 完成, 数据已保留.
pause
