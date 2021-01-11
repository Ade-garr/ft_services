FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 5000

RUN apk update \
&& mkdir -p /run/nginx \
&& apk add nginx \
&& apk add openssl \
&& apk add php7 php7-fpm php7-mbstring php7-mysqli php7-session php7-json \
#&& apk add php-fpm php-mbstring php-zip php-gd php-curl php-intl php-soap php-xml php-xmlrpc \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=localhost" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY srcs/localhost.conf /etc/nginx/conf.d/
COPY srcs/phpMyAdmin /var/www/localhost/phpmyadmin

RUN rm /etc/nginx/conf.d/default.conf \
&& chown -R nginx:nginx /var/www/localhost/phpmyadmin

RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel

#ENTRYPOINT nginx -g 'daemon off;'