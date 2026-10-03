@echo off
REM ============================================================
REM  0_all_restart.bat - 重启全部中间件 (数据保留)
REM ============================================================
cd /d "%~dp0"

echo ===== [redis] 重启 =====
cd redis && docker compose restart && cd ..
echo ===== [postgres] 重启 =====
cd postgres && docker compose restart && cd ..
echo ===== [milvus] 重启 =====
cd milvus && docker compose restart && cd ..
echo ===== [qdrant] 重启 =====
cd qdrant && docker compose restart && cd ..
echo ===== [elasticsearch] 重启 =====
cd elasticsearch && docker compose restart && cd ..

echo.
echo ===== 全部重启完成 =====
echo 查看状态: 0_all_status.bat
echo.
pause
