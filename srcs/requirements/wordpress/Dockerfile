FROM debian:buster
LABEL maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

ARG DB_NAME=${DB_NAME}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG DB_HOST=${DB_HOST}

ADD	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /

RUN	apt-get -y update && apt-get -y upgrade -qq\
		&& apt-get -y install sudo vim php-fpm php-mysql php-cli wget \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp \
		&& service php7.3-fpm start \
		&& service php7.3-fpm stop

RUN sh cmds.sh 
WORKDIR /var/www/html/wordpress

EXPOSE	9000

CMD ["bash", "wp.sh"]
