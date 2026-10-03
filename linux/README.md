# Linux / macOS 脚本

Windows 之外平台的启停脚本。compose 文件与数据目录完全通用，把整个仓库 clone 到 Linux/Mac 后只需这份脚本。

## 快捷脚本

| 脚本 | 等效 Windows bat |
|---|---|
| `./start-all.sh` | `0_all_start.bat` |
| `./stop-all.sh` | `0_all_stop.bat` |
| `./restart-all.sh` | `0_all_restart.bat` |
| `./status-all.sh` | `0_all_status.bat` |

## 单服务管理（一个脚本管全部）

```bash
./service.sh redis start        # 启动 redis
./service.sh all stop           # 停止全部
./service.sh milvus restart     # 重启 milvus
./service.sh qdrant status      # 查看 qdrant 状态
./service.sh elasticsearch logs -f   # 跟踪 ES 日志 (Ctrl+C 退出)
```

服务名：`redis` `postgres` `milvus` `qdrant` `elasticsearch` `all`

## 首次使用

clone 后先给脚本加执行权限（git 可能不保留 +x）：

```bash
chmod +x linux/*.sh
```

## 依赖

仅需 Docker（含 compose 插件）：`docker compose version` 能出版本即可。
