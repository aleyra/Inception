FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect mariadb-server mariadb-client \
		&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
		&& mkdir -p /var/www/html/phpmyadmin /var/www/html/wordpress \
		&& tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin \
# config de mySQL
		&& cp -f 50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf
ARG	DB_HOST=${DB_HOST}
ARG	DB_USER=${MYSQL_USER}
ARG	DB_PSW=${MYSQL_PASSWORD}
ARG	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG	DB_NAME=${DB_NAME}
RUN service mysql start \
		&& sh base.sh \
		&& echo youpi \
#ca boude ici echo a suppr
		&& mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql \
# nettoyage
		&& rm -rf base.sh mysql_install.sh 50-server.cnf\
		&& rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz phpmyadmin.keyring

EXPOSE	3306