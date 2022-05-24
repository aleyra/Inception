FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

# RUN	apt-get -y update && apt-get -y upgrade \
# 		&& apt-get -y install gnupg wget expect mariadb-server \
# 		&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz \
# 		&& mkdir -p /var/www/html/phpmyadmin /var/www/html/wordpress \
# 		&& tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin \
# 		#mettre phpmyadmin dans wp ?
# 		
# # config de mySQL
# 		&& cp -f 50-server.cnf /etc/mysql/mariadb.conf.d/ \
# # config de phpMyAdmin
# 		&& rm /var/www/html/phpmyadmin/config.sample.inc.php \
# # nettoyage
# 		&& rm -rf mysql_install.sh 50-server.cnf config.inc.php \
# 		&& rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz phpmyadmin.keyring

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install mariadb-server 
# && chmod +x base.sh 
# RUN cp -f 50-server.cnf /etc/mysql/my.cnf
ARG	DB_HOST=${DB_HOST}
ARG	DB_USER=${DB_USER}
ARG	DB_PSW=${DB_PSW}
ARG	MYSQL_ROOT_PASSWORD=${MYSQL_ROOT_PASSWORD}
ARG	DB_NAME=${DB_NAME}
# RUN	sh base.sh 
RUN service mysql start \
		# RUN mysql < base_wp.sql
		# && ./base.sh
		&& mysql -u root -e "CREATE DATABASE ${DB_NAME};" \
		&& mysql -u root -e "CREATE USER '${DB_USER}' IDENTIFIED BY '${DB_PSW}';" \
		&& mysql -u root -e "GRANT ALL PRIVILEGES ON ${DB_NAME}.* TO ${DB_USER}@'%';"
RUN sed -i 's/bind-address/bind-address = 0.0.0.0 #/i' /etc/mysql/mariadb.conf.d/50-server.cnf
		# RUN service mysql stop \
		# && cp config.inc.php /var/www/html/phpmyadmin/ \

EXPOSE	3306

CMD ["/usr/sbin/mysqld"]