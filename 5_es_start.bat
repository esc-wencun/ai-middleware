@echo off
REM ============================================================
REM  5_es_start.bat - 启动 Elasticsearch
REM ============================================================
cd /d "%~dp0elasticsearch"
echo [elasticsearch] docker compose up -d ...
docker compose up -d
echo [elasticsearch] 完成. 就绪约需1分钟.
pause
