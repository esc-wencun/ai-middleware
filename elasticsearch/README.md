# Elasticsearch 8.18.3（middle-elasticsearch）

全文检索 + 分析引擎，8.x 原生支持 `dense_vector` 字段与 kNN 向量检索（approximate + exact），可与全文混合打分（RRF）。

## 基本信息

| 项 | 值 |
|---|---|
| HTTP API | `http://localhost:9200`（本机开发模式，未开认证） |
| 数据目录 | `./data` |
| JVM 堆 | 1GB（容器上限 2GB） |
| 容器 | `middle-elasticsearch` |

## 常用命令

```bash
docker compose up -d      # 启动（就绪约 1 分钟）
docker compose stop       # 停止（数据保留）
docker compose logs -f    # 看日志
```

## 验证

```bash
curl http://localhost:9200/_cluster/health
```

## 向量检索示例（dense_vector + kNN）

```bash
# 建索引：一个 text 字段 + 一个 4 维向量字段（实际用 768/1024/1536 维）
curl -X PUT http://localhost:9200/demo -H "Content-Type: application/json" -d '{
  "mappings": {
    "properties": {
      "title":    { "type": "text", "analyzer": "ik_max_word" },
      "embedding": { "type": "dense_vector", "dims": 4, "index": true, "similarity": "cosine" }
    }
  }
}'

# 写入文档
curl -X POST http://localhost:9200/demo/_doc -H "Content-Type: application/json" -d '{"title":"中文测试","embedding":[0.1,0.2,0.3,0.4]}'

# kNN 向量检索
curl -X GET http://localhost:9200/demo/_search -H "Content-Type: application/json" -d '{
  "knn": { "field": "embedding", "query_vector": [0.1,0.2,0.3,0.4], "k": 5, "num_candidates": 50 }
}'
```

## 说明

- 单节点，集群健康为 yellow（单副本无备份节点）属正常，不影响使用。
- 中文分词：默认 standard 分词按单字切分。需要专业中文分词请装 IK 插件：
  `docker compose exec elasticsearch elasticsearch-plugin install https://get.infini.cloud/elasticsearch/analysis-ik/8.18.3`，然后重启。
- 密码/认证已关闭（`xpack.security.enabled=false`），仅限本机使用，不要暴露到公网。
