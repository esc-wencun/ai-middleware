@echo off
REM ============================================================
REM  5_es_stop.bat - 停止 Elasticsearch (数据保留)
REM ============================================================
cd /d "%~dp0elasticsearch"
echo [elasticsearch] docker compose stop ...
docker compose stop
echo [elasticsearch] 完成, 数据已保留.
pause
