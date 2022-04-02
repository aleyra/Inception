FROM    debian:buster
LABEL   maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect \
		php-fpm php-mysql php-cli \
		&& wget https://wordpress.org/wordpress-5.6.1.tar.gz \
		&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& echo '#!/bin/sh' >> /usr/local/bin/wp \
		&& echo 'wp-cli.phar "@" --allow-root' >> /usr/locql/bin/wp \
		&& chmod +x /usr/local/bin/wp \
		&& mkdir -p //var/www/html/wordpress \
		&& tar xzvf wordpress-5.6.1.tar.gz --strip-components=1 -C /var/www/html/wordpress \
# config de wordpress
		&& cp wp-config.php /var/www/html/wordpress \
		&& chown -R www-data:www-data /var/www/html \
		&& service php7.3-fpm start \
		# && wp --help \
		&& echo "youpi 3" \
		&& wp core install --url=$DOMAIN_NAME --title="inception" --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PSW --admin_email=$ADMIN_MAIL --skip-email  \
		&& echo "youpi 4" \
		&& service php7.3-fpm stop \
# nettoyage
		&& rm -rf wp-config.php wordpress-5.6.1.tar.gz wp-cli.phar

EXPOSE	3306

EXPOSE	9000

ENTRYPOINT ["php-fpm7.3", "-F -R"]