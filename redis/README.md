# Redis Stack Server（middle-redis）

AI 常用的缓存 + 向量检索中间件。Redis Stack 在原版 Redis 基础上内置了 RediSearch（向量检索/KNN）、RedisJSON 等模块。

## 基本信息

| 项 | 值 |
|---|---|
| 端口 | `6379` |
| 密码 | `111111`（见 `.env` 中 `REDIS_PASSWORD`） |
| 数据目录 | `./data`（备份 = 复制此文件夹） |
| 容器 | `middle-redis`，内存上限 768MB |

## 常用命令

```bash
docker compose up -d      # 启动
docker compose down       # 停止（数据保留）
docker compose pull       # 升级镜像
docker compose logs -f    # 看日志
```

## 连接测试

```bash
docker exec -it middle-redis redis-cli -a 111111 ping
```

Python 连接：

```python
import redis
r = redis.Redis(host="127.0.0.1", port=6379, password="111111")
print(r.ping())
```

## 验证向量检索模块

```bash
docker exec -it middle-redis redis-cli -a 111111 module list
```

应看到 `search`（RediSearch）与 `ReJSON` 模块。

## 说明

- **持久化已开启**：AOF（`appendfsync everysec`，宕机最多丢 1 秒数据）+ RDB 快照（900 秒内 1 次写入 / 300 秒内 10 次 / 60 秒内 1 万次时自动存盘）。持久化文件在 `./data` 目录。
- 淘汰策略默认 `noeviction`（适合向量/搜索场景，写满报错不丢数据）；纯缓存场景可在 `.env` 改为 `allkeys-lru` 后 `docker compose up -d` 重建。
- 镜像用的 `latest`，需要固定版本时把 `docker-compose.yml` 里的 tag 改成具体版本号（如 `7.4.0-v3`）即可。
