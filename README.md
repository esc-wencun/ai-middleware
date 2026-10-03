# AI 中间件集（W:\wencun\ai\middle）

本机 Docker 部署的 5 套 AI 常用中间件，每套独立目录 + 独立 compose，根目录有对应编号的启停脚本（双击即用）。

## 服务一览

| # | 服务 | 端口 | 认证 | 管理界面 |
|---|---|---|---|---|
| 1 | Redis Stack（缓存+向量） | 6379 | 密码 `111111` | — |
| 2 | PostgreSQL 17 + pgvector | 5432 | `postgres`/`111111`，默认库 `ai` | Adminer `http://localhost:8081` |
| 3 | Milvus standalone | 19530（SDK）、9091（HTTP） | 无 | Attu `http://localhost:8082` |
| 4 | Qdrant | 6333（HTTP+WebUI）、6334（gRPC） | 无 | 自带 `http://localhost:6333/dashboard` |
| 5 | Elasticsearch 8.18 | 9200 | 无（本机模式） | — |

## 向量能力

- **pgvector / Redis Stack / ES dense_vector / Qdrant / Milvus** 全部支持向量存储与 KNN 检索，均已实测写入+检索通过。
- 选型参考：轻量嵌入式选 pgvector；大规模高性能选 Milvus/Qdrant；全文+向量混合检索选 ES；缓存+小规模向量选 Redis。

## 启停

**全局（排最前的 0_all_*）**：`0_all_start.bat` 一键全部启动、`0_all_stop.bat` 全部停止、`0_all_restart.bat` 全部重启、`0_all_status.bat` 查看全部状态。

**单个服务**：双击对应 bat：`1_redis_start.bat` … `5_es_stop.bat`（start/stop/restart/status/logs 五种）。

或命令行：

```bash
cd redis && docker compose up -d      # 其余同理: postgres / milvus / qdrant / elasticsearch
```

## 备份

每套数据都在各自目录的 `data\`（milvus 另有 `etcd_data\`、`minio_data\`），停止服务后直接复制文件夹即可。

## 注意事项

- 所有密码统一 `111111`（Milvus 的 MinIO 是 `11111111`，MinIO 要求至少 8 位）；仅限本机使用，勿暴露到公网。
- ES 为单节点开发模式（安全认证已关），集群健康 yellow 属正常。
- 镜像存放在 Docker 虚拟磁盘（C 盘），数据在本目录；C 盘空间不足时可在 Docker Desktop → Settings → Resources 里迁移。
- 中间件启动顺序无依赖，可任意单独启停。
