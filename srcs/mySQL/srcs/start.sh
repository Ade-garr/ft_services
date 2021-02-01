#!/bin/sh

mysql_install_db --user=mysql --datadir=/var/lib/mysql
sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'admin'@'%';" | mysql -u root
echo "SET password FOR 'admin'@'%' = password('password');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'admin'@'%' IDENTIFIED BY 'password';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

mysql wordpress -u root < /start/wordpress.sql
tail -f /dev/null