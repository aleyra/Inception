mysql -e "CREATE DATABASE IF NOT EXISTS '${DB_HOST}';"

mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' WITH GRANT OPTION;"
mysql -e "CREATE USER '${DB_USER}'@'%' IDENTIFIED BY '${DB_PSW}';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"

mysql -e "FLUSH PRIVILEGES;"
