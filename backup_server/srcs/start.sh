#!/bin/bash

if [ $AUTOINDEX = "off" ]
then
	sed -i 's/autoindex on/autoindex off/g' /etc/nginx/sites-available/localhost
fi
service nginx start
service mysql start
service php7.3-fpm start
#echo "CREATE DATABASE wordpress;" | mysql -u root
#echo "CREATE USER 'wordpress_user'@'localhost';" | mysql -u root
#echo "SET password FOR 'wordpress_user'@'localhost' = password('password');" | mysql -u root
#echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress_user'@'localhost' IDENTIFIED BY 'password';" | mysql -u root
#echo "FLUSH PRIVILEGES;" | mysql -u root
#mysql wordpress -u root < /start/wordpress.sql
bash
