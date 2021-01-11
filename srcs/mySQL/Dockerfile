FROM alpine:latest

MAINTAINER ade-garr

RUN apk update
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel
RUN apk add mysql mysql-client
RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

COPY srcs/start.sh ./start/

CMD ["sh", "/start/start.sh"]