FROM debian:buster
LABEL maintainer="lburnet@dtudent.42lyon.fr"

RUN useradd -u 1234 moi

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install wget php-fpm php-mysql php-cli \
		&& wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp \
		&& mkdir -p /var/www/html/wordpress \
#config de wordpress
		&& chown -R www-data:www-data /var/www/html \
		&& service php7.3-fpm start \
		&& echo "youpi 1" \
		&& sh cmds.sh \
		&& echo "youpi 2" \
		&& service php7.3-fpm stop \
#nettoyage
		&& rm -rf cmds.sh wp-cli.phar

EXPOSE	3306
EXPOSE	9000

ENTRYPOINT [ "php-fpm7.3", "-F -R" ]