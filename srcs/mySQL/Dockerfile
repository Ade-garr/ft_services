FROM alpine:3.13

MAINTAINER ade-garr

EXPOSE 3306

RUN apk update
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel
RUN apk add mysql mysql-client

COPY srcs/ ./start/

CMD ["sh", "/start/start.sh"]