FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 3000

RUN apk update
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add grafana-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add openrc
RUN apk add syslog-ng
RUN touch /run/openrc/softlevel
RUN rc-status

ENTRYPOINT rc-service grafana start