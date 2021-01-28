FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 21 40000 40001 40002 40003 40004

RUN apk update
RUN apk add vsftpd
RUN apk add openrc
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN rc-status
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=75/L=Paris/O=42/CN=localhost" -keyout /etc/ssl/private/vsftpd.key.pem -out /etc/ssl/certs/vsftpd.cert.pem
RUN rm /etc/vsftpd/vsftpd.conf
COPY /srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN adduser -h /home/./ftps -D ftps
RUN echo "ftps:password" | chpasswd

ENTRYPOINT rc-service vsftpd start && tail -f /dev/null