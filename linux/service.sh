#!/usr/bin/env bash
# ============================================================
# service.sh - 单个/全部中间件管理
# 用法:
#   ./service.sh redis start          启动 redis
#   ./service.sh all stop             停止全部
#   ./service.sh milvus logs -f       跟踪 milvus 日志
# 服务名: redis postgres milvus qdrant elasticsearch mysql tdengine all
# 动作:   start stop restart status logs
# ============================================================
set -e
cd "$(dirname "$0")/.."

usage() {
    echo "用法: $0 <服务名> <动作> [logs附加参数]"
    echo "  服务名: redis postgres milvus qdrant elasticsearch mysql tdengine all"
    echo "  动作:   start stop restart status logs"
    echo "示例:   $0 redis start"
    echo "        $0 all stop"
    echo "        $0 milvus logs -f"
    exit 1
}

[ $# -ge 2 ] || usage

NAME="$1"
ACTION="$2"
shift 2

run_one() {
    local d="$1"
    case "$ACTION" in
        start)   echo "===== [$d] 启动 ====="; (cd "$d" && docker compose up -d) ;;
        stop)    echo "===== [$d] 停止 ====="; (cd "$d" && docker compose stop) ;;
        restart) echo "===== [$d] 重启 ====="; (cd "$d" && docker compose restart) ;;
        status)  (cd "$d" && docker compose ps) ;;
        logs)    (cd "$d" && docker compose logs "$@") ;;
        *) usage ;;
    esac
}

if [ "$NAME" = "all" ]; then
    for d in redis postgres milvus qdrant elasticsearch mysql tdengine; do
        run_one "$d"
    done
    echo "===== 全部完成 ====="
else
    [ -d "$NAME" ] || { echo "未知服务: $NAME"; usage; }
    run_one "$NAME"
fi
