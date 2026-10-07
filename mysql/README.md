# MySQL 8.0（middle-mysql）

通用 MySQL 关系数据库。首建时预建 `ruoyi-vue-pro` 库（芋道项目使用），`init/` 内的 `.sql` 会在数据目录为空时按文件名顺序自动执行。

> 种子数据说明：`init/` 下除 `00-users.sql` 外的业务库种子（ruoyi-vue-pro / aiflowy 官方发行数据，共约 2MB）不入库，需从各官方仓库获取后放到 `init/`，仅首次建库时自动执行。

## 基本信息

| 项 | 值 |
|---|---|
| 端口 | `3306` |
| 用户 / 密码 | `root` / `111111`，另建 `wencun` / `111111`（均任意 IP 可登录，`init/00-users.sql`） |
| 认证插件 | `mysql_native_password`（兼容老客户端；如 Navicat 低版本、部分 JDBC 驱动） |
| 预建库 | `ruoyi-vue-pro`、`aiflowy`（`init/01、03` 初始化芋道库，`init/04、05` 初始化 aiflowy 库；`.env` 的 `MYSQL_DATABASE` 仅预建 `ruoyi-vue-pro`） |
| 连接串 | `jdbc:mysql://127.0.0.1:3306/ruoyi-vue-pro` |
| 字符集 | utf8mb4 / utf8mb4_unicode_ci，时区 +08:00 |
| 数据目录 | `./data` |
| 初始化脚本 | `./init/*.sql`（仅首次建库时执行，之后需手动执行） |
| 容器 | `middle-mysql`（内存上限 1GB） |

## 常用命令

```bash
docker compose up -d      # 启动
docker compose stop       # 停止（数据保留）
docker compose logs -f    # 看日志
```

## 导入 SQL

初始化脚本只跑一次；之后导入用：

```bash
docker exec -i middle-mysql mysql -uroot -p111111 --default-character-set=utf8mb4 ruoyi-vue-pro < your.sql
```

## 说明

- 镜像版本 `mysql:8.0.46`（固定确切版本，不用 latest）。
- `lower-case-table-names=1` 在数据目录初始化后不可更改，如需大小写敏感请在首次启动前修改 compose。
- 数据落盘在 `./data`；重要数据请停止服务后备份 `data\` 文件夹。
