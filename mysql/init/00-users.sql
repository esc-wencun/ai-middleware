-- 账号初始化：允许任意 IP 登录 + mysql_native_password（兼容老客户端）
-- 注意：仅首次建库时自动执行；已初始化的库需手动执行等价语句。
CREATE USER IF NOT EXISTS 'wencun'@'%' IDENTIFIED WITH mysql_native_password BY '111111';
GRANT ALL PRIVILEGES ON *.* TO 'wencun'@'%' WITH GRANT OPTION;
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY '111111';
FLUSH PRIVILEGES;
