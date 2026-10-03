#!/usr/bin/env bash
# restart-all.sh - 重启全部中间件
cd "$(dirname "$0")"
./service.sh all restart
