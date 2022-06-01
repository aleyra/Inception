FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install nginx openssl \
		&& mkdir -p /etc/nginx/certificate \
		&& mkdir -p /etc/nginx/nginx.d \
		# && cp nginx.conf /etc/nginx/nginx.d/my.conf \
		&& rm -rf /etc/nginx/sites-available/default \
		&& cp nginx.conf /etc/nginx/sites-available/default \
		&& chown -R www-data:www-data /var/www/html \
		&& chmod -R 755 /var/www/html \
		&& openssl req -new -newkey rsa:4096 -x509 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=lburnet.42.fr" -out /etc/nginx/certificate/lburnet.42.fr-certificate.crt -keyout /etc/nginx/certificate/lburnet.42.fr.key


CMD ["nginx", "-g", "daemon off;"]
# CMD ["sleep", "infinity"]
