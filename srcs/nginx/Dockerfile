FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 80 443

RUN apk update \
&& mkdir -p /run/nginx \
&& apk add nginx \
&& apk add openssl \
&& openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=localhost" -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt

COPY srcs/localhost.conf /etc/nginx/conf.d/
COPY srcs/index.html /var/www/localhost/

RUN rm /etc/nginx/conf.d/default.conf \
&& chown -R nginx:nginx /var/www/localhost/

ENTRYPOINT nginx -g 'daemon off;'