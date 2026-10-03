@echo off
REM ============================================================
REM  3_milvus_start.bat - 启动 Milvus (含 etcd/MinIO/Attu)
REM ============================================================
cd /d "%~dp0milvus"
echo [milvus] docker compose up -d ...
docker compose up -d
echo [milvus] 完成. 首次启动需等待约1-2分钟.
pause
