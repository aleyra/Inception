FROM    debian:buster
LABEL   maintainer="lburnet@student.42lyon.fr"
RUN useradd -u 1234 moi
COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect \
		php-fpm php-mysql php-cli \
		&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp \
		&& mkdir -p //var/www/html/wordpress \
# config de wordpress
		&& chown -R www-data:www-data /var/www/html \
		&& service php7.3-fpm start \
		&& echo "youpi 3" \
		&& sh cmds.sh \
		&& echo "youpi 4" \
		&& service php7.3-fpm stop \
# nettoyage
		&& rm -rf wp-config.php  wp-cli.phar cmds.sh

EXPOSE	3306

EXPOSE	9000

ENTRYPOINT ["php-fpm7.3", "-F -R"]