FROM alpine:latest

MAINTAINER ade-garr

EXPOSE 3000

RUN apk update
RUN apk add grafana --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
RUN apk add grafana-openrc --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community
#RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/testing grafana-openrc
#RUN apk add -X http://dl-cdn.alpinelinux.org/alpine/edge/testing grafana
RUN apk add openrc
RUN apk add syslog-ng
#RUN sed -i 's/grafana:grafana/root:root/g' /etc/init.d/grafana
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN sed -i '/^cfg:server.http_addr/d' etc/conf.d/grafana
#RUN rc-status
#RUN rm /etc/grafana.ini
#COPY srcs/grafana.ini /etc/grafana.ini
#COPY srcs/*.json /var/lib/grafana/dashboards/
#COPY srcs/datasources.yaml /var/lib/grafana/provisioning/datasources/
#COPY srcs/dashboards.yaml /var/lib/grafana/provisioning/dashboards/

#ENTRYPOINT tail -f /dev/null
#rc-service grafana start