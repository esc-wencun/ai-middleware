@echo off
REM ============================================================
REM  0_all_stop.bat - 停止全部中间件 (数据保留)
REM ============================================================
cd /d "%~dp0"

echo ===== [redis] 停止 =====
cd redis && docker compose stop && cd ..
echo ===== [postgres] 停止 =====
cd postgres && docker compose stop && cd ..
echo ===== [milvus] 停止 =====
cd milvus && docker compose stop && cd ..
echo ===== [qdrant] 停止 =====
cd qdrant && docker compose stop && cd ..
echo ===== [elasticsearch] 停止 =====
cd elasticsearch && docker compose stop && cd ..
echo ===== [mysql] 停止 =====
cd mysql && docker compose stop && cd ..
echo ===== [tdengine] 停止 =====
cd tdengine && docker compose stop && cd ..

echo.
echo ===== 全部停止完成, 数据已保留 =====
echo.
pause
