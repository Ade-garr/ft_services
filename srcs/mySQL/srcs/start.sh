#!/bin/sh

sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf
rc-service mariadb start

echo "CREATE DATABASE wordpress;" | mysql -u root
echo "CREATE USER 'wordpress_admin'@'%';" | mysql -u root
echo "SET password FOR 'wordpress_admin'@'%' = password('password_admin');" | mysql -u root
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_admin'@'%' IDENTIFIED BY 'password_admin';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root

echo "CREATE USER 'wordpress_user1'@'%';" | mysql -u root
echo "SET password FOR 'wordpress_user1'@'%' = password('password_user1');" | mysql -u root
#echo "GRANT USAGE ON wordpress.* TO 'wordpress_user1'@'%' IDENTIFIED BY 'password_user1';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

echo "CREATE USER 'wordpress_user2'@'%';" | mysql -u root
echo "SET password FOR 'wordpress_user2'@'%' = password('password_user2');" | mysql -u root
#echo "GRANT USAGE ON wordpress.* TO 'wordpress_user2'@'%' IDENTIFIED BY 'password_user2';" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root


#mysql wordpress -u root < /start/wordpress.sql
tail -f /dev/null