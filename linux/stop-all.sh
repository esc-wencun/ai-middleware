#!/usr/bin/env bash
# stop-all.sh - 停止全部中间件 (数据保留)
cd "$(dirname "$0")"
./service.sh all stop
