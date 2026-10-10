# Elasticsearch 8.18.3（middle-elasticsearch）+ Elasticvue（middle-elasticvue）

全文检索 + 分析引擎，8.x 原生支持 `dense_vector` 字段与 kNN 向量检索（approximate + exact），可与全文混合打分（RRF）。配套 Elasticvue 作为 Web 管理界面。

## 基本信息

| 项 | 值 |
|---|---|
| HTTP API | `http://localhost:9200`（本机开发模式，未开认证） |
| Web 管理界面 | `http://localhost:8080`（Elasticvue 1.16.0，默认集群已预配置为 middle-es） |
| 数据目录 | `./data` |
| JVM 堆 | 1GB（容器上限 2GB） |
| 容器 | `middle-elasticsearch`、`middle-elasticvue` |

## IK 中文分词插件

插件与词典已随仓库分发（`plugins/`、`ik-config/`），compose 卷挂载到容器，clone 后 `docker compose up -d` 即带 IK，无需手动安装。

| 项 | 值 |
|---|---|
| 插件 | `analysis-ik`（[infinilabs](https://github.com/infinilabs/analysis-ik)） |
| 版本 | 8.18.3（必须与 ES 版本完全一致，否则启动失败） |
| 仓库目录 | `plugins/analysis-ik/`（插件代码，1.6MB）+ `ik-config/`（中文词典，8.1MB） |
| 卷挂载 | `./plugins` → `/usr/share/elasticsearch/plugins`，`./ik-config` → `/usr/share/elasticsearch/config/analysis-ik` |
| 已装分词器 | `ik_max_word`（细粒度，适合建索引）、`ik_smart`（粗粒度，适合搜索） |

重装/升级方法（如需换 ES 版本重装 IK）：临时删掉 compose 里的两个挂载行，`docker compose up -d` 后执行
`docker compose exec elasticsearch elasticsearch-plugin install --batch https://get.infini.cloud/elasticsearch/analysis-ik/<版本号>`，
重启，再 `docker cp` 把 `plugins/analysis-ik` 与 `config/analysis-ik` 拷回仓库目录（新版本词典以容器内为准）。

## Elasticvue（Web 管理界面）

- 镜像 `cars10/elasticvue:1.16.0`（固定精确 tag，勿用 latest），端口 8080，内存上限 256M。
- 通过环境变量 `ELASTICVUE_CLUSTERS` 预配置默认集群，容器启动时写入 `/usr/share/nginx/html/api/default_clusters.json`，格式 `[{"name":"middle-es","uri":"http://localhost:9200"}]`。
- **它是纯浏览器端应用**：页面从浏览器直连 ES，所以 uri 必须写浏览器可达的 `localhost:9200`（写 compose 服务名浏览器解析不了），因此 ES 侧开了 CORS（compose 里 `http.cors.*`，仅放行 `http://localhost:8080` 这一个来源）。

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
- 中文分词：已安装 IK 插件 `analysis-ik`，字段 mapping 里显式指定 `"analyzer": "ik_max_word"`（索引）/ `"search_analyzer": "ik_smart"`（搜索）即可使用。
- 密码/认证已关闭（`xpack.security.enabled=false`），仅限本机使用，不要暴露到公网。

## 安装记录

2026-10-10 安装 `analysis-ik 8.18.3` 并改为仓库分发：`_cat/plugins` 显示 `analysis-ik 8.18.3`；对"中华人民共和国国歌"做 `_analyze` 验证——`ik_max_word` 切出 中华人民共和国 / 中华人民 / 人民 / 共和国 / 国歌 等 10 个细粒度词，`ik_smart` 切出 中华人民共和国 / 国歌，`standard` 仅按单字切（9 个字）。
