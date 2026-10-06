# TDengine 3.3 时序数据库（middle-tdengine）

IoT 模块（yudao ruoyi-vue-pro / aiflowy 等项目的设备消息时序数据）使用的时序数据库。WebSocket 连接（`jdbc:TAOS-WS`），无需本地客户端。

## 基本信息

| 项 | 值 |
|---|---|
| 端口 | `6041`（WebSocket/REST，应用连接用）、`6030`（原生协议，一般不用） |
| 用户 / 密码 | `root` / `taosdata`（默认） |
| 应用连接串 | `jdbc:TAOS-WS://127.0.0.1:6041/<库名>?varcharAsString=true&enableAutoReconnect=true` |
| 数据目录 | `./data`（容器内 `/var/lib/taos`） |
| 日志目录 | `./log` |
| 容器 | `middle-tdengine`（内存上限 1GB） |

## 常用命令

```bash
docker compose up -d      # 启动
docker compose stop       # 停止（数据保留）
docker compose logs -f    # 看日志
# 进入 CLI
docker exec -it middle-tdengine taos
```

## 建库

yudao IoT 模块使用 `ruoyi_vue_pro` 库（下划线命名）：

```sql
CREATE DATABASE IF NOT EXISTS ruoyi_vue_pro KEEP 365 DURATION 10;
```

## 说明

- 版本固定 `3.3.6.13`（与 yudao 的 taos-jdbcdriver 3.9.0 兼容，3.x 服务端均可）。
- 仅本机使用，勿暴露到公网。
