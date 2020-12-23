FROM debian:buster

MAINTAINER ade-garr

EXPOSE 80 443

RUN apt -y update \
&& apt -y install nginx \
&& apt -y install mariadb-server \
&& apt -y install php-fpm php-mysql php-mbstring php-zip php-gd php-curl php-intl php-soap php-xml php-xmlrpc \
&& rm /etc/nginx/sites-enabled/default \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=localhost" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY srcs/localhost /etc/nginx/sites-available/

RUN ln -s /etc/nginx/sites-available/localhost /etc/nginx/sites-enabled/

COPY srcs/phpMyAdmin /var/www/html/phpMyAdmin
#COPY srcs/wordpress /var/www/html/wordpress

RUN chown -R www-data:www-data /var/www/html

COPY srcs/start.sh ./start/
#COPY srcs/wordpress.sql ./start/

ENV AUTOINDEX="on"

CMD ["bash", "/start/start.sh"]
