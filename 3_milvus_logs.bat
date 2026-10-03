@echo off
REM ============================================================
REM  3_milvus_logs.bat - 查看 Milvus 日志
REM  用法: 3_milvus_logs.bat             查看全部容器日志
REM        3_milvus_logs.bat standalone  只看 Milvus 本体
REM        3_milvus_logs.bat standalone -f  跟踪日志
REM ============================================================
cd /d "%~dp0milvus"
docker compose logs %1 %2
echo.
pause
