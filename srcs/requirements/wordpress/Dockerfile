FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect \
		php7.3 php7.3-fpm php7.3-mysql php7.3-curl php7.3-mbstring php7.3-xml php7.3-gettext php7.3-cgi \
		&& wget https://files.phpmyadmin.net/phpMyAdmin/5.0.4/phpMyAdmin-5.0.4-all-languages.tar.gz  \
		&& wget https://wordpress.org/wordpress-5.6.1.tar.gz

#mkdir et dossiers a revoir
RUN	mkdir -p /var/www/html/phpmyadmin /var/www/html/wordpress \
		&& tar xzvf wordpress-5.6.1.tar.gz --strip-components=1 -C /var/www/html/wordpress \
# config de phpMyAdmin
		&& rm /var/www/html/phpmyadmin/config.sample.inc.php \
		&& cp config.inc.php /var/www/html/phpmyadmin/ \
# config de wordpress
		&& cp wp-config.php /var/www/html/wordpress \
		&& chown -R www-data:www-data /var/www/html \
# nettoyage
		&& rm -rf config.inc.php wp-config.php wordpress-5.6.1.tar.gz

EXPOSE	3306

EXPOSE	9000