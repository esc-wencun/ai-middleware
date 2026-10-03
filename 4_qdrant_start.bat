@echo off
REM ============================================================
REM  4_qdrant_start.bat - Æô¶¯ Qdrant
REM ============================================================
cd /d "%~dp0qdrant"
echo [qdrant] docker compose up -d ...
docker compose up -d
echo [qdrant] Íê³É.
pause
