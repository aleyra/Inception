FROM debian:buster
LABEL maintainer="lburnet@student.42lyon.fr"

# RUN useradd -u 1234 moi

COPY ./files/ .

ADD	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install sudo vim php-fpm php-mysql php-cli \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp \
#config de wordpress
		&& mkdir -p /var/www/html/wordpress \
		&& chown -R www-data:www-data /var/www/html \
		&& cd /var/www/html/wordpress \
		&& service php7.3-fpm start 
RUN		wp core download <https://fr.wordpress.org/wordpress-5.9.3-fr_FR.tar.gz> --allow-root
		RUN sh cmds.sh \
		&& service php7.3-fpm stop \
#nettoyage
 		&& rm -rf cmds.sh wp-cli.phar

EXPOSE	9000

CMD ["php-fpm7.3", "-F"]