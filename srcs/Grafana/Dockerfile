FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 3000

RUN apk update
RUN apk add openrc
RUN rc-status
RUN touch /run/openrc/softlevel

wget https://dl.grafana.com/oss/release/grafana-7.3.7.linux-amd64.tar.gz
tar -zxvf grafana-7.3.7.linux-amd64.tar.gz


#MD ["sh", "/start/start.sh"]