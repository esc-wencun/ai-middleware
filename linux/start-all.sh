#!/usr/bin/env bash
# start-all.sh - 启动全部中间件
cd "$(dirname "$0")"
./service.sh all start
