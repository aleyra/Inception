FROM    debian:buster
LABEL   maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect \
		php-fpm php-mysql php-cli \
		&& wget https://wordpress.org/wordpress-5.6.1.tar.gz \
		&& mkdir -p //var/www/html/wordpress \
		&& tar xzvf wordpress-5.6.1.tar.gz --strip-components=1 -C /var/www/html/wordpress \
# config de wordpress
		&& cp wp-config.php /var/www/html/wordpress \
		&& chown -R www-data:www-data /var/www/html \
		&& service php7.3-fpm start \
		&& service php7.3-fpm stop \
# nettoyage
		&& rm -rf wp-config.php wordpress-5.6.1.tar.gz

EXPOSE	3306

EXPOSE	9000

ENTRYPOINT ["php-fpm7.3", "-F -R"]