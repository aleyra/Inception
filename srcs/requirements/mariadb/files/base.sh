echo "CREATE DATABASE IF NOT EXISTS '${DB_NAME}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';
GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;
CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PSW}';
GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;" > base_wp.sql
