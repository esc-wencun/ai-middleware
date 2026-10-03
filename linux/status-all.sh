#!/usr/bin/env bash
# status-all.sh - 查看全部中间件容器状态
docker ps -a --filter "name=middle-" --format "table {{.Names}}\t{{.Status}}\t{{.Ports}}"
