FROM debian:buster
LABEL maintainer="lburnet@student.42lyon.fr"

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
ARG DB_HOST=${DB_HOST}
ARG DB_NAME=${DB_NAME}

ADD	https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar /
# ADD https://fr.wordpress.org/wordpress-5.9.3-fr_FR.tar.gz /

RUN	apt-get -y update && apt-get -y upgrade -qq\
		&& apt-get -y install sudo vim php-fpm php-mysql php-cli wget \
		&& chmod +x wp-cli.phar \
		&& cp wp-cli.phar /usr/local/bin/wp \
		&& chmod +x /usr/local/bin/wp 
#config de wordpress
		# RUN mkdir -p /var/www/html 
		# && ls > ls.txt
		#ca marche jusque la
		# RUN tar -xvf wordpress-5.9.3-fr_FR.tar.gz -C /var/www/html
		# RUN tar -xvf wordpress-5.9.3-fr_FR.tar.gz
		# RUN mv wordpress/ /var/www/html/
		# RUN cp www.conf /etc/php/7.3/fpm/pool.d/www.conf \
		# && chown -R www-data:www-data /var/www/html 
		# RUN cd /var/www/html/wordpress \
		# && cp wp-config-sample.php wp-config.php \
		# && sed -i "s/votre_nom_de_bdd/${DB_NAME}/" ./wp-config.php \
		# && sed -i "s/votre_utilisateur_de_bdd/${MYSQL_USER}/" ./wp-config.php \
		# && sed -i "s/votre_mdp_de_bdd/$MYSQL_PASSWORD/" ./wp-config.php \
		# && sed -i "s/localhost/mariadb:3306/" ./wp-config.php
		# RUN service php7.3-fpm start
		RUN sh cmds.sh 
		WORKDIR /var/www/html/wordpress
		# RUN wp core install --allow-root --url=${DOMAIN_NAME} --title="Inception" --admin_user=${ADMIN_NAME} --admin_password=${ADMIN_PSW} --admin_email=${ADMIN_MAIL}
		# RUN wp user create ${USER_NAME} ${USER_MAIL} --role='editor' --user_pass=${USER_PSW} --allow-root 
		# RUN service php7.3-fpm start


EXPOSE	9000

# CMD ["php-fpm7.3", "-F"]
# CMD ["sleep", "infinity"]
CMD ["bash", "wp.sh"]
