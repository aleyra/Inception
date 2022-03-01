FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect nginx openssl

#mkdir et dossiers a revoir
RUN	mkdir -p /etc/nginx/certificate \
		&& rm -rf /etc/nginx/sites-available/default \
		&& cp nginx.conf /etc/nginx/sites-available/default \
		&& openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.localhost" -out /etc/nginx/certificate/lburnet_localhost-certificate.crt -keyout /etc/nginx/certificate/lburnet_localhost.key \
# nettoyage
		&& rm -rf nginx.conf

EXPOSE	9000

EXPOSE	443
