FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 5000

RUN apk update \
&& mkdir -p /run/nginx \
&& apk add nginx \
&& apk add openssl \
&& apk add php7-fpm php7-mcrypt php7-soap php7-openssl php7-gmp php7-pdo_odbc php7-json php7-dom php7-pdo php7-zip php7-mysqli php7-sqlite3 php7-apcu php7-pdo_pgsql php7-bcmath php7-gd php7-odbc php7-pdo_mysql php7-pdo_sqlite php7-gettext php7-xmlreader php7-xmlrpc php7-bz2 php7-iconv php7-pdo_dblib php7-curl php7-ctype \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=localhost" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY srcs/localhost.conf /etc/nginx/conf.d/
COPY srcs/phpMyAdmin /var/www/localhost/phpmyadmin

RUN rm /etc/nginx/conf.d/default.conf \
&& chown -R nginx:nginx /var/www/localhost/phpmyadmin

RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel

#ENTRYPOINT nginx -g 'daemon off;'