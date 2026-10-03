@echo off
REM ============================================================
REM  4_qdrant_restart.bat - ÷ÿ∆Ù Qdrant
REM ============================================================
cd /d "%~dp0qdrant"
echo [qdrant] docker compose restart ...
docker compose restart
echo [qdrant] ÕÍ≥….
pause
