FROM    debian:buster
LABEL    maintainer="lburnet@student.42lyon.fr"

COPY ./files/ .

RUN	apt-get -y update && apt-get -y upgrade \
		&& apt-get -y install nginx openssl \
		&& mkdir -p /etc/nginx/certificate \
		#&& rm -f /etc/nginx/sites-available/default \
		&& cp nginx.conf /etc/nginx/sites-available/default \
		&& openssl req -new -newkey rsa:4096 -x509 -days 365 -nodes -subj "/C=US/ST=Denial/L=Springfield/O=Dis/CN=lburnet.42.fr" -out /etc/nginx/certificate/lburnet.42.fr-certificate.crt -keyout /etc/nginx/certificate/lburnet.42.fr.key
# nettoyage
		#&& rm -f nginx.confdo

# EXPOSE	9000

#EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]
#CMD ["sleep", "infinity"]
