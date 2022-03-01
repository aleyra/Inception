FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect mariadb-server mariadb-client

#mkdir et dossiers a revoir
RUN		tar xvf phpMyAdmin-5.0.4-all-languages.tar.gz --strip-components=1 -C /var/www/html/phpmyadmin \
# config de mySQL
		&& service mysql start \
		&& sh mysql_install.sh \
		&& mysql -u root < base.sql \
		&& mysql -u root < /var/www/html/phpmyadmin/sql/create_tables.sql \
# nettoyage
		&& rm -rf base.sql mysql_install.sh \
		&& rm -rf phpMyAdmin-5.0.4-all-languages.tar.gz phpmyadmin.keyring

EXPOSE	3306