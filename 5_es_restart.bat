@echo off
REM ============================================================
REM  5_es_restart.bat - ÷ÿ∆Ù Elasticsearch
REM ============================================================
cd /d "%~dp0elasticsearch"
echo [elasticsearch] docker compose restart ...
docker compose restart
echo [elasticsearch] ÕÍ≥….
pause
