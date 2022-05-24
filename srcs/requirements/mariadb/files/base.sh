# !/bin/bash
# echo "CREATE DATABASE IF NOT EXISTS ${DB_NAME};
# GRANT ALL PRIVILEGES ON *.* TO root@localhost WITH GRANT OPTION;
# CREATE USER '${DB_USER}' IDENTIFIED BY '${DB_PSW}';
# GRANT ALL PRIVILEGES ON *.* TO ${DB_USER}@localhost WITH GRANT OPTION;
# ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';" > base_wp.sql

# service mysql start
# if test -f /var/lib/mysql/${DB_NAME};
# then
	# echo "config already done"
# else
	# mysql -u root -e "ALTER USER root@localhost iNDENTIFY WITH mysql_native_password;"
	# mysql -u root -e "ALTER USER root@localhost IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
	mysql -u root -e "CREATE DATABASE IF NOT EXISTS ${DB_NAME};"
	# mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "GRANT ALL PRIVILEGES ON *.* TO root@localhost WITH GRANT OPTION;"
	mysql -u root -e "CREATE USER '${DB_USER}' IDENTIFIED BY '${DB_PSW}';"
	mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${DB_USER}@localhost WITH GRANT OPTION;"
# fi