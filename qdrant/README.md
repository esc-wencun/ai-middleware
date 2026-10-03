# Qdrant（middle-qdrant）

Rust 编写的向量数据库，性能好、自带 Web UI，API 简洁。

## 基本信息

| 项 | 值 |
|---|---|
| HTTP API / Web UI | `http://localhost:6333`（Web UI 在 `http://localhost:6333/dashboard`） |
| gRPC 端口 | `6334` |
| 数据目录 | `./data` |
| 容器 | `middle-qdrant`（内存上限 2GB） |

## 常用命令

```bash
docker compose up -d      # 启动
docker compose stop       # 停止（数据保留）
docker compose logs -f    # 看日志
```

## Python 连接示例

```python
from qdrant_client import QdrantClient, models

client = QdrantClient("http://127.0.0.1:6333")

client.recreate_collection(
    collection_name="demo",
    vectors_config=models.VectorParams(size=4, distance=models.Distance.COSINE),
)
client.upsert(collection_name="demo", points=[
    models.PointStruct(id=1, vector=[0.1, 0.2, 0.3, 0.4], payload={"tag": "a"}),
    models.PointStruct(id=2, vector=[0.9, 0.8, 0.7, 0.6], payload={"tag": "b"}),
])
print(client.search(collection_name="demo", query_vector=[0.1, 0.2, 0.3, 0.4], limit=1))
```

## 说明

- 未设置 API Key（本机使用）；如需开启，在 compose 里加 `QDRANT__SERVICE__API_KEY` 环境变量。
- Web UI 自带，浏览器打开 `http://localhost:6333/dashboard` 可视化管理集合。
