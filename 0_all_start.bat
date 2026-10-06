@echo off
REM ============================================================
REM  0_all_start.bat - 启动全部中间件 (Redis/Postgres/Milvus/Qdrant/ES/MySQL/TDengine)
REM ============================================================
cd /d "%~dp0"

echo ===== [redis] 启动 =====
cd redis && docker compose up -d && cd ..
echo ===== [postgres] 启动 =====
cd postgres && docker compose up -d && cd ..
echo ===== [milvus] 启动 =====
cd milvus && docker compose up -d && cd ..
echo ===== [qdrant] 启动 =====
cd qdrant && docker compose up -d && cd ..
echo ===== [elasticsearch] 启动 =====
cd elasticsearch && docker compose up -d && cd ..
echo ===== [mysql] 启动 =====
cd mysql && docker compose up -d && cd ..
echo ===== [tdengine] 启动 =====
cd tdengine && docker compose up -d && cd ..

echo.
echo ===== 全部启动完成 =====
echo 查看状态: 0_all_status.bat
echo.
pause
