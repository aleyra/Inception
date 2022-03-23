FROM    debian:buster
LABEL   maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect \
		php7.3 php7.3-fpm php7.3-mysql php7.3-curl php7.3-mbstring php7.3-xml php7.3-gettext php7.3-cgi \
		&& wget https://wordpress.org/wordpress-5.6.1.tar.gz \
		&& mkdir -p //var/www/html/wordpress \
		&& tar xzvf wordpress-5.6.1.tar.gz --strip-components=1 -C /var/www/html/wordpress \
# config de wordpress
		&& cp wp-config.php /var/www/html/wordpress \
		&& chown -R www-data:www-data /var/www/html \
# nettoyage
		&& rm -rf wp-config.php wordpress-5.6.1.tar.gz

EXPOSE	3306

EXPOSE	9000