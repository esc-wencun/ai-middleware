# PostgreSQL 17 + pgvector（middle-postgres）

带 pgvector 向量扩展的 PostgreSQL，向量 + 关系数据一体化存储。

## 基本信息

| 项 | 值 |
|---|---|
| 端口 | `5432` |
| 用户 / 密码 | `postgres` / `111111` |
| 默认库 | `ai` |
| 连接串 | `postgresql://postgres:111111@127.0.0.1:5432/ai` |
| 管理界面 | Adminer：`http://localhost:8081`（系统选 PostgreSQL，服务器填 `postgres`，用户 `postgres`，密码 `111111`） |
| 数据目录 | `./data` |
| 容器 | `middle-postgres`（内存上限 2GB）、`middle-adminer`（256MB） |

## 常用命令

```bash
docker compose up -d      # 启动
docker compose stop       # 停止（数据保留）
docker compose logs -f    # 看日志
```

## 启用向量扩展

连接后执行一次：

```sql
CREATE EXTENSION IF NOT EXISTS vector;
```

## Python 连接示例

```python
import psycopg
conn = psycopg.connect("postgresql://postgres:111111@127.0.0.1:5432/ai")
conn.execute("CREATE EXTENSION IF NOT EXISTS vector")

# 建表 + 插入向量 + 相似度检索
conn.execute("CREATE TABLE IF NOT EXISTS items (id bigserial PRIMARY KEY, vec vector(3))")
conn.execute("INSERT INTO items (vec) VALUES ('[1,2,3]'), ('[4,5,6]')")
rows = conn.execute("SELECT id, vec <-> '[3,1,2]' AS dist FROM items ORDER BY vec <-> '[3,1,2]' LIMIT 1").fetchall()
print(rows)  # [(2, ...)] 最近邻
conn.commit()
conn.close()
```

## 说明

- 镜像 `pgvector/pgvector:pg17` 自带 vector 扩展，无需编译。
- 数据落盘在 `./data`，WAL 归档未开启（开发环境）；磁盘满或误删目录不可恢复，重要数据请另行备份 `data\` 文件夹。
