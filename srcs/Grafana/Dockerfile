FROM alpine:3.13

MAINTAINER ade-garr

EXPOSE 3000

RUN apk update
RUN apk add grafana
RUN apk add grafana-openrc
RUN apk add openrc
RUN apk add syslog-ng
RUN mkdir -p /run/openrc
RUN touch /run/openrc/softlevel
RUN sed -i '/^cfg:server.http_addr/d' etc/conf.d/grafana
RUN rc-status
RUN rm /etc/grafana.ini
COPY srcs/grafana.ini /etc/grafana.ini
COPY srcs/*.json /var/lib/grafana/dashboards/
COPY srcs/datasources.yaml /var/lib/grafana/provisioning/datasources/
COPY srcs/dashboards.yaml /var/lib/grafana/provisioning/dashboards/

ENTRYPOINT rc-service grafana start && tail -f /dev/null
