#!/bin/sh

rc-service influxdb start

echo "CREATE DATABASE metrics" | influx
echo "CREATE USER admin WITH PASSWORD 'password' WITH ALL PRIVILEGES" | influx

rc-service telegraf start

tail -f /dev/null