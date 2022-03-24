FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install gnupg wget expect nginx openssl \
		&& mkdir -p /etc/nginx/certificate \
		&& rm -f /etc/nginx/sites-available/default \
		&& cp nginx.conf /etc/nginx/sites-available/default \
		&& openssl req -new -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=www.localhost" -out /etc/nginx/certificate/lburnet_localhost-certificate.crt -keyout /etc/nginx/certificate/lburnet_localhost.key \
# nettoyage
		&& rm -f nginx.conf
		# && echo "daemon off;" >> /etc/nginx/sites-available/default

EXPOSE	9000

EXPOSE	443

# CMD ["systemctl start nginx"]

# CMD ["/usr/sbin/nginx"]
CMD ["nginx", "-g", "daemon off;"]
