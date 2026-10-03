# Milvus standalone（middle-milvus）

AI 领域最常用的开源向量数据库，standalone 单机模式，含 etcd（元数据）+ MinIO（对象存储）+ Milvus 本体。

## 基本信息

| 项 | 值 |
|---|---|
| SDK / gRPC 端口 | `19530` |
| HTTP / 指标端口 | `9091`（健康检查 `http://localhost:9091/healthz`） |
| 管理界面 Attu | `http://localhost:8082`（地址填 `standalone:19530`） |
| MinIO 控制台 | 未对宿主机暴露（Milvus 内部使用） |
| 数据目录 | `./data`、`./etcd_data`、`./minio_data` |
| 容器 | `middle-milvus`（4GB 上限）、`middle-milvus-etcd`、`middle-milvus-minio`、`middle-attu` |

## 常用命令

```bash
docker compose up -d      # 启动（首次较慢，Milvus 健康检查要等约 1-2 分钟）
docker compose stop       # 停止（数据保留）
docker compose logs -f standalone    # 看 Milvus 日志
```

## Python 连接示例

```python
from pymilvus import MilvusClient

client = MilvusClient(uri="http://127.0.0.1:19530")

client.create_collection(collection_name="demo", dimension=4)
client.insert(collection_name="demo", data=[
    {"id": 1, "vector": [0.1, 0.2, 0.3, 0.4]},
    {"id": 2, "vector": [0.9, 0.8, 0.7, 0.6]},
])
print(client.search(collection_name="demo", data=[[0.1, 0.2, 0.3, 0.4]], limit=1))
```

## 说明

- 首次启动 etcd / minio / milvus 依次健康后 milvus 才启动，整体就绪约 1-2 分钟，属正常。
- Attu 里连接地址填 `standalone:19530`（compose 内部网络名），浏览器里访问 `http://localhost:8082`。
- 数据分散在 `data\`、`etcd_data\`、`minio_data\` 三个目录，备份时整个 `milvus\` 目录一起复制。
