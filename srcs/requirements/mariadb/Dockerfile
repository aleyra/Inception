FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN apt-get update && apt-get upgrade -y \
&& apt-get -y install mariadb-server 

ARG	DB_HOST=${DB_HOST}
ARG	DB_USER=${DB_USER}
ARG	DB_PSW=${DB_PSW}
ARG	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG	DB_NAME=${DB_NAME}

RUN service mysql start \
		&& mysql -u root -e "CREATE DATABASE ${DB_NAME};" \
		&& mysql -u root -e "CREATE USER '${DB_USER}' IDENTIFIED BY '${DB_PSW}';" \
		&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%';"
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf

EXPOSE	3306

CMD ["/usr/sbin/mysqld"]
