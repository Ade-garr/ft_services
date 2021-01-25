FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 8086

RUN apk update
RUN apk add influxdb influxdb-openrc influxdb-doc
RUN apk add telegraf --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add telegraf-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community

RUN rm /etc/telegraf.conf
COPY srcs/telegraf.conf /etc/telegraf.conf
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel
COPY srcs/start.sh ./start/start.sh

CMD ["sh", "/start/start.sh"]