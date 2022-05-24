FROM debian:buster
LABEL maintainer="lburnet@student.42lyon.fr"

# RUN useradd -u 1234 moi

COPY ./files/ .

ARG DB_NAME=${DB_NAME}
ARG MYSQL_USER=${MYSQL_USER}
ARG MYSQL_PASSWORD=${MYSQL_PASSWORD}
ARG DOMAIN_NAME=${DOMAIN_NAME}
ARG ADMIN_NAME=${ADMIN_NAME}
ARG ADMIN_PSW=${ADMIN_PSW}
ARG ADMIN_MAIL=${ADMIN_MAIL}
ARG USER_NAME=${USER_NAME}
ARG USER_MAIL=${USER_MAIL}
ARG USER_PSW=${USER_PSW}

ADD	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /
ADD https://fr.wordpress.org/wordpress-5.9.3-fr_FR.tar.gz /

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install sudo vim php-fpm php-mysql php-cli \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp \
#config de wordpress
		&& mkdir -p /var/www/html \
		&& chown -R www-data:www-data /var/www/html \
		&& tar -xvf wordpress-5.9.3-fr_FR.tar.gz -C /var/www/html \
		&& cp www.conf /etc/php/7.3/fpm/pool.d/www.conf \
#nettoyage 1
		&& rm -rf wp-cli.phar wordpress-5.9.3-fr_FR.tar.gz
#config de wordpress suite
		RUN service php7.3-fpm start
		RUN cd /var/www/html/wordpress \
		&& cp wp-config-sample.php wp-config.php \
		&& sed -i "s/votre_nom_de_bdd/${DB_NAME}/" ./wp-config.php \
		&& sed -i "s/votre_utilisateur_de_bdd/${MYSQL_USER}/" ./wp-config.php \
		&& sed -i "s/votre_mdp_de_bdd/$MYSQL_PASSWORD/" ./wp-config.php \
		&& sed -i "s/localhost/mariadb:3306/" ./wp-config.php
	# wp core config --allow-root --dbname=$DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbprefix=wp_ 2>res1
		RUN sh cmds.sh 
		RUN service php7.3-fpm stop \
#nettoyage 2
 		&& rm -rf cmds.sh

EXPOSE	9000

# CMD ["php-fpm7.3", "-F"]
CMD ["sleep", "infinity"]